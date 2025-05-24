local Botao = {}
local Botao_mt = { __index = Botao }

function Botao:new(x, y, width, height, texto, cor)
    local novoBotao = {
        x = x,
        y = y,
        width = width,
        height = height,
        texto = texto,
        cor = cor,
    }
    setmetatable(novoBotao, Botao_mt)
    return novoBotao
end