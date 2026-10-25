-- Optional per-user keybind overrides (managed by DMS). Loaded after default binds.
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("ALT + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + W", hl.dsp.exec_cmd("dms ipc call window-rules toggle"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send 'Screenshot' 'Region copied to clipboard'"))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tesseract - - | wl-copy && notify-send 'OCR' 'Text copied to clipboard'"))
hl.bind("SUPER + Print",     hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png && notify-send 'Screenshot' 'Saved to ~/Pictures/Screenshots'"))
hl.bind(
    "SUPER + SHIFT + W",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/start-workspace.sh"),
    { description = "Launch work environment" }
)
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/record-region.sh"))