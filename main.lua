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
local botoes = {}
local botaoEmbaralhar, botaoRevelar
local cardFrame, menuFrame, sideFrame, descricaoFrame
local imagemCartaRevelada

function love.load()
    -- DECK
    deck = Deck:new("Myterious Mysteries")
    deck:criarDeck(Config.deckRandomImages)

    --FRAMES
    menuFrame = Frame:new(Config.frames.menuFrame, 0, 150)
    sideFrame = Frame:new(Config.frames.sideFrame, 550, 0, 1.5, 1.5)
    --cardFrame = Frame:new(Config.frames.cardFrame, 1250, 650, 0.2, 0.2)
    descricaoFrame = Frame:new(Config.frames.descricaoFrame, 900, 90, 1.0, 1.0)

    
    -- BOTOES dentro do menuFrame
    local baseX = menuFrame.x+170
    local baseY = menuFrame.y+270
    botaoEmbaralhar = Botao:new(baseX, baseY + 270, 200, 50, "EMBARALHAR", function()
        deck:embaralhar()
    end)

    botaoRevelar = Botao:new(baseX, baseY + 330, 200, 50, "REVELAR", function()
        carta = deck:revelarCarta()
        if carta and carta.imagemPath then
            imagemCartaRevelada = love.graphics.newImage(carta.imagemPath)
        end
    end)
    table.insert(botoes, botaoEmbaralhar)
    table.insert(botoes, botaoRevelar)

end

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    for _, botao in ipairs(botoes) do
        botao:update(mx, my)
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        for _, botao in ipairs(botoes) do
            botao:clicar(x, y)
        end
    end
end

function love.keypressed(key)
    if key == "x" then
        love.event.quit()
    end
end

function love.draw()
    -- configurações de tela
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.clear(1, 1, 1, 1) --resetando a tela

    -- Desenha os frames
    menuFrame:draw()
    sideFrame:draw()
    descricaoFrame:draw()

    --desenhando botoes
    botaoEmbaralhar:draw()
    botaoRevelar:draw()

    if deck.cartaRevelada then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(imagemCartaRevelada, descricaoFrame.x + 50, descricaoFrame.y + 50, 0, 0.3, 0.3)
    end
end
