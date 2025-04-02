
### **NVChad & Neovim Essential Commands Cheat Sheet**

---

#### **General NVChad Commands**
| Command            | Description                     |
|--------------------|---------------------------------|
| `:NvChadUpdate`    | Update NVChad                   |
| `:NvChadStopLSP`   | Stop LSPs                       |
| `:NvCheatsheet`    | Open cheatsheet                 |
| `:checkhealth`     | Check NVChad health             |
| `:Lazy`            | Open Lazy plugin manager        |

#### **Neovim Essentials**
| Command           | Description                      |
|-------------------|----------------------------------|
| `:q` / `:qa!`     | Quit / Quit all without saving   |
| `:w`              | Save file                        |
| `:wq`             | Save and quit                    |
| `:e <file>`       | Open file                        |
| `:vs <file>`      | Open file in vertical split     |
| `:sp <file>`      | Open file in horizontal split   |
| `:noh`            | Remove search highlight         |
| `u` / `<C-r>`     | Undo / Redo                      |

#### **File & Buffer Management**
| Keybinding        | Action              |
|-------------------|---------------------|
| `<leader> n`      | New buffer          |
| `<leader> x`      | Close buffer        |
| `<leader> bb`     | Buffer picker       |
| `<leader> bp` / `bn` | Prev / Next buffer |
| `:bnext` / `:bprev` | Cycle buffers     |

#### **Telescope (Search & Navigation)**
| Keybinding        | Action            |
|-------------------|-------------------|
| `<leader> ff`     | Find files        |
| `<leader> fg`     | Live grep         |
| `<leader> fb`     | Find buffers      |
| `<leader> fh`     | Find help tags    |
| `<leader> fw`     | Find words        |
| `<leader> fo`     | Find old files    |

#### **Window & Split Navigation**
| Keybinding        | Action            |
|-------------------|-------------------|
| `<leader> sv` / `sh` | Split vertical / horizontal |
| `<C-h>` / `<C-l>` / `<C-j>` / `<C-k>` | Move left / right / down / up |
| `<leader> q`      | Close window      |
| `<C-w> =`         | Equalize splits   |

#### **LSP (Language Server Protocol)**
| Keybinding        | Action            |
|-------------------|-------------------|
| `gd` / `gD`       | Go to definition / declaration |
| `gr`              | Show references   |
| `K`               | Hover info        |
| `<leader> rn`     | Rename            |
| `<leader> ca`     | Code actions      |
| `<leader> lf`     | Format code       |

#### **Git Integration**
| Keybinding        | Action            |
|-------------------|-------------------|
| `<leader> gg`     | Open LazyGit      |
| `<leader> gl`     | Git log           |
| `<leader> gp`     | Push              |
| `<leader> gf`     | Fetch             |
| `<leader> gs`     | Git status        |

#### **File Explorer (Tree)**
| Keybinding        | Action            |
|-------------------|-------------------|
| `<leader> e`      | Toggle tree       |
| `<leader> fc`     | Find file in tree |
| `<leader> ft`     | Focus tree        |

#### **Commenting**
| Keybinding        | Action            |
|-------------------|-------------------|
| `<leader> /`      | Toggle comment    |
| `gc`              | Comment (Visual Mode) |

#### **Terminal**
| Keybinding        | Action              |
|-------------------|---------------------|
| `<leader> tt`     | Open terminal       |
| `<leader> tf`     | Floating terminal   |
| `<C-\>`           | Toggle terminal     |
| `<C-n>`           | Open terminal in a new buffer |

#### **Marks & Navigation**
| Keybinding        | Action              |
|-------------------|---------------------|
| `m<letter>`       | Set mark            |
| `' <letter>`      | Jump to mark        |
| `` `<letter>``    | Jump to mark (exact position) |
| `:marks`          | List marks          |

#### **Miscellaneous**
| Keybinding        | Action             |
|-------------------|--------------------|
| `<leader> u`      | Toggle UI          |
| `<leader> th`     | Toggle theme       |
| `<leader> mm`     | Markdown preview   |
| `:set number` / `:set relativenumber` | Show line numbers |
| `:syntax on`      | Enable syntax highlighting |
| `:set wrap` / `:set nowrap` | Toggle line wrap |

---

### **Loaded Plugin Shortcuts**

| Plugin               | Command/Shortcut  | Description                             |
|----------------------|-------------------|-----------------------------------------|
| **base46**            | Custom themes     | Apply various themes (e.g., `aquarium`) |
| **cmp-buffer**        | N/A               | Autocompletion for buffers             |
| **cmp-nvim-lsp**      | N/A               | LSP-based autocompletion               |
| **cmp-nvim-lua**      | N/A               | Lua autocompletion                     |
| **cmp-path**          | N/A               | Path autocompletion                    |
| **cmp_luasnip**       | N/A               | Autocompletion with LuaSnip snippets   |
| **copilot.vim**       | `:Copilot`        | GitHub Copilot integration             |
| **friendly-snippets** | N/A               | Provides code snippets                 |
| **gitsigns.nvim**     | `<leader> gs`     | Git status in the gutter               |
| **indent-blankline.nvim** | `:IndentBlanklineToggle` | Toggle indent lines              |
| **lazy.nvim**         | `:Lazy`           | Open Lazy plugin manager               |
| **LuaSnip**           | N/A               | Snippet management and expansion       |
| **NvChad**            | `:NvChadUpdate`, `:NvChadStopLSP` | Update or stop LSPs from NVChad |
| **nvim-autopairs**    | N/A               | Auto-closes brackets/quotes            |
| **nvim-cmp**          | `<C-Space>`       | Trigger autocompletion                 |
| **nvim-lspconfig**    | `gd` / `gD`       | Go to definition or declaration        |
| **nvim-tree.lua**     | `<leader> e`      | Toggle file explorer (NvimTree)        |
| **nvim-treesitter**   | N/A               | Syntax highlighting and code folding   |
| **nvim-web-devicons** | N/A               | File icons for various file types      |
| **plenary.nvim**      | N/A               | Utility library for Neovim             |
| **ui**                | `:UI`             | UI-related functions                   |
| **volt**              | N/A               | Volt-related actions                   |
| **which-key.nvim**    | `<leader>`        | Displays key bindings for mappings     |

---
