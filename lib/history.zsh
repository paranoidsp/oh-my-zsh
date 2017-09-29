## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=100000000
SAVEHIST=100000000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

#setopt append_history
setopt extended_history
# Turning off inc_append_history when share_history is on
#setopt inc_append_history
setopt share_history
#setopt hist_expire_dups_first
#setopt hist_ignore_dups # ignore duplication command history list
#setopt hist_ignore_all_dups # ignore duplication command history list
#setopt hist_ignore_space
#setopt hist_save_no_dups
setopt hist_verify
setopt hist_reduce_blanks

# inc_append_history and share_history are mutually exclusive
#setopt inc_append_history
setopt share_history
