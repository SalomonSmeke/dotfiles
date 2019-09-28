# Execute code in the background to not affect the current session
(
  # Compile .zshrc, if modified, to increase startup speed.
  zshrc="${HOME}/.zshrc"
  if [[ -s "$zshrc" && (! -s "${zshrc}.zwc" || "$zshrc" -nt "${zshrc}.zwc") ]]; then
    zcompile "$zshrc"
  fi
) &!
