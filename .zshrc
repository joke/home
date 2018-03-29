# zplug setup

if [[ ! -d ~/.zplug ]] {
	print 'Checking requirements and installing zplug'
	whence -p git >&- || exit 8
	whence -p awk >&- || exit 8
	awk -W version |& grep -q GNU || exit 8

	git clone --depth 1 https://github.com/zplug/zplug ~/.zplug
}
source ~/.zplug/init.zsh

zstyle ':zplug:tag' depth 1
zstyle ':zplug:config:setopt' only_subshell extended_glob

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'joke/home', as:command, use:'bin/*(.x)', hook-build:'$ZPLUG_REPOS/joke/home/bin/zplug-install-joke_home'

zplug 'modules/completion', from:prezto
zplug 'modules/helper', from:prezto
zplug 'modules/directory', from:prezto
zplug 'modules/environment', from:prezto
zplug 'modules/fasd', from:prezto
zplug 'modules/git', from:prezto
zplug 'modules/history', from:prezto
zplug 'modules/history-substring-search', from:prezto
zplug 'modules/utility', from:prezto

#zplug 'zakaziko99/agnosterzak-ohmyzsh-theme', as:theme
#zplug 'NicoSantangelo/Alpharized', as:theme
zplug 'bhilburn/powerlevel9k', as:theme
#zplug 'denysdovhan/spaceship-zsh-theme', as:theme

zplug 'Shougo/dein.vim'
zplug 'powerline/fonts', hook-build:'$ZPLUG_REPOS/joke/home/bin/zplug-install-powerline_fonts', on:'joke/home'
zplug 'openshift/origin', from:gh-r, as:command, use:'*client*linux*64*', rename-to:oc

zplug check || zplug install
[[ -z "$(print $ZPLUG_HOME/log/update.log(Nmd-1))" ]] && zplug update

zplug load --verbose

zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'

alias -g ':G=| egrep -i'
alias -g ':g=| egrep'

watch=('notme')
path=($HOME/bin $ZPLUG_HOME/bin $path)

