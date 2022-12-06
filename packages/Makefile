shell:
	stow --adopt --dotfiles -t $(HOME) shell
	git restore .

shell-unstow:
	stow -D -t $(HOME) bin

bin:
	stow --adopt --dotfiles -t $(HOME) bin
	git restore .

bin-unstow:
	stow -D -t $(HOME) bin

nvim:
	stow --adopt --dotfiles -t $(HOME) nvim
	git restore .

nvim-unstow:
	stow -D -t $(HOME) nvim
