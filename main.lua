local Carta = require("classes.carta")
local Config = require("config")
--debuuger
if os.getenv "LOCAL_LUA_DEBUGGER_VSCODE" == "1" then
    local lldebugger = require "lldebugger"
    lldebugger.start()
    local run = love.run
    function love.run(...)
        local f = lldebugger.call(run, false, ...)
        return function(...) return lldebugger.call(f, false, ...) end
    end
end

local deck = {}

function love.load()
    deck = Carta:criarDeckGato()

    
end

function love.update()
    
end

function love.draw()
    love.graphics.clear(1, 1, 1, 1)

    Carta:desenharDeck(deck)

end