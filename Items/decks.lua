local IsaacDeck = {
    object_type = "Back",
    name = "wrenbind-Isaac",
    key = "isaac",
    loc_txt = {
        name = "Isaac Deck",
        text = {
            "Start with an",
            "{C:attention}Eternal Negative{}",
            "D6 Joker."
        }
    },
    order = 1,
    pos = { x = 0, y = 0 },
    atlas = "atlasdeck",
    apply = function()
        G.E_MANAGER:add_event(Event({
			func = function()
                WrenBind.util.deck_joker({
                    joker = "wrenbind_d6",
                    negative = true
                })
				return true
			end
		}))
    end
}
local LostDeck = {
    object_type = "Back",
    name = "wrenbind-Lost",
    key = "thelost",
    loc_txt = {
        name = "Lost Deck",
        text = {
            "Start with an",
            "{C:attention}Eternal Negative{}",
            "Holy Mantle Joker.",
            "Only 1 Hand and Discard."
        }
    },
    order = 1,
    pos = { x = 0, y = 0 },
    atlas = "atlasdeck",
    apply = function()
        G.E_MANAGER:add_event(Event({
			func = function()
                G.GAME.round_resets.hands = 1
                G.GAME.round_resets.discards = 1
                WrenBind.util.deck_joker({
                    joker = "wrenbind_ed6",
                    negative = true
                })
                WrenBind.util.deck_joker({
                    joker = "wrenbind_holymantle",
                    negative = true
                })
				return true
			end
		}))
    end
}
return {
    name = "Character Decks",
    items = {
        IsaacDeck
	LostDeck
    },
    
}
