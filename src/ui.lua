local module = {}
local data = nil
local logic = nil

local LABEL_WIDTH = 180
local DROPDOWN_WIDTH = 400
local COLUMN_GAP = 12
local DROPDOWN_TOOLTIP = "Guaranteed first hammer for this aspect. Leave on None (Random) to keep vanilla behavior."

local function DrawAspectDropdown(ui, uiState, aspectName)
    local hammerOptions = data.hammerData[aspectName]
    if not hammerOptions then
        return
    end
    local label = data.aspectLabels[aspectName] or aspectName
    local rowStartX = ui.GetCursorPosX()

    ui.AlignTextToFramePadding()
    ui.Text(label)
    if ui.IsItemHovered() then
        ui.SetTooltip(DROPDOWN_TOOLTIP)
    end

    ui.SameLine()
    ui.SetCursorPosX(rowStartX + LABEL_WIDTH + COLUMN_GAP)
    lib.widgets.dropdown(ui, uiState, aspectName, {
        label = "",
        values = hammerOptions.values,
        displayValues = hammerOptions.displayValues,
        controlWidth = DROPDOWN_WIDTH,
        tooltip = DROPDOWN_TOOLTIP,
    })
end

function module.drawTab(ui, uiState)
    for _, weaponName in ipairs(data.weaponDrawOrder or {}) do
        if ui.CollapsingHeader(data.weaponLabels[weaponName] or weaponName) then
            for _, aspectName in ipairs(data.weaponAspectMapping[weaponName] or {}) do
                DrawAspectDropdown(ui, uiState, aspectName)
            end
        end
    end
end

function module.drawQuickContent(ui, uiState)
    local currentAspect = logic.getEquippedAspect()
    DrawAspectDropdown(ui, uiState, currentAspect)
end

function module.bind(moduleData, moduleLogic)
    data = moduleData
    logic = moduleLogic
    return module
end

return module
