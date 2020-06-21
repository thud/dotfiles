import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = smartSpacingWithEdge 15 $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

--myLayout = gaps [(U,18), (R,23)] $ Tall 1 (3/100) (1/2) ||| Full

main = do
    xmproc <- spawnPipe "xmobar"
    spawn "startup"
    spawn "sxhkd"
    xmonad $ defaultConfig {
        terminal = "alacritty",
        layoutHook = myLayout
    }
