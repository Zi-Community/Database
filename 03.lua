-- UID 
local validUIDs = {707130, 603566, 646219, 273047, 819541, 848615}
local betatest = 164208
local totalseed = (y2 + 2) * 100 
local oldMagplantX = magplantX 
local magplantCount = 1 
local currentTime = os.time() 
local player = GetLocal().name 
local currentWorld = GetLocal().world 
local currentGem = GetLocal().gems 
local pohon = 0 
local seedcr = math.floor(totalseed / 2 / 10) 
local udah = 0 
local ziroidc = false 
local balekx, baleky = math.floor(GetLocal().pos_x / 32), math.floor(GetLocal().pos_y / 32)

EditToggle("modfly", true) 

local function zilog(txt) 
    log("`w[`b@Ziroi `4Proxy`w] : `w".. txt) 
end 

local proxy = "`w[ `b@Ziroi `9Script `w]"

local function zisay(text)
    SendPacket(2, "action|input\ntext|".. text)
end

local function warnText(text)
    text = text
    packet = {}
    packet[0] = "OnAddNotification"
    packet[1] = "interface/atomic_button.rttex"
    packet[2] = text
    packet[3] = "audio/hub_open.wav"
    packet["netid"] = -1 
    SendVarlist(packet)
    return true
end

AddCallback("onvariant", "OnVarlist", function(var)
    if var[0] == "OnTalkBubble" and var[2]:find("MAGPLANT 5000") then
        if var[2]:find("MAGPLANT 5000 is empty.") then
            changeRemote = true
        else
            changeRemote = false
        end
        return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("add_player_info") then
        if var[1]:find("`wGhost in the shell````|left|290|") then
        if hantu then
			ifhantu = true
        else
            ifhantu = false
		end
    end
        return true
    end
    if var[0] == "OnSDBroadcast" then
        zilog("`4SDB HAS BEEN BLOCKED!")
        return true
    end
    if var[0]:find("OnDialogRequest") and (var[1]:find("Item Finder") or var[1]:find("The MAGPLANT 5000 is disabled.")) then
		return true
	end
    if var[0] == "OnConsoleMessage" and var[1]:find("Disconnected?! Will attempt to reconnect...") then
        ziroidc = true
        return true
    end
    if var[0] == "OnConsoleMessage" and var[1]:find("Where would you like to go?") then
        return true
    end
    if var[0] == "OnTalkBubble" and var[2]:find("Used `51 Ultra World Spray``") then
        pohon = tonumber(var[2]:match("Sprayed `2(%d+)"))
        return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("MAGPLANT 5000") then
        if var[1]:find("The machine is currently empty!") then
            changeRemote = true
        end
        return true
    end
    return false
end)

worldName = ""

if not cheatFarm and removeAnimation then
    removeAnimation = false
end

if worldName == "" or worldName == nil then
    worldName = string.upper(GetLocal().world)
end

AddCallback("blockPackets", "OnRawPacket", function(packet)
    if packet.type == 3 or packet.type == 8 or packet.type == 17 then
        if removeAnimation then
            return true
        end
    end
end)

local function findItem(id)
    count = 0
    for _, inv in pairs(GetInventory()) do
        if inv.id == id then
            count = count + inv.count
        end
    end
    return count
end

zisay("`9PREMIUM `4PTHT-GPAI `9BY `b@Ziroi [ZI-COMMUNITY] `2SUCCESSFULLY INJECTED!")
Sleep(3000)

local function wrench(x, y)
    pkt = {}
    pkt.type = 3
    pkt.int_data = 32
    pkt.int_x = math.floor(GetLocal().pos_x / 32 + x)
    pkt.int_y = math.floor(GetLocal().pos_y / 32 + y)
    pkt.px = GetLocal().pos_x
    pkt.py = GetLocal().pos_y
    SendPacketRaw(pkt)
end


