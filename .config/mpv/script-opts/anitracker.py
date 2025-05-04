from pathlib import Path
from os.path import expanduser
from typing import Dict
import requests
import webbrowser
import sys
from guessit import guessit
from argparse import ArgumentParser
from json import dumps


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

    def get_anime(self, anime_id: int) -> Dict | None:
        query = """
        query ($id: Int!) {
          Page {
            media(id: $id, type: ANIME) {
              id
              episodes
            }
          }
        }
        """
        variables = {"id": anime_id}

        response = self._graphql_request(query, variables)
        media = response.json()["data"]["Page"]["media"]
        if len(media) > 0:
            return {"id": media[0]["id"], "total_episodes": media[0]["episodes"]}
        return None

    def get_animes(self, title: str) -> Dict | None:
        query = """
        query ($search: String!) {
          Page {
            media(search: $search, type: ANIME) {
              title {
                english
              }
              id
              episodes
            }
          }
        }
        """
        variables = {"search": title}

        response = self._graphql_request(query, variables)
        media = response.json()["data"]["Page"]["media"]
        return media
        # if len(media) > 0:
        #     return {"id": media[0]["id"], "total_episodes": media[0]["episodes"]}
        # return None

    def update_anime_entry(self, anime_id, episode_no, total_episodes):
        query = """
        mutation ($mediaId: Int, $status: MediaListStatus, $progress: Int) {
          SaveMediaListEntry(mediaId: $mediaId, status: $status, progress: $progress) {
            id
            status
          }
        }
        """
        status = (
            "COMPLETED"
            if (episode_no and total_episodes and episode_no >= total_episodes)
            else "CURRENT"
        )
        variables = {"mediaId": anime_id, "status": status, "progress": episode_no}
        self._graphql_request(query, variables)


parser = ArgumentParser()

parser.add_argument(
    "-a", "--authorize", help="Save authorization token", action="store_true"
)
parser.add_argument("-s", "--search", help="Search for the anime", type=str)
parser.add_argument(
    "-t",
    "--title",
    help="Title of the anime (should be passed along with --id)",
    type=str,
)
parser.add_argument("--id", help="ID of the anime in anilist", type=int)

args = parser.parse_args()

if args.authorize:
    access_token = authorize()
    output_file = Path(expanduser("~/.local/share/anitracker/access_token"))
    output_file.parent.mkdir(exist_ok=True, parents=True)
    with open(output_file, "w") as f:
        f.write(access_token)
    exit(0)

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

if args.search is not None:
    guess = guessit(args.search)
    title = guess.get("title")
    season = guess.get("season")

    search_query = title
    if season is not None and season != 1:
        search_query += " Season " + str(season)

    animes = anilist.get_animes(search_query)
    print(dumps(animes))

if args.id:
    if args.title is None:
        print("Please provide title", file=sys.stderr)
        exit(1)

    guess = guessit(args.title)
    episode_no = guess.get("episode")
    anime = anilist.get_anime(args.id)

    if episode_no is None:
        print("Failed to get the episode number", file=sys.stderr)
        exit(1)

    if anime is not None:
        anime_id, total_episodes = anime["id"], anime["total_episodes"]
        anilist.update_anime_entry(anime_id, episode_no, total_episodes)
    else:
        print("Anime not found", file=sys.stderr)
        exit(1)
