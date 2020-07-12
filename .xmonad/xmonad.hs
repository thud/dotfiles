import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = smartBorders . smartSpacingWithEdge 15 $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

main = do
    xmproc <- spawnPipe "xmobar"
    spawn "startup"
    spawn "sxhkd"
    xmonad $ ewmh defaultConfig {
        terminal = "alacritty",
        layoutHook = myLayout
    }
