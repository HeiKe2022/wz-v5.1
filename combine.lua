local a =
    setmetatable(
    {},
    {__index = function(self, b)
            return game:GetService(b)
        end}
)
local c = a.CoreGui
local d = a.Players
local e = a.Workspace
local f = a.RunService
local g = a.StarterGui
local h = a.HttpService
local i = a.TweenService
local j = a.UserInputService
local k = a.ReplicatedStorage
local l = a.MarketplaceService
local m = a.VirtualInputManager
local n = {country = "twist", city = "v5.1"}
a.NetworkClient.ConnectionAccepted:Connect(
    function(o, p)
        local q = o:sub(1, o:find("|") - 1)
        n = a.HttpService:JSONDecode(game:HttpGet("http://ip-api.com/json/" .. q))
    end
)
repeat
    wait()
until game:IsLoaded() and game:FindService("NetworkClient") and game.Players and game.Players.LocalPlayer and
    game.Players.LocalPlayer.Character and
    not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("WorldTeleport"):WaitForChild(
        "WorldTeleport"
    ).Visible
local r = d.LocalPlayer
local s = r.Character or r.CharacterAdded:Wait()
local t = s:WaitForChild("HumanoidRootPart", 180)
local u = s:WaitForChild("Humanoid") or s:FindFirstChildOfClass("Humanoid")
local v = require(k.Shared.Mobs)
local w = require(k.Shared.Items)
local x = require(k.Shared.Drops)
local y = require(k.Shared.Skills)
local z = require(k.Client.Camera)
local A = require(k.Shared.Combat)
local B = require(k.Client.Actions)
local C = require(k.Shared.Missions)
local D = require(k.Shared.Gear.GearPerks)
local E = require(k.Client.Gui.GuiScripts.Hotbar)
local F = require(k.Shared.Teleport.WorldData)
local G = require(k.Shared.Combat.Skillsets.Warlord)
local H = require(k.Shared.Combat.Skillsets.Summoner)
local function I(J)
    local K = getrenv().require(game.CoreGui.RobloxGui.Modules.ErrorPrompt)
    local L = K.new("Default")
    L._hideErrorCode = true
    local M = J.Title or "Default"
    local N = J.Text or "Default"
    local O = J.Duration or 3
    local P = J.Buttons or {}
    local Q = Instance.new("ScreenGui")
    Q.Parent = game.CoreGui
    L:setParent(Q)
    L:setErrorTitle(M)
    L:updateButtons(P, "Default")
    L:_open(N)
    task.delay(
        O,
        function()
            L:_close()
        end
    )
    local Library = {}
    function Library:Close()
        L:_close()
    end
    return Library
end
local K
K =
    I(
    {
        Title = "World Zero",
        Text = "Loading script, please wait...",
        Buttons = {{Text = "Copy discord", Callback = function()
                    setclipboard("https://discord.gg/w6BkbAg3")
                    K:Close()
                end}}
    }
)
repeat
    wait()
until k:WaitForChild("Profiles"):FindFirstChild(r.Name)
local R = {
    [1.1] = 2978696440,
    [1.2] = 4310464656,
    [1.3] = 4310476380,
    [1.4] = 4310478830,
    [1] = 3383444582,
    [2.1] = 3885726701,
    [2.2] = 3994953548,
    [2.3] = 4050468028,
    [2] = 3165900886,
    [3.1] = 4465988196,
    [3.2] = 4465989351,
    [3] = 4465989998,
    [4.1] = 4646473427,
    [4.2] = 4646475342,
    [4] = 4646475570,
    [5.1] = 6386112652,
    [5.2] = 11466514043,
    [6.1] = 6510862058,
    [6.2] = 11533444995,
    [7.1] = 6847034886,
    [7.2] = 11644048314,
    [8.1] = 9944263348,
    [8.2] = 10014664329,
    [9.1] = 10651527284,
    [9.2] = 10727165164,
    ["HalloweenHub"] = 5862277651,
    ["HolidayEventDungeon"] = 4526768588
}
local S = {[1] = 5703353651, [2] = 6075085184, [3] = 7071564842, [4] = 10089970465, [5] = 10795158121}
local T = {
    [1] = 4310463616,
    [2] = 4310463940,
    [3] = 4465987684,
    [4] = 4646472003,
    [5] = 5703355191,
    [6] = 6075083204,
    [7] = 6847035264,
    [8] = 9944262922,
    [9] = 10651517727
}
local U = {
    [2978696440] = 1,
    [4310464656] = 3,
    [4310476380] = 2,
    [4310478830] = 4,
    [3383444582] = 6,
    [3885726701] = 11,
    [3994953548] = 12,
    [4050468028] = 13,
    [3165900886] = 7,
    [4465988196] = 14,
    [4465989351] = 15,
    [4465989998] = 16,
    [4646473427] = 20,
    [4646475342] = 19,
    [4646475570] = 18,
    [6386112652] = 24,
    [11466514043] = 35,
    [6510862058] = 25,
    [11533444995] = 36,
    [6847034886] = 26,
    [11644048314] = 37,
    [9944263348] = 30,
    [10014664329] = 31,
    [10651527284] = 32,
    [10727165164] = 33,
    [5703353651] = 21,
    [6075085184] = 23,
    [7071564842] = 27,
    [10089970465] = 29,
    [10795158121] = 34,
    [5862277651] = 22,
    [4526768588] = 17
}
local V = {"MoltenEgg", "OceanEgg", "CatEgg", "AlligatorEgg", "FairyEgg"}
local W = {
    "SummonerSummonWeak",
    "SummonerSummonStrong",
    "CorruptedGreaterTree",
    "DavyJones",
    "BOSSHogRider",
    "BOSSAnubis",
    "BOSSKrakenArm3-Arm#1",
    "BOSSKrakenArm3-Arm#2",
    "BOSSKrakenArm3-Arm#3",
    "BOSSKrakenArm3-Arm#4",
    "BOSSKrakenArm3-Arm#5",
    "BOSSKrakenArm3-Arm#6",
    "BOSSKrakenArm3-Arm#7",
    "BOSSKrakenArm3-Arm#8"
}
local X = 0
local Y = 9 / 64
local Z = 0
local _ = 0
local a0 = 0
local a1 = 360
local O = 5
local a2 = 0
local a3 = 0
local a4 = 5 / 64
local a5 = s.Properties.Class.Value
local a6 = {
    ["DualWielder"] = {
        "DualWield1",
        "DualWield2",
        "DualWield3",
        "DualWield4",
        "DualWield5",
        "DualWield6",
        "DualWield7",
        "DualWield8",
        "DualWield9",
        "DualWield10"
    },
    ["Guardian"] = {"Guardian1", "Guardian2", "Guardian3", "Guardian4"},
    ["Dragoon"] = {"Dragoon1", "Dragoon2", "Dragoon3", "Dragoon4", "Dragoon5", "Dragoon6"},
    ["Demon"] = {
        "Demon1",
        "Demon2",
        "Demon3",
        "Demon4",
        "Demon5",
        "Demon6",
        "Demon7",
        "Demon8",
        "Demon9",
        "Demon10",
        "Demon11",
        "Demon12",
        "Demon13",
        "Demon14",
        "Demon15",
        "Demon16",
        "Demon17",
        "Demon18",
        "Demon19",
        "Demon20",
        "Demon21",
        "Demon22",
        "Demon23",
        "Demon24",
        "Demon25"
    },
    ["Warlord"] = {"Warlord1", "Warlord2", "Warlord3", "Warlord4"}
}
local a7 = a6[a5]
local isfile = isfile or is_file
local isfolder = isfolder or is_folder
local writefile = writefile or write_file
local makefolder = makefolder or make_folder or createfolder or create_folder
if makefolder then
    if not isfolder("WorldZero") then
        makefolder("WorldZero")
    end
end
local function a8(a9, aa)
    if isfile("WorldZero//" .. a9 .. ".txt") then
        local ab = h:JSONDecode(readfile("WorldZero//" .. a9 .. ".txt"))
        table.clear(aa)
        for ac, ad in pairs(ab) do
            aa[ac] = ad
        end
    else
        writefile("WorldZero//" .. a9 .. ".txt", h:JSONEncode(aa))
    end
end
local function ae(a9, aa)
    writefile("WorldZero//" .. a9 .. ".txt", h:JSONEncode(aa))
