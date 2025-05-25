local Config = require("config")
local Deck = require("classes.deck")
local Botao = require("interface.botao")
local Frame = require("interface.frame")

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

local deck, carta
local botaoEmbaralhar, botaoRevelar
local cardFrame, menuFrame
local imagemCartaRevelada

function love.load()
    -- DECK
    deck = Deck:new("Cat Deck")
    deck:criarDeckGato()

    --FRAMES
    menuFrame = Frame:new(Config.frames.menuFrame, 50, 150)
    cardFrame = Frame:new(Config.frames.cardFrame, 1050, 280, 0.4, 0.4)

    -- BOTOES
    botaoEmbaralhar = Botao:new(100, 500, 200, 50, "Embaralhar", function()
        deck:embaralhar()
    end)

    botaoRevelar = Botao:new(400, 500, 200, 50, "Revelar", function()
        carta = deck:revelarCarta()
        if carta and carta.imagemPath then
            imagemCartaRevelada = love.graphics.newImage(carta.imagemPath)
        end
end)

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

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    -- configurações de tela

    love.graphics.clear(1, 1, 1, 1) --resetando a tela
    
    -- Desenha os frames
    --cardFrame:draw()
    menuFrame:draw()
    cardFrame:draw()
    

    --botaoEmbaralhar:draw()
    --botaoRevelar:draw()

end
