import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
const { execAsync, exec } = Utils;
const { Box, Button, Label, Entry } = Widget;
import Gtk from 'gi://Gtk';

let grid = new Gtk.Grid()
let entry = Entry({
  placeholder_text: 'Play here',
  onAccept: ({ text }) => { entry.text = eval(text).toString() }
})

for (let i = 1; i < 10; i++) {
  grid.attach(
    Button({
      className: 'calculator-btn',
      child: Label({ label: `${i}` }),
      onPrimaryClick: () => { entry.text += i }
    }), ((i - 1) % 3), (3 - Math.floor((i - 1) / 3)), 1, 1)
}

export const Calculator = () => Box({
  children: [
    entry, grid
  ],
  vertical: true
})
