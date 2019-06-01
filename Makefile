.PHONY: linux
linux: zsh git vim tmux Xmodmap vscode .config libinput-gestures albert ranger redshift

.PHONY: zsh
zsh: $(HOME)/.zshrc
$(HOME)/.zshrc: linux/dot-zshrc.symlink
	ln -s $(PWD)/linux/dot-zshrc.symlink $(HOME)/.zshrc

.PHONY: git
git: $(HOME)/.gitignore-global $(HOME)/.gitconfig
$(HOME)/.gitignore-global: dot-gitignore-global.symlink
	ln -s $(PWD)/dot-gitignore-global.symlink $(HOME)/.gitignore-global

$(HOME)/.gitconfig: linux/dot-gitconfig.symlink
	ln -s $(PWD)/linux/dot-gitconfig.symlink $(HOME)/.gitconfig

.PHONY: vim
vim: $(HOME)/.vimrc
$(HOME)/.vimrc: dot-vimrc.symlink
	ln -s $(PWD)/dot-vimrc.symlink $(HOME)/.vimrc

.PHONY: tmux
tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf: dot-tmux.conf.symlink
	ln -s $(PWD)/dot-tmux.conf.symlink $(HOME)/.tmux.conf

.PHONY: Xmodmap
Xmodmap: $(HOME)/Xmodmap
$(HOME)/Xmodmap: linux/dot-Xmodmap.symlink
	ln -s $(PWD)/linux/dot-Xmodmap.symlink $(HOME)/.Xmodmap

.PHONY: vscode
vscode: $(HOME)/.vscode/settings.json
$(HOME)/.vscode/settings.json: linux/vscode/settings.json.symlink
	mkdir -p $(HOME)/.vscode
	ln -s $(PWD)/linux/vscode/settings.json.symlink $(HOME)/.vscode/settings.json

.PHONY: .config
.config: $(HOME)/.config
$(HOME)/.config:
	mkdir -p $(HOME)/.config

.PHONY: libinput-gestures
libinput-gestures: $(HOME)/.config/libinput-gestures.conf
$(HOME)/.config/libinput-gestures.conf: .config linux/dot-config/libinput-gestures.conf.symlink
	ln -s $(PWD)/linux/dot-config/libinput-gestures.conf.symlink $(HOME)/.config/libinput-gestures.conf

.PHONY: albert
albert: $(HOME)/.config/albert/albert.conf
$(HOME)/.config/albert/albert.conf: .config linux/dot-config/albert/albert.conf.symlink
	mkdir -p $(HOME)/.config/albert
	ln -s $(PWD)/linux/dot-config/albert/albert.conf.symlink $(HOME)/.config/albert/albert.conf

.PHONY: ranger
ranger: $(HOME)/.config/ranger/
$(HOME)/.config/ranger/: .config linux/dot-config/ranger.symlink
	ln -s $(PWD)/linux/dot-config/ranger.symlink $(HOME)/.config/ranger/

.PHONY: redshift
redshift: $(HOME)/.config/redshift/
$(HOME)/.config/redshift/: .config linux/dot-config/redshift.symlink
	ln -s $(PWD)/linux/dot-config/redshift.symlink $(HOME)/.config/redshift/
