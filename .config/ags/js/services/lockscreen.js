import Service from 'resource:///com/github/Aylur/ags/service.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
import App from 'resource:///com/github/Aylur/ags/app.js';

class Lockscreen extends Service {
    static {
        Service.register(this, {
            'lock': ['boolean'],
            'authenticating': ['boolean'],
        });
    }

    lockscreen() {
      Utils.exec("/home/nolawz/.config/hypr/scripts/lock.sh")
    }
}

export default new Lockscreen();
