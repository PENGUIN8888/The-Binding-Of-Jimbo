local CursedEye = {
    -- this joker doesn't work for some reason...
    object_type="Joker",
    name="wrenbind_cursedeye",
    key="cursedeye",
    loc_txt={
        name="Cursed Eye",
        text = {
            "\"Cursed Charge Shot\"",
        }
    },
    atlas = "atlasone",
    pos = { x = 0, y = 0 },
    rarity = "wrenbind_q0",
    cost = 4,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            return {
                message = "Again!",
                repetitions = 3,
                card = context.other_card
            }
        end

        if context.cardarea == G.jokers and not context.end_of_round and context.after then 
            ease_hands_played(-1)
            return {
                message = "Fuck You!"
            }
        end
    end
}

local Quarter = {
    object_type="Joker",
    name="wrenbind_quarter",
    key="quarter",
    loc_txt={
        name="A Quarter",
        text = {
            "Gives {C:green}$25{} when sold",
        }
    },
    atlas = "atlasone",
    pos = { x = 0, y = 0 },
    rarity = "wrenbind_q0",
    cost = 0,
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = "wrenbind_devilpool" }
	end,
    calculate = function(self, card, context)
        if context.selling_self then
            ease_dollars(25)
        end
    end
}

return {
    name = "Quality 0 Jokers",
    quality = "q0",
    items = {
        CursedEye,
        Quarter
    }
}