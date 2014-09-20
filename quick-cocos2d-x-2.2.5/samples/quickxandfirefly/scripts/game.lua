
require("config")
require("framework.init")
scheduler = require("framework.scheduler")

-- 加载网络链接的依赖库
bit = require("lib.bit")
send = require("lib.send")
netManager = require("lib.netManager")

-- define global module
game = {}

function game.startup()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
    -- 加载场景
    game.enterMainScene()
    -- 建立网络链接
    scheduler.performWithDelayGlobal(game.connect, 0)
end

function game.exit()
    game.client:close()
    CCDirector:sharedDirector():endToLua()
end

function game.enterMainScene()
    display.replaceScene(require("scenes.MainScene").new(), "fade", 0.6, display.COLOR_WHITE)
end


function game.connect()
    -- 建立网络链接
    game.client = netManager:getConnect(CONFIG_SERVER.HOST, CONFIG_SERVER.PORT, CONFIG_SERVER_PROTOCOL)
end