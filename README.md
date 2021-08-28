# nvim-win-shell

Run `*-add.cmd` or `*-remove.cmd` as a Windows Administrator user to toggle
 - respective Neovim client program ID and file type associations
 - "Edit with *Neovim client*", "Open *Neovim client* here" options in File Explorer right-click context menus

## Configuration files

- `*-config.cmd` — edit to configure respective Neovim client path, displayed program name in context menus etc.
- `filetypes.txt` — edit to list of file types that will be associated with the Neovim client

## Warning

- Running `*-add.cmd` automatically downloads the propietary [SetUserFTA utility](https://kolbi.cz/blog/2017/10/25/setuserfta-userchoice-hash-defeated-set-file-type-associations-per-user/) from it's author's website. It is downloaded only once and saved in the `common` directory. The utility is executed inside the script to set the file type associations for system and inside `*-remove.cmd` to unset them.

- It's advised NOT adding `bat`, `cmd`, `vb` and `vbs` file name extensions to `filetypes.txt`, as changing them will break various third-party scripts that depend on passing these files to `open` utility.
