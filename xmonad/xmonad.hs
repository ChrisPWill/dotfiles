import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.SimpleFloat

import System.IO

myManagementHooks :: [ManageHook]
myManagementHooks = [
  resource =? "stalonetray" --> doIgnore,
  isFullscreen --> doFullFloat
  ]

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar"
    spawn "xscreensaver -no-splash"
    spawn "stalonetray"
    spawn "feh --bg-scale /home/cwilliams/.config/awesome/themes/cpw/wallpaper2.jpg &"
    spawn "redshift-gtk"
    xmonad $ docks $ defaultConfig
        { terminal           = "urxvt"
        , modMask            = mod4Mask
        , borderWidth        = 1
        , normalBorderColor  = "#eeeaea"
        , focusedBorderColor = "#654dff"

        , manageHook = manageDocks <+> manageHook defaultConfig <+> composeAll myManagementHooks
        , layoutHook = avoidStruts  $  (layoutHook defaultConfig ||| simpleFloat)
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "blue" "" . shorten 50
                        , ppCurrent = xmobarColor "blue" "" . wrap "[" "]"
                        }
        } `additionalKeys`
        [ 
         -- Custom Hotkeys
         -- > Launching/Termination
          ((mod4Mask,               xK_r     ), spawn "dmenu_run -nb '#fffafa' -nf '#999999' -l 5")
        , ((mod4Mask,               xK_d     ), kill)
        , ((mod4Mask,               xK_z     ), spawn "xscreensaver-command -lock; xset dpms force off")
         -- > Application shortcuts
        , ((mod4Mask,               xK_Return), spawn "urxvt")    -- Terminal
         -- > Web
        , ((mod4Mask,               xK_f     ), spawn "firefox")
        , ((mod4Mask,               xK_g     ), spawn "google-chrome-stable")
        ]
