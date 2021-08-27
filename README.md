# nvim-win-shell

Neovim file type associations, "Edit with Neovim" / "Open Neovim here" context menu items on Windows.

## Configuration

- `{nvim-client}-config.cmd` — configure Neovim client & icon paths and exact program name
- `filetypes.txt` — set list of file name extensions that will be associated with the Neovim client


## Adding
Running `{nvim-client}-add.cmd` as an Administrator user adds
 - Respective Neovim client `ProgID` and file types associations,
 - `Edit with {nvim-client}` / `Open {nvim-client} here` option to right-click context menu items

to Windows Registry.

## Removal
Running `{nvim-client}-remove.cmd` as an Administrator user removes
 - Respective Neovim client `ProgID` and file types associations,
 - `Edit with {nvim-client}` / `Open {nvim-client} here` option to right-click context menu items

from Windows Registry.

## General information

- On the first run of `{nvim-client}-add.cmd`, the script `common/add.cmd` downloads a third-party [SetUserFTA](https://kolbi.cz/blog/2017/10/25/setuserfta-userchoice-hash-defeated-set-file-type-associations-per-user/) utility archive file from the author's homepage, saving and extracting it in `common` directory. It is then ran from within the script for adding the file type associations to Windows Registry.

- It's advised NOT adding `bat`, `cmd`, `vb` and `vbs` file name extensions to `filetypes.txt`, as changing them will break various third-party scripts that depend on passing these files to `open` utility.
