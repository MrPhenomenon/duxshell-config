-- DMS Window Rules — managed by Dux Shell
-- Do not edit manually; changes may be overwritten

-- DMS-RULE: id=dms-floating-windows, name=DMS Floating Windows
hl.window_rule({ match = { class = "^(dev\\.duxlabs\\.shell|com\\.danklinux\\.dms)$" }, float = true })

-- DMS-RULE: id=wr_1789249688860975153, name=com.anthropic.Claude
hl.window_rule({ match = { class = "^com.anthropic.Claude$" }, workspace = "2" })

-- DMS-RULE: id=wr_1789503073548524385, name=org.kde.kcalc
hl.window_rule({ match = { class = "^org.kde.kcalc$" }, float = true })

-- DMS-RULE: id=wr_1792609125035296541, name=ai.opencode.desktop
hl.window_rule({ match = { class = "^ai.opencode.desktop$" }, workspace = "2" })

-- DMS-RULE: id=dms-window-opaque, name=DMS Window Opaque
hl.window_rule({ match = { class = "^(dev\\.duxlabs\\.shell|com\\.danklinux\\.dms)$" }, opaque = true })
