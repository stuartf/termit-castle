assert(package.loadlib('/usr/lib/x86_64-linux-gnu/liblua5.2-posix.so.1', 'luaopen_posix_c'))()

defaults = {}
defaults.windowTitle = 'Termit'
defaults.tabName = 'Terminal'
defaults.encoding = 'UTF-8'
defaults.wordChars = '+-AA-Za-z0-9,./?%&#:_~'
defaults.scrollbackLines = 4096
defaults.font = 'Monospace 10'
defaults.geometry = '80x24'
defaults.hideSingleTab = true
defaults.showScrollbar = true
defaults.showBorders = false
defaults.fillTabbar = false
defaults.hideMenubar = true
defaults.allowChangingTitle = true
defaults.visibleBell = true
defaults.audibleBell = false
defaults.urgencyOnBell = true
defaults.matches = {['http[^ \n]+'] = function (url) spawn('x-www-browser "'..url..'"') end}
setOptions(defaults)

-- Unbind ctrl-t so it doesn't create tabs
bindKey('Ctrl-t', nil)

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    setTabFont(string.sub(tab.font, 1, string.find(tab.font, '[0-9.]+$') - 1)..(tab.fontSize + delta))
end

bindKey('CtrlShift-equal', function () changeTabFontSize(1) end)
bindKey('Ctrl-equal', function () changeTabFontSize(1) end)
bindKey('Ctrl-minus', function () changeTabFontSize(-1) end)
bindKey('Ctrl-0', function () setTabFont(defaults.font) end)

setKbPolicy('keysym')

posix.setenv('TERM', 'xterm-256color')
