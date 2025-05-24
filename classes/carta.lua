local Carta = {}
local Carta_mt = { __index = Carta }

function Carta:new(id, nome, imagemPath, descricao)
    local novaCarta = {
        id = id,
        name = nome,
        description = descricao,
        image = love.graphics.newImage(imagemPath),
    }
    setmetatable(novaCarta, Carta_mt)
    return novaCarta
end

function Carta:draw(x, y)
    local largura = Config.deckSize.larguraCarta
    local altura = Config.deckSize.alturaCarta
    love.graphics.draw(self.image, x, y, 0, largura / self.image:getWidth(), altura / self.image:getHeight())
end

function Carta:criarDeckGato()
    local deck = {}
    for i = 1, #Config.deckCatImages do
        local img = Config.deckCatImages[i]
        local nome = Config.deckName[i] or ("Carta " .. i)
        local desc = Config.deckDescription[i] or "Sem descrição"

        local carta = Carta:new(i, nome, img, desc)
        table.insert(deck, carta)
    end
    return deck
end

function Carta:desenharDeck(deck)
    local largura = Config.deckSize.larguraCarta
    local altura = Config.deckSize.alturaCarta
    local x = 100
    local y = 100
    local espacamento = 20

    for i, carta in ipairs(deck) do
        carta:draw(x, y, largura, altura)
        x = x + largura + espacamento
    end
    
end


return Carta