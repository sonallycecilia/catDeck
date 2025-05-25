local Carta = {}
local Carta_mt = { __index = Carta }

function Carta:new(id, nome, imagemPath, descricao)
    local novaCarta = {
        id = id,
        name = nome,
        description = descricao,
        imagemPath = imagemPath,
        image = love.graphics.newImage(imagemPath),
    }
    setmetatable(novaCarta, Carta_mt)
    return novaCarta
end

function Carta:draw(x, y)
    local largura = Config.deckSize.larguraCarta
    local altura = Config.deckSize.alturaCarta
    love.graphics.draw(self.imagePng, x, y, 0, largura / self.imagePng:getWidth(), altura / self.imagePng:getHeight())
end

return Carta