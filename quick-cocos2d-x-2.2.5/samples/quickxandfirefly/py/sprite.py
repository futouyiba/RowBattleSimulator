#!python
# -*- coding:utf-8 -*-


class sprite(object):

    #名字
    nick = ''
    sex = 1

    #经验
    exp = 0
    #境界
    level = 0
    __levelShow = '凡人'

    #修炼功法
    theurgy = None

    #基础属性 升级所提升的基础属性
    baseAttr = None
    #实际属性 在上基础属性上增加 装备功法做造成的 额外属性 后计算结果
    realAttr = None

    def __init__(self, nick):
        self.baseAttr = {'hp': 100, 'mp' : 100, 'speed' : 10, 'atk' : 20, 'defense' : 20}
        self.realAttr = {'hp': 100, 'mp' : 100, 'speed' : 10, 'atk' : 20, 'defense' : 20}
        self.nick = nick

    def setLoc(self, x, y):
        self.loc = [x, y]

    def setSex(self, sex):
        self.sex = sex

    def setHp(self, hp):
        self.baseAttr['hp'] = hp

    def setMp(self, mp):
        self.baseAttr['mp'] = mp

    def setTheurgy(self, t):
        self.theurgy = t

    def setSpeed(self, speed):
        self.baseAttr['speed'] = speed
    
    def setAtk(self, atk):
        self.atk = atk

    def setDefense(self, defense):
        self.baseAttr['defense'] = defense

    #显示信息
    def getInfo(self):
        info = "Name:%8s "  % str(self.nick)
        info = info + "| Sex:%s " % str(self.sex)
        info = info + "| levelShow:%s " % str(self.__levelShow)
        info = info + "| Talent:%s " % str(self.baseAttr['talent'])
        info = info + "| HP:%8s " % str(self.baseAttr['hp'])
        info = info + "| MP:%8s " % str(self.baseAttr['mp'])
        info = info + "| Level:%2s " % str(self.level)
        info = info + "| Exp:%9s "  % str(self.exp)
        info = info + "| Speed:%5s " % str(self.baseAttr['speed'])
        info = info + "| Atk:%8s "  % str(self.atk)
        info = info + "| Defense:%8s " % str(self.baseAttr['defense'])
        info = info + "| Theurgy:%3s " % str(self.theurgy.difficulty)
        info = info + "| TheName:%s " % str(self.theurgy.name)
        info = info + "| Loc:%s " % str(self.loc)
        return info