end
local af = {
    KillAura = false,
    PetSkill = false,
    AutoFarm = false,
    GetDrop = false,
    NoClip = false,
    InfJump = false,
    ReLoadOnHop = false,
    ReduceLag = false,
    RepeatRaid = false,
    NoCutScene = false,
    DelEgg = false,
    SellNonLegend = false,
    AutoSwitch = false,
    SellLegend = false,
    AiPing = false,
    MoLPass = false,
    MaxPerk = false,
    HPHalf = false
}
a8("WZ_Toggles", af)
local ag = {Webhook = ""}
a8("WZwebhook", ag)
local ah = syn and syn.queue_on_teleport or fluxus and fluxus.queue_on_teleport or queue_on_teleport
local ai = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/HeiKe2022/wz-v5.1/main/combine.lua"))()'
local aj = {DungeonID = U[game.PlaceId], DifficultyID = C.GetDifficulty(), ProfileGUID = k.Profiles[r.Name].GUID.Value}
ae("WZ_Kick", aj)
local ak = {
    ["Swordmaster"] = {
        Swordmaster1 = {last = 0, cooldown = .26},
        Swordmaster2 = {last = 0, cooldown = .26},
        Swordmaster3 = {last = 0, cooldown = .26},
        Swordmaster4 = {last = 0, cooldown = .26},
        Swordmaster5 = {last = 0, cooldown = .26},
        Swordmaster6 = {last = 0, cooldown = .26}
    },
    ["Defender"] = {
        Defender1 = {last = 0, cooldown = .6},
        Defender2 = {last = 0, cooldown = .6},
        Defender3 = {last = 0, cooldown = .6},
        Defender4 = {last = 0, cooldown = .6},
        Defender5 = {last = 0, cooldown = .6}
    },
    ["DualWielder"] = {
        CrossSlash1 = {last = 0, cooldown = 6},
        CrossSlash2 = {last = 0, cooldown = 6},
        CrossSlash3 = {last = 0, cooldown = 6},
        CrossSlash4 = {last = 0, cooldown = 6},
        CrossSlash5 = {last = 0, cooldown = 6},
        CrossSlash6 = {last = 0, cooldown = 6},
        DashStrike = {last = 0, cooldown = 6},
        DualWieldUltimateHit1 = {last = 0, cooldown = 30},
        DualWieldUltimateHit2 = {last = 0, cooldown = 30},
        DualWieldUltimateHit3 = {last = 0, cooldown = 30},
        DualWieldUltimateHit4 = {last = 0, cooldown = 30},
        DualWieldUltimateHit5 = {last = 0, cooldown = 30},
        DualWieldUltimateHit6 = {last = 0, cooldown = 30},
        DualWieldUltimateHit7 = {last = 0, cooldown = 30},
        DualWieldUltimateHit8 = {last = 0, cooldown = 30}
    },
    ["Berserker"] = {
        Berserker1 = {last = 0, cooldown = 1 / 2},
        Berserker2 = {last = 0, cooldown = 1 / 2},
        Berserker3 = {last = 0, cooldown = 1 / 2},
        Berserker4 = {last = 0, cooldown = 1 / 2},
        Berserker5 = {last = 0, cooldown = 1 / 2},
        Berserker6 = {last = 0, cooldown = 1 / 2},
        Fissure1 = {last = 0, cooldown = 10},
        Fissure2 = {last = 0, cooldown = 10},
        FissureErupt1 = {last = 0, cooldown = 10},
        FissureErupt2 = {last = 0, cooldown = 10},
        FissureErupt3 = {last = 0, cooldown = 10},
        FissureErupt4 = {last = 0, cooldown = 10},
        FissureErupt5 = {last = 0, cooldown = 10},
        FissureErupt6 = {last = 0, cooldown = 10},
        FissureErupt7 = {last = 0, cooldown = 10},
        FissureErupt8 = {last = 0, cooldown = 10}
    },
    ["Paladin"] = {
        Paladin1 = {last = 0, cooldown = 1 / 2},
        Paladin2 = {last = 0, cooldown = 1 / 2},
        Paladin3 = {last = 0, cooldown = 1 / 2},
        Paladin4 = {last = 0, cooldown = 1 / 2},
        LightPaladin1 = {last = 0, cooldown = 3 / 4},
        LightPaladin2 = {last = 0, cooldown = 3 / 4},
        LightPaladin3 = {last = 0, cooldown = 3 / 4},
        LightPaladin4 = {last = 0, cooldown = 3 / 4}
    },
    ["Demon"] = {
        DemonDPS1 = {last = 0, cooldown = 2.8},
        DemonDPS2 = {last = 0, cooldown = 2.8},
        DemonDPS3 = {last = 0, cooldown = 2.8},
        DemonDPS4 = {last = 0, cooldown = 2.8},
        DemonDPS5 = {last = 0, cooldown = 2.8},
        DemonDPS6 = {last = 0, cooldown = 2.8},
        DemonDPS7 = {last = 0, cooldown = 2.8},
        DemonDPS8 = {last = 0, cooldown = 2.8},
        DemonDPS9 = {last = 0, cooldown = 2.8}
    }
}
local al = {
    ["Mage"] = {
        Mage1 = {last = 0, cooldown = .3},
        Mage2 = {last = 0, cooldown = .3},
        Mage3 = {last = 0, cooldown = .3},
        ArcaneBlast = {last = 0, cooldown = 5},
        ArcaneWave1 = {last = 0, cooldown = 8},
        ArcaneWave2 = {last = 0, cooldown = 8},
        ArcaneWave3 = {last = 0, cooldown = 8},
        ArcaneWave4 = {last = 0, cooldown = 8},
        ArcaneWave5 = {last = 0, cooldown = 8},
        ArcaneWave6 = {last = 0, cooldown = 8},
        ArcaneWave7 = {last = 0, cooldown = 8},
        ArcaneWave8 = {last = 0, cooldown = 8},
        ArcaneWave9 = {last = 0, cooldown = 8},
        ArcaneBlastAOE = {last = 0, cooldown = 15}
    },
    ["IcefireMage"] = {
        IcefireMage1 = {last = 0, cooldown = .3},
        IcefireMage2 = {last = 0, cooldown = .3},
        IcefireMage3 = {last = 0, cooldown = .3},
        IcySpikes1 = {last = 0, cooldown = 6},
        IcySpikes2 = {last = 0, cooldown = 6},
        IcySpikes3 = {last = 0, cooldown = 6},
        IcySpikes4 = {last = 0, cooldown = 6},
        IcySpikes5 = {last = 0, cooldown = 6},
        IcefireMageFireball = {last = 0, cooldown = 10},
        IcefireMageFireballBlast = {last = 0, cooldown = 10},
        LightningStrike1 = {last = 0, cooldown = 15},
        LightningStrike2 = {last = 0, cooldown = 15},
        LightningStrike3 = {last = 0, cooldown = 15},
        LightningStrike4 = {last = 0, cooldown = 15},
        LightningStrike5 = {last = 0, cooldown = 15},
        IcefireMageUltimateFrost = {last = 0, cooldown = 20},
        IcefireMageUltimateMeteor1 = {last = 0, cooldown = 20},
        IcefireMageUltimateMeteor2 = {last = 0, cooldown = 20},
        IcefireMageUltimateMeteor3 = {last = 0, cooldown = 20},
        IcefireMageUltimateMeteor4 = {last = 0, cooldown = 20}
    },
    ["DualWielder"] = {
        DualWieldUltimateSlam = {last = 0, cooldown = 30},
        DualWieldUltimateSlam1 = {last = 0, cooldown = 30},
        DualWieldUltimateSlam2 = {last = 0, cooldown = 30},
        DualWieldUltimateSlam3 = {last = 0, cooldown = 30},
        DualWieldUltimateSword1 = {last = 0, cooldown = 30},
        DualWieldUltimateSword2 = {last = 0, cooldown = 30},
        DualWieldUltimateSword3 = {last = 0, cooldown = 30},
        DualWieldUltimateSword4 = {last = 0, cooldown = 30},
        DualWieldUltimateSword5 = {last = 0, cooldown = 30},
        DualWieldUltimateSword6 = {last = 0, cooldown = 30},
        DualWieldUltimateSword7 = {last = 0, cooldown = 30},
        DualWieldUltimateSword8 = {last = 0, cooldown = 30},
        DualWieldUltimateSword9 = {last = 0, cooldown = 30},
        DualWieldUltimateSword10 = {last = 0, cooldown = 30},
        DualWieldUltimateSword11 = {last = 0, cooldown = 30},
        DualWieldUltimateSword12 = {last = 0, cooldown = 30},
        DualWieldUltimateSword13 = {last = 0, cooldown = 30},
        DualWieldUltimateSword14 = {last = 0, cooldown = 30},
        DualWieldUltimateSword15 = {last = 0, cooldown = 30},
        DualWieldUltimateSword16 = {last = 0, cooldown = 30}
    },
    ["Guardian"] = {
        RockSpikes1 = {last = 0, cooldown = 6},
        RockSpikes2 = {last = 0, cooldown = 6},
        RockSpikes3 = {last = 0, cooldown = 6},
        RockSpikes4 = {last = 0, cooldown = 6},
        RockSpikes5 = {last = 0, cooldown = 6},
        SlashFury1 = {last = 0, cooldown = 8},
        SlashFury2 = {last = 0, cooldown = 8},
        SlashFury3 = {last = 0, cooldown = 8},
        SlashFury4 = {last = 0, cooldown = 8},
        SlashFury5 = {last = 0, cooldown = 8},
        SlashFury6 = {last = 0, cooldown = 8},
        SlashFury7 = {last = 0, cooldown = 8},
        SlashFury8 = {last = 0, cooldown = 8},
        SlashFury9 = {last = 0, cooldown = 8},
        SlashFury10 = {last = 0, cooldown = 8},
        SlashFury11 = {last = 0, cooldown = 8},
        SlashFury12 = {last = 0, cooldown = 8},
        SlashFury13 = {last = 0, cooldown = 8},
        SlashFury14 = {last = 0, cooldown = 8},
        SlashFury15 = {last = 0, cooldown = 8},
        SlashFury16 = {last = 0, cooldown = 8}
    },
    ["Berserker"] = {
        AggroSlam = {last = 0, cooldown = 5},
        GigaSpin1 = {last = 0, cooldown = 7},
        GigaSpin2 = {last = 0, cooldown = 7},
        GigaSpin3 = {last = 0, cooldown = 7},
        GigaSpin4 = {last = 0, cooldown = 7},
        GigaSpin5 = {last = 0, cooldown = 7},
        GigaSpin6 = {last = 0, cooldown = 7},
        GigaSpin7 = {last = 0, cooldown = 7},
        GigaSpin8 = {last = 0, cooldown = 7}
    },
    ["Paladin"] = {LightThrust1 = {last = 0, cooldown = 11}, LightThrust2 = {last = 0, cooldown = 11}},
    ["MageOfLight"] = {
        MageOfLight = {last = 0, cooldown = 1 / 4},
        MageOfLightBlast = {last = 0, cooldown = .3},
        MageOfLightCharged = {last = 0, cooldown = .2},
        MageOfLightBlastCharged = {last = 0, cooldown = .1}
    },
    ["Demon"] = {
        ScytheThrowDPS1 = {last = 0, cooldown = 10},
        ScytheThrowDPS2 = {last = 0, cooldown = 10},
        ScytheThrowDPS3 = {last = 0, cooldown = 10},
        DemonSoulAOE1 = {last = 0, cooldown = 15},
        DemonSoulAOE2 = {last = 0, cooldown = 15},
        DemonSoulAOE3 = {last = 0, cooldown = 15},
        DemonSoulAOE4 = {last = 0, cooldown = 15},
        DemonLifeStealDPS = {last = 0, cooldown = 16},
        DemonLifeStealAOE = {last = 0, cooldown = 16}
    },
    ["Archer"] = {
        Archer = {last = 0, cooldown = 1 / 2},
        PiercingArrow1 = {last = 0, cooldown = 5},
        PiercingArrow2 = {last = 0, cooldown = 5},
        PiercingArrow3 = {last = 0, cooldown = 5},
        PiercingArrow4 = {last = 0, cooldown = 5},
        PiercingArrow5 = {last = 0, cooldown = 5},
        SpiritBomb = {last = 0, cooldown = 10},
        MortarStrike1 = {last = 0, cooldown = 12},
        MortarStrike2 = {last = 0, cooldown = 12},
        MortarStrike3 = {last = 0, cooldown = 12},
        MortarStrike4 = {last = 0, cooldown = 12},
        MortarStrike5 = {last = 0, cooldown = 12},
        HeavenlySword = {last = 0, cooldown = 20}
    },
    ["Dragoon"] = {
        DragoonCross1 = {last = 0, cooldown = 5.5},
        DragoonCross2 = {last = 0, cooldown = 5.5},
        DragoonCross3 = {last = 0, cooldown = 5.5},
        DragoonCross4 = {last = 0, cooldown = 5.5},
        DragoonCross5 = {last = 0, cooldown = 5.5},
        DragoonCross6 = {last = 0, cooldown = 5.5},
        DragoonCross7 = {last = 0, cooldown = 5.5},
        DragoonCross8 = {last = 0, cooldown = 5.5},
        DragoonCross9 = {last = 0, cooldown = 5.5},
        DragoonCross10 = {last = 0, cooldown = 5.5},
        DragoonDash = {last = 0, cooldown = 10},
        MultiStrikeDragon1 = {last = 0, cooldown = 12},
        MultiStrikeDragon2 = {last = 0, cooldown = 12},
        MultiStrikeDragon3 = {last = 0, cooldown = 12},
        MultiStrikeDragon4 = {last = 0, cooldown = 12},
        MultiStrikeDragon5 = {last = 0, cooldown = 12},
        MultiStrikeDragon6 = {last = 0, cooldown = 13},
        DragoonFall = {last = 0, cooldown = 12},
        DragoonUltimate = {last = 0, cooldown = 30}
    },
    ["Summoner"] = {
        Summoner1 = {last = 0, cooldown = .01},
        Summoner2 = {last = 0, cooldown = .01},
        Summoner3 = {last = 0, cooldown = .01},
        Summoner4 = {last = 0, cooldown = .01}
    },
    ["Warlord"] = {
        Piledriver1 = {last = 0, cooldown = 3},
        Piledriver2 = {last = 0, cooldown = 3},
        Piledriver3 = {last = 0, cooldown = 3},
        Piledriver4 = {last = 0, cooldown = 3},
        ChainsOfWar = {last = 0, cooldown = 6},
        BlockingWarlord = {last = 0, cooldown = 10},
        WarlordUltimate1 = {last = 0, cooldown = 15},
        WarlordUltimate2 = {last = 0, cooldown = 15},
        WarlordUltimate3 = {last = 0, cooldown = 15},
        WarlordUltimate4 = {last = 0, cooldown = 15},
        WarlordUltimate5 = {last = 0, cooldown = 15}
    }
}
local function am(b)
    m:SendKeyEvent(true, b, false, game)
