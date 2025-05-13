# Neovim Chad Configuration

This is a custom Neovim configuration built using the [NvChad](https://github.com/NvChad/NvChad) framework. To get started, please make sure you have the following dependencies installed and set up:

## Prerequisites:

1. **Neovim**: Install Neovim **version 0.10.0 or above**. You can download it from [here](https://github.com/neovim/neovim/releases/tag/v0.10.0).

2. **Copilot for Vim**: Install GitHub Copilot for Neovim. Instructions are available [here](https://github.com/github/copilot.vim).

3. **Node.js**: Install Node.js, which is required by various plugins. You can install it on Ubuntu using the following command:
   ```bash
   sudo apt install nodejs
   ```

4. **Nerd Fonts**: Nerd Fonts are required for proper icon rendering in Neovim. Download them from [here](https://www.nerdfonts.com/).

5. **Ripgrep**: Ripgrep is used for searching files. Install it from [here](https://github.com/BurntSushi/ripgrep).
   '''bash
      sudo apt-get install ripgrep
   '''

## Key Mappings Cheat Sheet

Copilot:
KeyCombination
C-l		Autocomplete Accpet 
### **Normal Mode Key Mappings**

#### **Window Navigation**:
| Key Combination | Action                       | Description                          |
|-----------------|------------------------------|--------------------------------------|
| `Ctrl + h`      | `<C-w>h`                     | Switch to the window to the left.    |
| `Ctrl + j`      | `<C-w>j`                     | Switch to the window below.          |
| `Ctrl + k`      | `<C-w>k`                     | Switch to the window above.          |
| `Ctrl + l`      | `<C-w>l`                     | Switch to the window to the right.   |

---

#### **File and Buffer Management**:
| Key Combination | Action                       | Description                          |
|-----------------|------------------------------|--------------------------------------|
| `Esc`           | `<cmd>noh<CR>`                | Clear search highlights.            |
| `Ctrl + s`      | `<cmd>w<CR>`                  | Save the current file.              |
| `Ctrl + c`      | `<cmd>%y+<CR>`                | Copy the entire file to clipboard.  |
| `space n`       | `<cmd>set nu!<CR>`            | Toggle line numbers.                |
| `space rn`      | `<cmd>set rnu!<CR>`           | Toggle relative line numbers.       |
| `space ch`      | `<cmd>NvCheatsheet<CR>`       | Open the NvCheatsheet plugin.       |

---

#### **Tab Buffer Navigation**:
| Key Combination | Action                                       | Description                              |
|-----------------|----------------------------------------------|------------------------------------------|
| `space b`       | `<cmd>enew<CR>`                              | Create a new buffer.                    |
| `<tab>`         | `require("nvchad.tabufline").next()`         | Go to the next buffer.                  |
| `<S-tab>`       | `require("nvchad.tabufline").prev()`         | Go to the previous buffer.              |
| `space x`       | `require("nvchad.tabufline").close_buffer()` | Close the current buffer.               |

---

#### **Commenting Code**:
| Key Combination | Action    | Description                             |
|-----------------|-----------|-----------------------------------------|
| `space /`       | `gcc`     | Toggle comment for the current line.    |
| `space /`       | `gc`      | Toggle comment for the selected text.   |

---

#### **NvimTree**:
| Key Combination | Action               | Description                           |
|-----------------|----------------------|---------------------------------------|
| `Ctrl + n`      | `<cmd>NvimTreeToggle<CR>` | Toggle NvimTree window.            |
| `space e`       | `<cmd>NvimTreeFocus<CR>`  | Focus NvimTree window.             |

---

#### **Telescope**:
| Key Combination | Action                                           | Description                             |
|-----------------|--------------------------------------------------|-----------------------------------------|
| `space fw`      | `<cmd>Telescope live_grep<CR>`                   | Search for text in files.              |
| `space fb`      | `<cmd>Telescope buffers<CR>`                     | Find open buffers.                     |
| `space fh`      | `<cmd>Telescope help_tags<CR>`                   | Search for help tags.                  |
| `space ma`      | `<cmd>Telescope marks<CR>`                       | Search for marks.                      |
| `space fo`      | `<cmd>Telescope oldfiles<CR>`                    | Search for recently opened files.      |
| `space fz`      | `<cmd>Telescope current_buffer_fuzzy_find<CR>`   | Search within the current buffer.      |
| `space cm`      | `<cmd>Telescope git_commits<CR>`                 | Search Git commits.                    |
| `space gt`      | `<cmd>Telescope git_status<CR>`                  | View Git status.                       |
| `space pt`      | `<cmd>Telescope terms<CR>`                       | Pick a hidden terminal.                |
| `space th`      | `require("nvchad.themes").open()`               | Open NvChad themes.                    |
| `space ff`      | `<cmd>Telescope find_files<cr>`                  | Find files.                            |
| `space fa`      | `<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>` | Find all files, including hidden ones. |

---

#### **Terminal Management**:
| Key Combination | Action                                                | Description                              |
|-----------------|-------------------------------------------------------|------------------------------------------|
| `Ctrl + x`      | `<C-\\><C-N>`                                        | Escape terminal mode.                   |
| `space h`       | `require("nvchad.term").new { pos = "sp" }`           | Open a new horizontal terminal.          |
| `space v`       | `require("nvchad.term").new { pos = "vsp" }`          | Open a new vertical terminal.            |
|                 | `require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }` | Toggle vertical terminal.     |
|                 | `require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }`  | Toggle horizontal terminal.   |
|                 | `require("nvchad.term").toggle { pos = "float", id = "floatTerm" }`  | Toggle floating terminal.    |

---

#### **Which Key**:
| Key Combination | Action            | Description                  |
|-----------------|-------------------|------------------------------|
| `space wK`      | `<cmd>WhichKey <CR>` | Show all key mappings.      |
| `space wk`      | `WhichKey query lookup` | Look up a specific key mapping. |

---

#### **Formatting and Diagnostics**:
| Key Combination | Action                        | Description                            |
|-----------------|-------------------------------|----------------------------------------|
| `space fm`      | `require("conform").format`    | Format the current file using LSP fallback. |
| `space ds`      | `vim.diagnostic.setloclist`    | Show diagnostics in the location list.  |

---

### **Insert Mode Key Mappings**:
| Key Combination | Action    | Description                     |
|-----------------|-----------|---------------------------------|
| `Ctrl + b`      | `^i`      | Move cursor to the beginning of the line. |
| `Ctrl + e`      | `<End>`   | Move cursor to the end of the line. |
| `Ctrl + h`      | `<Left>`  | Move cursor left (one character). |
| `Ctrl + l`      | `<Right>` | Move cursor right (one character). |
| `Ctrl + j`      | `<Down>`  | Move cursor down (one line).    |
| `Ctrl + k`      | `<Up>`    | Move cursor up (one line).      |

