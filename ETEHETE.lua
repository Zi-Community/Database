local UID1 = 707130 --@ZIROI
local UID2 = 603566 --@NIEQY
local UID3 = 646219 --@NIEQY
local UID4 = 273047 --@2TAK [588614840768266240]
local UID5 = 819541 --@3TAK [588614840768266240]
local UID6 = 164208 --@
local betatest = 164208 -- BETA TESTER @Sinaga (YantoTzy)943847342115815465
local dcjir = false
local ifhantu = false
local oldMagplantX = magplantX -- [DO NOT TOUCH ANYTHING] --
local magplantCount = 1 -- [DO NOT TOUCH ANYTHING] --
local changeRemote = false -- [DO NOT TOUCH ANYTHING] --
local currentTime = os.time() -- [DO NOT TOUCH ANYTHING] --
local player = GetLocal().name -- [DO NOT TOUCH ANYTHING] --
local currentWorld = GetWorld().name -- [DO NOT TOUCH ANYTHING] --
local currentGem = GetPlayerInfo().gems -- [DO NOT TOUCH ANYTHING] --
local pohon = 0
local seedcr = math.floor(totalseed / 2 / 10)

ChangeValue("[C] Modfly", true)

local function zilog(txt)
    LogToConsole("`w[`b@Ziroi `4Proxy`w] : `w".. txt)
end

local proxy = "`w[ `b@Ziroi `9Script `w]"