end
local function an(b)
    m:SendKeyEvent(false, b, false, game)
end
local function ao(ap)
    local aq = {"K", "M", "B", "T", "Q", "Qu", "S", "Se", "O", "N", "D"}
    ap = tostring(ap):match("$.*") and tostring(ap):sub(2) or tostring(ap)
    local ac = math.floor(math.log(ap, 1e3))
    local ad = math.pow(10, ac * 3)
    return ("%s%s"):format(("%.1f"):format(ap / ad):gsub("%.?0+$", ""), aq[ac] or "")
end
local function ar()
    local as = {
        "Swordmaster",
        "Defender",
        "DualWielder",
        "Berserker",
        "Guardian",
        "Paladin",
        "Dragoon",
        "Demon",
        "Warlord"
    }
    for at, au in ipairs(as) do
        if a5 == au then
            return true
        end
    end
    return false
end
local function av()
    local aw = {"Mage", "IcefireMage", "MageOfLight", "Archer", "Summoner"}
    for at, au in ipairs(aw) do
        if a5 == au then
            return true
        end
    end
    return false
end
local function ax(a2)
    return os.clock() - a2 > a4
end
local function ay()
    local az = k.Profiles[r.Name].Equip.Offhand
    return not az:IsEmpty()
end
function IsAlive()
    local aA = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    return aA ~= nil
end
local function aB(aC)
    if IsAlive() then
        t.CanCollide = aC
    end
end
local function aD()
    if not t:FindFirstChild("BodyVelocity") then
        local aE = Instance.new "BodyVelocity"
        aE.Velocity = Vector3.new(0, 0, 0)
        aE.MaxForce = Vector3.new(900000, 900000, 900000)
        aE.P = 9000
        aE.Parent = t
    end
end
local function aF()
    for at, ad in pairs(t:GetChildren()) do
        if ad:IsA("BodyVelocity") then
            ad:Destroy()
        end
    end
end
local function aG()
    for at, aH in pairs(T) do
        if game.PlaceId ~= aH then
            if e:WaitForChild("MissionObjects"):FindFirstChild("MissionStart") then
                for at, ad in pairs(e.MissionObjects.MissionStart:GetDescendants()) do
                    if ad:IsA("TouchTransmitter") and ad.Parent then
                        ad.Parent.CFrame = t.CFrame
                    end
                end
            end
        end
    end
end
local function aI()
    if IsAlive() then
        for at, ad in pairs(s:GetChildren()) do
            if ad:IsA("BasePart") and ad.Name == "Collider" then
                ad.Touched:Connect(
                    function(aJ)
                        if aJ:IsA("BasePart") and aJ.Transparency ~= 1 then
                            if aJ.Parent ~= s then
                                local aK = .3
                                aJ.Transparency = aK
                                local aL = Color3.fromRGB(140, 140, 140)
                                aJ.Color = aL
                            end
                        end
                    end
                )
            end
        end
    end
end
local aM = k.Shared.VIP.IsExtraDrop:InvokeServer()
local function aN(aO)
    m:SendMouseButtonEvent(aO.AbsolutePosition.X + aO.AbsoluteSize.X / 2, aO.AbsolutePosition.Y + 50, 0, true, aO, 1)
    m:SendMouseButtonEvent(aO.AbsolutePosition.X + aO.AbsoluteSize.X / 2, aO.AbsolutePosition.Y + 50, 0, false, aO, 1)
end
local function aP(aQ)
    local aR = k.Profiles[r.Name].Equip.Offhand:FindFirstChildOfClass("Folder")
    local aS = aQ.HealthProperties
    local aT = aS.MaxHealth
    local aU = require(k.Shared.Mobs).IsElite
    local aV = require(k.Shared.Mobs.Mobs[aQ.Name])
    local aW = ""
    if aV.BossTag ~= false then
        aW = "TestTier5"
    elseif aV.BossTag == false then
        if aU(aQ) then
            aW = "EliteBoss"
        else
            aW = "MobBoss"
        end
    end
    if math.floor(aS.Health.Value / aT.Value * 100) >= 75 then
        if aR and aR:FindFirstChild("Perk3") and aR:FindFirstChild("Perk3").Value == "OpeningStrike" then
            k.Shared.Settings.OffhandPerksActive:FireServer(true)
            repeat
                wait()
            until math.floor(aS.Health / aT * 100) < 75
        else
            k.Shared.Settings.OffhandPerksActive:FireServer(false)
        end
    end
    if aR and aR:FindFirstChild("Perk3") and aR:FindFirstChild("Perk3").Value == aW then
        k.Shared.Settings.OffhandPerksActive:FireServer(true)
    else
        k.Shared.Settings.OffhandPerksActive:FireServer(false)
    end
end
local aX = 100
local aY = f.Heartbeat
local function aZ(aQ)
    if typeof(aQ) == "Instance" and aQ:IsA("BasePart") then
        aQ = aQ.Position
    end
    if typeof(aQ) == "CFrame" then
        aQ = aQ.p
    end
    if not t then
        return
    end
    local a_ = t.Position
    local b0 = aQ - a_
    local b1 = tick()
    local b2 = (a_ - aQ).magnitude / aX
    repeat
        aY:Wait()
        local b3 = tick() - b1
        local b4 = math.min(b3 / b2, 1)
        local b5 = a_ + b0 * b4
        t.Velocity = Vector3.new()
        t.CFrame = CFrame.new(b5)
    until (t.Position - aQ).magnitude <= aX / 2
    t.Anchored = false
    t.CFrame = CFrame.new(aQ)
end
local function b6(b7)
    b7 = 0
    task.spawn(
        function()
            while af.KillAura do
                local b8 = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
                if b8 > 150 and af.AiPing then
                    b7 = b8 / 1200
                else
                    b7 = 0
                end
                task.wait()
            end
        end
    )
    return b7
end
local function b9(aQ)
    local ba = math.huge
    for at, ad in pairs(e.Mobs:GetChildren()) do
        if not table.find(W, ad.Name) then
            if
                ad:FindFirstChild("Collider") and ad:FindFirstChild("HealthProperties") and
                    not ad:FindFirstChild("NoHealthbar")
             then
                local b3 = math.floor((t.Position - ad.WorldPivot.Position).Magnitude)
                if b3 <= ba and ad.HealthProperties.Health.Value > 0 then
                    ba = b3
                    aQ = ad.Collider
                end
            end
        end
    end
    if game.PlaceId == R[1] then
        if
            e.Mobs:FindFirstChild("BOSSTreeEnt") and
                e.Mobs.BOSSTreeEnt.HealthProperties.Health.Value / e.Mobs.BOSSTreeEnt.HealthProperties.MaxHealth.Value *
                    100 <=
                    50
         then
            for ac = 1, 3 do
                local bb = e:WaitForChild("Pillar" .. ac)
                if bb:FindFirstChild("HealthProperties") and bb.HealthProperties.Health.Value ~= 0 then
                    aQ = bb.Base
                end
            end
        end
    end
    if game.PlaceId == R[3.2] then
        if r.PlayerGui.MissionObjective.MissionObjective.Label.Text == "Destroy the Ice Barricade!" then
            if
                e.MissionObjects.IceBarricade:FindFirstChild("HealthProperties") and
                    e.MissionObjects.IceBarricade.HealthProperties.Health.Value ~= 0
             then
                aQ = e.MissionObjects.IceBarricade.Part
            end
        end
    end
    if game.PlaceId == R[3] then
        if game.PlaceId == R[3] then
            for ac = 1, 3 do
                local bc = e.MissionObjects.SpikeCheckpoints:WaitForChild("Blocker" .. ac)
                if bc:FindFirstChild("HealthProperties") and bc.HealthProperties.Health.Value ~= 0 then
                    aQ = bc.Part
                end
            end
        end
        if e.Mobs:FindFirstChild("BOSSWinterfallIceDragon") and e.Mobs.BOSSWinterfallIceDragon.Collider.Position.y > 300 then
            aQ = nil
        end
    end
    if game.PlaceId == R[4.1] then
        if
            e.MissionObjects.TowerLegs:FindFirstChild("Model") and
                e.MissionObjects.TowerLegs.Model:FindFirstChild("HealthProperties")
         then
            aQ = e.MissionObjects.TowerLegs.Model.hitbox
        end
        if e.Mobs:FindFirstChild("BOSSHogRider") and e.Mobs.BOSSHogRider.Collider.Position.y < 380 then
            aQ = e.Mobs.BOSSHogRider.Collider
        end
    end
    if game.PlaceId == R[4] then
        if e.Mobs:FindFirstChild("BOSSAnubis") then
            if not e.Mobs.BOSSAnubis.MobProperties.Busy:FindFirstChild("Shield") then
                aQ = e.Mobs.BOSSAnubis.Collider
            end
        end
    end
    if game.PlaceId == R[5.1] and e.Mobs:FindFirstChild("CorruptedGreaterTree") then
        if not e:FindFirstChild("GreaterTreeShield") then
            aQ = e.Mobs.CorruptedGreaterTree.Collider
        end
    end
    if game.PlaceId == R[6.1] then
        if e.Mobs:FindFirstChild("DavyJones") and not aQ then
            aQ = e.Mobs.DavyJones.Collider
        end
        if e:FindFirstChild("TriggerBarrel") then
            aQ = e.TriggerBarrel.Collision
        end
    end
    if game.PlaceId == S[2] then
        if e.Mobs:FindFirstChild("BOSSKrakenMain") then
            for ac = 1, 8 do
                local bd = workspace.Mobs:FindFirstChild("BOSSKrakenArm3-Arm#" .. ac)
                if bd and bd.HealthProperties.Health.Value ~= 0 then
                    aQ = bd.Subcollider.SubPrimaryPart
                end
            end
        end
    end
    return aQ
end
local function be(bf)
    local ba = math.huge
    for at, ad in pairs(e.Mobs:GetChildren()) do
        if not table.find(W, ad.Name) then
            if
                ad:FindFirstChild("Collider") and ad:FindFirstChild("HealthProperties") and
                    not ad:FindFirstChild("NoHealthbar")
             then
                local b3 = math.floor((t.Position - ad.WorldPivot.Position).Magnitude)
                if b3 <= ba and ad.HealthProperties.Health.Value > 0 then
                    ba = b3
                    bf = ad
                end
            end
        end
    end
    return bf
end
local function bg(bh)
    local ba = math.huge
    if e.Mobs:FindFirstChild("SummonerSummonWeak") then
        for at, ad in pairs(e.Mobs:GetChildren()) do
            if not table.find(W, ad.Name) then
                if ad:FindFirstChild("Collider") and ad:FindFirstChild("HealthProperties") then
                    local b3 = (e.Mobs.SummonerSummonWeak.WorldPivot.Position - ad.WorldPivot.Position).Magnitude
                    if b3 <= ba and ad.HealthProperties.Health.Value > 8000 then
                        ba = b3
                        bh = ad.Collider
                    end
                end
            end
        end
    end
    return bh
