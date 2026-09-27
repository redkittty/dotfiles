-- Monitors

-- DP-2
hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@120",
    position = "0x0",
    scale    = "auto",
})

-- DP-3
hl.monitor({
  output = "DP-3",
  mode = "1920x1080@60",
  position = "auto-left",
  scale = "auto",
})

-- Workspaces
hl.workspace_rule({ workspace = "1", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2"})
hl.workspace_rule({ workspace = "3", monitor = "DP-2"})
hl.workspace_rule({ workspace = "4", monitor = "DP-2"})
hl.workspace_rule({ workspace = "5", monitor = "DP-2"})
hl.workspace_rule({ workspace = "6", monitor = "DP-2"})

hl.workspace_rule({ workspace = "7", monitor = "DP-3"})
hl.workspace_rule({ workspace = "8", monitor = "DP-3"})
hl.workspace_rule({ workspace = "9", monitor = "DP-3"})

