#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#xbacklight -set 50 &
#stalonetray &
#feh --bg-scale ~/Imagens/papelDeParede.jpg &
#numlockx &
#xsetroot -cursor_name left_ptr &

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
