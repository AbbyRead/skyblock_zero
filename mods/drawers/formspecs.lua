-- Drawer Upgrades GUI Pane (refactored from helpers.lua)

--[[ To get, roughly:
┌─────────────────────────────────────────────────────┐
│                                                     │
│            ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐            │
│            │ ⇧ │ │ ⇧ │ │ ⇧ │ │ ⇧ │ │ ⇧ │            │
│            └───┘ └───┘ └───┘ └───┘ └───┘            │
│                                                     │
│                                                     │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐   │
│   │   │ │   │ │   │ │   │ │   │ │   │ │   │ │   │   │
│   └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘   │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐   │
│   │   │ │   │ │   │ │   │ │   │ │   │ │   │ │   │   │
│   └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘   │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐   │
│   │   │ │   │ │   │ │   │ │   │ │   │ │   │ │   │   │
│   └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘   │
│   ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐   │
│   │   │ │   │ │   │ │   │ │   │ │   │ │   │ │   │   │
│   └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘   │
│                                                     │
└─────────────────────────────────────────────────────┘
]]
function drawers.drawer_formspec(pos, upgrade_slots, hotbar_slots)
    -- Formspec version for this scope
    local fs_version = 'formspec_version[7]'

    if hotbar_slots == 0 or hotbar_slots == nil then hotbar_slots = 8 end
    if upgrade_slots == nil then upgrade_slots = 5 end

    local inv_slot_w = 1.0
    local inv_slot_h = 1.0
    local separation_spacing = 0.5
    local relational_spacing = 0.25 -- was used to separate hotbar visually
    local inventory_size = 32

    -- Clamp hotbar and derive slots_per_row from it, within a sensible range
    local hotbar_slots_clamped = math.min(hotbar_slots, inventory_size)
    local slots_per_row = math.max(5, math.min(hotbar_slots_clamped, 12))

    -- Derive pane width from slots_per_row
    local pane_width = slots_per_row + separation_spacing * 2

    -- Upgrade section
    -- Centre the upgrade row within the pane width
    local upgrade_x = (pane_width - upgrade_slots) / 2
    local upgrade_y = separation_spacing

    local pos_str = pos.x .. ',' .. pos.y .. ',' .. pos.z
    local fs_upgrade_slots =
        string.format('list[nodemeta:%s;upgrades;%.2f,%.2f;%d,1;]',
            pos_str, upgrade_x, upgrade_y, upgrade_slots)

    local fs_upgrade_arrows = ''
    for i = 0, (upgrade_slots - 1) do
        fs_upgrade_arrows = fs_upgrade_arrows ..
            string.format('image[%.2f,%.2f;%.2f,%.2f;drawers_upgrade_slot_bg.png]',
                upgrade_x + i, upgrade_y, inv_slot_w, inv_slot_h)
    end

    -- Player inventory section
    local remaining_slots = inventory_size - hotbar_slots_clamped
    local hotbar_rows = math.ceil(hotbar_slots_clamped / slots_per_row)
    local inv_remaining_rows = math.ceil(remaining_slots / slots_per_row)

    local hotbar_y = upgrade_y + inv_slot_h -- + separation_spacing
    local inv_remaining_y = hotbar_y + hotbar_rows * inv_slot_h + relational_spacing
    local total_height = inv_remaining_y + inv_remaining_rows * inv_slot_h + separation_spacing

    local fs_hotbar =
        string.format('list[current_player;main;%.2f,%.2f;%d,%d;]',
            separation_spacing, hotbar_y, slots_per_row, hotbar_rows)

    local fs_remaining =
        string.format('list[current_player;main;%.2f,%.2f;%d,%d;%d]',
            separation_spacing, inv_remaining_y, slots_per_row, inv_remaining_rows, hotbar_slots_clamped)

    local fs_size = string.format('size[%.2f,%.2f]', pane_width, total_height)

    local fs_listrings =
        'listring[context;upgrades]' ..
        'listring[current_player;main]'

    return fs_size ..
        fs_upgrade_slots ..
        fs_upgrade_arrows ..
        fs_hotbar ..
        fs_remaining ..
        fs_listrings
end
