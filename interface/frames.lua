local Config = require("config")
local Frame = {}
local Frame_mt = { __index = Frame }

-- O construtor agora recebe apenas uma tabela de configurações
function Frame:new(x, y, imagemPath)
    local novoFrame = {
        x = x or Config.x,
        y = y or Config.y,

        largura = Config.largura,
        altura = Config.altura,
        imagemPath = imagemPath,
        -- Pega as escalas da configTable, com padrão 1.0 se não definidas
        scaleX = Config.scaleX or 1.0,
        scaleY = Config.scaleY or 1.0,
    }
    setmetatable(novoFrame, Frame_mt)
    return novoFrame
end

-- Novo método para definir a escala do frame
function Frame:setScale(newScaleX, newScaleY)
    self.scaleX = newScaleX
    self.scaleY = newScaleY
end

-- Método para desenhar o frame
function Frame:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, self.scaleX, self.scaleY)
end

return Frame