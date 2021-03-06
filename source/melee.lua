local memory = require("memory")
local color = require("util.color")

MENU_VS_CSS = 0x0
MENU_VS_STAGE_SELECT = 0x1
MENU_VS_INGAME = 0x2
MENU_VS_POSTGAME_SCORES = 0x4

MATCH_GAME = 0x02
MATCH_STAGE_CLEAR = 0x03
MATCH_STAGE_CLEAR2 = 0x05
MATCH_NEW_RECORD = 0x06
MATCH_NO_CONTEST = 0x07
MATCH_GAME_CLEAR = 0x09

MENU_TITLE_SCREEN = 0x00
MENU_LANGUAGE_CHANGE = 0x01
MENU_VS_MODE = 0x02
MENU_CLASSIC_MODE = 0x03
MENU_ADVENTURE_MODE = 0x04
MENU_ALL_STAR_MODE = 0x05
MENU_DEBUG = 0x06
MENU_SOUND_TEST = 0x07
MENU_VS_UNKNOWN = 0x08
MENU_UNKOWN_1 = 0x09
MENU_CAMERA_MODE = 0x0A
MENU_TROPHY_GALLERY = 0x0B
MENU_TROPHY_LOTTERY = 0x0C
MENU_TROPHY_COLLECTION = 0x0D
MENU_START_MATCH = 0x0E
MENU_TARGET_TEST = 0x0F
MENU_SUPER_SUDDEN_DEATH = 0x10
MENU_INVISIBLE_MELEE= 0x11
MENU_SLOW_MO_MELEE = 0x12
MENU_LIGHTNING_MELEE = 0x13
MENU_CHARACTER_APPROACHING = 0x14
MENU_CLASSIC_MODE_CREDITS = 0x15
MENU_ADVENTURE_MODE_CREDITS = 0x16
MENU_ALL_STAR_CREDITS = 0x17
MENU_INTRO_VIDEO = 0x18
MENU_ADVENTURE_MODE_CINEMEATIC = 0x19
MENU_CHARACTER_UNLOCKED = 0x1A
MENU_TOURNAMENT = 0x1B
MENU_TRAINING_MODE = 0x1C
MENU_TINY_MELEE = 0x1D
MENU_GIANT_MELEE = 0x1E
MENU_STAMINA_MODE = 0x1F
MENU_HOME_RUN_CONTEST = 0x20
MENU_10_MAN_MELEE = 0x21
MENU_100_MAN_MELEE = 0x22
MENU_3_MINUTE_MELEE = 0x23
MENU_15_MINUTE_MELEE = 0x24
MENU_ENDLESS_MELEE = 0x25
MENU_CRUEL_MELEE = 0x26
MENU_PROGRESSIVE_SCAN = 0x27
MENU_PLAY_INTRO_VIDEO = 0x28
MENU_MEMORY_CARD_OVERWRITE = 0x29
MENU_FIXED_CAMERA_MODE = 0x2A
MENU_EVENT_MATCH = 0x2B
MENU_SINGLE_BUTTON_MODE = 0x2C


