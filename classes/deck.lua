local Carta = require("classes.carta")
local Config = require("config")

local Deck = {}
local Deck_mt = { __index = Deck }

function Deck:new(nome)
    local novoDeck = {
        nome = nome,
        deck = {},
        largura = Config.deckSize.larguraCarta,
        altura = Config.deckSize.alturaCarta,
    }
    setmetatable(novoDeck, Deck_mt)
    return novoDeck
end

function Deck:criarDeckGato()
    local deck = {}
    for i = 1, #Config.deckCatImages do
        local img = Config.deckCatImages[i]
        local nome = Config.deckName[i] or ("Carta " .. i)
        local desc = Config.deckDescription[i] or "Sem descrição"

        local carta = Carta:new(i, nome, img, desc)
        table.insert(deck, carta)
    end
    self.deck = deck
    return deck
end

function Deck:embaralhar()
    math.randomseed(os.time()) --pegando seed aleatório para embaralhar as cartas
    local n = #self.deck
    for i = n, 2, -1 do
        local j = math.random(i)
        self.deck[i], self.deck[j] = self.deck[j], self.deck[i]
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
    local carta = self.deck[1] -- Revela a primeira carta do deck
    if carta then
        print("Revelando carta: " .. carta.name)
        carta:draw(400, 300) -- Desenha a carta na posição (400, 300)
    else
        print("Nenhuma carta no deck.")
    end
end

return Deck