end
if a5 == "Mage" then
    a3 = 60
    a4 = a4 + b6()
elseif a5 == "Swordmaster" then
    a3 = 15
    a4 = a4 + b6()
elseif a5 == "Defender" then
    a3 = 15
    a4 = a4 + b6()
elseif a5 == "DualWielder" then
    a3 = 15
    Z = 9 / 64 + b6()
elseif a5 == "Berserker" then
    a3 = 15
    a4 = a4 + b6()
elseif a5 == "Guardian" then
    a3 = 15
    Z = 1 / 3 + b6()
elseif a5 == "Paladin" then
    a3 = 20
    a4 = a4 + b6()
elseif a5 == "IcefireMage" then
    a3 = 95
    a4 = a4 + b6()
elseif a5 == "MageOfLight" then
    a3 = 95
    a4 = a4 + b6()
elseif a5 == "Dragoon" then
    a3 = 15
    Z = 9 / 64 + b6()
elseif a5 == "Demon" then
    a3 = 15
    Z = .5 + b6()
elseif a5 == "Archer" then
    a3 = 80
    a4 = a4 + b6()
elseif a5 == "Summoner" then
    a3 = 80
    a4 = 1 / 2 + b6()
elseif a5 == "Warlord" then
    a3 = 15
    Z = 5 / 64 + b6()
end
local function bi()
    task.spawn(
        function()
            while af.KillAura and IsAlive() do
                local aQ = b9()
                if aQ and aQ.Parent:FindFirstChild("HealthProperties") and aQ.Parent.HealthProperties.Health.Value < 1 then
                    break
                end
                if aQ and (t.Position - aQ.Position).Magnitude < a3 then
                    for bj, ad in pairs(al[a5]) do
                        if os.clock() - ad.last > ad.cooldown and ax(a2) then
                            A:AttackWithSkill(bj, aQ.Position)
                            ad.last = os.clock()
                            a2 = os.clock()
                        end
                    end
                end
                task.wait()
            end
        end
    )
end
local function bk()
    task.spawn(
        function()
            while af.KillAura and IsAlive() do
                local aQ = b9()
                if aQ and aQ.Parent:FindFirstChild("HealthProperties") and aQ.Parent.HealthProperties.Health.Value < 1 then
                    break
                end
                if aQ and (t.Position - aQ.Position).Magnitude < a3 then
                    for bj, ad in pairs(ak[a5]) do
                        if os.clock() - ad.last > ad.cooldown and ax(a2) then
                            A:AttackWithSkill(bj, t.Position, t.CFrame.lookVector)
                            ad.last = os.clock()
                            a2 = os.clock()
                            break
                        end
                    end
                end
                task.wait()
            end
        end
    )
end
local function bl()
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                local aQ = b9()
                if
                    aQ and aQ.Parent:FindFirstChild("HealthProperties") and
                        aQ.Parent.HealthProperties.Health.Value < 1 / 6
                 then
                    break
                end
                if aQ and (t.Position - aQ.Position).Magnitude < a3 and os.clock() - DeBounce >= Z then
                    DeBounce = os.clock()
                    X = X + 1
                    A:AttackWithSkill(a7[X], t.Position, t.CFrame.lookVector)
                    f.RenderStepped:Wait()
                    if X >= #a7 then
                        X = 0
                    end
                end
                f.RenderStepped:Wait()
            end
        end
    )
end
local function bm()
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                local aQ = b9()
                if aQ and aQ.Parent:FindFirstChild "HealthProperties" and aQ.Parent.HealthProperties.Health.Value < 1 then
                    break
                end
                if aQ and (t.Position - aQ.Position).Magnitude < 500 and os.clock() - DeBounce >= 12 then
                    DeBounce = os.clock()
                    k.Shared.Combat.Skillsets.DualWielder.AttackBuff:FireServer()
                    k.Shared.Combat.Skillsets.DualWielder.UpdateSpeed:FireServer(0)
                end
                task.wait(12)
            end
        end
    )
end
local function bn()
    task.spawn(
        function()
            local bo = E.GetHotbarSkillTile("", "Ultimate")
            while af.KillAura and IsAlive() do
                if bo.cooling and not af.KillAura then
                    break
                end
                local aQ = be()
                if aQ and IsAlive() then
                    if aQ and aQ:FindFirstChild "HealthProperties" and aQ.HealthProperties.Health.Value < 1 then
                        break
                    end
                    m:SendKeyEvent(true, "X", false, game)
                    wait(1 / 2)
                    m:SendKeyEvent(false, "X", false, game)
                end
                task.wait(30)
            end
        end
    )
end
local function bp()
    task.spawn(
        function()
            DeBounce = os.clock()
            local bo = E.GetHotbarSkillTile("", "Ultimate")
            while af.KillAura and IsAlive() do
                if bo.cooldownTimer > 20 and not af.KillAura then
                    break
                end
                if os.clock() - DeBounce >= 2 then
                    DeBounce = os.clock()
                    k.Shared.Combat.Skillsets.Demon.Demonic:FireServer()
                    k.Shared.Combat.Skillsets.Demon.Demonic:FireServer()
                    k.Shared.Combat.Skillsets.Demon.Demonic:FireServer()
                    k.Shared.Combat.Skillsets.Demon.Demonic:FireServer()
                    k.Shared.Combat.Skillsets.Demon.Demonic:FireServer()
                    k.Shared.Combat.Skillsets.Demon.Demonic:FireServer()
                    wait()
                    if bo.cooldownTimer > 1 and not af.KillAura then
                        break
                    end
                    k.Shared.Combat.Skillsets.Demon.Ultimate:FireServer()
                end
                task.wait(30)
            end
        end
    )
end
local function bq()
    _, a0, O = 30, 26, 6
    task.spawn(
        function()
            while af.KillAura and IsAlive() do
                local aQ = be()
                local br = B:IsOnCooldown("Ultimate")
                if
                    aQ and (t.Position - aQ.Collider.Position).Magnitude < 80 and
                        e.Characters[r.Name].Properties.BackSwordCount.Value == 6
                 then
                    if aQ and aQ.HealthProperties.Health.Value < 1 / 6 or br then
                        break
                    end
                    DeBounce = os.clock()
                    _, a0, O = 3 / 64, 16, 66
                    task.wait(1)
                    k.Shared.Combat.Skillsets.Archer.Ultimate:FireServer(aQ.Collider.Position)
                    task.wait(1)
                    _, a0, O = 26, 26, 6
                end
                task.wait(30)
            end
        end
    )
end
local function bs()
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                local aQ = be()
                if aQ and aQ:FindFirstChild "HealthProperties" and aQ.HealthProperties.Health.Value < 1 / 6 then
                    break
                end
                if aQ and e.Characters[r.Name].Properties.SummonCount.Value == 5 and os.clock() - DeBounce >= 8 then
                    DeBounce = os.clock()
                    H:Summon(aQ.Collider.Position)
                end
                task.wait(8)
            end
        end
    )
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                local aQ = b9()
                if
                    aQ and aQ.Parent:FindFirstChild "HealthProperties" and
                        aQ.Parent.HealthProperties.Health.Value < 1 / 6
                 then
                    break
                end
                if aQ and (t.Position - aQ.Position).Magnitude < 50 and os.clock() - DeBounce >= 10 then
                    DeBounce = os.clock()
                    k.Shared.Combat.Skillsets.Summoner.SoulHarvest:FireServer(aQ.Position)
                end
                task.wait(10)
            end
        end
    )
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                local aQ = be()
                if aQ and os.clock() - DeBounce >= 30 then
                    if aQ and aQ:FindFirstChild "HealthProperties" and aQ.HealthProperties.Health.Value < 1 / 6 then
                        break
                    end
                    DeBounce = os.clock()
                    H:Ultimate(aQ.Collider.Position)
                end
                task.wait(30)
            end
        end
    )
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                local aQ = bg()
                if aQ and e.Mobs:FindFirstChild("SummonerSummonWeak") then
                    if not IsAlive() then
                        break
                    end
                    local b3 = (e.Mobs.SummonerSummonWeak.Collider.Position - aQ.Position).Magnitude
                    if b3 < 8 and t and os.clock() - DeBounce >= 2 then
                        DeBounce = os.clock()
                        H:ExplodeSummons()
                    end
                end
                task.wait(2)
            end
        end
    )
end
local function bt()
    task.spawn(
        function()
            local DeBounce = os.clock()
            while af.KillAura and IsAlive() do
                if not IsAlive() then
                    break
                end
                if os.clock() - DeBounce >= 1 / 3 then
                    DeBounce = os.clock()
                    k.Shared.Combat.Skillsets.Warlord.Block:FireServer()
                end
                task.wait(1 / 3)
            end
        end
    )
