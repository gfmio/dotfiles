Caffeine = hs.loadSpoon("Caffeine")
ReloadConfiguration = hs.loadSpoon("ReloadConfiguration")
ShiftIt = hs.loadSpoon("ShiftIt")
SpoonInstall = hs.loadSpoon("SpoonInstall")

local mod = "ctrl"

Caffeine:start()

ReloadConfiguration:start()

ShiftIt:bindHotkeys({})

hs.hotkey.bind({ mod, "shift" }, "c", function()
  hs.reload()
end)

hs.hotkey.bind({ mod }, "return", function()
  hs.execute("open -a Terminal $HOME")
end)
