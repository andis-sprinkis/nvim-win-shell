# nvim-win-shell

Neovim file type associations, "Edit with Neovim" / "Open Neovim here" context menu items in Windows File Explorer.

## Currently supported clients
- [Neovim Qt](https://github.com/equalsraf/neovim-qt)
- [Neoray](https://github.com/hismailbulut/neoray)

## Configuration (required)

- `*client*-config.cmd` — edit to configure Neovim client path, displayed program name in context menus etc.
- `filetypes.txt` — edit to list of file types that will be associated with the client

## Warning

- Running `*client*-add.cmd` downloads and extracts a freeware, propietary, 3rd-party [SetUserFTA](https://kolbi.cz/blog/2017/10/25/setuserfta-userchoice-hash-defeated-set-file-type-associations-per-user/) utility which is used in scripts for setting and unsetting the file type associations.

- It's advised NOT adding `bat`, `cmd`, `vb` and `vbs` file name extensions to `filetypes.txt`, as it will break various third-party scripts that depend on paths of these files being passed to system `open` utility.
