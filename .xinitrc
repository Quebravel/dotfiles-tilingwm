[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#xbacklight -set 50 &
#stalonetray &
#feh --bg-scale ~/Imagens/papelDeParede.jpg &
numlockx &
xsetroot -cursor_name left_ptr &

exec xmonad
