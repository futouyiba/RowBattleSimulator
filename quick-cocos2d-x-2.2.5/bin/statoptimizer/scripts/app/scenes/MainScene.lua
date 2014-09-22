require("/app/scenes/csv.lua")

ref={"hp","att","def","ctRtLv","ctDgLv","dgRtLv","dgDgLv","precs","penetr","tough","armor","weapon","chasis","engine","tyre"}
refRev={hp=1,att=2,def=3,ctRtLv=4,ctDgLv=5,dgRtLv=6,dgDgLv=7,precs=8,penetr=9,tough=10}
armor,weapon,chasis,engine,tyre=11,12,13,14,15
resultFactor={hp={0,1,0,0},att={0,1,0,0},def={12.5,237.5,1,0},ctRtLv={11.4,215.9,0.05,0.7},ctDgLv={8.3,158.3,0.5,2.0},dgRtLv={10.0,190.0,0.05,0.70},dgDgLv={10.0,190.0,0.33,0.67},precs={10.0,190.0,0,math.huge},penetr={12.5,237.5,0,math.huge},tough={8.3,158.3,0,math.huge}}

statValue={0.25,1,0.53,0.51,0.5,1.13,1.13,1.87,0.88,0.84}
positionFactor={0,0,0,0,0,0,0,0,0,0,armor=3,weapon=3,chasis=2,engine=2,tyre=2}
--itemLevel={{1,-2},}
itemStatNum={1,0,1,0,0,1,1,0,0,0}
itemStatDis={1,3,6,7}
level=20
step=0.2
i=0
max=0
alpha=1.7095
itemValue=1400
potencyMax=0
systemStats={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0.05},ctDgLv={pct=0,value=0,number=0,result=0.5},dgRtLv={pct=0,value=0,number=0,result=0.05},dgDgLv={pct=0,value=0,number=0,result=0.33},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}}
baseStats={hp={pct=0,value=0,number=0,result=2232},att={pct=0,value=0,number=0,result=558},def={pct=0,value=0,number=0,result=526},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}}
itemStats={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}}
totalStats={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}}
maxStats={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}}
--armorStats,weaponStats,chasisStats,engineStats,tyreStats={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}},={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}},={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}},={hp={pct=0,value=0,number=0,result=0},att={pct=0,value=0,number=0,result=0},def={pct=0,value=0,number=0,result=0},ctRtLv={pct=0,value=0,number=0,result=0},ctDgLv={pct=0,value=0,number=0,result=0},dgRtLv={pct=0,value=0,number=0,result=0},dgDgLv={pct=0,value=0,number=0,result=0},precs={pct=0,value=0,number=0,result=0},penetr={pct=0,value=0,number=0,result=0},tough={pct=0,value=0,number=0,result=0}}

function calcResult(t)
    for k,v in pairs(t) do
        v.number=v.value/statValue[refRev[k]]
        v.result=math.min(v.number/(resultFactor[k][1]*level+resultFactor[k][2])+resultFactor[k][3],resultFactor[k][4])
    end
end

function calcFromResult(t)
    for k,v in pairs(t) do
        v.number=(v.result-resultFactor[k][3])*(resultFactor[k][1]*level+resultFactor[k][2])
        v.value=v.number*statValue[refRev[k]]
    end
        print("baseStats result",baseStats.att.result,baseStats.def.result,baseStats.hp.result,baseStats.ctRtLv.result,baseStats.ctDgLv.result,baseStats.dgRtLv.result,baseStats.dgDgLv.result)

end

function devide()
    local itemValueAlphaPower=math.pow(itemValue,alpha)
	for k,v in pairs(itemStats) do
		v.value=math.pow(itemValueAlphaPower*v.pct,1/alpha)
	end
end

function calcpotency()
--[[	for k,v in pairs(totalStats) do
		totalStats[k].result=baseStats[k].result+itemStats[k].result
		print("calcpotency",k,"   pct:",itemStats[k].pct)
	end]]--
	local potency=totalStats.att.result*totalStats.def.result*totalStats.hp.result*(1+totalStats.ctRtLv.result*totalStats.ctDgLv.result)*(1-totalStats.dgRtLv.result*totalStats.dgDgLv.result)
	print("totalStats result",totalStats.att.result,totalStats.def.result,totalStats.hp.result,totalStats.ctRtLv.result,totalStats.ctDgLv.result,totalStats.dgRtLv.result,totalStats.dgDgLv.result)

    print("potency",potency)
	return potency
end

function record()
	for k,v in pairs(maxStats) do
        for i,j in pairs(v) do
    		maxStats[k][i]=itemStats[k][i]
        end
	end
end

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    calcFromResult(baseStats)
    label={title={},pct={},value={},result={}}
    pct={0,0,0,0,0}
    for a=1,10,1 do
        label.title[a]=ui.newTTFLabel({text = ref[a], size = 32, align = ui.TEXT_ALIGN_CENTER}):pos(120, 960-80*a):addTo(self)
        label.pct[a]=ui.newTTFLabel({text = i, size = 32, align = ui.TEXT_ALIGN_CENTER}):pos(320, 960-80*a):addTo(self)
        label.value[a]=ui.newTTFLabel({text = i, size = 32, align = ui.TEXT_ALIGN_CENTER})
        :pos(440, 960-80*a)
        :addTo(self)
        label.result[a]=ui.newTTFLabel({text = i, size = 32, align = ui.TEXT_ALIGN_CENTER})
        :pos(560, 960-80*a)
        :addTo(self)
    end
    max=0
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function()
    	return self:onRefresh()
    	end)
    self:scheduleUpdate()
    sum={0,0,0,0,0}
    sum[0]=0
    times=#itemStatDis
    print("times=",times)
    
    ranPct(1)
    print("potencyMax",max)
    for a=1,10,1 do
        label.pct[a]:setString((maxStats[ref[a]].pct*100).."%")
        label.value[a]:setString(maxStats[ref[a]].number)
        label.result[a]:setString(maxStats[ref[a]].result)
    end
    csvTestTable=LoadCsv("F:/RowBattleSimulator/quick-cocos2d-x-2.2.5/bin/statoptimizer/res/csvtest.csv")
    print(csvTestTable)
    for k,v in pairs(csvTestTable) do
        for i,j in pairs(v) do
            print(j)
        end
    end
end

function ranPct(i)
    print("ranPct,i=",i)
    if i==times then
        pct[i]=1-sum[i-1]
        itemStats[ref[itemStatDis[i]]].pct=pct[i]
        print(ref[itemStatDis[i]],"=",pct[i])
        sum[i]=sum[i-1]+pct[i]
        devide()
        for k,v in pairs(totalStats) do
            totalStats[k].value=baseStats[k].value+itemStats[k].value
        end
        calcResult(totalStats)
        local potency=calcpotency()
        if potency>max then 
            max=potency
            print("here comes max!")
            record()
        end
        else 
            pct[i]=step
            print(ref[itemStatDis[i]]," pct=",pct[i])
            sum[i]=sum[i-1]+pct[i]
            print("search for solution:","sum",i,"=",sum[i])
            while pct[i]+sum[i-1]+step*(times-i)<=1 do
                itemStats[ref[itemStatDis[i]]].pct=pct[i]
                ranPct(i+1)
                pct[i]=pct[i]+step
            end
    end 
end


function MainScene:onEnter()
end

function MainScene:onRefresh()


end


function MainScene:onExit()
end

return MainScene