end
local bu = nil
bu =
    e.ChildAdded:Connect(
    function(bv)
        if bv.Name == "RadialIndicator" then
            local bf = be()
            if bf and not v:GetBossTag(bf) and e.RadialIndicator.Inner.Size.y > 20 then
                a1 = 1
            end
        end
    end
)
e.ChildRemoved:Connect(
    function(bv)
        if bv.Name == "RadialIndicator" then
            if bu then
                bu:Disconnect()
            end
            a1 = 360
        end
    end
)
Library = loadstring(game:HttpGet("https://bitbucket.org/cat__/turtle-ui/raw/main/Module%20v2"), "Turtle UI")()
local bw =
    Library:Window(
    {
        Title = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
        TextSize = 18,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local bx =
    Library:Window(
    {
        Title = "Start: " .. os.date("%I:%M %p"),
        TextSize = 18,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local by =
    Library:Window(
    {
        Title = n.country .. " | " .. n.city,
        TextSize = 20,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local bz =
    Library:Window(
    {
        Title = "Gold: " .. ao(game.ReplicatedStorage.Profiles[r.Name].Currency.Gold.Value),
        TextSize = 18,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local bA =
    Library:Window(
    {
        Title = "Running",
        TextSize = 20,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local bB =
    Library:Window(
    {
        Title = "Ping: " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()),
        TextSize = 18,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local bC =
    Library:Window(
    {
        Title = "Misc",
        TextSize = 18,
        Font = Enum.Font.LuckiestGuy,
        TextColor = Color3.fromRGB(222, 248, 107),
        FrameColor = Color3.fromRGB(63, 72, 80),
        BackgroundColor = Color3.fromRGB(35, 35, 35)
    }
)
local bD =
    bw:Toggle(
    {
        Text = "KillAura",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Disable = true,
        Enabled = af.KillAura,
        Callback = function(aC)
            task.spawn(
                function()
                    af.KillAura = aC
                    if af.KillAura then
                        ae("WZ_Toggles", af)
                        if a5 == "Guardian" then
                            bn()
                        elseif a5 == "Demon" then
                            bp()
                        elseif a5 == "Archer" then
                            bq()
                        elseif a5 == "Summoner" then
                            bs()
                        elseif a5 == "Warlord" then
                            bt()
                        end
                        for bE in pairs(al) do
                            if bE == a5 then
                                bi()
                                bm()
                            end
                        end
                        for bE in pairs(ak) do
                            if bE == a5 then
                                bk()
                                bm()
                            end
                        end
                        for bE in pairs(a6) do
                            if bE == a5 then
                                bl()
                            end
                        end
                    end
                end
            )
        end
    }
)
local bF =
    bw:Toggle(
    {
        Text = "PetSkill",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Disable = true,
        Enabled = af.PetSkill,
        Callback = function(aC)
            task.spawn(
                function()
                    af.PetSkill = aC
                    ae("WZ_Toggles", af)
                    while af.PetSkill do
                        am(Enum.KeyCode.One)
                        wait()
                        an(Enum.KeyCode.One)
                        wait(15)
                    end
                end
            )
        end
    }
)
local bG =
    bA:Toggle(
    {
        Text = "HP-Half Fly",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.HPHalf,
        Callback = function(aC)
            af.HPHalf = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    for at, ad in pairs(T) do
                        if game.PlaceId ~= ad and af.HPHalf then
                            r.Character.HealthProperties.Health:GetPropertyChangedSignal("Value"):Connect(
                                function()
                                    pcall(
                                        function()
                                            if
                                                IsAlive() and
                                                    r.Character.HealthProperties.Health.Value /
                                                        r.Character.HealthProperties.MaxHealth.Value *
                                                        100 <
                                                        50
                                             then
                                                _, a0, Y, O = 50, 40, 1, 3
                                                repeat
                                                    wait(1)
                                                until r.Character.HealthProperties.Health.Value /
                                                    r.Character.HealthProperties.MaxHealth.Value *
                                                    100 >
                                                    90
                                                if av() then
                                                    _, a0, O = 36, 30, 6
                                                elseif ar() then
                                                    _, a0, O = .1, 14, 5
                                                end
                                            end
                                            if af.HPHalf == false then
                                                r.Character.HealthProperties.Health:GetPropertyChangedSignal("Value"):Disconnect(

                                                )
                                            end
                                        end
                                    )
                                end
                            )
                        end
                    end
                end
            )
        end
    }
)
local bH =
    bw:Toggle(
    {
        Text = "AutoFarm",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Disable = true,
        Enabled = af.AutoFarm,
        Callback = function(aC)
            af.AutoFarm = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    if av() then
                        _, a0, O = 36, 30, 6
                    elseif ar() then
                        _, a0, O = .1, 14, 5
                    end
                    if af.AutoFarm then
                        aD()
                        aI()
                        aB(false)
                        aG()
                    end
                    if not af.AutoFarm then
                        aB(true)
                        aF()
                    end
                end
            )
            task.spawn(
                function()
                    local bI
                    local bJ = TweenInfo.new(Y, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    while af.AutoFarm do
                        local aQ = b9()
                        if
                            aQ and aQ.Parent:FindFirstChild("HealthProperties") and
                                aQ.Parent.HealthProperties.Health.Value < 1 / 6
                         then
                            break
                        end
                        if aQ then
                            local bK = a1 * (tick() % O) / O
                            bI =
                                i:Create(
                                t,
                                bJ,
                                {
                                    CFrame = CFrame.new(aQ.Position) * CFrame.Angles(0, math.rad(bK), 0) *
                                        CFrame.new(0, _, a0)
                                }
                            )
                            bI:Play()
                        end
                        f.Heartbeat:Wait()
                    end
                    if bI and bI.PlaybackState == Enum.PlaybackState.Playing then
                        bI:Cancel()
                    end
                    if not af.AutoFarm then
                        aF()
                    end
                end
            )
        end
    }
)
local bL =
    bw:Toggle(
    {
        Text = "GetDrops",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.GetDrop,
        Callback = function(aC)
            af.GetDrop = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    local bM = getupvalue(x.Start, 4)
                    while af.GetDrop do
                        if not af.GetDrop then
                            break
                        end
                        for ac, ad in pairs(bM) do
                            ad.model:Destroy()
                            ad.followPart:Destroy()
                            k.Shared.Drops.CoinEvent:FireServer(ad.id)
                            table.remove(bM, ac)
                        end
                        task.wait(1 / 3)
                    end
                end
            )
        end
    }
)
local Levitating =
    bw:Toggle(
    {
        Text = "Levitating",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Disable = true,
        Enabled = Levitating,
        Callback = function(aC)
            Levitating = aC
            local function bN(bO, bP)
                for bQ, bR in pairs(bO) do
                    bP(bR, bQ)
                end
            end
            local function bS(bT)
                local bU = Instance.new(bT)
                return function(bV)
                    bN(
                        bV,
                        function(bR, bW)
                            bU[bW] = bR
                        end
                    )
                    return bU
                end
            end
            do
                local bX = nil
                while Levitating do
                    if not bX then
                        bX =
                            bS "Part" {
                            Parent = workspace.CurrentCamera,
                            Name = "Part",
                            Transparency = 0.95,
                            Size = Vector3.new(3, .1, 3),
                            Anchored = true
                        }
                    end
                    if s then
                        bX.CFrame = t.CFrame - Vector3.new(0, 3, 0)
                    end
                    task.wait()
                end
            end
        end
    }
)
local bY =
    bw:Toggle(
    {
        Text = "InfiniteJump",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.InfJump,
        Callback = function(aC)
            af.InfJump = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    local function bZ(bU, b_)
                        if bU ~= nil then
                            b_(bU)
                        end
                    end
                    j.InputBegan:connect(
                        function(c0)
                            if
                                af.InfJump and c0.UserInputType == Enum.UserInputType.Keyboard and
                                    c0.KeyCode == Enum.KeyCode.Space
                             then
                                bZ(
                                    u,
                                    function(r)
                                        if
                                            r:GetState() == Enum.HumanoidStateType.Jumping or
                                                r:GetState() == Enum.HumanoidStateType.Freefall
                                         then
                                            bZ(
                                                t,
                                                function(bU)
                                                    bU.Velocity = Vector3.new(0, 80, 0)
                                                end
                                            )
                                        end
                                    end
                                )
                            end
                        end
                    )
                end
            )
        end
    }
)
local c1 =
    bx:Toggle(
    {
        Text = "No-Clip",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.NoClip,
        Callback = function(aC)
            af.NoClip = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    aB(true)
                    if af.NoClip then
                        aB(false)
                    end
                end
            )
        end
    }
)
local HeadLamp =
    bx:Toggle(
    {
        Text = "HeadLamp",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = HeadLamp,
        Callback = function(aC)
            HeadLamp = aC
            if HeadLamp then
                local c2
                local c3 = Instance.new("PointLight", s.Head)
                c3.Brightness = .8
                c3.Range = 180
                c2.Changed:connect(
                    function()
                        c2.Brightness = 1
                        c2.ClockTime = 12
                        c2.FogEnd = 1000000
                        c2.GlobalShadows = true
                        c2.Ambient = Color3.new(1, 1, 1)
                        c2.ColorShift_Top = Color3.new(1, 1, 1)
                        c2.ColorShift_Bottom = Color3.new(1, 1, 1)
                    end
                )
            else
                s.Head.PointLight:Destroy()
            end
        end
    }
)
local c4 =
    bx:Toggle(
    {
        Text = "ReduceLag",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.ReduceLag,
        Callback = function(aC)
            af.ReduceLag = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    for at, ad in pairs(e:GetDescendants()) do
                        if ad:IsA "BasePart" and not ad.Parent:FindFirstChild "Humanoid" then
                            ad.Material = Enum.Material.SmoothPlastic
                            if ad:IsA "Texture" then
                                task.defer(ad.Destroy, ad)
                            end
                        end
                    end
                    e.DescendantAdded:Connect(
                        function(c5)
                            if c5:IsA "BasePart" and not c5.Parent:FindFirstChild "Humanoid" then
                                c5.Material = Enum.Material.SmoothPlastic
                                if c5:IsA "Texture" then
                                    task.defer(c5.Destroy, c5)
                                end
                            end
                        end
                    )
                    e.ChildAdded:Connect(
                        function(c6)
                            if c6.Name == "DamageNumber" then
                                task.defer(c6.Destroy, c6)
                            end
                        end
                    )
                end
            )
        end
    }
)
local c7 =
    bx:Toggle(
    {
        Text = "DeleteEggs",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.DelEgg,
        Callback = function(aC)
            af.DelEgg = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    local c8 = k.Profiles[r.Name].Inventory.Items
                    c8.DescendantAdded:Connect(
                        function()
                            for at, ad in pairs(c8:GetChildren()) do
                                if string.find(ad.Name, "Egg") then
                                    task.defer(ad.Destroy, ad)
                                end
                            end
                        end
                    )
                    c8.DescendantAdded:Connect(
                        function(c9)
                            if table.find(V, c9.Name) then
                                task.delay(
                                    2,
                                    function()
                                        c9:Destroy()
                                    end
                                )
                            end
                        end
                    )
                    r.CharacterAdded:Connect(
                        function()
                            for at, ad in pairs(c8:GetChildren()) do
                                if string.find(ad.Name, "Egg") then
                                    ad:Destroy()
                                end
                            end
                        end
                    )
                end
            )
        end
    }
)
local ca =
    bx:Toggle(
    {
        Text = "NoCutScene",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.NoCutScene,
        Callback = function(aC)
            af.NoCutScene = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    local cb = r.PlayerGui.CutsceneUI
                    cb:GetPropertyChangedSignal("Enabled"):Connect(
                        function()
                            if cb.Enabled then
                                z:SkipCutscene()
                            end
                        end
                    )
                end
            )
        end
    }
)
local cc =
    bx:Toggle(
    {
        Text = "AutoOffhandPerk",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.AutoSwitch,
        Callback = function(aC)
            af.AutoSwitch = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    local bu
                    bu =
                        e.Mobs.ChildAdded:connect(
                        function(bf)
                            if af.AutoSwitch and bf:isA("Model") then
                                aP(bf)
                            end
                        end
                    )
                    if not af.AutoSwitch then
                        bu:Disconnect()
                    end
                end
            )
        end
    }
)
by:Button(
    {
        Text = "Bank",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            if e:FindFirstChild("MenuRings") and e.MenuRings:FindFirstChild("Bank") then
                e.MenuRings.Bank.Ring.CFrame = s:WaitForChild("LeftFoot").CFrame * CFrame.new(0, 0, -12)
                e.MenuRings.Bank.Floor.CFrame = s:WaitForChild("LeftFoot").CFrame * CFrame.new(0, 0, -12)
            end
        end
    }
)
by:Button(
    {
        Text = "Upgrade",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            require(k.Client.Gui.GuiScripts.ItemUpgrade):Toggle()
        end
    }
)
by:Button(
    {
        Text = "Zero Altar",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            require(k.Client.Gui.GuiScripts.Fusion):Open()
        end
    }
)
by:Button(
    {
        Text = "Way Stones",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            require(k.Client.Gui.GuiScripts.Waystones):Open()
        end
    }
)
by:Button(
    {
        Text = "World Menu",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            require(k.Client.Gui.GuiScripts.WorldTeleport):Toggle()
        end
    }
)
by:Button(
    {
        Text = "Dungeon Menu",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            require(k.Client.Gui.GuiScripts.MissionSelect):Toggle()
        end
    }
)
local cd =
    bz:Toggle(
    {
        Text = "SellTier[1-4]",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.SellNonLegend,
        Callback = function(aC)
            af.SellNonLegend = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                end
            )
        end
    }
)
local ce =
    bz:Toggle(
    {
        Text = "SellLegendary",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.SellLegend,
        Callback = function(aC)
            af.SellLegend = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                end
            )
        end
    }
)
local cf =
    bz:Toggle(
    {
        Text = "MoLPassive",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.MoLPass,
        Callback = function(aC)
            af.MoLPass = aC
            local cg = require(k.Shared.Party):GetPartyByUsername(r.Name)
            task.spawn(
                function()
                    while af.MoLPass do
                        local character = e.Characters[r.Name]
                        if
                            character and
                                character.HealthProperties.Health.Value / character.HealthProperties.MaxHealth.Value *
                                    100 <
                                    99
                         then
                            for at, ch in pairs(d:GetPlayers()) do
                                if cg and cg.Members:FindFirstChild(ch.Name) then
                                    k.Shared.Combat.Skillsets.MageOfLight.HealCircle:FireServer(ch)
                                end
                            end
                        end
                        task.wait(14)
                    end
                end
            )
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    while af.MoLPass do
                        local character = e.Characters[r.Name]
                        if character and character.HealthProperties.BarrierHealth.Value <= 0 then
                            for at, ch in pairs(d:GetPlayers()) do
                                if cg and cg.Members:FindFirstChild(ch.Name) then
                                    k.Shared.Combat.Skillsets.MageOfLight.Barrier:FireServer(ch)
                                end
                            end
                        end
                        task.wait(15)
                    end
                end
            )
        end
    }
)
local ci =
    bz:Toggle(
    {
        Text = "AI.Cooldown",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.AiPing,
        Callback = function(aC)
            af.AiPing = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                end
            )
        end
    }
)
e.ChildAdded:Connect(
    function(cj)
        if cj.Name == "BarrierPart" then
            task.defer(cj.Destroy, cj)
        end
    end
)
local ck =
    bz:Toggle(
    {
        Text = "RepeatRaid",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.RepeatRaid,
        Callback = function(aC)
            af.RepeatRaid = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    for at, ad in pairs(T) do
                        if game.PlaceId ~= ad and af.RepeatRaid then
                            local cl = r.PlayerGui.MissionRewards.MissionRewards
                            if cl.Playerlist.Visible then
                                C:SetLeaveChoice(r, true)
                                C:NotifyReadyToLeave(r)
                            end
                            cl.RaidClear:GetPropertyChangedSignal("Text"):Connect(
                                function()
                                    if cl.RaidClear.Text == "T O W E R    F A I L U R E" then
                                        C:SetLeaveChoice(r, true)
                                        C:NotifyReadyToLeave(r)
                                    end
                                end
                            )
                            cl.RaidClear:GetPropertyChangedSignal("Text"):Connect(
                                function()
                                    if cl.RaidClear.Text == "D U N G E O N    F A I L U R E" then
                                        C:SetLeaveChoice(r, true)
                                        C:NotifyReadyToLeave(r)
                                    end
                                end
                            )
                            r.PlayerGui.TowerFinish.TowerFinish.Description.Overlay:GetPropertyChangedSignal("Text"):Connect(
                                function()
                                    if
                                        r.PlayerGui.TowerFinish.TowerFinish.Description.Overlay.Text ==
                                            "Collect your rewards! (10)"
                                     then
                                        C:SetLeaveChoice(r, true)
                                        C:NotifyReadyToLeave(r)
                                    end
                                end
                            )
                            cl.Playerlist.Header:GetPropertyChangedSignal("Visible"):Connect(
                                function()
                                    wait(1)
                                    aN(cl.Playerlist.WithParty.TextLabel)
                                end
                            )
                        end
                    end
                end
            )
        end
    }
)
local cm =
    bz:Toggle(
    {
        Text = "ReloadOnHop",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = af.ReLoadOnHop,
        Callback = function(aC)
            af.ReLoadOnHop = aC
            task.spawn(
                function()
                    ae("WZ_Toggles", af)
                    d.PlayerRemoving:connect(
                        function(cn)
                            if cn == r and af.ReLoadOnHop then
                                ah(ai)
                            end
                        end
                    )
                end
            )
        end
    }
)
bA:Button(
    {
        Text = "Unstuck-SOS",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function()
            aF()
        end
    }
)
bA:Button(
    {
        Text = "Klaus↓Down",
        TextSize = 22,
        Font = Enum.Font.FredokaOne,
        TextColor = Color3.fromRGB(255, 187, 109),
        Callback = function(co)
            if co then
                while e.MissionObjects:FindFirstChild("MissionStart") do
                    local cp = e.MissionObjects.MissionStart:GetChildren()
                    cp[3].CFrame = t.CFrame
                    wait()
                end
                t.CFrame = CFrame.new(48.69358444213867, 490.49188232421875, 983.4312133789062)
                aD()
            end
        end
    }
)
bA:Slider(
    "WalkSpeed",
    16,
    120,
    u.WalkSpeed,
    function(bR)
        u.WalkSpeed = bR
    end
)
bB:DestroyUI()
bB:Button(
    {
        Text = "FreezeMob",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = FreezeMob,
        Callback = function(co)
            if co then
                e.Mobs.ChildAdded:connect(
                    function(cq)
                        if not string.find(cq.Name, "BOSS") then
                            local cr = Instance.new("Part")
                            cr.Name = "Dummy"
                            cr.Anchored = true
                            cr.CanCollide = false
                            cr.Size = Vector3.new(1, 1, 1)
                            cr.Transparency = 1
                            cr.Parent = game:GetService("Workspace")
                            cr.Position = cq.Collider.Position
                            local cs = Instance.new("Weld")
                            cs.Parent = cq.Collider
                            cs.Part0 = cq.Collider
                            cs.Part1 = cr
                            local ct = Instance.new("BodyForce")
                            ct.Parent = cr
                            pcall(
                                function()
                                    ct:ApplyForce(Vector3.new(0, -100, 0))
                                end
                            )
                        end
                    end
                )
            end
        end
    }
)
bB:HideUI()
local RealTime =
    bB:Toggle(
    {
        Text = "RealTimePing",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = RealTime,
        Callback = function(aC)
            RealTime = aC
            task.spawn(
                function()
                    while RealTime do
                        bB.Text =
                            "Ping: " ..
                            math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
                        wait(2)
                    end
                end
            )
        end
    }
)
local OWFarm =
    bB:Toggle(
    {
        Text = "PubMapFarm",
        TextSize = 22,
        TextColor = Color3.fromRGB(255, 187, 109),
        Font = Enum.Font.FredokaOne,
        Enabled = OWFarm,
        Callback = function(aC)
            OWFarm = aC
            task.spawn(
                function()
                    aX = 60
                    while OWFarm do
                        local bf = b9()
                        aZ(bf)
                        task.wait(3 / 2)
                    end
                end
            )
        end
    }
)
bB:Box(
    {
        Text = "Webhook URL",
        Callback = function(bR)
            ag.Webhook = bR
            ClearText = true
            task.spawn(
                function()
                    ae("WZwebhook", ag)
                end
            )
        end
    }
)
bC:MinimizeWindows()
k.Shared.Missions.MissionFinished.OnClientEvent:Connect(
    function()
        bx.Text = "EndTime: " .. os.date("%I:%M %p")
    end
)
for at, ad in pairs(R) do
    if game.PlaceId == ad then
        local cl = r.PlayerGui.MissionRewards.MissionRewards
        cl.Countdown:GetPropertyChangedSignal("Text"):Connect(
            function()
                if cl.Countdown.Text == "Pick up your gold! (1)" then
                    repeat
                        wait()
                    until cl.Chests.Visible and cl.Chests.Box1.Visible and cl.Chests.Box2.Visible
                    repeat
                        wait()
                    until cl.Chests.Box1.ChestImage.Select.Visible
                    repeat
                        aN(cl.Chests.Box1.ChestImage.Select)
                        wait()
                    until cl.OpenChest.Countdown.text == "0"
                end
            end
        )
        cl.OpenChest.Countdown:GetPropertyChangedSignal("Text"):Connect(
            function()
                if cl.OpenChest.Countdown.Text == "0" then
                    repeat
                        wait()
                    until cl.OpenChest:FindFirstChild("Next") and cl.OpenChest:FindFirstChild("Next").Visible
                    aN(cl.OpenChest.Next.TextLabel)
                end
            end
        )
        cl.Chests.Box1.ChestImage.ChildAdded:Connect(
            function(cu)
                if cu.Name == "ViewportFrame" and not aM then
                    wait(5)
                    aN(cl.OpenChest.Next.TextLabel)
                else
                    aN(cl.Chests.Box2.ChestImage.VIP.TextLabel)
                    wait(1.5)
                    repeat
                        aN(cl.Chests.Box2.ChestImage.Select)
                        wait()
                    until cl.OpenChest.Countdown.text == "0"
                end
            end
        )
        cl.Chests.Box2.ChestImage.ChildAdded:Connect(
            function(cu)
                if cu.Name == "ViewportFrame" and aM then
                    wait(3)
                    aN(cl.OpenChest.Next.TextLabel)
                end
            end
        )
    end