local function lahsetan()
	if GetLocal() == nil then return end
	SendPacket(2, "action|wrench\n|netid|"..GetLocal().netid)
end

local function hantujir()
	if GetLocal() == nil then return end
    if ifhantu then
    warnText("`9You Already Ghosted!")
	lahsetan()
	Sleep(500)
    else
	if not ifhantu then
        lahsetan()
        warnText("`9Not Ghost `2Detected!")
		zisay("/ghost")
        Sleep(700)
        warnText("`9Auto Ghost `2Activated!")
		Sleep(200)
	end
end
end

local function GetItemCount(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then
            return item.count
        end    
    end
    return 0
end

local function FormatNumber(num)
    num = math.floor(num + 0.5)

    local formatted = tostring(num)
    local k = 3
    while k < #formatted do
        formatted = formatted:sub(1, #formatted - k) .. "," .. formatted:sub(#formatted - k + 1)
        k = k + 4
    end

    return formatted
end

local function removeColorAndSymbols(str)
    cleanedStr = string.gsub(str, "`(%S)", '')
    cleanedStr = string.gsub(cleanedStr, "`{2}|(~{2})", '')
    return cleanedStr
end

if GetLocal() == nil then
    username = removeColorAndSymbols(player)
else
    username = removeColorAndSymbols(GetLocal().name)
end

local inpouws = math.floor(GetItemCount(12600))
local inpoarroz = math.floor(GetItemCount(4604))
local inpoclover = math.floor(GetItemCount(528))
local gemsuws = math.floor(GetLocal().gems - currentGem)
-- [DON'T EDIT SCRIPT]
local function playerHook(info)
    if whUse then
        oras = os.time() - currentTime
SendWebhook(whUrl,[[
    {
           "username": "Zi-Community",
           "avatar_url": "https://i.ibb.co/xXCfYMD/zyro-image-removebg-preview.png",
           "embeds": [
           {
          "author": {
            "name": "PTHT PREMIUM WEBHOOK",
            "icon_url": "https://i.ibb.co/xXCfYMD/zyro-image-removebg-preview.png"
          },
          "title": "<a:warn:1228787474625593431> PTHT INFORMATION <a:warn:1228787474625593431>",
          "color": "]] ..math.random(1000000, 9999999).. [[",
          "fields": [
            {
              "name": "<a:hopeinf:1261681307037990962> Information",
              "value": "<a:panahijo:1210654489988571177>Player Name : **]].. username ..[[**\n<a:panahijo:1210654489988571177>World : **]].. currentWorld ..[[**\n<a:panahijo:1210654489988571177>Status : **]].. info ..[[**\n<a:panahijo:1210654489988571177>Mode : **]].. modeptht ..[[**",
              "inline": "false"
            },
            {
              "name": "<:gems:996867421954637934> More Information",
              "value": "<a:panahijo:1210654489988571177>Current Gems: **]].. FormatNumber(GetLocal().gems) ..[[**\n<a:panahijo:1210654489988571177>Used For UWS: **]].. FormatNumber(gemsuws) ..[[**\n<a:panahijo:1210654489988571177>Total Sprayed Tree : **]].. FormatNumber(pohon) ..[[**",
              "inline": "false"
            },
            {
              "name": "<:uws:1218980171084730499> Consumable Stock",
              "value": "<a:panahijo:1210654489988571177>UWS : **]].. inpouws ..[[**\n<a:panahijo:1210654489988571177>Arroz : **]].. inpoarroz ..[[**\n<a:panahijo:1210654489988571177>Clover : **]].. inpoclover ..[[**",
              "inline": "false"
            },
            {
              "name": "<:mag:1217555651966926939> Magplant Posstion",
              "value": "<a:panahijo:1210654489988571177>Current Remote : (**]].. magplantX ..[[**, **]].. magplantY ..[[**)",
              "inline": "false"
            },
            {
              "name": "<:clock:1217555047999864962> Time-UP",
              "value": "<a:panahijo:1210654489988571177>]].. math.floor(oras/86400) ..[[ Days ]].. math.floor(oras%86400/3600) ..[[ Hours ]].. math.floor(oras%86400%3600/60) ..[[ Minutes ]].. math.floor(oras%3600%60) ..[[ Seconds",
              "inline": "false"
            },
            {
              "name": "<:lua:1261682458810781706> Version",
              "value": "<a:panahijo:1210654489988571177> **1.1.5**",
              "inline": "false"
            }
    
    
        ],
          "thumbnail": {
            "url": "https://i.ibb.co/Fx9xjzQ/standard-1.gif"
            },
            "image": {
            "url": "https://i.ibb.co/89sPhqN/standard.gif"
            },
            "footer": {
            "text": "TIME : ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[ | @Al's#0955",
            "icon_url": "https://i.ibb.co/xXCfYMD/zyro-image-removebg-preview.png"
            }}
      ]
    }]])
        end
end

playerHook("Script is now runing!")

SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_gems|1")

function path(x,y,state)
    SendPacketRaw({flags = state, int_x = x, int_y = y, pos_x = x*32,  pos_y = y*32})
end

function panjg(x,y,id)
    SendPacketRaw({type = 3, int_data = id, int_x = x, int_y = y, pos_x = x*32, pos_y= y*32})
end

local function getRemote()
    if findItem(5640) == 0 or changeRemote then
        FindPath(magplantX, magplantY - 1, 6)
        Sleep(100)
        wrench(0, 1)
        Sleep(100)
        SendPacket(2, "action|dialog_return\ndialog_name|magplant_edit\nx|".. magplantX .."|\ny|".. magplantY .."|\nbuttonClicked|getRemote")
        Sleep(500)
        playerHook("Taked Magplant Remote!")
        currentGem = GetLocal().gems
        if findItem(5640) >= 1 then
            Sleep(100)
        end
    end
    changeRemote = false
end

local function remoteCheck()
    if GetLocal().world == nil or ziroidc == true then
        playerHook("Disconnected, Try To Reconnecting!..")
        Sleep(1000)
        SendPacket(3, "action|join_request\nname|"..worldName.."\ninvitedWorld|0")
        Sleep(1000)
        playerHook("Reconnected!")
        Sleep(5000)
        ziroidc = false
    else
        if GetLocal().world ~= (worldName:upper()) then
            zilog("`9Current World: `4" .. GetLocal().world .. " `9Target World: `4" .. worldName:upper())
            playerHook("Not In The World, Try Rejoin!")
            Sleep(1000)
            SendPacket(3, "action|join_request\nname|"..worldName.."\ninvitedWorld|0")
            Sleep(3000)
            playerHook("Success Rejoin To World!")
            Sleep(4000)
        else
            if findItem(5640) < 0 or findItem(5640) == 0 then
                Sleep(1000)
                getRemote()
            end
        end
    end
    end

function checkseed()
    local Ready = 0
    for y = y1, y2 do
        for x = 0,199 do
           if GetTile(x,y).ready then
              Ready = Ready + 1
           end
        end
     end
     return Ready
 end

function percent(per,pler)
    local percentage = math.floor((per / 23) * 100)
    zilog("Progress : `2"..percentage.."%".." `0Line : `4"..pler)
end


function skenb(x1,x2)
    local dirt_count = 0
    for x = x1, x2 do
      for y = y1, y2 do
        local tile = GetTile(x, y)
        if tile.fg == idseed then
          dirt_count = dirt_count + 1
        end
      end
    end
    return dirt_count
  end

function harvest()
    if GetLocal() == nil then return end
    if (checkseed() > 0) then
        playerHook("Harvested Tree")
        for y = y2,y1,-1 do
            for x = 0,0 do
                remoteCheck()
                if GetTile(x, y).ready then
                    
                    zilog("Harvested X : `2"..math.floor(x).." `wY : `2"..math.floor(y))
                    path(x,y,5640)
                    Sleep(delayht)
                    panjg(x,y,18)
                    Sleep(delayht)
                    end
                end
            end
        end
    Sleep(2000)
end

local function plantLine(lineNumber)
    if GetLocal() == nil then return end
    playerHook("Plant Line " .. lineNumber)
    if skenb((lineNumber - 1) * 10, lineNumber * 10 - 1) == seedcr then
        percent(lineNumber, lineNumber .. " Already Planted!")
        return
    else
        percent(lineNumber, lineNumber .. "/20")
        zisay("`w[`bZiroi `4Proxy`w] Planting Line `4"..lineNumber.."/20")
        for y = y1, y2 do
            for x = (lineNumber - 1) * 10, (lineNumber - 1) * 10 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    zilog("Planted X : `2"..math.floor(x).." `wY : `2"..math.floor(y))
                    path(x,y,6)
                    Sleep(delaypt)
                    panjg(x,y,5640)
                    Sleep(delaypt)
                else
                    if changeRemote then
                        for i = 1, 1 do
                            if magplantX and magplantY and GetTile(magplantX + 1, magplantY).fg == 5638 then
                                magplantX = magplantX + 1
                                magplantCount = magplantCount + 1
                                warnText("`wMagplant `2#".. magplantCount - 1 .." `wis empty. Switching to Magplant `2#".. magplantCount)
                                zilog("Magplant #".. magplantCount - 1 .." is empty. Switching to Magplant #".. magplantCount)
                                playerHook("Magplant #".. magplantCount - 1 .." is empty. Switching to Magplant #".. magplantCount)
                            else
                                warnText("`wMagplant `2#".. magplantCount .." `wis empty. Switching to Magplant `2#1")
                                zilog("`wMagplant `2#".. magplantCount .." `wis empty. Switching to Magplant `2#1")
                                playerHook("Magplant #".. magplantCount .." is empty. Switching to Magplant #1")
                                magplantCount = 1
                                magplantX = oldMagplantX
                            end
                            getRemote()
                            Sleep(1000)
                        end
                    end
                end
            end
        end
    end
end

function plantantimiss()
    if GetLocal() == nil then return end
    playerHook("Plant Miss!")
    if skenb(0, 199) == totalseed then
        percent(21,"`2Seed Complete! No Miss!")
        return
    else
        percent(21,"`4Plant Miss!")
        remoteCheck()
        for x= 0,199 do
            for y = y2,y1,-1 do
                if GetTile(x,y).fg == 0 then
                    zilog("Miss X : `2"..math.floor(x).." `wY : `2"..math.floor(y))
                    path(x,y,6)
                    Sleep(delaypt)
                    panjg(x,y,5640)
                    Sleep(delaypt)
                else
                    if changeRemote then
                        for i = 1, 1 do
                            if magplantX and magplantY and GetTile(magplantX + 1, magplantY).fg == 5638 then
                                magplantX = magplantX + 1
                                magplantCount = magplantCount + 1
                                warnText("`wMagplant `2#".. magplantCount - 1 .." `wis empty. Switching to Magplant `2#".. magplantCount)
                                zilog("Magplant #".. magplantCount - 1 .." is empty. Switching to Magplant #".. magplantCount)
                                playerHook("Magplant #".. magplantCount - 1 .." is empty. Switching to Magplant #".. magplantCount)
                            else
                                warnText("`wMagplant `2#".. magplantCount .." `wis empty. Switching to Magplant `2#1")
                                zilog("`wMagplant `2#".. magplantCount .." `wis empty. Switching to Magplant `2#1")
                                playerHook("Magplant #".. magplantCount .." is empty. Switching to Magplant #1")
                                magplantCount = 1
                                magplantX = oldMagplantX
                            end
                            getRemote()
                            Sleep(1000)
                        end
                    end
                    end
                end
            end
        end
    end

function uws()
    remoteCheck()
    if GetLocal() == nil then return end
    if (checkseed() <= totalseed) and (skenb(0,199) == totalseed) then
    playerHook("Using UWS")
    percent(22,"`4Using UWS")
        SendPacket(2, "action|dialog_return\ndialog_name|ultraworldspray")
        Sleep(1000)
        SendPacket(2, "action|input\n|text|"..proxy.." `9Sprayed Trees : `2"..pohon)
        Sleep(1000)
    else
        percent(22,"`4Back Loop Line For Checking Miss!")
        return
    end
end

-- Fungsi untuk memvalidasi user
local function isValidUser (userid)
    for _, uid in ipairs(validUIDs) do
        if userid == uid then
            return true
        end
    end
    return false
end

-- Fungsi untuk menangani user yang tidak valid
local function handleInvalidUser ()
    zilog("`4WRONG `0UID") 
    log("Wrong UID | UserID : "..GetLocal().userid.." GrowID : "..GetLocal().name) 
    playerHook("Wrong UID | UserID : "..GetLocal().userid.." GrowID : "..GetLocal().name) 
end

local function performPlantingAndHarvesting()
    hantujir()
    getRemote()
    FindPath(balekx, baleky)
    Sleep(1000) 
    harvest()
    Sleep(1000)

    for i = 1, 20 do
        plantLine(i)
        Sleep(40) -- Delay antar baris
    end

    plantantimiss()
    Sleep(delayuws)
    uws()
    Sleep(1000)
    harvest()
end

-- Main Loop
if modeptht == "LOOP" then
    looping = true
    counters = false
elseif modeptht == "COUNTER" then
    counters = true
    looping = false
else
zisay("`9MODEPTHT MUST `2LOOP `9OR `2COUNTER `9ONLY!, SCRITP `4TERMINATED!")
warnText("MODEPTHT MUST LOOP OR COUNTER ONLY!")
zilog("`4WRONG INPUT MODEPTHT!")
zilog("SCRIPT `4TERMINATED!")
end
warnText("`9Having `4Problems `9With This Script?")
Sleep(1500)
warnText("Contact `#Al's#0955 `9Or open `4Ticket `9On the Discord Server")
zisay(proxy.."`9Mode : `0[`2"..modeptht.."`0]")
Sleep(1500)
zilog("Target Plant : "..totalseed)
zilog("Current Plant Per-line : "..seedcr)
zisay("`0[ `2World-PTHT `0] : `9"..currentWorld)
Sleep(1500)
if looping then
    while true do 
        if isValidUser(GetLocal().userid) then
            if GetLocal().userid == betatest then
                warnText("`0User  `2BETA TESTER! "..GetLocal().name)
                zisay("User  `2BETA TESTER! "..GetLocal().name)
                Sleep(3000)
            end
            performPlantingAndHarvesting()
            udah = udah + 1
            zisay(proxy.."Total Count PTHT : `2"..udah)
            Sleep(2000)
            zilog("Total Count PTHT : `2"..udah)
            Sleep(1500)
        else
            handleInvalidUser ()
            break 
        end 
    end 
elseif counters then
    for ziroi = 1, counter do
        if isValidUser(GetLocal().userid) then
            if GetLocal().userid == betatest then
                warnText("`0User  `2BETA TESTER! "..GetLocal().name)
                zisay("User  `2BETA TESTER! "..GetLocal().name)
                Sleep(3000)
            end
            performPlantingAndHarvesting()
            playerHook("Done!")
            zisay(proxy.." Total PTHT Done : `2"..ziroi.."`0/`2"..counter)
            zilog("Total PTHT Done : `2"..ziroi.."`0/`2"..counter)
            Sleep(2000)
        else
            handleInvalidUser ()
            break
        end
    end
end
