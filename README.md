# nvim-win-shell

- [File type associations](filetypes.txt) for Neovim on Windows.
- "Edit with Neovim" / "Open Neovim here" context menu items in Windows File Explorer.

## Supported Neovim clients
- [Neovim Qt](https://github.com/equalsraf/neovim-qt)
- [Neoray](https://github.com/hismailbulut/neoray)

## Configuration

-  **Config. editing required** — `*client*-config.cmd` — Neovim client path, toggling setting context menus and file type associations etc. 
- [`filetypes.txt`](filetypes.txt) — list of file types associated with the Neovim client

## Warning

- `*client*-add.cmd` downloads, extracts and runs the 3rd-party, closed-source [`SetUserFTA`](https://kolbi.cz/blog/2017/10/25/setuserfta-userchoice-hash-defeated-set-file-type-associations-per-user/) utility.
- It's advised **not** adding `bat`, `cmd`, `vb`, `vbs` extensions to [`filetypes.txt`](filetypes.txt), as doing so breaks various scripts that depend on executing these types directly.
