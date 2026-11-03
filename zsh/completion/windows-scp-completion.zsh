# Hosts whose SSH default shell is Windows PowerShell / pwsh.
# Use the name exactly as you type it in `scp`.
typeset -ga WINDOWS_SSH_HOSTS=(
  big-endian
  192.168.1.23
)

# Load zsh's normal implementation and keep an untouched copy.
autoload -Uz _remote_files
functions -c _remote_files _remote_files_unix

_remote_files_windows() {
  local host="${IPREFIX%:}"
  local remote_path="$PREFIX"
  local dir b64 pscmd out item
  local -a ssh_args entries files dirs
  local expl
  local ret=1

  ssh_args=("$@")
  [[ ${ssh_args[1]-} == --  ]] && shift ssh_args
  [[ ${ssh_args[1]-} == ssh ]] && shift ssh_args

  if [[ "$remote_path" == */* ]]; then
    dir="${remote_path%/*}"

    [[ "$remote_path" == [A-Za-z]:/ ]] && dir="$remote_path"
    [[ -z "$dir" ]] && dir="/"
  else
    dir="."
  fi

  # Encode the pathname so spaces, quotes, $, etc. don't need to survive
  # several layers of shell/PowerShell quoting.
  b64="$(
    printf '%s' "$dir" |
      base64 |
      tr -d '\r\n'
  )" || return 1

  pscmd="\$p=[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('$b64')); Get-ChildItem -LiteralPath \$p -Force -ErrorAction SilentlyContinue | ForEach-Object { if (\$_.PSIsContainer) { [Console]::Out.WriteLine(\$_.Name + '/') } else { [Console]::Out.WriteLine(\$_.Name) } }"

  out="$(
    command ssh \
      -o BatchMode=yes \
      -a -x \
      "${ssh_args[@]}" \
      "$host" \
      "$pscmd" \
      2>/dev/null
  )" || return 1

  out="${out//$'\r'/}"
  entries=("${(@f)out}")

  # Remove the already-typed directory portion so compadd only receives
  # names from the directory we're listing.
  compset -P '*/'

  for item in "${entries[@]}"; do
    [[ -z "$item" ]] && continue

    if [[ "$item" == */ ]]; then
      dirs+=("${item%/}")
    else
      files+=("$item")
    fi
  done

  if (( ${#dirs} )); then
    _wanted remote-files expl 'remote directory' \
      compadd -S/ -- "${dirs[@]}" && ret=0
  fi

  if (( ${#files} )); then
    _wanted remote-files expl 'remote file' \
      compadd -- "${files[@]}" && ret=0
  fi

  return ret
}

# Replace _remote_files with a dispatcher.
_remote_files() {
  local remote_host="${IPREFIX%:}"
  local match_host="${remote_host#*@}"
  local windows_host

  # Only alter scp. Everything else retains zsh's stock behaviour.
  if [[ "$service" == scp ]]; then
    for windows_host in "${WINDOWS_SSH_HOSTS[@]}"; do
      if [[ "$match_host" == "$windows_host" ]]; then
        _remote_files_windows "$@"
        return $?
      fi
    done
  fi

  _remote_files_unix "$@"
}
