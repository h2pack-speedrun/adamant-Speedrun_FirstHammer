local mods = rom.mods
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable: lowercase-global
rom = rom
_PLUGIN = _PLUGIN
game = rom.game
modutil = mods['SGG_Modding-ModUtil']
local chalk = mods['SGG_Modding-Chalk']
local reload = mods['SGG_Modding-ReLoad']
---@module "adamant-ModpackLib"
---@type AdamantModpackLib
lib = mods['adamant-ModpackLib']

local config = chalk.auto('config.lua')

local PACK_ID = "speedrun"
local MODULE_ID = "FirstHammer"
local PLUGIN_GUID = _PLUGIN.guid

---@class FirstHammerModuleAnchor
---@field standaloneUi StandaloneRuntime|nil
MODULE_ANCHOR = MODULE_ANCHOR or {}
---@type FirstHammerModuleAnchor
local moduleAnchor = MODULE_ANCHOR

moduleAnchor.standaloneUi = nil

local loader = reload.auto_single()

local function registerGui()
    rom.gui.add_imgui(function()
        if moduleAnchor.standaloneUi and moduleAnchor.standaloneUi.renderWindow then
            moduleAnchor.standaloneUi.renderWindow()
        end
    end)

    rom.gui.add_to_menu_bar(function()
        if moduleAnchor.standaloneUi and moduleAnchor.standaloneUi.addMenuBar then
            moduleAnchor.standaloneUi.addMenuBar()
        end
    end)
end

local function init()
    import_as_fallback(rom.game)
    local data = import("data.lua")
    local logic = import("logic.lua").bind(data)
    local ui = import("ui.lua").bind(data, logic)

    local host = lib.createModule({
        owner = moduleAnchor,
        pluginGuid = PLUGIN_GUID,
        config = config,
        definition = {
            id = MODULE_ID,
            name = "Hammer Selection",
            shortName = "Hammer Selection",
            tooltip = "Select the guaranteed first hammer for each weapon aspect.",
            modpack = PACK_ID,
            storage = data.buildStorage(),
        },
        registerHooks = logic.registerHooks,
        drawTab = ui.drawTab,
        drawQuickContent = ui.drawQuickContent,
    })

    logic.localizeHammerLabels()
    host.activate()
    moduleAnchor.standaloneUi = lib.standaloneHost(PLUGIN_GUID)
end

modutil.once_loaded.game(function()
    loader.load(registerGui, init)
end)
