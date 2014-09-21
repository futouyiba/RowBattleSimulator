refRev={hp,att,def,ctRtLv,ctDgLv,dgRtLv,dgDgLv,precs,penetr,tough=1,2,3,4,5,6,7,8,9,10}

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    ui.newTTFLabel({text = refRev.hp, size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy)
        :addTo(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
