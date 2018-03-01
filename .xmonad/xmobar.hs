-- Todas as Frags USE="" para ativar todas as extenções:
-- mpd mpris timezone with_conduit with_uvmeter alsa dbus inotify wifi xft xpm
-- O workspace padrão de inicio dependera em qual workspace você esta depois de fazer a recompilação.

Config {  font = "xft:misc ohsnap:size:14,FontAwesome:size=9"
        --       "xft:ProFont-11"
        --       "-Misc-Fixed-Regular-R-Normal-*-13-*-*-*-*-*-*-*"
        --       , additionalFonts = [ "xft:TamzenForPowerline-11" ] --(adicione no make.conf USE="xft" para o xmobar ser compilado com essa extenção)
       , borderColor = "#1C1C1C"
       , border = NoBorder
       , bgColor = "#1C1C1C"
       , fgColor = "#8a8a8a"
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
       , template = "%StdinReader%%multicpu%%memory%%battery%}{<fc=#93a1a1>%locks% </fc>%dynnetwork%%DEVICEwi%%coretemp%%default:Master%<fc=#d75f00,#331400> %mydate% </fc>"

--     , template = "<fn=1> %StdinReader% %multicpu% %memory% %battery%</fn>}{<fn=1><fc=#93a1a1>%locks%</fc> %dynnetwork% %DEVICEwi% %coretemp% %default:Master% <fc=#d75f00>%mydate%</fc></fn>"

       , commands = [

       -- SOM
       -- Run Com "sh" ["/home/jonatas/.xmonad/volume.sh"] "volume" 10
         Run Volume "default" "Master" [ "--template" , "<status>"
       , "--"
       , "--on"       , "<fc=#ffff66,#333300>  <volume>% </fc>"
       , "--onc"      , "#93a1a1"
       , "--off"      , "<fc=#dc322f,#1a0000>  MUDO </fc>"
       , "--offc"     , "#dc322f,#1a0000"
       ] 10

       -- BATÉRIA
       , Run Battery           [ "--template" , "<fc=#6c71c4,#0f1024> <acstatus> </fc>"
       -- , "--Low"      , "10"        -- units: %
       -- , "--High"     , "80"        -- units: %
       -- , "--low"      , "#d70000,#0f1024"
       -- , "--high"     , "#00afaf,#0f1024"
       , "--" -- battery specific options
       -- discharging status
       , "-o"  , "<left>% (<timeleft>)"
       -- AC "on" status
       , "-O"  , "<fc=#6c71c4,#0f1024></fc>"
       -- charged status
       , "-i"  , "<fc=#6c71c4,#0f1024></fc>"
       ] 50

       -- TEMPERATURA
       , Run CoreTemp          [ "--template" , "<fc=#268bd2,#000033> <core0>°C <core1>°C </fc>"
       , "--Low"      , "60"        -- units: °C
       , "--High"     , "80"        -- units: °C
       , "--low"      , "#268bd2,#000033"
       , "--normal"   , "#af8700,#000033"
       , "--high"     , "#d70000,#000033"
       ] 50

       -- INTERNET (dynamic interface resolution)
       , Run DynNetwork        [ "--template" , "<fc=#ff0066,#330014> <dev> </fc><fc=#d33682,#2a0919>  <rx>kB/s  <tx>kB/s </fc>"
       , "--Low"      , "30000"       -- units: Kb/s
       , "--High"     , "60000"       -- units: Kb/s
       , "--low"      , "#d33682,#2a0919"
       , "--high"     , "#d70000,#2a0919"
       ] 10

       -- SINAL WIFI
--addwifi       ,  Run Wireless "DEVICE" --(adicione no make.conf USE="wifi" para o xmobar ser compilado com essa extenção) (%wlp2s0wi%)
--addwifi      [ "-a", "l"
--addwifi      , "-x", "-"
--addwifi      , "-t", "<fc=#00afaf,#003333>  <essid> <quality>% </fc>"
--addwifi      , "-L", "40"
--addwifi      , "-H", "70"
--addwifi      , "-l", "#d70000,#003333"
--addwifi      , "-n", "#af8700,#003333"
--addwifi      , "-h", "#00afaf,#003333"
--addwifi      ] 10

       -- MEMÓRIA RAM
       , Run Memory     [ "--template" ,"<fc=#859900,#2c3300> Mem: <used>Mb </fc>"
       , "--Low"        , "500"        -- units: %
       , "--High"       , "3000"       -- units: %
       -- , "--low"        , "#93a1a1,#2c3300"
       , "--normal"     , "#859900,#2c3300"
       , "--high"       , "#d70000,#2c3300"
       ] 10

       -- CPU
       , Run MultiCpu   [ "--template" , "<fc=#cb4b16,#2e1106> <total0>% <total1>% <total2>% <total3>% </fc>"
       , "--Low"        , "50"         -- units: %
       , "--High"       , "85"         -- units: %
       , "--low"        , "#cb4b16,#2e1106"
       , "--normal"     , "#cc0066,#2e1106"
       , "--high"       , "#d70000,#2e1106"
       ] 10

       -- LOCKS
       , Run Locks

       -- DATA
       -- , Run Date "%A %d/%m/%y %H:%M:%S " "date" 10
       -- , Run Com "sh" ["/home/jonatas/.xmonad/date.sh"] "date" 10
       , Run Com "date" ["+ %A %d/%m/%y %H:%M:%S  "] "mydate" 10

       -- BARRA TITULO/TAGS
       , Run StdinReader

                    ]
       }
