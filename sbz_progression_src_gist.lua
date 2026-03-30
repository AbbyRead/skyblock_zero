----- ./mods/sbz_progression/annoy.lua -----
-- Warns players without a questbook every 1s (once), and provides /qb command to restore it.

local S = core.get_translator('sbz_progression')
local timer = 0

core.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer >= 1 then
        timer = 0
        for _, player in ipairs(core.get_connected_players()) do
            local inv = player:get_inventory()
            if inv and not inv:contains_item('main', 'sbz_progression:questbook') then
                if player:get_meta():get_int 'questbook_warning' == 0 then
                    sbz_api.displayDialogLine(player:get_player_name(), S('Lost your questbook? Use /qb to get it back.'))
                    player:get_meta():set_int('questbook_warning', 1)
                end
            end
        end
    end
end)

core.register_chatcommand('qb', {
    description = S("Gives you a questbook if you don't have one."),
    func = function(name, param)
        local inv = core.get_player_by_name(name):get_inventory()
        if not inv then return end
        if inv:contains_item('main', 'sbz_progression:questbook') then
            sbz_api.displayDialogLine(name, S('You already have a Quest Book.'))
        elseif inv:room_for_item('main', 'sbz_progression:questbook') then
            inv:add_item('main', 'sbz_progression:questbook')
            sbz_api.displayDialogLine(name, S('You have been given a Quest Book.'))
        else
            sbz_api.displayDialogLine(name, S('Your inventory is full.'))
        end
    end,
})

----- ./mods/sbz_progression/init.lua -----
local S = core.get_translator('sbz_progression')
local modpath = core.get_modpath 'sbz_progression'

dofile(modpath .. '/quest_parser.lua')
dofile(modpath .. '/quests.lua')
dofile(modpath .. '/questbook.lua')
dofile(modpath .. '/annoy.lua')

function sbz_api.displayDialogLine(player_name, text)
    core.chat_send_player(player_name, '⌠ ' .. text .. ' ⌡')
end

-- Maps craftable item IDs → quest IDs (qid_ slugs). Triggers unlock_achievement on craft.
local achievement_table = {
    ['sbz_resources:matter_blob'] = 'qid_a_bigger_platform',
    ['sbz_resources:matter_stair'] = 'qid_matter_stairs',
    -- [...]
    ['sbz_area_containers:room_container'] = 'qid_room_containers',
}

core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
    local achievement_name = achievement_table[itemstack:get_name()]
    if achievement_name then
        unlock_achievement(player:get_player_name(), achievement_name)
    end
end)

function sbz_api.activate_safetynet(player_name, pos) return true end

-- Safetynet: teleports player back to origin if they fall below y < -300.
-- Rare 1/50k chance to drop a Singularity Rune on fall.
core.register_globalstep(function(dtime)
    for _, player in ipairs(core.get_connected_players()) do
        local pos = player:get_pos()
        if pos.y < -100 then unlock_achievement(player:get_player_name(), 'qid_emptiness') end
        if pos.y < -300 then
            if sbz_api.activate_safetynet(player:get_player_name(), pos) then
                sbz_api.displayDialogLine(player:get_player_name(), S('You fell off the platform.'))
                player:set_pos { x = 0, y = 1, z = 0 }
                if math.random(1, 50000) == 1 then
                    -- add singularity rune to inventory or drop at pos, broadcast to all
                end
            end
        end
    end
end)

-- Maps item IDs → quest IDs, triggered on inventory action (move/put).
local achievement_in_inventory_table = {
    ['sbz_chem:gold_powder'] = 'qid_its_fake',
    -- [...]
    ['sbz_resources:wormhole'] = 'qid_wormhole',
}

-- Maps node IDs → quest IDs, triggered on dig.
local achievement_on_dig_table = {
    ['sbz_meteorites:antineutronium'] = 'qid_antineutronium',
    -- [...]
    ['sbz_bio:shockshroom_4'] = 'qid_shockshrooms',
}

core.register_on_player_inventory_action(function(player, action, inv, inv_info)
    local itemstack = (action == 'move') and inv:get_stack(inv_info.to_list, inv_info.to_index) or inv_info.stack
    local achievement_name = achievement_in_inventory_table[itemstack:get_name()]
    if achievement_name then unlock_achievement(player:get_player_name(), achievement_name) end
end)

