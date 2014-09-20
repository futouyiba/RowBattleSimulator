
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

items = {}

function MainScene:ctor()
    local sendBtn = ui.newTTFLabelMenuItem({
        text  = "发送",
        size  = 32,
        x     = display.left + 300,
        y     = display.top - 60,
        listener = function() self:requestServer() end
    })
    sendBtn:align(display.LEFT_CENTER)
    items.sendBtn = sendBtn

    local textInput = ui.newEditBox({
        size = CCSize(220, 30),
        x     = display.left + 150,
        y     = display.top - 60,  
        image = "EditBoxBg.png",
        color = "#000",
        listener = function()  end
    })
    textInput:setText("Hi Server, I am Client!")
    items.textInput = textInput

    local recvText = ui.newTTFLabelMenuItem({
        text  = "",
        size  = 18,
        x     = display.left + 350,
        y     = display.top - 200,
        listener = function() end
    })
    items.recvText = recvText

    local menu = ui.newMenu({sendBtn, recvText})
    self:addChild(menu)
    self:addChild(textInput)
end

function MainScene:requestServer()
    game.client:send(items.textInput:getText(), 1)
    recv = game.client:recv()
    if recv == nil then
        recv = "服务器连接失败"
    end
    items.recvText:setString(recv)
end

function MainScene:onEnter()
    if device.platform ~= "android" then return end

    -- avoid unmeant back
    self:performWithDelay(function()
        -- keypad layer, for android
        local layer = display.newLayer()
        layer:addKeypadEventListener(function(event)
            if event == "back" then game.exit() end
        end)
        self:addChild(layer)

        layer:setKeypadEnabled(true)
    end, 0.5)
end

return MainScene
