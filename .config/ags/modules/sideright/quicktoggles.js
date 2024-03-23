const { GLib } = imports.gi;
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';

import Bluetooth from 'resource:///com/github/Aylur/ags/service/bluetooth.js';
import Network from 'resource:///com/github/Aylur/ags/service/network.js';
const { execAsync, exec } = Utils;
import { BluetoothIndicator, NetworkIndicator } from '../.commonwidgets/statusicons.js';
import { setupCursorHover } from '../.widgetutils/cursorhover.js';
import { MaterialIcon } from '../.commonwidgets/materialicon.js';

export const ToggleIconWifi = (props = {}) => Widget.Button({
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Wifi | Right-click to configure',
    onClicked: () => Network.toggleWifi(),
    onSecondaryClickRelease: () => {
        execAsync(['bash', '-c', 'networkmanager_dmenu', '&']);
        App.closeWindow('sideright');
    },
    child: NetworkIndicator(),
    setup: (self) => {
        setupCursorHover(self);
        self.hook(Network, button => {
            button.toggleClassName('sidebar-button-active', [Network.wifi?.internet, Network.wired?.internet].includes('connected'))
            button.tooltipText = (`${Network.wifi?.ssid} | Right-click to configure` || 'Unknown');
        });
    },
    ...props,
});

export const ToggleIconBluetooth = (props = {}) => Widget.Button({
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Bluetooth | Right-click to configure',
    onClicked: () => {
        const status = Bluetooth?.enabled;
        if (status)
            exec('rfkill block bluetooth');
        else
            exec('rfkill unblock bluetooth');
    },
    onSecondaryClickRelease: () => {
        execAsync(['bash', '-c', 'blueberry &']);
        App.closeWindow('sideright');
    },
    child: BluetoothIndicator(),
    setup: (self) => {
        setupCursorHover(self);
        self.hook(Bluetooth, button => {
            button.toggleClassName('sidebar-button-active', Bluetooth?.enabled)
        });
    },
    ...props,
});

export const HyprToggleIcon = async (icon, name, hyprlandConfigValue, props = {}) => {
    try {
        return Widget.Button({
            className: 'txt-small sidebar-iconbutton',
            tooltipText: `${name}`,
            onClicked: (button) => {
                // Set the value to 1 - value
                Utils.execAsync(`hyprctl -j getoption ${hyprlandConfigValue}`).then((result) => {
                    const currentOption = JSON.parse(result).int;
                    execAsync(['bash', '-c', `hyprctl keyword ${hyprlandConfigValue} ${1 - currentOption} &`]).catch(print);
                    button.toggleClassName('sidebar-button-active', currentOption == 0);
                }).catch(print);
            },
            child: MaterialIcon(icon, 'norm', { hpack: 'center' }),
            setup: button => {
                button.toggleClassName('sidebar-button-active', JSON.parse(Utils.exec(`hyprctl -j getoption ${hyprlandConfigValue}`)).int == 1);
                setupCursorHover(button);
            },
            ...props,
        })
    } catch {
        return null;
    }
}

export const ModuleNightLight = (props = {}) => Widget.Button({ // TODO: Make this work
    attribute: {
        enabled: false,
    },
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Night Light',
    onClicked: (self) => {
        self.attribute.enabled = !self.attribute.enabled;
        self.toggleClassName('sidebar-button-active', self.attribute.enabled);
        if (self.attribute.enabled) Utils.execAsync('gammastep').catch(print)
        else Utils.execAsync('pkill gammastep');
    },
    child: MaterialIcon('nightlight', 'norm'),
    setup: (self) => {
        setupCursorHover(self);
        self.attribute.enabled = !!exec('pidof gammastep');
        self.toggleClassName('sidebar-button-active', self.attribute.enabled);
    },
    ...props,
});

export const ModuleWallpaper = (props = {}) => Widget.Button({
  className: 'txt-small sidebar-iconbutton',
  tooltipText: 'Random wallpaper',
  onClicked: () => {
    execAsync(['bash', '-c', '~/.config/hypr/scripts/random-wallpaper --change'])
  },
  child: MaterialIcon('wallpaper', 'norm'),
  setup: setupCursorHover,
  ...props,

});

export const ModuleIdleInhibitor = (props = {}) => Widget.Button({ // TODO: Make this work
    attribute: {
        enabled: false,
    },
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Keep system awake',
    onClicked: (self) => {
        self.attribute.enabled = !self.attribute.enabled;
        self.toggleClassName('sidebar-button-active', self.attribute.enabled);
        if (self.attribute.enabled) Utils.execAsync(['bash', '-c', `pidof wayland-idle-inhibitor.py || ${App.configDir}/scripts/wayland-idle-inhibitor.py`]).catch(print)
        else Utils.execAsync('pkill -f wayland-idle-inhibitor.py').catch(print);
    },
    child: MaterialIcon('coffee', 'norm'),
    setup: (self) => {
        setupCursorHover(self);
        self.attribute.enabled = !!exec('pidof wayland-idle-inhibitor.py');
        self.toggleClassName('sidebar-button-active', self.attribute.enabled);
    },
    ...props,
});

export const ModuleReloadIcon = (props = {}) => Widget.Button({
    ...props,
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Reload Environment config',
    onClicked: () => {
        execAsync(['bash', '-c', 'hyprctl reload || swaymsg reload &']);
        App.toggleWindow('sideright');
    },
    child: MaterialIcon('refresh', 'norm'),
    setup: button => {
        setupCursorHover(button);
    }
})

export const ModulePowerIcon = (props = {}) => Widget.Button({
    ...props,
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Session',
    onClicked: () => {
        App.toggleWindow('session');
        App.closeWindow('sideright');
    },
    child: MaterialIcon('power_settings_new', 'norm'),
    setup: button => {
        setupCursorHover(button);
    }
})



