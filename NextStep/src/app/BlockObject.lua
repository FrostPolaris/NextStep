
LEFT  = 2
UP    = 3
RIGHT = 5
DOWN  = 7

BLOCKTYPE_NORMAL = 100
BLOCKTYPE_START = 101
BLOCKTYPE_EXIT = 102
BLOCKTYPE_TREASURE = 103

BlockMask={
Block01 = LEFT,
Block02 = UP,
Block03 = RIGHT,
Block04 = DOWN,
Block05 = LEFT * UP,
Block06 = UP * RIGHT,
Block07 = RIGHT * DOWN,
Block08 = DOWN * LEFT,
Block09 = UP * DOWN,
Block10 = LEFT * RIGHT,
Block11 = LEFT * UP * RIGHT,
Block12 = UP * RIGHT * DOWN,
Block13 = LEFT * RIGHT * DOWN,
Block14 = LEFT * UP * DOWN,
Block15 = LEFT * UP * RIGHT * DOWN,
}

local blockObject = {}

function blockObject.HasDirection(block, direction)
    local remainder = math.fmod(block.Mask, direction)
    return remainder == 0
end

local function CreatBlock(blockMask, blockType, node)
    local block = {}
    block.Mask = blockMask
    block.Type = blockType
    block.Node = node
--    node:setAnchorPoint(cc.p(0.5 ,0.5))
    return block
end

function blockObject.CreateNormalBlock()
    local blockMask = math.random(1, 15)
    local key = 'Block' .. string.format("%02d.png", blockMask)
    local node = cc.Sprite:create('Image/Block/' .. key)
    return CreatBlock(BlockMask[key], BLOCKTYPE_NORMAL, node)
end

function blockObject.CreateStartBlock()
    return CreatBlock(0, BLOCKTYPE_START, cc.Sprite:create('Image/Block/Block15.png'))
end

function blockObject.CreateExitBlock()
    return CreatBlock(0, BLOCKTYPE_EXIT, cc.Sprite:create('Image/Block/ExitBlock.png'))
end

function blockObject.CreateTreasureBlock()
    return CreatBlock(0, BLOCKTYPE_TREASURE, cc.Sprite:create('Image/Other/Treasure.png'))
end

return blockObject

--[[
-- some test codes

local function AddImages(rootNode)
    local blockManager = require "src/app/BlockObject.lua"
    for i = 1, 8 do
        for j = 1, 8 do
            local block = blockManager.CreateNormalBlock()
            block.Node:setPosition(cc.p((i-1) * 80 + 40, (j-1) * 80 + 40))
            rootNode:addChild(block.Node)
        end
        
    end
end

--local heroObject = require('res/HeroNode.lua').create()
--local heroNode = heroObject.root
--heroNode:setPosition(cc.p(120, 120))
--heroNode:runAction(heroObject.animation)
----heroObject.animation:gotoFrameAndPlay(40, 55, true)
--heroObject.animation:play("Right", true)
--heroNode:runAction(cc.MoveTo:create(0.5, cc.p(520, 120)))
--self.resourceNode_:addChild(heroNode)
--AddImages(self.resourceNode_)

]]