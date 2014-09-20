local speed=0.5

local Progress = import("..ui.Progress")

local Player = class("Player", function()
    local sprite = display.newSprite("buggy1.png")
    sprite:setScale(0.3)
    return sprite
end)

function Player:ctor()
    --battle stats
    self.healthLimit=100
    self.attack = 25
    self.hp = 50
    self.defense=50
    self.critResultLevel=20
    self.critChanceLevel=20
    self.dodgeResultLevel=20
    self.dodgeChanceLevel=20
    self.penetration=20
    self.toughness=12
    self.precision=12
    self.name="DefaultName"
    --condition stats






    self.progress=Progress.new("progressbackground.png", "progressfill.png")
    self.progress:setScale(1.0)
    self.progress:setPosition(self:getContentSize().width/2,self:getContentSize().height)
    self:addChild(self.progress)


    self:scheduleUpdate();
--[[    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, 
        function()
            self.progress:setProgress(self.hp/self.healthLimit*100)
            self:updateFrame(dt)
        end)
]]--
    self:setTouchEnabled(true)
    self:addNodeEventListener(NODE_TOUCH_EVENT,function() self:ruin() end) 


end

function Player:setPos(isDown,isBack)
    self.isFront=isDown--0为前排，1为后排
    self.isRight=isBack--0为上方，1为下方
    print(isDown,"\t",isBack)

    self.posX=320+(isDown-0.5)*(isBack+1)*120
    self.posY=180-(isDown-0.5)*(isBack+1)*120
    self:setPosition(CCPoint(self.posX,self.posY))
    self.isRuined=false
end


function Player:ruin()
    print(self.name,"ruin")
    blink=CCBlink:create(1.5, 3)
    fade=CCFadeTo:create(1.5, 64 )
 --   spawn=CCSpawn:create({blink,fade,nil})
    self:runAction(fade)
    self.progress:setVisible(false)
    self.isRuined=true
end

function Player:updateFrame(dt)

    math.randomseed(os.time()) 
    local shiftX
    local shiftY
    local x,y=self:getPosition()
    if (x>(self.posX-20) and x<(self.posX+20)) then
        shiftX=math.random(-speed,speed)
    else
        shiftX=(self.posX-x)/math.abs(self.posX-x)*speed

    end
    if (y>(self.posY-20) and y<(self.posY+20)) then
        math.randomseed(tostring(os.time()):reverse():sub(1, 6)) 
    
        shiftY=math.random(-speed,speed)
    else
        shiftY=(self.posY-y)/math.abs(self.posY-y)*speed
    end
    self:moveBy(0.016, shiftX, shiftY)


end

return Player