local character_selections = {
	[0x00] = {
		name = "captain",
		skin = {"original", "black", "red", "white", "green", "blue"},
		team_skin = {3, 6, 5},
		series = "fzero"
	},
	[0x01] = {
		name = "donkey",
		skin = {"original", "black", "red", "blue", "green"},
		team_skin = {3, 4, 5},
		series = "donkey_kong"
	},
	[0x02] = {
		name = "fox",
		skin = {"original", "red", "blue", "green"},
		team_skin = {2, 3, 4},
		series = "star_fox"
	},
	[0x03] = {
		name = "gamewatch",
		skin = {"original", "red", "blue", "green"},
		team_skin = {2, 3, 4},
		series = "game_and_watch"
	},
	[0x04] = {
		name = "kirby",
		skin = {"original", "yellow", "blue", "red", "green", "white"},
		team_skin = {4, 3, 5},
		series = "kirby"
	},
	[0x05] = {
		name = "koopa",
		skin = {"green", "red", "blue", "black"},
		team_skin = {2, 3, 1},
		series = "mario"
	},
	[0x06] = {
		name = "link",
		skin = {"green", "red", "blue", "black", "white"},
		team_skin = {2, 3, 1},
		series = "zelda"
	},
	[0x07] = {
		name = "luigi",
		skin = {"green", "white", "blue", "red"},
		team_skin = {4, 3, 1},
		series = "mario"
	},
	[0x08] = {
		name = "mario",
		skin = {"red", "yellow", "black", "blue", "green"},
		team_skin = {1, 4, 5},
		series = "mario"
	},
	[0x09] = {
		name = "marth",
		skin = {"original", "red", "green", "black", "white"},
		team_skin = {2, 1, 3},
		series = "fire_emblem"
	},
	[0x10] = {
		name = "samus",
		skin = {"red", "pink", "black", "green", "blue"},
		team_skin = {1, 5, 4},
		series = "metroid"
	},
	[0x11] = {
		name = "yoshi",
		skin = {"green", "red", "blue", "yellow", "pink", "light_blue"},
		team_skin = {2, 3, 1},
		series = "yoshi"
	},
	[0x12] = {
		name = "zelda",
		skin = {"original", "red", "blue", "green", "white"},
		team_skin = {2, 3, 4},
		series = "zelda"
	},
	[0x13] = {
		name = "sheik",
		skin = {"original", "red", "blue", "green", "white"},
		team_skin = {2, 3, 4},
		series = "zelda"
	},
	[0x14] = {
		name = "falco",
		skin = {"original", "red", "blue", "green"},
		team_skin = {2, 3, 4},
		series = "star_fox"
	},
	[0x15] = {
		name = "younglink",
		skin = {"green", "red", "blue", "white", "black"},
		team_skin = {2, 3, 1},
		series = "zelda"
	},
	[0x16] = {
		name = "mariod",
		skin = {"white", "red", "blue", "green", "black"},
		team_skin = {2, 3, 4},
		series = "mario"
	},
	[0x17] = {
		name = "roy",
		skin = {"original", "red", "blue", "green", "yellow"},
		team_skin = {2, 3, 4},
		series = "fire_emblem"
	},
	[0x18] = {
		name = "pichu",
		skin = {"original", "red", "blue", "green"},
		team_skin = {2, 3, 4},
		series = "pokemon"
	},
	[0x19] = {
		name = "ganon",
		skin = {"original", "red", "blue", "green", "purple"},
		team_skin = {2, 3, 4},
		series = "zelda"
	},
	[0x0A] = {
		name = "mewtwo",
		skin = {"original", "red", "blue", "green"},
		team_skin = {2, 3, 4},
		series = "pokemon"
	},
	[0x0B] = {
		name = "ness",
		skin = {"original", "yellow", "blue", "green"},
		team_skin = {1, 3, 4},
		series = "earthbound"
	},
	[0x0C] = {
		name = "peach",
		skin = {"original", "daisy", "white", "blue", "green"},
		team_skin = {1, 4, 5},
		series = "mario"
	},
	[0x0D] = {
		name = "pikachu",
		skin = {"original", "red", "blue", "green"},
		team_skin = {2, 3, 4},
		series = "pokemon"
	},
	[0x0E] = {
		name = "ice_climber",
		skin = {"original", "green", "orange", "red"},
		team_skin = {4, 1, 2},
		series = "ice_climbers"
	},
	[0x0F] = {
		name = "purin",
		skin = {"original", "red", "blue", "green", "crown"},
		team_skin = {2, 3, 4},
		series = "pokemon"
	},
	[0x1A] = {
		name = "master_hand",
		skinless = true,
		series = "smash"
	},
	[0x1E] = {
		name = "crazy_hand",
		skinless = true,
		series = "smash"
	},
	[0x1D] = {
		name = "giga_bowser",
		skinless = true,
		series = "smash"
	},
	[0x21] = {
		name = "wireframe",
		skinless = true,
		series = "smash"
	},
}

