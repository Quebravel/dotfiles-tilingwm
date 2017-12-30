-- Todas as Frags USE="" para ativar todas as extenções:
-- mpd mpris timezone with_conduit with_uvmeter alsa dbus inotify wifi xft xpm
-- O workspace padrão de inicio dependera em qual workspace você esta depois de fazer a recompilação.

Config {  font = "xft:ProFont-11"
        --       "-Misc-Fixed-Regular-R-Normal-*-13-*-*-*-*-*-*-*"
       , additionalFonts = [ "xft:TamzenForPowerline-11" ] --(adicione no make.conf USE="xft" para o xmobar ser compilado com essa extenção)
       , borderColor = "#1C1C1C"
       , border = NoBorder
       , bgColor = "#1C1C1C"
       , fgColor = "#93a1a1"
       , alpha = 255
       , position = TopW L 100
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% %multicpu% %memory% %battery%}{<fc=#93a1a1>%locks%</fc> %dynnetwork% %DEVICEwi% %coretemp% %default:Master% <fc=#d75f00>%mydate%</fc>"
--     , template = "<fn=1> %StdinReader% %multicpu% %memory% %battery%</fn>}{<fn=1><fc=#93a1a1>%locks%</fc> %dynnetwork% %DEVICEwi% %coretemp% %default:Master% <fc=#d75f00>%mydate%</fc></fn>"
       , commands = [ Run Volume "default" "Master" [ "--template" , "<status>" --(adicione no make.conf USE="alsa" para o xmobar ser compilado com essa extenção)
       , "--"                                          --V
       , "--on", "<fc=#ffff66>Vol: <volume></fc>%"     --O
       , "--onc", "#93a1a1"                            --L
       , "--off", "<fc=#dc322f>Vol: MUDO</fc>"         --U
       , "--offc", "#dc322f"                           --M
       ] 10                                            --E

       -- BATÉRIA
       , Run Battery           [ "--template" , "Bat: <acstatus>"
       , "--Low"      , "10"        -- units: %
       , "--High"     , "80"        -- units: %
       , "--low"      , "#d70000"
       , "--high"     , "#00afaf"
       , "--" -- battery specific options
       -- discharging status
       , "-o"  , "<left>% (<timeleft>)"
       -- AC "on" status
       , "-O"  , "<fc=#af8700>AC</fc>"
       -- charged status
       , "-i"  , "<fc=#af005f>100</fc>%"
       ] 50

       -- TEMPERATURA
       , Run CoreTemp          [ "--template" , "<core0>°C <core1>°C"
       , "--Low"      , "60"        -- units: °C
       , "--High"     , "80"        -- units: °C
       , "--low"      , "#268bd2"
       , "--normal"   , "#af8700"
       , "--high"     , "#d70000"
       ] 50

       -- INTERNET (dynamic interface resolution)
       , Run DynNetwork        [ "--template" , "<fc=#ff0066><dev></fc> <rx>kB/s <tx>kB/s"
       , "--Low"      , "30000"       -- units: Kb/s
       , "--High"     , "60000"       -- units: Kb/s
       , "--low"      , "#93a1a1"
       , "--high"     , "#d70000"
       ] 10

       -- SINAL WIFI
--addwifi       ,  Run Wireless "DEVICE" --(adicione no make.conf USE="wifi" para o xmobar ser compilado com essa extenção) (%wlp2s0wi%)
--addwifi      [ "-a", "l"
--addwifi      , "-x", "-"
--addwifi      , "-t", "<fc=#00afaf><essid> <quality></fc>%"
--addwifi      , "-L", "40"
--addwifi      , "-H", "70"
--addwifi      , "-l", "#d70000"
--addwifi      , "-n", "#af8700"
--addwifi      , "-h", "#00afaf"
--addwifi      ] 10

       -- MEMÓRIA RAM
       , Run Memory     [ "--template" ,"Mem: <used>Mb"
       , "--Low"        , "500"        -- units: %
       , "--High"       , "3000"       -- units: %
       , "--low"        , "#93a1a1"
       , "--normal"     , "#af8700"
       , "--high"       , "#d70000"
       ] 10

       -- CPU
       , Run MultiCpu   [ "--template" , "<total0>% <total1>% <total2>% <total3>%"
       , "--Low"        , "50"         -- units: %
       , "--High"       , "85"         -- units: %
       , "--low"        , "#93a1a1"
       , "--normal"     , "#d75f00"
       , "--high"       , "#d70000"
       ] 10

       -- LOCKS
       , Run Locks

       -- DATA
       -- , Run Date "%A %d/%m/%y %H:%M:%S " "date" 10
       -- , Run Com "sh" ["/home/jonatas/.xmonad/date.sh"] "date" 10
       , Run Com "date" ["+%A %d/%m/%y %H:%M:%S        "] "mydate" 10

       -- BARRA TITULO/TAGS
       , Run StdinReader

                    ]
       }
