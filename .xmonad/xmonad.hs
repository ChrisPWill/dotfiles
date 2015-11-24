import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import System.IO

myManagementHooks :: [ManageHook]
myManagementHooks = [
  resource =? "stalonetray" --> doIgnore
  ]

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { terminal           = "urxvt"
        , modMask            = mod4Mask
        , borderWidth        = 1
        , normalBorderColor  = "#eeeaea"
        , focusedBorderColor = "#b5a9ff"

        , manageHook = manageDocks <+> manageHook defaultConfig <+> composeAll myManagementHooks
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
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
         -- > Application shortcuts
        , ((mod4Mask,               xK_Return), spawn $ "urxvt")    -- Terminal
         -- > Web
        , ((mod4Mask,               xK_f     ), spawn "firefox")
        ]