core.register_on_dignode(function(pos, oldnode, digger)
    if digger ~= nil and digger:is_valid() then
        local achievement_name = achievement_on_dig_table[oldnode.name]
        if achievement_name then unlock_achievement(digger:get_player_name(), achievement_name) end
    end
end)

----- ./mods/sbz_progression/questbook.lua -----
local S = core.get_translator('sbz_progression')

-- Helpers
local function localized(quest, field, lang)      -- returns translated field or English fallback
local function player_lang(player_name)           -- returns player's lang_code or 'en'
local function get_quest_by_id(quest_id)          -- linear search through quests[]
local function combineWithAnd(list)               -- "A, B, and C" (translatable)

-- Core achievement functions (globals)
function unlock_achievement(player_name, achievement_id)
    -- Sets meta key to 'true', sends chat message, spawns particles.
    -- No-ops if already unlocked.

function revoke_achievement(player_name, achievement_id)
    -- Clears meta key, sends chat message.

function is_achievement_unlocked(player_name, achievement_id)
    -- Returns meta key == 'true'.

function is_quest_available(player_name, quest_id)
    -- Returns true if all quest.requires are unlocked (or quest has none).

-- Builds the questbook formspec. Shows quest list with color/icon by status,
-- and quest detail pane on the right. Supports search, font size +/-, and
-- the special 'reachable' search filter.
local function get_questbook_formspec(selected_quest_index, player_name, quests_to_show, search_text)
    -- Counts: completed_count, available_count, quest_count (excludes info/text types).
    -- Unlocks qid_credits automatically when available_count==1 and no quests remain.
    -- Plays 'questbook' sound on open.

core.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= 'questbook:main' then return end
    -- Handles: quest_list selection, search field, search_reset, font_add, font_sub.
    -- Filters quests by search text or 'reachable' keyword.
    -- Re-shows formspec with updated state.

core.register_craftitem('sbz_progression:questbook', {
    description = S('Quest Book'),
    inventory_image = 'questbook.png',
    stack_max = 1,
    on_use = function(itemstack, player, pointed_thing)
        -- Shows questbook formspec at last selected index.

----- ./mods/sbz_progression/quests.lua -----
quests = {}
local quest_id_index = {}  -- id → index, for O(1) translation patching

function sbz_api.register_quest(def)   -- appends to quests[], updates index

local quest_files = { 'Introduction', 'Emittrium', 'Chemistry', 'Storage',
    'Meteorites', 'Organics', 'Decorator', 'Pipeworks_and_fluid_transport',
    'Reactor', 'Jumpdrive', 'Sensors', 'Secrets', 'Status_Effects' }

-- 1. Load English (canonical) quest files → establishes all IDs.
-- 2. Register hardcoded Credits quest (qid_credits) with developer names/quotes.
-- 3. Load translations for supported_languages = { 'ja', 'x-pirate' }.
--    Patches only .title_localized[lang] and .text_localized[lang]; never touches logic fields.
--    Logs warnings for missing files or unknown quest IDs.

-- One-time player migration: rewrites old English-title metadata keys to qid_ slugs on join.
local legacy_key_map = {
    ['Introduction'] = 'qid_introduction',
    -- [...]
    ['Credits'] = 'qid_credits',
}
core.register_on_joinplayer(function(player)
    -- Iterates legacy_key_map, migrates any found keys, logs count.

----- ./mods/sbz_progression/quest_parser.lua -----
-- Serializer/deserializer: markdown ↔ quest table format.

-- Markdown syntax:
--   # Questline name          → type='text' banner
--   ## Quest name             → type='quest'
--   ## Info: Name             → type='text', info=true
--   ## Secret: Name           → type='secret'
--   ### ID: qid_slug          → required, stable key, must follow ## immediately
--   ### Text / ### Meta       → content and Requires: list

-- markdown_parser.encode(quests)   → markdown string
-- markdown_parser.decode(text)     → quest table list
-- markdown_parser.decode_text(text) → converts markdown bold/mono/lists to mt hypertext tags
--   (**→<b>, `→<mono>, \< \>→< >, -, *, digits→<dash>)

-- decode() state machine:
--   Scans lines; on #/##/## Info:/## Secret: headers, calls decode_text_and_meta()
--   decode_text_and_meta(): reads ### ID:, ### Text, ### Meta blocks in order;
--     asserts ID starts with qid_, Text precedes Meta.

sbz_api.quest_parser = markdown_parser