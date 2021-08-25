# neovim-qt-win-shell

Set Neovim Qt file type associations and add `Edit with Neovim` / `Open Neovim here` right click context menu items on Windows.

## Configuration

- `path.txt` — set full path of `nvim-qt.exe` here
- `filetypes.txt` — set list of file name extensions that will be associated with Neovim Qt

## Adding

Running `add.cmd` as and Administrator user adds
 - Neovim Qt `ProgID` and file types associations,
 - `Edit with Neovim` / `Open Neovim here` option to right-click context menu items

to Windows Registry.

## Removal
Running `remove.cmd` script as an Administrator user removes
- Neovim Qt `ProgID` and file type associations,
- `Edit with Neovim` / `Open Neovim here` option from right-click context menu items

from Windows Registry.

## General information

 - On the first run the `add.cmd` script downloads a third-party [SetUserFTA](https://kolbi.cz/blog/2017/10/25/setuserfta-userchoice-hash-defeated-set-file-type-associations-per-user/) utility ZIP file from the author's homepage, saving and extracting it in the same directory. It is ran from within the script for adding the file type associations to Windows Registry.

- It's advised NOT adding `.bat`, `.cmd`, `.vb` and `.vbs` file name extensions to `filetypes.txt`, as changing them will break various third-party scripts that depend on passing these files to `open` utility.
