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
        cartaRevelada = nil, -- Armazena a carta revelada
    }
    setmetatable(novoDeck, Deck_mt)
    return novoDeck
end

function Deck:criarDeckGato()
    local cartas = {}
    for i = 1, #Config.deckCatImages do
        local img = Config.deckCatImages[i]
        local nome = Config.deckName[i] or ("Carta " .. i)
        local desc = Config.deckDescription[i] or "Sem descrição"

        local carta = Carta:new(i, nome, img, desc)
        table.insert(cartas, carta)
    end
    self.cartas = cartas
    return cartas
end

function Deck:embaralhar()
    math.randomseed(os.time()) --pegando seed aleatório para embaralhar as cartas
    local n = #self.cartas
    for i = n, 2, -1 do
        local j = math.random(i)
        self.cartas[i], self.cartas[j] = self.cartas[j], self.cartas[i]
    end
    print("Deck embaralhado!")
end

function Deck:drawDeck()
    local largura = self.largura
    local altura = self.altura
    local x = 100
    local y = 100
    local espacamento = 20

    for i, carta in ipairs(self.deck) do
        carta:draw(x, y, largura, altura)
        x = x + largura + espacamento
    end
end

function Deck:revelarCarta()
    if self.cartas[1] then
        self.cartaRevelada = self.cartas[1]  -- Armazena a carta revelada
        print("Revelando carta: " .. self.cartas[1].name)
        return self.cartas[1]
    end
end

function Deck:drawCartaRevelada(carta)
    if self.cartaRevelada and self.cartaRevelada.imagemPath then
        local x = (love.graphics.getWidth() - self.largura) / 2
        local y = (love.graphics.getHeight() - self.altura) / 2

        love.graphics.rectangle("fill", x, y, self.largura, self.altura)

        love.graphics.setColor(0, 0, 0)
        love.graphics.printf(self.cartaRevelada.name, x, y + self.altura / 2 - 8, self.largura, "center")
    end
end



return Deck