AddHook("onvariant", "mommy", function(var)
    if var[0] == "OnTalkBubble" and var[2]:find("MAGPLANT 5000") then
        if var[2]:find("MAGPLANT 5000 is empty.") then
            changeRemote = true
        else
            changeRemote = false
        end
        return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("add_player_info") then
        if var[1]:find("|290|") then
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
    worldName = string.upper(GetWorld().name)
end

AddHook("onprocesstankupdatepacket", "pussy", function(packet)
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
            count = count + inv.amount
        end
    end
    return count
end

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
    packet[4] = 0
    SendVariantList(packet)
    return true
end

zisay("`9Premium `4PTHT `9By `b@Ziroi `0[`#Zi-Community`0] `2Has Been Injected")
Sleep(3000)

local function wrench(x, y)
    pkt = {}
    pkt.type = 3
    pkt.value = 32
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    SendPacketRaw(false, pkt)
end

local function lahsetan()
	if GetWorld() == nil then return end
	cekhantu = true
	SendPacket(2, "action|wrench\n|netid|"..GetLocal().netid)
end

local function hantujir()
	if GetWorld() == nil then return end
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
            return item.amount
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

if GetWorld() == nil then
    username = removeColorAndSymbols(player)
else
    username = removeColorAndSymbols(GetLocal().name)
end

local inpouws = math.floor(GetItemCount(12600))
local inpoarroz = math.floor(GetItemCount(4604))
local inpoclover = math.floor(GetItemCount(528))
local gemsuws = GetPlayerInfo().gems - currentGem
-- [DON'T EDIT SCRIPT]
local function playerHook(info)
    if whUse then
        oras = os.time() - currentTime
MakeRequest(whUrl,"POST",{["Content-Type"] = "application/json"},[[
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
              "value": "<a:panahijo:1210654489988571177>Current Gems: **]].. FormatNumber(GetPlayerInfo().gems) ..[[**\n<a:panahijo:1210654489988571177>Used For UWS: **]].. FormatNumber(gemsuws) ..[[**\n<a:panahijo:1210654489988571177>Total Sprayed Tree : **]].. FormatNumber(pohon) ..[[**",
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

local function getRemote()
    if findItem(5640) == 0 or changeRemote then
        FindPath(magplantX, magplantY - 1, 100)
        Sleep(100)
        wrench(0, 1)
        Sleep(100)
        SendPacket(2, "action|dialog_return\ndialog_name|magplant_edit\nx|".. magplantX .."|\ny|".. magplantY .."|\nbuttonClicked|getRemote")
        Sleep(500)
        playerHook("Taked Magplant Remote!")
        currentGem = GetPlayerInfo().gems
        if findItem(5640) >= 1 then
            Sleep(100)
        end
    end
    changeRemote = false
end

local function remoteCheck()
    if GetWorld() == nil then
        playerHook("Disconnected, Try To Reconnecting!..")
        Sleep(1000)
        RequestJoinWorld(worldName)
        Sleep(1000)
        playerHook("Reconnected!")
        Sleep(5000)
    else
        if GetWorld().name ~= (worldName:upper()) then
            playerHook("Not In The World, Try Rejoin!")
            Sleep(1000)
            RequestJoinWorld(worldName)
            Sleep(1000)
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

local function overlayText(text)
    packet = {}
    packet[0] = "OnTextOverlay"
    packet[1] = text
    SendVariantList(packet)
end


function IsReady(tile)
    if tile and tile.extra and tile.extra.progress and tile.extra.progress == 1.0 then
        return true
    end
    return false
end

function checkseed()
    if GetWorld() == nil then return end
    remoteCheck()
       local Ready = 0
       for y = y1,y2 do
           for x = 0,199 do
              if IsReady(GetTile(x,y)) then
                 Ready = Ready + 1
              end
           end
        end
       return Ready
    end

function punch(x,y)
    if GetWorld() == nil or GetWorld().name ~= worldName then return end
    pkt = {}
    pkt.type = 3
    pkt.value = 18
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y 
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    SendPacketRaw(false, pkt)
end

local function place(id,x,y)
	if GetWorld() == nil or GetWorld().name ~= worldName then return end
	pkt = {}
	pkt.type = 3
	pkt.value = id
	pkt.px = math.floor(GetLocal().pos.x / 32 + x)
	pkt.py = math.floor(GetLocal().pos.y / 32 + x)
	pkt.x = GetLocal().pos.x
	pkt.y = GetLocal().pos.y
	SendPacketRaw(false, pkt)
end

function wrench(x,y)
    pkt = {}
    pkt.type = 3
    pkt.value = 32
    pkt.px = math.floor(GetLocal().pos.x / 32 + x)
    pkt.py = math.floor(GetLocal().pos.y / 32 + y)
    pkt.x = GetLocal().pos.x
    pkt.y = GetLocal().pos.y
    SendPacketRaw(false, pkt)
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

  function percent(per,pler)
    local percentage = math.floor((per / 23) * 100)
    zilog("Progress : `2"..percentage.."%".." `0Line : `4"..pler)
end

function harvest()
    if GetWorld() == nil then return end
    if checkseed() > 0  then
        playerHook("Harvested Tree")
        for y = y2,y1,-1 do
            for x = 0,0 do
                remoteCheck()
                if IsReady(GetTile(x,y)) then
                    FindPath(x,y,80)
                    Sleep(delayht)
                    punch(0,0)
                    Sleep(delayht)
                    end
                end
            end
        end
    Sleep(2000)
end


function plant()
    if GetWorld() == nil then return end
    playerHook("Plant Line 1 (Firts Line!)")
    Sleep(1000)
    if skenb(0,9) == seedcr then
        percent(1,"1 `2Already Plant!")
        return
    else
        percent(1,"1/20")
        for x= 0,0 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant2()
    if GetWorld() == nil then return end
    playerHook("Plant Line 10")
    if skenb(10,19) == seedcr then
        percent(2,"2 `2Already Plant!")
        return
    else
        percent(2,"2/20")
        for x= 10,10 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant3()
    if GetWorld() == nil then return end
    playerHook("Plant Line 20")
    if skenb(20,29) == seedcr then
        percent(3,"3 `2Already Plant!")
        return
    else
        percent(3,"3/20")
        for x= 20,20 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant4()
    if GetWorld() == nil then return end
    playerHook("Plant Line 30")
    if skenb(30,39) == seedcr then
        percent(4,"4 `2Already Plant!")
        return
    else
        percent(4,"4/20")
        for x= 30,30 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant5()
    if GetWorld() == nil then return end
    playerHook("Plant Line 40")
    if skenb(40,49) == seedcr then
        percent(5,"5 `2Already Plant!")
        return
    else
        percent(5,"5/20")
        for x= 40,40 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant6()
    if GetWorld() == nil then return end
    playerHook("Plant Line 50")
    if skenb(50,59) == seedcr then
        percent(6,"6 `2Already Plant!")
        return
    else
        percent(6,"6/20")
        for x= 50,50 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant7()
    if GetWorld() == nil then return end
    playerHook("Plant Line 60")
    if skenb(60,69) == seedcr then
        percent(7,"7 `2Already Plant!")
        return
    else
        percent(7,"7/20")
        for x= 60,60 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant8()
    if GetWorld() == nil then return end
    playerHook("Plant Line 70")
    if skenb(70,79) == seedcr then
        percent(8,"8 `2Already Plant!")
        return
    else
        percent(8,"8/20")
        for x= 70,70 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant9()
    if GetWorld() == nil then return end
        playerHook("Plant Line 80")
    if skenb(80,89) == seedcr then
        percent(9,"9 `2Already Plant!")
        return
    else
        percent(9,"9/20")
        for x= 80,80 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant10()
    if GetWorld() == nil then return end
       playerHook("Plant Line 90")
    if skenb(90,99) == seedcr then
        percent(10,"10 `2Already Plant!")
        return
    else
        percent(10,"10/20")
        for x= 90,90 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant11()
    if GetWorld() == nil then return end
    playerHook("Plant Line 100")
    if skenb(100,109) == seedcr then
        percent(11,"11 `2Already Plant!")
        return
    else
        percent(11,"11/20")
        for x= 100,100 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant12()
    if GetWorld() == nil then return end
        playerHook("Plant Line 110")
    if skenb(110,119) == seedcr then
        percent(12,"12 `2Already Plant!")
        return
    else
        percent(12,"12/20")
        for x= 110,110 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant13()
    if GetWorld() == nil then return end
        playerHook("Plant Line 120")
    if skenb(120,129) == seedcr then
        percent(13,"13 `2Already Plant!")
        return
    else
        percent(13,"13/20")
        for x= 120,120 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant14()
    if GetWorld() == nil then return end
    playerHook("Plant Line 130")
    if skenb(130,139) == seedcr then
        percent(14,"14 `2Already Plant!")
        return
    else
        percent(14,"14/20")
        for x= 130,130 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant15()
    if GetWorld() == nil then return end
        playerHook("Plant Line 140")
    if skenb(140,149) == seedcr then
        percent(15,"15 `2Already Plant!")
        return
    else
        percent(15,"15/20")
        for x= 140,140 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant16()
    if GetWorld() == nil then return end
    playerHook("Plant Line 150")
    if skenb(150,159) == seedcr then
        percent(16,"16 `2Already Plant!")
        return
    else
        percent(16,"16/20")
        for x= 150,150 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant17()
    if GetWorld() == nil then return end
    playerHook("Plant Line 160")
    if skenb(160,169) == seedcr then
        percent(17,"17 `2Already Plant!")
        return
    else
        percent(17,"17/20")
        for x= 160,160 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant18()
    if GetWorld() == nil then return end
    playerHook("Plant Line 170")
    if skenb(170,179) == seedcr then
        percent(18,"18 `2Already Plant!")
        return
    else
        percent(18,"18/20")
        for x= 170,170 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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

function plant19()
    if GetWorld() == nil then return end
    playerHook("Plant Line 180")
    if skenb(180,189) == seedcr then
        percent(19,"19 `2Already Plant!")
        return
    else
        percent(19,"19/20")
        for x= 180,180 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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



function plant20()
    if GetWorld() == nil then return end
    playerHook("Plant Line 190 (Last Line!)")
    if skenb(190,199) == seedcr then
        percent(20,"20 `2Already Plant!")
        return
    else
        percent(20,"20/20")
        for x= 190,190 do
            for y = y1,y2 do
                remoteCheck()
                if GetTile(x,y).fg == 0 then
                    FindPath(x,y,55)
                    Sleep(delaypt)
                    place(5640,0,0)
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
    if GetWorld() == nil then return end
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
                    FindPath(x,y,50)
                    Sleep(delaypt)
                    place(5640,0,0)
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
    if GetWorld() == nil then return end
    if checkseed() < totalseed and skenb(0,199) == totalseed then
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

overlayText("`9Having `4Problems `9With This Script?")
Sleep(1500)
overlayText("Contact `#Al's#0955 `9Or open `4Ticket `9On the Discord Server")
zisay(proxy.."`9Mode : `0[`2"..modeptht.."`0]")
Sleep(2000)
zilog("Target Plant : "..totalseed)
zilog("Current Plant Per-line : "..seedcr)
zisay("`0[ `2World-PTHT `0] : `9"..currentWorld)
Sleep(2500)

if modeptht == "LOOP" then
    looping = true
    counters = false
elseif modeptht == "COUNTER" then
    counters = true
    looping = false
else
zisay("`9MODEPTHT MUST `2LOOP `9OR `2COUNTER `9ONLY!, SCRITP `4TERMINATED!")
overlayText("MODEPTHT MUST LOOP OR COUNTER ONLY!")
zilog("`4WRONG INPUT MODEPTHT!")
zilog("SCRIPT `4TERMINATED!")
end

while looping do
if GetLocal().userid == UID1 or GetLocal().userid == UID2 or GetLocal().userid == UID3 or GetLocal().userid == UID4 or GetLocal().userid == UID5 or GetLocal().userid == UID6 then
    if GetLocal().userid == betatest then
        zilog("`0User `2BETA TESTER! "..GetLocal().name)
        overlayText("`0User `2BETA TESTER! "..GetLocal().name)
        zisay("User `2BETA TESTER! "..GetLocal().name)
        Sleep(3000)
    end
    hantujir()
    Sleep(1000)
    remoteCheck()
    Sleep(200)
    harvest()
    Sleep(200)
    plant()
    Sleep(20)
    plant2()
    Sleep(20)
    plant3()
    Sleep(20)
    plant4()
    Sleep(20)
    plant5()
    Sleep(20)
    plant6()
    Sleep(20)
    plant7()
    Sleep(20)
    plant8()
    Sleep(20)
    plant9()
    Sleep(20)
    plant10()
    Sleep(20)
    plant11()
    Sleep(20)
    plant12()
    Sleep(20)
    plant13()
    Sleep(20)
    plant14()
    Sleep(20)
    plant15()
    Sleep(20)
    plant16()
    Sleep(20)
    plant17()
    Sleep(20)
    plant18()
    Sleep(20)
    plant19()
    Sleep(20)
    plant20()
    Sleep(20)
    plantantimiss()
    Sleep(delayuws)
    uws()
    Sleep(1000)
    harvest()
    percent(23,"Done PTHT")
    playerHook("Done!")
else
    zilog("`4WRONG `0UID")
    playerHook("Wrong UID | UserID : "..GetLocal().userid.." GrowID : "..GetLocal().name)
    overlayText("`4WRONG `0UID")
    Sleep(1000)
    overlayText("Please Contact `#Al's#0955 `0Or Open Ticket In `eDiscord `0To Add UID")
end
end

if counters then
zisay("`9 Total Count PTHT : `2"..counter)
Sleep(2000)
for ziroi = 1, counter do
if GetLocal().userid == UID1 or GetLocal().userid == UID2 or GetLocal().userid == UID3 or GetLocal().userid == UID4 or GetLocal().userid == UID5 or GetLocal().userid == UID6 or GetLocal().userid == betatest then
if GetLocal().userid == betatest then
    zilog("`0User `2BETA TESTER! "..GetLocal().name)
    overlayText("`0User `2BETA TESTER! "..GetLocal().name)
    zisay("User `2BETA TESTER! "..GetLocal().name)
    Sleep(3000)
end
hantujir()
Sleep(1000)
remoteCheck()
Sleep(200)
harvest()
Sleep(200)
plant()
Sleep(20)
plant2()
Sleep(20)
plant3()
Sleep(20)
plant4()
Sleep(20)
plant5()
Sleep(20)
plant6()
Sleep(20)
plant7()
Sleep(20)
plant8()
Sleep(20)
plant9()
Sleep(20)
plant10()
Sleep(20)
plant11()
Sleep(20)
plant12()
Sleep(20)
plant13()
Sleep(20)
plant14()
Sleep(20)
plant15()
Sleep(20)
plant16()
Sleep(20)
plant17()
Sleep(20)
plant18()
Sleep(20)
plant19()
Sleep(20)
plant20()
Sleep(20)
plantantimiss()
Sleep(delayuws)
uws()
Sleep(1000)
harvest()
percent(23,"Done PTHT")
playerHook("Done!")
zisay(proxy.." Total PTHT Done : `2"..ziroi.."`0/`2"..counter)
zilog("Total PTHT Done : `2"..ziroi.."`0/`2"..counter)
Sleep(2000)

if ziroi == counter then
zilog("`9PTHT `2SUCCESSFULLY DONE!")
zisay("`9PTHT `2Successfully Done`9, Thanks For Using!")
Sleep(2000)
zisay("Script By `b@Ziroi `0[`b@Al's#0955`0]")
end
else
zilog("`4WRONG `0UID")
playerHook("Wrong UID | UserID : "..GetLocal().userid.." GrowID : "..GetLocal().name)
overlayText("`4WRONG `0UID")
Sleep(1000)
overlayText("Please Contact `#Al's#0955 `0Or Open Ticket In `eDiscord `0To Add UID")
end
end
end