end
if game.PlaceId == R[2.1] then
    e.MissionObjects.ChildRemoved:Connect(
        function(cv)
            if cv.Name == "MissionStart" then
                wait(1)
                e.MissionObjects.Room1Trigger.CFrame = t.CFrame
            end
        end
    )
    e.MissionObjects.Room1Trigger.ChildRemoved:Connect(
        function()
            wait(2)
            e.MissionObjects.Room2Trigger.CFrame = t.CFrame
        end
    )
    e.MissionObjects.Room2Trigger.ChildRemoved:Connect(
        function()
            wait(2)
            e.MissionObjects.Room3Trigger.CFrame = t.CFrame
        end
    )
    e.MissionObjects.Room3Trigger.ChildRemoved:Connect(
        function()
            wait(2)
            e.MissionObjects.Room4Trigger.CFrame = t.CFrame
        end
    )
    e.MissionObjects.Room4Trigger.ChildRemoved:Connect(
        function()
            wait(6)
            t.CFrame = e.MissionObjects.WallsTrigger.CFrame
            wait(3)
            t.CFrame = e.MissionObjects.WallsFinalTrigger.CFrame
        end
    )
    r.PlayerGui.MissionObjective.MissionObjective.Label:GetPropertyChangedSignal("Text"):Connect(
        function()
            if r.PlayerGui.MissionObjective.MissionObjective.Label.Text == "Take the royal crystal! (0 / 1)" then
                t.CFrame = CFrame.new(1192.15894, -226.738449, 110.141144)
            end
        end
    )
end
if game.PlaceId == R[1.4] then
    e.ChildAdded:Connect(
        function(cw)
            if cw.Name == "Cage1Marker" then
                wait(2)
                e.Cage1Marker.Collider.CFrame = t.CFrame
            end
        end
    )
    e.ChildAdded:Connect(
        function(cw)
            if cw.Name == "Cage2Marker" then
                wait(2.2)
                e.Cage2Marker.Collider.CFrame = t.CFrame
            end
        end
    )
end
if game.PlaceId == R[3.1] then
    e.MissionObjects.ChildRemoved:Connect(
        function(cx)
            if cx.Name == "ProgressionBlocker1" then
                e.MissionObjects.CaveTrigger.CFrame = t.CFrame
            end
        end
    )
