local Botao = {}
local Botao_mt = { __index = Botao }

function Botao:new(x, y, width, height, texto, funcao)
    local novoBotao = {
        x = x,
        y = y,
        width = width,
        height = height,
        texto = texto,
        
        corNormal = Config.coresBotao.normal,
        corHover = Config.coresBotao.hover,
        corSelecionado = Config.coresBotao.selecionado,
        
        funcao = funcao,
        selecionado = false,
        mouseSobre = false
    }
    setmetatable(novoBotao, Botao_mt)
    return novoBotao
end

function Botao:update(mx, my)
    self.mouseSobre = mx >= self.x and mx <= self.x + self.width and
                      my >= self.y and my <= self.y + self.height
end

function Botao:clicar()
    if self.mouseSobre then
        self.selecionado = not self.selecionado
        if self.funcao then
            self.funcao()
        end
    end
end


function Botao:draw()
    local cor = self.corNormal

    if self.selecionado then
        cor = self.corSelecionado
    elseif self.mouseSobre then
        cor = self.corHover
    else
        cor = self.corNormal
    end


    love.graphics.setColor(cor)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    
    love.graphics.setColor(0, 0, 0) -- cor do texto (preto)
    love.graphics.printf(self.texto, self.x, self.y + self.height/2 - 8, self.width, "center")
end

return Botao
