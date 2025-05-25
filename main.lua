local Config = require("config")
local Deck = require("classes.deck")
local Botao = require("interface.botao")

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

local deck
local botaoEmbaralhar, botaoRevelar

function love.load()
    -- BOTOES
    botaoEmbaralhar = Botao:new(100, 500, 200, 50, "Embaralhar", function()
        deck:embaralhar()
    end)

    botaoRevelar = Botao:new(400, 500, 200, 50, "Revelar", function()
        deck:revelarCarta()
    end)

    -- DECK
    deck = Deck:new("Cat Deck")
    deck:criarDeckGato()

end

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    botaoEmbaralhar:update(mx, my)
    botaoRevelar:update(mx, my)
end

function love.mousepressed(x, y, button) --callback, unica funcao mousepressed
    if button == 1 then -- botão esquerdo do mouse
        botaoEmbaralhar:clicar(x, y)
        botaoRevelar:clicar(x, y)
    end
end


function love.draw()
    love.graphics.clear(1, 1, 1, 1)

    botaoEmbaralhar:draw()
    botaoRevelar:draw()

    --deck:drawDeck()

end

