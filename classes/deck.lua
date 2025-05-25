local Carta = require("classes.carta")
local Config = require("config")

local Deck = {}
local Deck_mt = { __index = Deck }

function Deck:new(nome)
    local novoDeck = {
        nome = nome,
        cartas = {},
        largura = Config.deckSize.larguraCarta,
        altura = Config.deckSize.alturaCarta,
        cartaRevelada = nil,      -- Referência à carta revelada
        imagemCartaRevelada = nil -- Imagem da carta carregada (cache)
    }
    setmetatable(novoDeck, Deck_mt)
    return novoDeck
end

function Deck:criarDeck(configTable)
    local cartas = {}
    for i = 1, 21 do
        local img = configTable[i] or configTable.defaultErrorImage
        local nome = Config.deckCardName[i] or ("Carta " .. i)
        local desc = Config.deckDescription[i] or "Sem descrição"

        local carta = Carta:new(i, nome, img, desc)
        table.insert(cartas, carta)
    end
    self.cartas = cartas
    return cartas
end

function Deck:embaralhar()
    math.randomseed(os.time())
    for i = #self.cartas, 2, -1 do
        local j = math.random(i)
        self.cartas[i], self.cartas[j] = self.cartas[j], self.cartas[i]
    end
    print("Deck embaralhado!")
end

function Deck:drawDeck()
    local x = 100
    local y = 100
    local espacamento = 20

    for i, carta in ipairs(self.cartas) do
        carta:draw(x, y, self.largura, self.altura)
        x = x + self.largura + espacamento
    end
end

function Deck:revelarCarta()
    if self.cartas[1] then
        self.cartaRevelada = self.cartas[1]

        -- Carrega e armazena a imagem apenas uma vez
        if self.cartaRevelada.imagemPath then
            self.imagemCartaRevelada = love.graphics.newImage(self.cartaRevelada.imagemPath)
        end

        print("Revelando carta: " .. self.cartaRevelada.name)
        return self.cartaRevelada
    end
end

function Deck:drawCartaRevelada(frame)
    if not self.cartaRevelada or not self.imagemCartaRevelada then return end
    if not frame or not frame.x or not frame.y then
        print("[Erro] Frame inválido ao tentar desenhar a carta revelada.")
        return
    end

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.imagemCartaRevelada, frame.x, frame.y, 0, Config.scaleX or 1, Config.scaleY or 1)
end

return Deck
