local Carta = {}
local Carta_mt = { __index = Carta }

function Carta:new(id, nome, imagemPath, descricao)
    local novaCarta = {
        id = id,
        name = nome,
        description = descricao,
        imagemPath = imagemPath,
        imagePng = love.graphics.newImage(imagemPath),
    }
    setmetatable(novaCarta, Carta_mt)
    return novaCarta
end

function Carta:draw(x, y)
    local largura = Config.deckSize.larguraCarta
    local altura = Config.deckSize.alturaCarta
    love.graphics.draw(self.image, x, y, 0, largura / self.image:getWidth(), altura / self.image:getHeight())
end


return Carta