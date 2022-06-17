function run {
  if ! pgrep $1 ; then
    $@&
  fi
}
run picom --experimental-backends
run nitrogen --restore
rotate-wallpaper