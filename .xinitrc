[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#xbacklight -set 50 &
#stalonetray &
#feh --bg-scale ~/Imagens/papelDeParede.jpg &
#dunst &

#export MPD_HOST=$HOME/.config/mpd/socket
#mpd &

xset +fp /home/jonatas/.local/share/fonts
xset fp rehash

numlockx &
xsetroot -cursor_name left_ptr &

exec xmonad
