local Deck = {}
local Deck_mt = { __index = Deck }
local Config = require("config")
local Carta = require("classes.carta")

function Deck:new(nome)
    local novoDeck = {
        nome = nome,
        cartas = {},
        largura = Config.deckSize.larguraCarta,
        altura = Config.deckSize.alturaCarta,
    }
    setmetatable(novoDeck, Deck_mt)
    return novoDeck
end

return Deck