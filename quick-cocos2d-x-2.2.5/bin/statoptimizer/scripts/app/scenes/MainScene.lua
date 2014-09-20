step=0.01
i=0
max=0
alpha=1.7095
itemValue=50
yieldMax=0
baseStats={att={pct=0,value=100},def={pct=0,value=15},hp={pct=0,value=0}}
itemStats={att={pct=0,value=0},def={pct=0,value=0},hp={pct=0,value=0}}
totalStats={att={pct=0,value=0},def={pct=0,value=0},hp={pct=0,value=0}}
maxStats={att={pct=0,value=0},def={pct=0,value=0},hp={pct=0,value=0}}

function devide(itemValue,itemStats)
	local itemValueAlphaPower=math.pow(itemValue,alpha)
	for k,v in pairs(itemStats) do
		v.value=math.pow(itemValueAlphaPower*v.pct,1/alpha)
	end
end

function calcYield(baseStats,itemStats,totalStats)
	for k,v in pairs(totalStats) do
		totalStats[k].value=baseStats[k].value+itemStats[k].value
		print(itemStats[k].pct)
	end
	yield=totalStats.att.value*totalStats.def.value*totalStats.hp.value
	print(yield)
	return yield
end

function record(maxStats,itemStats,totalStats)
	for k,v in pairs(maxStats) do
		maxStats[k].pct=itemStats[k].pct
		maxStats[k].value=totalStats[k].value
	end


end

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    label1=ui.newTTFLabel({text = i, size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy+50)
        :addTo(self)
    label2=ui.newTTFLabel({text = i, size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy)
        :addTo(self)
    label3=ui.newTTFLabel({text = i, size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy-50)
        :addTo(self)
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function()
    	return self:onRefresh()
    	end)
    self:scheduleUpdate()
    for pct1=0,1-step*2,step do
    	itemStats.att.pct=pct1
	    for pct2=0,1-step-pct1,step do
	    	itemStats.def.pct=pct2
	    	pct3=1-pct1-pct2

     	    	itemStats.hp.pct=pct3
     	    	devide(itemValue,itemStats) 
     	    	yield=calcYield(baseStats,itemStats,totalStats)	
     	    	if yield>yieldMax then
     	    		yieldMax=yield
     	    		record(maxStats,itemStats,totalStats)
     	    	end

		end
    end

    
    print("yieldMax",yieldMax)
    label1:setString(maxStats.att.pct)
    label2:setString(maxStats.def.pct)
    label3:setString(maxStats.hp.pct)
end

function MainScene:onEnter()
end

function MainScene:onRefresh()


end


function MainScene:onExit()
end

return MainScene
