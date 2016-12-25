import XMonad
import XMonad.Config.Xfce
import XMonad.Config.Gnome
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog

main = xmonad myConfig

myConfig = xfceConfig
           {
             startupHook = setWMName "LG3D",
             modMask = mod4Mask
           }
