# nvim-win-shell

- Neovim [file type associations](filetypes.txt) in Windows.
- "Edit with Neovim" / "Open Neovim here" context menu items in Windows File Explorer.

## Supported clients
- [Neovim Qt](https://github.com/equalsraf/neovim-qt)
- [Neoray](https://github.com/hismailbulut/neoray)

## Configuration

-  **Editing required** — `*client*-config.cmd` — Neovim client path, toggling setting context menus and file type associations etc. 
- `filetypes.txt` — list of file types associated with the Neovim client

## Warning

- `*client*-add.cmd` downloads, extracts and runs the 3rd-party, closed-source [SetUserFTA](https://kolbi.cz/blog/2017/10/25/setuserfta-userchoice-hash-defeated-set-file-type-associations-per-user/) utility.
- It's advised NOT adding `bat`, `cmd`, `vb` and `vbs` extensions to `filetypes.txt`, as doing so breaks various third-party scripts that depend on file paths of these types being passed to system `open` utility.