local textures = {
	series = {},
	stocks = {},
}

local graphics = love.graphics
local newImage = graphics.newImage

local melee = {}

function melee.loadtextures()
	for cid, info in pairs(character_selections) do
		textures.series[cid] = newImage(("textures/series/%s.png"):format(info.series))
		if info.skin then
			for sid, skin in ipairs(info.skin) do
				textures.stocks[cid] = textures.stocks[cid] or {}
				textures.stocks[cid][sid-1] = newImage(("textures/stocks/%s-%s.png"):format(info.name, skin))
			end
		else
			textures.stocks[cid] = newImage(("textures/stocks/%s.png"):format(info.name))
		end
	end
end

function melee.getCharacterID(port)
	if not memory.player then return end
	local player = memory.player[port]

	if not player then return end

	local character = player.character
	local transformed = player.transformed == 256

	-- Handle and detect Zelda/Sheik transformations
	if character == 0x13 then
		character = transformed and 0x12 or 0x13
	elseif character == 0x12 then
		character = transformed and 0x13 or 0x12
	end

	return character
end

function melee.getStockTexture(id, skin)
	if character_selections[id] and character_selections[id].skinless == true then
		return textures.stocks[id]
	end
	if not textures.stocks[id] or not textures.stocks[id][skin] then
		return textures.stocks[0x21]
	end
	return textures.stocks[id][skin]
end

function melee.getSeriesTexture(id)
	if not textures.series[id] then
		return textures.series[0x21]
	end
	return textures.series[id]
end

function melee.drawSeries(port, ...)
	local id = melee.getCharacterID(port)
	if not id then return end
	local series = melee.getSeriesTexture(id)
	if not series then return end
	graphics.easyDraw(series, ...)
end

function melee.drawStock(port, ...)
	local id = melee.getCharacterID(port)
	if id == 0x21 or not memory.player then return end
	local player = memory.player[port]
	if not player or not id then return end
	local stock = melee.getStockTexture(id, player.skin)
	if not stock then return end
	graphics.easyDraw(stock, ...)
end

local TEAM_COLORS = {
	[0x00] = color(255, 0, 0, 255),		-- Red
	[0x01] = color(0, 100, 255, 255),	-- Blue
	[0x02] = color(0, 255, 0, 255),		-- Green
	[0x04] = color(200, 200, 200, 255),	-- CPU/Disabled
}

function melee.getPlayerTeamColor(port)
	if not memory.player then return end
	local player = memory.player[port]
	return TEAM_COLORS[player.team] or color_white
end

local PLAYER_COLORS = {
	[1] = color(245, 46, 46, 255),
	[2] = color(84, 99, 255, 255),
	[3] = color(255, 199, 23, 255),
	[4] = color(31, 158, 64, 255),
}

function melee.getPlayerColor(port)
	return PLAYER_COLORS[port] or color_white
end

local char_replacement_map = {
	[0x8149] = "!", [0x8168] = "\"", [0x8194] = "#", [0x8190] = "$",
	[0x8193] = "%", [0x8195] = "&", [0x8166] = "'", [0x8169] = "(",
	[0x816A] = ")", [0x8196] = "*", [0x817B] = "+", [0x8143] = ",",
	[0x817C] = "-", [0x8144] = ".", [0x815E] = "/", [0x8146] = ":",
	[0x8147] = ";", [0x8183] = "<", [0x8181] = "=", [0x8184] = ">",
	[0x8148] = "?", [0x8197] = "@", [0x816D] = "[", [0x815F] = "\\",
	[0x816E] = "]", [0x814F] = "^", [0x8151] = "_", [0x814D] = "`",
	[0x816F] = "{", [0x8162] = "|", [0x8170] = "}", [0x8160] = "~",
}