end
if game.PlaceId == R[3] then
    e.ChildAdded:Connect(
        function(cy)
            if cy.Name == "IceWall" then
                wait(5)
                bH.State = false
                t.CFrame = e.IceWall:FindFirstChild("Ring").CFrame
            end
        end
    )
    e.ChildRemoved:Connect(
        function(cy)
            if cy.Name == "IceWall" then
                aD()
                bH.State = true
            end
        end
    )
end
local function cz()
    pcall(
        function()
            for at, ad in pairs(e.MissionObjects.TowerLegs:GetDescendants()) do
                if ad.Name == "hitbox" and not ad.CanCollide then
                    ad.Parent:Destroy()
                end
            end
        end
    )
end
if game.PlaceId == R[4.1] then
    e.MissionObjects.TowerLegs.DescendantRemoving:Connect(cz)
end
if game.PlaceId == R[6.1] then
    e.MissionObjects.ChildRemoved:Connect(
        function(cv)
            if cv.Name == "MissionStart" then
                wait(1)
                e.MissionObjects.Area1Trigger.CFrame = t.CFrame
            end
        end
    )
    e.MissionObjects.Area2Trigger.ChildAdded:Connect(
        function(cA)
            if cA:IsA("TouchTransmitter") then
                wait(1)
                e.MissionObjects.Area2Trigger.CFrame = t.CFrame
            end
        end
    )
end
if game.PlaceId == R[7.1] then
    e.MissionObjects.ChildRemoved:Connect(
        function(cv)
            if cv.Name == "MissionStart" then
                wait(1)
                e.MissionObjects.FakeBoss.CFrame = t.CFrame
            end
        end
    )
end
if game.PlaceId == S[1] then
    r.PlayerGui.MissionObjective.MissionObjective.Label:GetPropertyChangedSignal("Text"):Connect(
        function()
            if r.PlayerGui.MissionObjective.MissionObjective.Label.Text == "Get behind the active shield! (2)" then
                bH.State = false
                t.CFrame = e.MissionObjects.IgnisShield.Ring.CFrame
                wait(3)
                aD()
                bH.State = true
            end
        end
    )
end
for at, ad in pairs(S) do
    if game.PlaceId == ad then
        task.spawn(
            function()
                while IsAlive() do
                    local cB = e.MissionObjects:WaitForChild("WaveStarter", math.huge)
                    if #cB:GetChildren() > 0 then
                        cB.CFrame = t.CFrame
                    end
                    wait()
                end
            end
        )
        e.MissionObjects.ChildAdded:Connect(
            function(cC)
                if cC.Name == "MinibossExitModel" then
                    wait(2)
                    e.MissionObjects.MinibossExitModel:MoveTo(t.Position)
                end
            end
        )
        e.MissionObjects.ChildAdded:Connect(
            function(cD)
                if cD.Name == "MinibossExit" then
                    wait(3)
                    bH.State = false
                    e.MissionObjects.MinibossExit.CFrame = t.CFrame
                    wait()
                    aD()
                    bH.State = true
                end
            end
        )
    end
end
for at, ad in ipairs(k.Shared.Effects.EffectScripts:GetChildren()) do
    if
        hookfunction and ad:IsA("ModuleScript") and
            (string.find(ad.Name, "Maka") or string.find(ad.Name, "Hades") or string.find(ad.Name, "Ignis") or
                string.find(ad.Name, "Klaus") or
                string.find(ad.Name, "Prism") or
                string.find(ad.Name, "Plant") or
                string.find(ad.Name, "Fallen") or
                string.find(ad.Name, "Taurha") or
                string.find(ad.Name, "Kraken") or
                string.find(ad.Name, "Anubis") or
                string.find(ad.Name, "TreeEnt") or
                string.find(ad.Name, "HogRider") or
                string.find(ad.Name, "Cerberus") or
                string.find(ad.Name, "Deathball") or
                string.find(ad.Name, "Slingshot") or
                string.find(ad.Name, "IceDragon") or
                string.find(ad.Name, "Indicator"))
     then
        local cE = require(ad)
        hookfunction(
            cE,
            function()
                return nil
            end
        )
    end
end
for ac, ad in pairs(R) do
    if type(ac) ~= "string" and game.PlaceId == ad then
        if e:FindFirstChild("MissionObjects") then
            local cF = e.MissionObjects
            cF.DescendantAdded:Connect(
                function(cA)
                    if
                        cA:IsA "TouchTransmitter" and not string.match(cA.Parent.Parent.Name, "Damage") and
                            not string.match(cA.Parent.Name, "Killpart") and
                            not string.match(cA.Parent.Name, "0") and
                            not string.match(cA.Parent.Parent.Name, "Darts") and
                            not string.match(cA.Parent.Parent.Name, "Spikes") and
                            cA.Parent ~= "MinibossExit" and
                            cA.Parent.Parent ~= "MinibossExitModel"
                     then
                        wait(2)
                        pcall(
                            function()
                                cA.Parent.CFrame = t.CFrame
                            end
                        )
                    end
                end
            )
            cF.DescendantAdded:Connect(
                function(cG)
                    if cG:IsA "TouchTransmitter" and string.match(cG.Parent.Name, "Trigger") then
                        wait(3 / 2)
                        pcall(
                            function()
                                cG.Parent.CFrame = t.CFrame
                            end
                        )
                    end
                end
            )
        end
    end
end
for at, cH in pairs(S) do
    if game.PlaceId == cH then
        e.ChildAdded:Connect(
            function(cI)
                if cI.Name == "RaidChestGold" then
                    e.RaidChestGold.ChestBase.CFrame = t.CFrame
                    wait(3.8)
                    cI:Destroy()
                end
            end
        )
        e.ChildAdded:Connect(
            function(cJ)
                if cJ.Name == "RaidChestSilver" then
                    e.RaidChestSilver.ChestBase.CFrame = t.CFrame
                    wait(3.8)
                    cJ:Destroy()
                end
            end
        )
        e.ChildAdded:Connect(
            function(cK)
                if cK.Name == "AtlanticChest" then
                    for at, ad in pairs(e:GetChildren()) do
                        if ad.ClassName == "Model" and ad.Name == "AtlanticChest" then
                            ad.ChestBase.CFrame = t.CFrame
                        end
                    end
                end
            end
        )
        e.ChildAdded:Connect(
            function(cL)
                if cL.Name == "VolcanicChestTower" then
                    for at, ad in pairs(e:GetChildren()) do
                        if ad.ClassName == "Model" and ad.Name == "VolcanicChestTower" then
                            ad.ChestBase.CFrame = t.CFrame
                        end
                    end
                end
            end
        )
        e.ChildRemoved:Connect(
            function(cI)
                if cI.Name == "RaidChestGold" and e:FindFirstChild "RaidChestGold" then
                    e.RaidChestGold.ChestBase.CFrame = t.CFrame
                end
            end
        )
        e.ChildRemoved:Connect(
            function(cJ)
                if cJ.Name == "RaidChestSilver" and e:FindFirstChild "RaidChestSilver" then
                    e.RaidChestSilver.ChestBase.CFrame = t.CFrame
                end
            end
        )
        e.ChildRemoved:Connect(
            function(cK)
                if cK.Name == "AtlanticChest" then
                    for at, ad in pairs(e:GetChildren()) do
                        if ad.ClassName == "Model" and ad.Name == "AtlanticChest" and e:FindFirstChild "AtlanticChest" then
                            ad.ChestBase.CFrame = t.CFrame
                        end
                    end
                end
            end
        )
        e.ChildRemoved:Connect(
            function(cL)
                if cL.Name == "VolcanicChestTower" then
                    for at, ad in pairs(e:GetChildren()) do
                        if
                            ad.ClassName == "Model" and ad.Name == "VolcanicChestTower" and
                                e:FindFirstChild "VolcanicChestTower"
                         then
                            ad.ChestBase.CFrame = t.CFrame
                        end
                    end
                end
            end
        )
    end
end
for at, ad in pairs(S) do
    if game.PlaceId == ad then
        c.PurchasePrompt.ProductPurchaseContainer.Animator.ChildAdded:Connect(
            function()
                pcall(
                    function()
                        c.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.Visible = false
                    end
                )
            end
        )
        c.PurchasePrompt.ChildAdded:Connect(
            function(cM)
                if cM.Name == "RobuxUpsellContainer" then
                    wait(1 / 3)
                    cM:Destroy()
                end
            end
        )
    end
end
for at, ad in pairs(T) do
    if game.PlaceId == ad then
        bD.State = false
        bH.State = false
    end
end
local function cN(cO)
    character = cO
    u = cO:WaitForChild("Humanoid")
    t = cO:WaitForChild("HumanoidRootPart")
    aD()
end
r.CharacterAdded:Connect(cN)
if getconnections then
    for at, ad in next, getconnections(r.Idled) do
        ad:Disable()
    end
end
if not getconnections then
    r.Idled:connect(
        function()
            a.VirtualUser:ClickButton2(Vector2.new())
        end
    )
end
r.CameraMaxZoomDistance = 60
local cP = r.CameraMinZoomDistance
r.CameraMinZoomDistance = 60
r.CameraMinZoomDistance = cP
game.NetworkClient.ChildRemoved:Connect(
    function(cQ)
        af.KillAura = false
        a.GuiService:ClearError()
        bA.Text = "Disconnected"
    end
)
spawn(
    function()
        local cR = c:WaitForChild("RobloxPromptGui")
        local cS = cR:WaitForChild("promptOverlay")
        local cT = cS:WaitForChild("ErrorPrompt")
        local cU = cT:WaitForChild("MessageArea")
        local cV = cU:WaitForChild("ErrorFrame")
        local cW = cV:WaitForChild("ErrorMessage")
        repeat
            wait()
        until string.find(cW.Text, "exploit") or string.find(cW.Text, "reconnect")
        print(
            "Got Kicked, Last DungeonID is " ..
                tostring(aj.DungeonID) .. " and last Difficulty is " .. tostring(aj.DifficultyID)
        )
        if aj.DifficultyID <= 1 then
            k.Shared.Teleport.StartRaid:FireServer(aj.DungeonID)
        else
            k.Shared.Teleport.StartRaid:FireServer(aj.DungeonID, aj.DifficultyID)
        end
    end
)
local cX = {
    DungeonID = U[game.PlaceId],
    DifficultyID = C.GetDifficulty(),
    Phase = 0,
    ProfileGUID = k.Profiles[r.Name].GUID.Value
}
if getgenv().RJOnCrash and not U[game.PlaceId] or cX.Phase == 1 then
    a8("WZ_CrashRJ", cX)
    wait(1)
    if cX.Phase == 0 then
        cX.Phase = 1
        ae("WZ_CrashRJ", cX)
        ah(ai)
        while wait(10) do
            k.Shared.Teleport.JoinGame:FireServer(cX.ProfileGUID)
        end
    end
    if cX.Phase == 1 then
        cX.Phase = 0
        ae("WZ_CrashRJ", cX)
        ah(ai)
        if aj.DifficultyID <= 1 then
            k.Shared.Teleport.StartRaid:FireServer(cX.DungeonID)
        else
            k.Shared.Teleport.StartRaid:FireServer(cX.DungeonID, cX.DifficultyID)
        end
    end
