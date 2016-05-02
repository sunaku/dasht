#
# Source this file in ZSH to activate TAB completion for dasht:
#
#   source path_to_dasht_codebase/etc/zsh/completions.zsh
#
# Or simply add the completions/ directory to your ZSH $fpath
# if you've already set up ZSH's completion system elsewhere:
#
#   fpath+=path_to_dasht_codebase/etc/zsh/completions/
#
autoload -Uz compinit
fpath+=${0:r}
compinit
