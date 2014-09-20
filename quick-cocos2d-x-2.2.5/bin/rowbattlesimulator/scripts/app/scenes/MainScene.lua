local Player=import("..data.Player")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    ui.newTTFLabel({text = "Simulate", size = 64, align = ui.TEXT_ALIGN_CENTER}):pos(display.cx,display.cy):addTo(self)
	local a1=Player:new():addTo(self):setPos(0,0)
	local a2=Player:new():addTo(self):setPos(1,0)
	local b1=Player:new():addTo(self):setPos(0,1)
	local b2=Player:new():addTo(self):setPos(1,1)
	self:addNodeEventListener(NODE_ENTER_FRAME_EVENT, function(dt)
		return a1:updateFrame(dt)
		end)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene