from pathlib import Path
from os.path import expanduser
from typing import Dict
import requests
import webbrowser
import sys
from guessit import guessit


def authorize() -> str:
    url = (
        "https://anilist.co/api/v2/oauth/authorize?client_id=26435&response_type=token"
    )
    print("Go to the url:", url)
    print("Press 'o' to open browser or press anything else to enter token manually")
    inp = input()
    if inp == "o":
        webbrowser.open(url)
    access_token = input("Enter your token: ")
    return access_token


class Anilist:
    def __init__(self, access_token) -> None:
        self.access_token = access_token

    def _graphql_request(self, query, variables=None):
        headers = {"Authorization": "Bearer " + self.access_token}
        return requests.post(
            "https://graphql.anilist.co",
            headers=headers,
            json={"query": query, "variables": variables},
        )

    def get_anime(self, title: str) -> Dict | None:
        query = """
        query ($search: String!) {
          Page {
            media(search: $search, type: ANIME) {
              id
              episodes
            }
          }
        }
        """
        variables = {"search": title}

        response = self._graphql_request(query, variables)
        media = response.json()["data"]["Page"]["media"]
        if len(media) > 0:
            return {"id": media[0]["id"], "total_episodes": media[0]["episodes"]}
        return None

    def update_anime_entry(self, anime_id, episode_no, total_episodes):
        query = """
        mutation ($mediaId: Int, $status: MediaListStatus, $progress: Int) {
          SaveMediaListEntry(mediaId: $mediaId, status: $status, progress: $progress) {
            id
            status
          }
        }
        """
        status = "COMPLETED" if episode_no >= total_episodes else "CURRENT"
        variables = {"mediaId": anime_id, "status": status, "progress": episode_no}
        self._graphql_request(query, variables)


if sys.argv[1].lower() == "authorize":
    access_token = authorize()
    output_file = Path(expanduser("~/.local/share/anitracker/access_token"))
    output_file.parent.mkdir(exist_ok=True, parents=True)
    with open(output_file, "w") as f:
        f.write(access_token)
    exit(1)

try:
    with open(expanduser("~/.local/share/anitracker/access_token"), "r") as f:
        access_token = f.read()
except FileNotFoundError:
    print(
        "Access token not found. Create it by running: python anitracker.py authorize",
        file=sys.stderr,
    )
    exit(1)

anilist = Anilist(access_token)

guess = guessit(" ".join(sys.argv[1:]))
title = guess.get("title")
season = guess.get("season")
episode_no = guess.get("episode")

search_query = title
if season is not None:
    search_query += " Season " + str(season)

anime = anilist.get_anime(search_query)
if anime is not None:
    anime_id, total_episodes = anime["id"], anime["total_episodes"]
    anilist.update_anime_entry(anime_id, episode_no, total_episodes)
else:
    exit(1)
