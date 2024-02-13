import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
const { Box, Button, EventBox, Label, Revealer, Scrollable, Stack } = Widget;
const { execAsync, exec } = Utils;
import { QuickScripts } from './quickscripts.js';
import { Calculator } from './calculator.js'

export default Scrollable({
  hscroll: "never",
  vscroll: "automatic",
  child: Box({
    vertical: true,
    children: [
      // QuickScripts(),
      Calculator()
    ]
  })
});