function melee.convertStr(str)
	local niceStr = ""
	local i = 1
	while i <= #str do
		local c1 = string.sub(str, i, i)
		local b1 = string.byte(c1)

		if bit.band(b1, 0x80) == 0x80 then
			local c2 = string.sub(str, i + 1, i + 1)
			local b2 = string.byte(c2)

			local b16 = bit.bor(bit.lshift(b1, 8), bit.lshift(b2, 0))

			if char_replacement_map[b16] then
				niceStr = niceStr .. char_replacement_map[b16]
			end

			i = i + 2
		else
			niceStr = niceStr .. c1
			i = i + 1
		end
	end
	return niceStr
end

local STAGE_SERIES = {
	[0x02] = "Super Mario", -- Princess Peach's Castle
	[0x03] = "Super Mario", -- Rainbow Cruise
	[0x04] = "Donkey Kong", -- Kongo Jungle
	[0x05] = "Donkey Kong", -- Jungle Japes
	[0x06] = "The Legend of Zelda", -- Great Bay
	[0x07] = "The Legend of Zelda", -- Hyrule Temple
	[0x08] = "Metroid", -- Brinstar
	[0x09] = "Metroid", -- Brinstar Depths
	[0x0A] = "Yoshi", -- Yoshi's Story
	[0x0B] = "Yoshi", -- Yoshi's Island
	[0x0C] = "Kirby", -- Fountain of Dreams
	[0x0D] = "Kirby", -- Green Greens
	[0x0E] = "Star Fox", -- Corneria
	[0x0F] = "Star Fox", -- Venom
	[0x10] = "Pokémon", -- Pokémon Stadium
	[0x11] = "Pokémon", -- Poké Floats
	[0x12] = "F-Zero", -- Mute City
	[0x13] = "F-Zero", -- Big Blue
	[0x14] = "Earthbound", -- Onett
	[0x15] = "Earthbound", -- Fourside
	[0x16] = "Ice Climbers", -- Icicle Mountain
	[0x18] = "Super Mario", -- Mushroom Kingdom
	[0x19] = "Super Mario", -- Mushroom Kingdom 2
	[0x1B] = "Game & Watch", -- Flat Zone
	[0x1C] = "Kirby", -- Dream Land N64
	[0x1D] = "Yoshi", -- Yoshi's Island N64
	[0x1E] = "Donkey Kong", -- Kongo Jungle N64
	[0x24] = "Super Smash Bros", -- Battlefield
	[0x25] = "Super Smash Bros", -- Final Destination
}

local STAGE_NAMES = {
	[0x02] = "Princess Peach's Castle",
	[0x03] = "Rainbow Cruise",
	[0x04] = "Kongo Jungle",
	[0x05] = "Jungle Japes",
	[0x06] = "Great Bay",
	[0x07] = "Hyrule Temple",
	[0x08] = "Brinstar",
	[0x09] = "Brinstar Depths",
	[0x0A] = "Yoshi's Story",
	[0x0B] = "Yoshi's Island",
	[0x0C] = "Fountain of Dreams",
	[0x0D] = "Green Greens",
	[0x0E] = "Corneria",
	[0x0F] = "Venom",
	[0x10] = "Pokémon Stadium",
	[0x11] = "Poké Floats",
	[0x12] = "Mute City",
	[0x13] = "Big Blue",
	[0x14] = "Onett",
	[0x15] = "Fourside",
	[0x16] = "Icicle Mountain",
	[0x18] = "Mushroom Kingdom",
	[0x19] = "Mushroom Kingdom 2",
	[0x1B] = "Flat Zone",
	[0x1C] = "Dream Land N64",
	[0x1D] = "Yoshi's Island N64",
	[0x1E] = "Kongo Jungle N64",
	[0x24] = "Battlefield",
	[0x25] = "Final Destination",
}

function melee.getAllStages()
	return STAGE_NAMES
end

function melee.getStageName(id)
	return STAGE_NAMES[id]
end

function melee.getAllStageSeries()
	return STAGE_SERIES
end

function melee.getStageSeries(id)
	return STAGE_SERIES[id]
end

return melee