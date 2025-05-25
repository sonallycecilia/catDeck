Config = {}

Config.scaleX = 0.5
Config.scaleY = 0.5
Config.defaultErrorImage = "assets/erro.png"

Config.deckCatImages = {
        "assets/cats/1.jpg",
        "assets/cats/3.jpg",
        "assets/cats/4.jpg",
        "assets/cats/5.jpg",
        "assets/cats/6.jpg",
        "assets/cats/7.jpg",
        "assets/cats/9.jpg",
        "assets/cats/10.jpg",
        "assets/cats/12.jpg",
        "assets/cats/14.jpg",
        "assets/cats/15.jpg",
        "assets/cats/16.jpg",
        "assets/cats/17.jpg",
        "assets/cats/18.jpg",
        "assets/cats/19.jpg",
        "assets/cats/20.jpg",
        "assets/cats/21.jpg",
}

Config.deckName = {
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
    menuFrame = {
        imagemPath = "assets/frames/menuFrame.png", -- Adicionei de volta, pois é essencial para carregar a imagem
        largura = 288,
        altura = 360,
        x = 50,
        y = 50,
    },
    -- Configurações para o cardFrame
    cardFrame = {
        imagemPath = "assets/frames/cardFrame.png", -- Adicionei de volta
        largura = 288,
        altura = 360,
        x = 300,
        y = 50,
    },
}


local function hexToRGB(hex)
    hex = hex:gsub("#", "")
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    return { r, g, b }
end

Config.coresBotao = {
    normal = hexToRGB("#9079a8"),
    hover = hexToRGB("#d4c4e9"),
    selecionado = hexToRGB("#b98eb9")
}

return Config