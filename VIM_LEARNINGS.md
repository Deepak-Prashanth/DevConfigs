## Interesting articles/info:
1. https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
2. Quip to wikipedia
3. [vim-galore](https://github.com/mhinz/vim-galore)
4. [Vim registers quick start guide](www.baeldung.com/linux/vim-registers)

### Courses:

### Tips:
  ```
  # Remove duplicate lines in vim buffer
  :sort u

  # Replace a character with a new line in vim
  :set magic
  :set/,/,\r/g

  # Yank matches into a register
  # Check register is empty first
  :let @A=''
  :%s/regex/\=setreg('A', submatch(0))/n

  # Match guid from logs
  :%s/id: \=setreg('B', submatch(0))/n
  :set magic
  :s/id:/\rid:/g
  :%s/^id: //g
  :sort u

  # To scroll two buffers at the same time
  :set scrollbind
  # Go to the next one and run the above command again
  : set noscrollbind
  ```

### PSQL Tips:
  ```
  # To append output to a logfile instead of creating one.
  db~> \o | cat - >> <Log-file>
  ```

### Shell
  ```
  tail -n1 $(ls -ltr <logfile>* | tail -n1 | awk '{print $9;}') | rstime
  grep "MatchString" $(ls -ltr <logfile>* | tail -n40 | sed -n '1p,20p' | awk '{print $9;}') | rstime | tail -n4
  ```

### SED
  ```
  # Print 2nd line
  sed -n '2p' < file.txt
  # Print 2011th line
  sed -n '2011p' < file.txt
  # Print 10-33 lines
  sed -n '10,33p' < file.txt
  # Print 1st and 3rd lines
  sed -n '1p;3p' < file.txt
  ```

## Curated lists:
1. [Nvim plugins](https://neovimcraft.com/?search=tag%3Aplugin)
2. [Rust tools: Specifically CLI utils](https://lib.rs)
