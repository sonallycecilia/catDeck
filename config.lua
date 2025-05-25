Config = {}

--metodos uteis
local function hexToRGB(hex)
    hex = hex:gsub("#", "")
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    return { r, g, b }
end

Config.scaleX = 0.5
Config.scaleY = 0.5
Config.defaultErrorImage = "assets/erro.png"

Config.botoes = {
    revelarImagem = "assets/botoes/revelar.png",
    embaralharImagem = "assets/botoes/embaralhar.png",
    largura = 200,
    altura = 50,
    coresBotao = {
        normal = hexToRGB("#9079a8"),
        hover = hexToRGB("#d4c4e9"),
        selecionado = hexToRGB("#b98eb9")
    }
    
}

Config.deckRandomImages = {
    "assets/mystery/2.png",
    "assets/mystery/13.png",
    "assets/mystery/14.png",
    "assets/mystery/18.png",
    "assets/mystery/19.png",
    "assets/mystery/21.png",
    defaultErrorImage = "assets/mystery/default.png",
}

Config.deckCardName = {
    "The Fool",
    "The Magician",
    "The High Priestess",
    "The Empress",
    "The Emperor",
    "The Hierophant",
    "The Lovers",
    "The Chariot",
    "Strength",
    "The Hermit",
    "Wheel of Fortune",
    "Justice",
    "The Hanged Man",
    "Death",
    "Temperance",
    "The Devil",
    "The Tower",
    "The Star",
    "The Moon",
    "The Sun",
    "Judgment",
    "The World",
}

Config.deckDescription = {
    "A new beginning, innocence, spontaneity.",
    "Willpower, desire, creation, manifestation.",
    "Intuition, unconscious knowledge, mystery.",
    "Fertility, femininity, beauty, nature.",
    "Authority, structure, control, fatherhood.",
    "Tradition, conformity, morality and ethics.",
    "Love, harmony, relationships, choices.",
    "Control, willpower, victory, assertion.",
    "Courage, strength, confidence.",
    "Soul-searching, introspection, inner guidance.",
    "Luck, karma, life cycles, destiny.",
    "Fairness, truth, law and order.",
    "Sacrifice, release, martyrdom.",
    "Endings, change, transformation.",
    "Balance moderation and patience.",
    "Addiction, materialism, playfulness.",
    "Disaster, upheaval, chaos, revelation.",
    "Hope, faith, purpose, renewal.",
    "Illusion, fear, anxiety, subconscious.",
    "Joy, success, positivity, vitality.",
    "Judgment, rebirth, inner calling.",
    "Completion, integration, accomplishment.",
}

Config.deckSize = {
    alturaCarta = 320,
    larguraCarta = 200,
}

Config.frames = {
    -- Configurações para o menuFrame
    sideFrame = {
        imagemPath = "assets/frames/sideFrame.png",
        largura = 800,  -- ajuste conforme a resolução da sua interface
        altura = 600,
        x = 0,
        y = 0,
    },

    menuFrame = {
        imagemPath = "assets/frames/menuFrame.png", -- Adicionei de volta, pois é essencial para carregar a imagem
        largura = 300,
        altura = 360,
        x = 50,
        y = 50,
    },
    -- Configurações para o cardFrame
    cardFrame = {
        imagemPath = "assets/frames/cardFrame.png",
        largura = 550,  -- ajuste conforme a resolução da sua interface
        altura = 700,
        x = 0,
        y = 0,
    },
    descricaoFrame = {
        imagemPath = "assets/frames/descricaoFrame.png",
        largura = 550,  -- ajuste conforme a resolução da sua interface
        altura = 700,
        x = 0,
        y = 0,
    },
}

return Config