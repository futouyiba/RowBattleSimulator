local Player=import("..data.Player")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    ui.newTTFLabel({text = "Simulate", size = 64, align = ui.TEXT_ALIGN_CENTER}):pos(display.cx,display.cy):addTo(self)
	 a1=Player:new():addTo(self):setPos(0,0)
	local a2=Player:new():addTo(self):setPos(1,0)
	local b1=Player:new():addTo(self):setPos(0,1)
	local b2=Player:new():addTo(self):setPos(1,1)
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function(dt)
		return self:refresh(dt)
		end)
	self:scheduleUpdate()
	itemStats={hp={pct=0,value=0,number=0,result=0}}
	for k,v in pairs(itemStats) do
		print(k)
	end
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

function MainScene:refresh(dt)
--	print("1")
--	a1:updateFrame(dt)
end

return MainScene