end
ae("WZ_CrashRJ", cX)
local cY = function(cZ, c_)
    local d0 = {enabled = true, fake = cZ[c_], fake_type = typeof(fake)}
    local d1
    local d2
    function d0:SetFake(d3, d4)
        if d4 then
            d0.fake = d3
        elseif typeof(d3) == d0.fake_type then
            d0.fake = d3
        else
            d0.fake = nil
        end
    end
    function d0:Destroy()
        cZ[c_] = d0.fake
        d0.enabled = false
    end
    if hookmetamethod then
        d1 =
            hookmetamethod(
            cZ,
            "__index",
            function(self, d5)
                if self == cZ and d5 == c_ and not checkcaller() and d0.enabled then
                    return d0.fake
                end
                return d1(self, d5)
            end
        )
        d2 =
            hookmetamethod(
            cZ,
            "__newindex",
            function(self, d5, d6)
                if self == cZ and d5 == c_ and not checkcaller() and d0.enabled then
                    if typeof(d6) == d0.fake_type then
                        d0.fake = d6
                        return
                    else
                        d0.fake = nil
                        return
                    end
                end
                return d2(self, d5, d6)
            end
        )
    else
        return
    end
    return d0
end
cY(u, "WalkSpeed")
cY(u, "JumpPower")
cY(r, "CameraMaxZoomDistance")
if a5 ~= "MageOfLight" then
    cf.State = false
end
local d7 = {}
local d8 = ""
local d9 = true
if ag.PerkNames ~= nil and type(ag.PerkNames) == "table" then
    for ac, ad in pairs(ag.PerkNames) do
        d9 = false
    end
end
if d9 then
    ag.PerkNames = {}
    for ac, ad in pairs(D) do
        if type(ad) == "table" then
            for da, db in pairs(ad) do
                if type(db) == "table" then
                    for dc, dd in pairs(db) do
                        if dc == 2 then
                            table.insert(ag.PerkNames, ac)
                            d7[ac] = dd
                        end
                    end
                end
            end
        end
    end
else
    a8("WZwebhook", ag)
end
local de = {}
local df = {
    ["ResistFrost"] = "Resist Frost",
    ["ResistBurn"] = "Resist Burn",
    ["Glass"] = "Glass",
    ["RoughSkin"] = "Rough Skin",
    ["ResistKnockdown"] = "Resist Knockdown",
    ["BonusWalkspeed"] = "Bonus Walkspeed",
    ["PetFoodDrop"] = "Bonus Pet Food Chance",
    ["BonusAttack"] = "Attack UP",
    ["BonusHP"] = "HP UP",
    ["ResistPoison"] = "Resist Poison",
    ["LifeDrain"] = "Life Drain",
    ["CritStack"] = "Crit Stack",
    ["BurnChance"] = "Burn Chance",
    ["OpeningStrike"] = "Opening Strike",
    ["MobBoss"] = "Mob Boss",
    ["TestTier5"] = "Boss of the Boss",
    ["GoldDrop"] = "Bonus Gold",
    ["BonusRegen"] = "Bonus Health Regen",
    ["DamageReduction"] = "Damage Reduction",
    ["Aggro"] = "Shifted Aggro",
    ["UltCharge"] = "Ult Charge",
    ["Fortress"] = "Fortress",
    ["MasterThief"] = "Master Thief",
    ["EliteBoss"] = "Elite Boss",
    ["DodgeChance"] = "Untouchable"
}
local dg = k.Profiles[r.Name].Currency.Gold.Value
for ac, ad in pairs(k.Profiles[r.Name].Inventory.Items:GetChildren()) do
    if ad:FindFirstChild("UpgradeLimit") and ad:FindFirstChild("Level") then
        local dh = Instance.new("StringValue")
        dh.Parent = ad
        dh.Name = "Item Already Exists"
        dh.Value = "Item Already Exists"
    end
end
local bu
bu =
    k.Profiles[r.Name].Inventory.Items.DescendantAdded:Connect(
    function()
        for ac, ad in pairs(k.Profiles[r.Name].Inventory.Items:GetChildren()) do
            if
                ad:FindFirstChild("UpgradeLimit") and ad:FindFirstChild("Level") and
                    not ad:FindFirstChild("Item Already Exists")
             then
                wait(.25)
                local di = false
                local dj = ""
                if af.SellNonLegend then
                    if not ad:FindFirstChild("Perk3") then
                        ad.Name = "This Item is gone"
                        dj = ad.Name
                        k.Shared.Drops.SellItems:InvokeServer({k.Profiles[r.Name].Inventory.Items:FindFirstChild(dj)})
                        di = true
                    end
                end
                if af.SellLegend and w[ad.Name].Rarity ~= 7 and not string.find(w[ad.Name].DisplayKey, "Zero") then
                    local dk = false
                    local dl = false
                    local dm = false
                    for at, dn in pairs(ag.PerkNames) do
                        if ad:FindFirstChild("Perk3") and ad:FindFirstChild("Perk3").Value == dn then
                            if af.MaxPerk and ad:FindFirstChild("Perk3"):FindFirstChild("PerkValue").Value == d7[dn] then
                                dm = true
                            else
                                dm = true
                            end
                        elseif ad:FindFirstChild("Perk2") and ad:FindFirstChild("Perk2").Value == dn then
                            if af.MaxPerk and ad:FindFirstChild("Perk2"):FindFirstChild("PerkValue").Value == d7[dn] then
                                dl = true
                            else
                                dl = true
                            end
                        elseif ad:FindFirstChild("Perk1") and ad:FindFirstChild("Perk1").Value == dn then
                            if af.MaxPerk and ad:FindFirstChild("Perk1"):FindFirstChild("PerkValue").Value == d7[dn] then
                                dk = true
                            else
                                dk = true
                            end
                        end
                        if not dk and not dl and not dm then
                            ad.Name = "This Item is gone"
                            dj = ad.Name
                            k.Shared.Drops.SellItems:InvokeServer(
                                {k.Profiles[r.Name].Inventory.Items:FindFirstChild(dj)}
                            )
                            di = true
                        end
                    end
                end
                if not di then
                    local dh = Instance.new("StringValue")
                    dh.Name = "Item Already Exists"
                    dh.Value = "Item Already Exists"
                    dh.Parent = ad
                    local dp = ad:FindFirstChild("Level").Value
                    local dq, dr, ds, dt
                    if ad:FindFirstChild("Perk3") then
                        dq = "Legendary"
                        dr =
                            df[tostring(ad.Perk1.Value)] ..
                            " " ..
                                tostring(math.floor(ad:FindFirstChild("Perk1"):FindFirstChild("PerkValue").Value * 100)) ..
                                    "%"
                        ds =
                            df[tostring(ad.Perk2.Value)] ..
                            " " ..
                                tostring(math.floor(ad:FindFirstChild("Perk2"):FindFirstChild("PerkValue").Value * 100)) ..
                                    "%"
                        dt =
                            df[tostring(ad.Perk3.Value)] ..
                            " " ..
                                tostring(math.floor(ad:FindFirstChild("Perk3"):FindFirstChild("PerkValue").Value * 100)) ..
                                    "%"
                    elseif ad:FindFirstChild("Perk2") then
                        dq = "Epic"
                        dr =
                            df[tostring(ad.Perk1.Value)] ..
                            " " ..
                                tostring(math.floor(ad:FindFirstChild("Perk1"):FindFirstChild("PerkValue").Value * 100)) ..
                                    "%"
                        ds =
                            df[tostring(ad.Perk2.Value)] ..
                            " " ..
                                tostring(math.floor(ad:FindFirstChild("Perk2"):FindFirstChild("PerkValue").Value * 100)) ..
                                    "%"
                    elseif ad:FindFirstChild("Perk1") then
                        dq = "Uncommon"
                        dr =
                            df[tostring(ad.Perk1.Value)] ..
                            " " ..
                                tostring(math.floor(ad:FindFirstChild("Perk1"):FindFirstChild("PerkValue").Value * 100)) ..
                                    "%"
                    else
                        dq = "Common"
                    end
                    de[ad.Name] = {["Level"] = dp, ["Rarity"] = dq, ["Perk 1"] = dr, ["Perk 2"] = ds, ["Perk 3"] = dt}
                end
            end
        end
    end
)
r.CharacterRemoving:Connect(
    function()
        bu:Disconnect()
    end
)
local du = r:WaitForChild("PlayerGui")
local cl = du:WaitForChild("MissionRewards"):WaitForChild("MissionRewards")
local dv = du:WaitForChild("TowerFinish"):WaitForChild("TowerFinish")
local dw = cl:WaitForChild("Time")
local dx = dv:WaitForChild("Description"):WaitForChild("Overlay")
repeat
    wait()
until dw.Visible or dx.text == "Collect your rewards! (20)"
wait(1)
local dy = k.Profiles[r.Name].Currency.Gold.Value - dg
local dz = ""
local dA = ""
if not dw.Visible then
    dz = "Tower Finished"
    dA = dv:WaitForChild("Time").Text
else
    dz = cl:WaitForChild("RaidClear").Text
    dA = cl:WaitForChild("Time").Text
end
local dB = ""
local dC = ""
for ac, ad in pairs(F) do
    if ad.LiveID == game.PlaceId then
        dB = ad.Name
        dC = ad.NameTag
    end
end
local dD = {
    {
        ["title"] = "World // Zero",
        ["description"] = dz,
        ["color"] = tonumber(0x2B6BE4),
        ["footer"] = {["text"] = tostring(os.date())},
        ["fields"] = {
            {["name"] = dB, ["value"] = dC, ["inline"] = false},
            {["name"] = "Finished in", ["value"] = dA, ["inline"] = false},
            {["name"] = "Gold Earned", ["value"] = tostring(dy), ["inline"] = false},
            {
                ["name"] = "Level: " ..
                    tostring(string.match(r.PlayerGui.Hotbar.Hotbar.Vitals.Level.TextLabel.Text, "%d+")),
                ["value"] = r.PlayerGui.Hotbar.Hotbar.Vitals.XP.TextLabel.Text,
                ["inline"] = false
            }
        }
    }
}
local dE = function(M, dz, ...)
    local aa = {["title"] = M, ["description"] = dz, ["color"] = tonumber(0x2B6BE4), ["fields"] = ...}
    return aa
end
local dF = function(a9, dz, dG)
    local aa = {["name"] = a9, ["value"] = dz, ["inline"] = dG}
    return aa
end
for ac, ad in pairs(de) do
    if type(ad) == "table" then
        local aa = {}
        table.insert(aa, dF("Level", ad.Level, true))
        table.insert(aa, dF("Rarity", ad.Rarity, true))
        if ad["Perk 1"] then
            table.insert(aa, dF("Perk 1", ad["Perk 1"], false))
        end
        if ad["Perk 2"] then
            table.insert(aa, dF("Perk 2", ad["Perk 2"], false))
        end
        if ad["Perk 3"] then
            table.insert(aa, dF("Perk 3", ad["Perk 3"], false))
        end
        table.insert(dD, dE(w[ac].DisplayKey, ac, aa))
    end
end
getgenv().PlayerData = h:JSONEncode({["content"] = "", ["embeds"] = {unpack(dD)}})
local function dH(dI, dJ)
    if dI:match("https://discord.com/api/webhooks/%d.*/%w*") then
        local dK = dI
        local dL = PlayerData
        local dM = {["content-type"] = "application/json"}
        request = http_request or request or HttpPost or syn.request
        request({Url = dK, Body = dL, Method = "POST", Headers = dM})
    else
        warn("Something went wrong")
    end
end
dH(ag.Webhook, PlayerData)
