dialogText = ""

qast = false
aban = false
apull = false
wrenchban = false
wrenchmode = false
wrenchpull = false
wrenchkick = false
cdropping = false
blink = false
fempty = false
fadd = false
fastdice = false
fastroulette = false
msgspamming = false
clotheauto = false
hostmode = false
pulltextya = false
pulljir = false
noblockdia = false
fakew = false
cekspin = false
moder = false

count = 0
acount = 0
sdelay = 0
cmode = ""
spemtek = ""
spamtext = ""
pulltext = ""
saveworld = ""
playernama = ""
targetpulled = ""
spamtextjir = ""

pos1x, pos1y = 0,0
pos2x, pos2y = 0,0
pos3x, pos3y = 0,0
pos4x, pos4y = 0,0

hatint, patint ,shirtint ,wingint ,shoeint ,handint, maskint, faceint, neckint , ancesint = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

addiditem, addcountitem = 0,0
yposx, yposy = math.floor(GetLocal().pos.x / 32), math.floor(GetLocal().pos.y / 32)


function zilog(txt)
    LogToConsole("`w[`b@Ziroi `4Proxy`w] : `w".. txt)
end

function zilog1(type, e) 
    if type == "real" then
    LogToConsole("`w[ `b@Ziroi `2Real Detector `w] `0"..e) 
    else
    LogToConsole("`w[ `b@Ziroi `4Fake Detector `w] `0"..e)
  end
  end

function addSpacer(type)
    if type == "big" then
        dialogText = dialogText .. "add_spacer|big|\n"
    else
        dialogText = dialogText .. "add_spacer|small|\n"
    end
end

function addItemWithCustomText(itemID, textUnderButton, buttonName)
    dialogText = dialogText .. "\nadd_button_with_icon|" .. buttonName .. "|" .. textUnderButton .. "|staticBlueFrame|" .. itemID .. "|"
end

function addNewLineAfterFrame()
    dialogText = dialogText .. "\nadd_button_with_icon||END_LIST|noflags|0|0|"
end

function addPicker(pickername, pickertext, headText)
    dialogText = dialogText .. "\nadd_item_picker|" .. pickername .. "|" .. pickertext .. "|" .. headText .. "|"
end

function addStaticBlueFrame(itemID, count, textUnderFrame, buttonName, isEndLine)
    if not isEndLine then
        dialogText = dialogText .. "\nadd_button_with_icon|" .. buttonName .. "|" .. textUnderFrame .. "|frame|" .. itemID .. "|" .. count .. "|"
    else
        dialogText = dialogText .. "\nadd_button_with_icon||END_LIST|noflags|0|0|\nadd_button_with_icon|" .. buttonName .. "|" .. textUnderFrame .. "|frame|" .. itemID .. "|" .. count .. "|"
    end
end

function addLabelWithIcon(text, tileid, type)
    if type == "big" then
        dialogText = dialogText .. "add_label_with_icon|big|" .. text .. "|left|" .. tileid .. "|\n"
    else
        dialogText = dialogText .. "add_label_with_icon|small|" .. text .. "|left|" .. tileid .. "|\n"
    end 
end

function addButton(buttonname, buttontext)
    dialogText = dialogText .. "add_button|" .. buttonname .. "|" .. buttontext .. "|noflags|0|0|\n"
end

function addButton2(buttonname, buttontext)
    dialogText = dialogText .. "add_button|" .. buttonname .. "|" .. buttontext .. "|noflags|0|0|"
end

function addButtonWithIcon(btname, text, logoid, type )
    if type == "static" then
    dialogText = dialogText .. "\nadd_button_with_icon|" .. btname .. "|" .. text .. "|staticframe|".. logoid .."|||"
    else
    dialogText = dialogText .. "\nadd_button_with_icon|" .. btname .. "|" .. text .. "|staticBlueFrame|" .. logoid .. "|||"
    end
end

function addCheckbox(checkboxname, checkboxtext, checked)
    if checked then
        dialogText = dialogText .. "add_checkbox|" .. checkboxname .. "|" .. checkboxtext .. "|1|\n"
    else
        dialogText = dialogText .. "add_checkbox|" .. checkboxname .. "|" .. checkboxtext .. "|0|\n"
    end
end

function addTextBox(text)
    dialogText = dialogText .. "add_textbox|" .. text .. "|left|\n"
end

function addSmallText(text)
    dialogText = dialogText .. "add_smalltext|" .. text .. "|\n"
end

function addInputBox(name, text, cont, size)
    dialogText = dialogText .. "add_text_input|" .. name .. "|" .. text .. "|" .. cont .. "|" .. size .. "|\n"
end 


function addEndDialog(name, accept, cancel)
    dialogText = dialogText .. "end_dialog|" .. name .. "|" .. cancel .. "|" .. accept .. "|\n"
end

function addCustom(packet)
    dialogText = dialogText .. packet .. "\n"
end

function addLabel(text ,type)
    if type == "BIG" then
        dialogText = dialogText .. ("add_label|big|"..text.."|left|\n")
    end
    if type == "SMALL" then
        dialogText = dialogText .. ("add_label|small|"..text.."|left|\n")
    end
end

function endDialog(name, accept, nvm)
    dialogText = dialogText ..("end_dialog|" .. name .. "|" .. nvm .. "|" .. accept .. "|\n")
end

function addUrlButton(text, url, ender)
    dialogText = dialogText ..("add_url_button||".. text .."|NOFLAGS|".. url .."|".. ender .."|0|0|)\n")
end

function exit()
    dialogText = dialogText ..("add_quick_exit|\n")
end

function addCustomButton(name, image)
    dialogText = dialogText ..("add_custom_button|".. name .."|image:interface/large/".. image ..".rttex;image_size:400,260;width:0.19;|")
end


function addCustomBreak()
    dialogText = dialogText ..("add_custom_break|\n")
end

function nmbers(str)
    cleanedStr = string.gsub(str, "%b()", '')
    return cleanedStr
end

function sendvar()
  SendVariantList({[0] = "OnDialogRequest", [1] = dialogText})
  dialogText = ""
end

SendPacket(2,"action|input\n|text|`9Premium `4Proxy `9By `b@Ziroi `0[`#Zi-Community`0] `2Has Been Injected")


function allcmd()
    addLabelWithIcon("`4Ziroi `bProxy `9All-List-Cmd", 9474, "big")
    addSpacer("small")
    addLabelWithIcon("[+] /cmd       OPEN THIS COMMAND MENU", 482, "small")
    addLabelWithIcon("`b[+][ HOSTER COMMAND LIST ][+]", 758, "small")
    addSpacer("small")
    addLabelWithIcon("`0[+] /set1 [ `9SET POS FOR FIRST PLAYER `0]", 482, "small")
    addLabelWithIcon("`0[+] /set2 [ `9SET POS FOR SECOND PLAYER `0]", 482, "small")
    addLabelWithIcon("`0[+] /set3 [ `9SET POS FOR THIRD PLAYER `0]", 482, "small")
    addLabelWithIcon("`0[+] /set4 [ `9SET POS FOR FOURTH PLAYER `0]", 482, "small")
    addLabelWithIcon("`0[+] /w1 (AMOUNT) [ `9DROP POS1 `0]", 482, "small")
    addLabelWithIcon("`0[+] /w2 (AMOUNT) [ `9DROP POS2 `0]", 482, "small")
    addLabelWithIcon("`0[+] /w3 (AMOUNT) [ `9DROP POS3 `0]", 482, "small")
    addLabelWithIcon("`0[+] /w4 (AMOUNT) [ `9DROP POS4 `0]", 482, "small")
    addLabelWithIcon("`0[+] /wl (AMOUNT)  [ `9DROP WLS `0]", 482, "small")
    addLabelWithIcon("`0[+] /take [ `9TAKE BGL FROM POS SET `0]", 482, "small")
    addLabelWithIcon("`0[+] /hoster [ `9OPEN HOSTER MENU `0]", 482, "small")
    addLabelWithIcon("`0[+] /cv [ `9CV DL TO BGL(TELEPHONE CANNOT FAR AWAY) `0]", 482, "small")
    addSpacer("small")
    addLabelWithIcon("`b[+][ FAST COMMAND LIST ][+]", 32, "small")
    addSpacer("small")
    addLabelWithIcon("`0[+] /auto [ `9AUTO PULL, AUTO BAN `0]", 482, "small")
    addLabelWithIcon("`0[+] /vend [ `9VEND FUNCTION `0]", 482, "small")
    addLabelWithIcon("`0[+] /wp (WORLD) [ `9WARPING TO WORLD `0]", 482, "small")
    addLabelWithIcon("`0[+] /wr (TYPE) [ `9WRENCH (BAN, PULL, KICK) `0]", 482, "small")
    addLabelWithIcon("`0[+] /dl (AMOUNT) [ `9DROP DLS `0]", 482, "small")
    addLabelWithIcon("`0[+] /bgl (AMOUNT) [ `9DROP BGLS `0]", 482, "small")
    addLabelWithIcon("`0[+] /bbgl (AMOUNT) [ `9DROP BBGLS `0]", 482, "small")
    addLabelWithIcon("`0[+] /dablek [ `9DROP ALL BBGL `0]", 482, "small")
    addLabelWithIcon("`0[+] /dadl [ `9DROP ALL DL `0]", 482, "small")
    addLabelWithIcon("`0[+] /dabgl [ `9DROP ALL BGL `0]", 482, "small")
    addLabelWithIcon("`0[+] /drop (AMOUNT) (UNIT) [ `9UNIT : wl,dl,bgl,bbgl `0]", 482, "small")
    addSpacer("small")
    addLabelWithIcon("`b[+][ VISUAL COMMAND LIST ][+]", 12436, "small")
    addSpacer("small")
    addLabelWithIcon("`0[+] /clothe   MENU (VISUAL CLOTHES)", 482, "small")
    addLabelWithIcon("`0[+] /change   CHANGE CLOTHES", 482, "small")
    addLabelWithIcon("`0[+] /item     VISUAL ITEM ON INVENTORY MENU", 482, "small")
    addLabelWithIcon("`0[+] /add      ADD VISUAL ITEM TO INVENTORY", 482, "small")
    addSpacer("small")
    addLabelWithIcon("`b[+][ OTHER COMMAND LIST ][+]", 9472, "small")
    addSpacer("small")
    addLabelWithIcon("`0[+] /csn          Spin all roulette on world", 482, "small")
    addLabelWithIcon("`0[+] /save (WORLD) Save world, set go", 482, "small")
    addLabelWithIcon("`0[+] /gscan (ID)   Show dropped , placed", 482, "small")
    addLabelWithIcon("`0[+] /spam         OPEN SPAMMER MENU", 482, "small")
    addLabelWithIcon("`0[+] /setspam      Spam text (Normal , Msg)", 482, "small")
    addLabelWithIcon("`0[+] /setdelay     Spam delay", 482, "small")
    addLabelWithIcon("`0[+] /startspam    Start spam", 482, "small")
    addLabelWithIcon("`0[+] /startmsgpam  Starting msg spam", 482, "small")
    addLabelWithIcon("`0[+] /ss           Save Settings", 482, "small")
    addLabelWithIcon("`0[+] /ls           Load Settings", 482, "small")
    addSpacer("small")
    addButton("bproxy", "Back")
    exit()
    sendvar()
    end


function command_menu()
    addLabelWithIcon("Commands", 5956, "LABEL_BIG")
    addLabel("`0This `2Proxy `0Created By `b@Ziroi`0[`bDC : Al's#0955`0]", "SMALL")
    addButton("hostermenu", "Hoster Menu")
    addSpacer("small")
    addButton("visualmenu", "Visual Menu")
    addSpacer("small")
    addButton("fastmenu", "Fast Things Menu")
    addSpacer("small")
    addButton("othermenu", "Other Menu")
    endDialog("comandmenuend", "Back", "Cancel")
    exit()
    sendvar()
end

function bankmenu()
  addLabelWithIcon("`eBank Menu", 7188, "big")
  addSpacer("small")
  addLabelWithIcon(" `bYour BBGL Balance : " .. findItem(11550), 11550, "small")
  addLabelWithIcon(" `eYour BGL Balance : " .. findItem(7188), 7188, "small")
  addLabelWithIcon(" `cYour DL Balance : " .. findItem(1796), 1796, "small")
  addLabelWithIcon(" `9Your WL Balance : " .. findItem(242), 242, "small")
  addSpacer("small")
  addButton("bank", "`eBGL Bank")
  addUrlButton("`wGo Save World", "OPENWORLD", "Ziroi")
  addButton("bproxy", "Back")
  exit()
  sendvar()
end

function wrmenu()
  addLabelWithIcon("`wWrench Menu", 32, "big")
  exit()
  sendvar()
end

function posinf()
  addLabelWithIcon("`bPossition Info", 15018, "big")
  addSpacer("small")
  addSmallText("`bHoster `4Name : " .. nmbers(GetLocal().name))
  addSmallText("`9Your Possition : ".. yposx .. ", " .. yposy)
  addSmallText("`9Pos1 : ".. pos1x .. ", " .. pos1y)
  addSmallText("`9Pos2 : ".. pos2x .. ", " .. pos2y)
  addSmallText("`9Pos3 : ".. pos3x .. ", " .. pos3y)
  addSmallText("`9Pos4 : ".. pos4x .. ", " .. pos4y)
  addSpacer("small")
  addButton("bproxy", "Back")
  addUrlButton("`wGo Save World", "OPENWORLD", "Ziroi")
  exit()
  sendvar()
end

isihostm = "`4Off"
isiptext = "`4Off"
isiceksp = "`4Off"
function hostmenu()
  addLabelWithIcon("`4Hoster Menu", 758, "big")
  addSmallText("`9Pull Text = If you pull then say your pull text")
  addSmallText("`4NOTE : `9If you want use pull text, you need active pull text by clicking Pull Text to on mode adn write pull text")
  addSpacer("small")
  addSmallText("`wCurrent Pull Text :".. pulltext)
  addInputBox("pulltext", "`wPull Text", pulltext, 30)
  addButtonWithIcon("cekspin", "Cek-Spin : "..isiceksp, 758, "small")
  addButtonWithIcon("hostmodeon", "Host-Mode : "..isihostm, 9474, "small")
  addButtonWithIcon("pulltextya", "Pull Text : "..isiptext, 5804, "small")
  addNewLineAfterFrame()
  addSpacer("small")
  addSmallText("`9Cek-Spin : Cek Reme/Qeme Number, Cek Real Or Fake Spin, Fast Wheel")
  addSmallText("`9Host-Mode : Fast Pull,Pull Text(`4Must Active Pull text`9)")
  addSmallText("`9Pull Text : Say Your Text if pulled someone")
  addSpacer("small")
  addButton("bproxy", "Back")
  exit()
  sendvar()
end

function spammer()
  addLabelWithIcon("`bChat Spam Configuration", 15136, "big")
  addSmallText("You can use `9/setspam`0 and `9/setdelay`0 to change this")
  addSmallText("and you can use `9/startspam`0 to start spamming")
  addSpacer("small")
  addSmallText("`9Spam Text : `0" .. spamtext)
  addSmallText("`9Spam Delay : `0" .. sdelay)
  addInputBox("sdelay", "Spam Delay", sdelay, 5)
  addInputBox("spamtextjir", "Spam Text", spamtextjir, 120)
  addSpacer("small")
  addButton("changenow", "Change Now!")
  addButton("startspam", "Start Spam")
  addButton("bproxy", "Back")
  exit()
  sendvar()
end
local isimodec = "`4Off"
local isimoder = "`4Off"
function chatmenu()
    addLabelWithIcon("`bChat Menu", 8282, "big")
    addSmallText("`9You can Use Random Text With Emoji Or Set Manually")
    addInputBox("cmode", "Chat Color", cmode, 5)
    addSmallText("`4Note : `9Color Input Like : `92 = `2Green `94 = `4Red `9ETC.")
    addSpacer("small")
    addButton("modec","Custom : "..isimodec)
    addButton("moder","`1R`2a`3n`4d`5o`6m`7-`8C`9h`ea`ct : "..isimoder)
    addSpacer("small")
    addButton("bproxy", "Back")
    exit()
    sendvar()
end



function proxy_menu()
    addLabelWithIcon("`4Proxy Menu", 4210, "big")
    addSmallText("`9This `2Proxy `9Created By `b@Ziroi`0[`bDC : Al's#0955`0]")
    addSmallText("`9Be Wise In Using This Proxy,If U Got a `4BUG `9U Can Report It")
    addSmallText("`$Have A Nice Day :) ".. nmbers(GetLocal().name))
    addSpacer(big)
    addButtonWithIcon("hostmenu", "Hoster-Menu", 758, "no")
    addSpacer("small")
    addButtonWithIcon("wrench", "Wrench-Menu", 32, "no")
    addSpacer("small")
    addButtonWithIcon("bankmenu", "Bank-Menu", 15124, "no")
    addSpacer("small")
    addButtonWithIcon("chatex", "Chat Menu", 8282, "no")
    addNewLineAfterFrame()
    addButtonWithIcon("spammer", "Chat Spam", 15136, "no")
    addSpacer("small")
    addButtonWithIcon("posinf", "Possition Info", 15018, "no")
    addSpacer("small")
    addButtonWithIcon("allcmd", "All Cmd List", 3690, "no")
    addNewLineAfterFrame()
    addSpacer("big")
    addUrlButton("`4Report Bug!", "https://discord.com/channels/984033402002997258/1213804730439172116", "`4Report Bug? `0You will be immediately directed to the discord server")
    endDialog("vendudu", "Done", "Cancel")
    exit()
    sendvar()
end

function cs()
    for i = 1,25 do
    local totTxt = ""
    for o = 1, math.random(1,23), 1 do
    totTxt = totTxt .. string.char(math.random(97, 122))
    totTxt = string.upper(totTxt)
    end     
    SendPacket(3, ("action|join_request\nname|%s\ninvitedWorld|0"):format(totTxt))
    Sleep(6000)
    end
    end
    
function convertdl()
for _, til in pairs(GetTiles())do
if til.fg == 3898 or til.bg == 3898 then
SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..til.x.."|\ny|"..til.y.."|\nbuttonClicked|bglconvert")
SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Convert DL")
end
end
end

function HasItem(id, count)
    local hasItem = false
    for _, item in pairs(GetInventory()) do
      if item.id == id and item.amount >= count then
        hasItem = true
        break
      end
    end
    return hasItem
  end

function Split(inputstr, sep)
    if sep == nil then
        sep = "%s" -- Default separator is a space
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

  function DropItem(id, count)
    if not HasItem(id, count) then
      zilog("You do not have "..count.." of "..id)
      return
    end

    SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|"..id.."|\nitem_count|"..count)
  end

    function qazino()
        local function Lolx(x, y)
        local p = {}
        p.type = 3
        p.int_data = 6326
        p.int_x = x
        p.int_y = y
        p.pos.x = GetLocal().pos.x
        p.pos.y = GetLocal().pos.y
        SendPacketRaw(p)
        end
    
    
    local d = function()
        for i, v in pairs(GetTiles()) do
            if v.fg == 758 then
                Lolx(v.pos.x, v.pos.y)
                Sleep(200)
            end
        end
    end
    
    RunThread(function()
        d()
    end)
    end


    function setspam()
        while spamming do
            SendPacket(2, "action|input\n|text|".. randomNumduar .. randomEmoteduar .." : ".. spamtext)
                Sleep(sdelay)
                if sdelay == 0 then zilog("Spam delay cant be `40`w please change it!")
                    break
                end
        end
        end
        
        
    function fasting()
        addLabelWithIcon("Fast", 758, "LABEL_BIG")
        addSpacer("small")
        addCheckbox("fastroulette", "Fast Roulette", fastroulette)
        addSpacer("small")
        addCheckbox("fastdice", "Fast Dice", fastdice)
        addSpacer("small")
    if playernama == nil or playernama == "" then
            addTextBox("Please add user name /setplayer (name)")
            addSpacer("small")
    end
        endDialog("vendudu", "Done", "Cancel")
        sendvar()
        end

    function vend()
        addLabelWithIcon("Ziroi", 2978, "LABEL_BIG")
        addSpacer("small")
        addCheckbox("zivend", "Fast Vend", qast)
        addSpacer("small")
        addInputBox("zicount", "Fast Vend Amount", count, 3);
        addSpacer("small")
        addCheckbox("fasttake", "Fast Emtpy", fempty)
        addSpacer("small")
        addCheckbox("fadd", "Fast Add Stock", fadd)
        endDialog("vendudu", "Done", "Cancel")
        sendvar()
        end

    function visualclothe()
        addLabelWithIcon("Ziroi", 7188, "LABEL_BIG")
        addSpacer("small")
        addInputBox("hatint", "Hat", hatint, 5);
        addSpacer("small")
        addInputBox("patint", "Pant", patint, 5);
        addSpacer("small")
        addInputBox("shirtint", "Shirt", shirtint, 5);
        addSpacer("small")
        addInputBox("wingint", "Wing", wingint, 5);
        addSpacer("small")
        addInputBox("shoeint", "Shoe", shoeint, 5);
        addSpacer("small")
        addInputBox("handint", "Hand", handint, 5);
        addSpacer("small")
        addInputBox("maskint", "Mask", maskint, 5);
        addSpacer("small")
        addInputBox("faceint", "Face", faceint, 5);
        addSpacer("small")
        addInputBox("neckint", "Neck", neckint, 5);
        addSpacer("small")
        addInputBox("ancesint", "Ances", ancesint, 5);
        addSpacer("small")
        
        addCheckbox("clotheauto", "Auto load clothe when join world", clotheauto)
        endDialog("clotheint", "Done", "Cancel")
        
        sendvar()
        end

        function dandc(input)
            local lower_input = string.lower(input)
            local trimmed_input = string.gsub(lower_input, "^/+", "/")
            local final_input = string.gsub(trimmed_input, "%s+", "")
            return final_input
        end

        function added(id,count)
            local packet = {}
            packet.type = 13
            packet.int_data = tonumber(id) 
            packet.count2 = tonumber(count) 
            SendPacketRawClient(packet)
            end
            
        function add_item()
        addLabelWithIcon("Visual Item Inventory", 6276, "LABEL_BIG")
        addSpacer("small")
        addInputBox("addiditem", "Item ID", addiditem, 5);
        addSpacer("small")
        addInputBox("addcountitem", "Count", addcountitem, 3);
        endDialog("addItem", "Done", "Cancel")
        sendvar()
        end

        function auto()
            addLabelWithIcon("Auto", 733, "LABEL_BIG")
            addSpacer("small")
            addCheckbox("aban", "Auto Ban", aban)
            addSpacer("small")
            addCheckbox("apull", "Auto Pull", apull)
            endDialog("vendudu", "Done", "Cancel")
            
            sendvar()
            end

        isifpull = "`4Off"
        isifban = "`4Off"
        isifkick = "`4Off"
        function wrench()
            addLabelWithIcon("Wrench Mode", 32, "big")
            addButton("wrenchpull", "`9Fast Pull : "..isifpull)
            addButton("wrenchkick", "`9Fast Kick : "..isifkick)
            addButton("wrenchban", "`9Fast Ban : "..isifban)
            addSpacer("small")
            addButton("bproxy", "`wProxy Menu")
            endDialog("wus", "Done", "Cancel")
            sendvar()
        end

        function overlayText(text)
            packet = {}
            packet[0] = "OnTextOverlay"
            packet[1] = text
            SendVariantList(packet)
          end

        function dropped(ids)
            local qwe = 0;
            for _,object in pairs(GetObjectList()) do
              if object.id == ids then
                    qwe = qwe + object.amount
              end
              end
            return tostring(qwe)
            end

        function placed(ids)
            local qwer = 0;
            for _, tile in pairs(GetTiles()) do
                if tile.fg == ids or tile.bg == ids then
                     qwer = qwer + 1
                end
            end
            return tostring(qwer)
            end

        function string:removeColors()
            return self:gsub("`.", '')
        end

        function growscan(ids)
            ids = tostring(ids)
            ids = ids:gsub(" ", "")
            ids = tonumber(ids)
            addLabelWithIcon("Growscan", 6016, "LABEL_BIG")
            addSpacer("small")
            addTextBox("Dropped : " .. dropped(ids));addTextBox("Placed : " .. placed(ids));
            endDialog("gscan", "Done", "Cancel")
            
            sendvar()
        end

        function findItem(id)
            local c = 0
            for __, inv in pairs(GetInventory()) do
                if inv.id == id then
                    c = c + inv.amount
                end
            end
            return c
        end

        function collect(range)
            range = (range or 4) * 32
            for __, obj in pairs(GetObjectList()) do
                posx = math.floor(GetLocal().pos.x - obj.pos.x)
                posy = math.floor(GetLocal().pos.y - obj.pos.y)
                if posx < range and posy < range then
                    SendPacketRaw(false,{type = 11, value = obj.oid, x = obj.pos.x, y = obj.pos.y,})
                end
            end
        end
        
        function cdrop(amount, unit)
        if amount and unit then
            amount = tonumber(amount)
            if unit == "wl" then
                if amount > 0 then
                    if findItem(242) >= amount then
                    zilog("Dropping "..amount.." WLs")
                    DropItem(242, amount)
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9World Lock")
                    else
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4You don't have enough `9World Locks.")
                    end
                    return true
                else
                    zilog("Invalid amount. Please enter a number greater than or equal to 250.")
                end
            elseif unit == "dl" then
                if amount >= 0 then
                    if findItem(1796) >= amount then
                    zilog("Dropping "..amount.." DLs")
                    DropItem(1796, amount)
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9Diamond Lock")
                    else
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4You don't have enough `9Diamond Locks.")
                    end
                    return true
                else
                    zilog("Invalid amount. Please enter a number greater than or equal to 250.")
                end
            elseif unit == "bgl" then
                if amount >= 0 then
                    if findItem(7188) >= amount then
                    zilog("Dropping "..amount.." BGLs")
                    DropItem(7188, amount)
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9Blue Gem Lock")
                    else
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4You don't have enough `9Blue Gem Locks.")
                    end
                    return true
                else
                    zilog("Invalid amount. Please enter a number greater than or equal to 250.")
                end
            elseif unit == "bbgl" then
                if amount >= 0 then
                    if findItem(11550) >= amount then
                    zilog("Dropping "..amount.." BBGLs")
                    DropItem(11550, amount)
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9Black Gem Lock")
                    else
                    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4You don't have enough `9Black Gem Locks.")
                    end
                    return true
                else
                    zilog("Invalid amount. Please enter a number greater than or equal to 250.")
                end
            else
                zilog("Invalid unit. Please enter 'wl', 'dl', 'bgl', or 'bbgl'.")
                zilog("Invalid command. Please enter '/drop' followed by a number and a unit.")
            end
        end
    end          

---------------------
local function hook(vlist)
function qq_function(number)
  str_number = tostring(number)
  last_digit = str_number:sub(-1)
  result = tonumber(last_digit)
  return result
end

if vlist[0] == "OnDialogRequest" and vlist[1]:find("end_dialog|telephone") then
    return true
end

function numnum()
    if vlist[0] == "OnDialogRequest" then
        randomNumduarr = numduar[math.random(1, #numduar)]
        randomEmoteduarr = emotes[math.random(1, #emotes)]
        targetpulled = vlist[1]:match("`w(.*)``(%s)")
        if pulljir == true then
            SendPacket(2, "action|input\n|text|".. randomNumduarr .. randomEmoteduarr .." : ".. pulltext .. " " .. targetpulled)
       return true
        end
    end
end


function remove_color_codes(str)
  pattern = "`."
  result = string.gsub(str, pattern, "")
  return result
end

function say(text)
    SendPacket(2, "action|input\n|text|`b[@Ziroi] "..text)
  end

function reme_function(number)
  str_number = tostring(number)
  sum = 0
  
  for i = 1, #str_number do
      sum = sum + tonumber(str_number:sub(i, i))
  end
  
  str_sum = tostring(sum)
  last_digit = str_sum:sub(-1)
  result = tonumber(last_digit)
  
  return result
end

if cekspin == true then
if vlist[0]:find("OnConsoleMessage") and vlist[1]:find("spun the wheel") and vlist[1]:find("CP:_PL:0_OID:_CT") and vlist[1]:find("<") and vlist[1]:find(">") and not vlist[1]:find("`b[@Ziroi]") and not vlist[1]:find("Fake Spin Detected") then
    playernya = vlist[1]:match("`w(.*)(%])")
    say("`4Fake Spin Detected : `0"..playernya.."`0]")
    overlayText("`4FAKE SPIN DETECTED : `0"..playernya)
    return true
  end


  if vlist[0]:find("OnConsoleMessage") and vlist[1]:find("spun the wheel") then
    if fakew == false then
      zilog1("real", "`w[ `2REAL `w] "..vlist[1]) 
    end
      return true 
  end 
  
  if vlist[0]:find("OnConsoleMessage") then
      LogToConsole("`w[ `b@Ziroi `9Proxy `w] `0"..vlist[1]) 
      return true 
  end
  
  if vlist[0]:find("OnTalkBubble") and vlist[2]:find("spun the wheel") and vlist[2]:find("<") and vlist[2]:find(">") and not vlist[2]:find("Fake Spin") then
      SendVariantList({[0] = vlist[0], [1] = vlist[1], [2] = " `w[`4 FAKE `w]"..vlist[2], [3] = vlist[3]})
      fakew = true
      zilog1("fake", "`w[ `4FAKE `w] "..vlist[2])
    playernya1 = vlist[2]:match("`6<(.*)(%>)")
    overlayText("`4FAKE SPIN DETECTED : `0"..playernya1)
    say("`4Fake Spin Detected : "..playernya1)
      return true
  end  
  
  if vlist[0] == ("OnTalkBubble") and vlist[2]:find("spun the wheel and got") and vlist[2]:find("``") and not vlist[2]:find("Fake Spin") then
        number = remove_color_codes(vlist[2])
        number = number:match("spun the wheel and got (%d+)")
        qq_number = qq_function(number)
        reme_number = reme_function(number)
        SendVariantList({[0] = vlist[0], [1] = vlist[1], [2] = "`0[ `2REAL `0]`7 "..vlist[2].. " `4Q: `3".. qq_number .. " `4R: `3" .. reme_number, [3] = vlist[3]})
        fakew = false
      return true 
  end 
end



if vlist[0]:find("OnConsoleMessage") then
    if vlist[1]:find("`oCollected ") then
    local ang, word = vlist[1]:match("`w(%d+) (.+)``")
    if word:find("World Lock") then
    zilog("Collected "..ang.." WLS/"..math.floor(ang / 100).." DLS/"..math.floor(ang / 1000).." BGL.")
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Collected `c" .. ang .. " `9WL")
    elseif word:find("Diamond Lock") then
    zilog("Collected "..math.floor(ang * 100).." WLS/"..ang.." DLS/"..math.floor(ang / 1000).." BGL.")
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Collected `c" .. ang .. " `9DL")
    elseif word:find("Blue Gem Lock") then
    zilog("Collected "..math.floor(ang * 1000).." WLS/"..math.floor(ang * 100).." DLS/"..ang.." BGL.")
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Collected `c" .. ang .. " `9BGL")
    elseif word:find("Black Gem Lock") then
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Collected `c" .. ang .. " `9BBGL")
    elseif ang and word then
    LogToConsole("`w[`9COMMANDS INPUT `w] : " .. word)
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Collected `c" .. ang .. " `9" .. word)
  end
return true
end
end

if vlist[0] == "OnSDBroadcast" then 
zilog("`4SDB BLOCKED")
return true
end
if vlist[0]:find("OnConsoleMessage") then
local dialogName = vlist[1]
if dialogName then
local newDialogName = "`e[`b@Zi `cCommunity `e]`c" .. dialogName
LogToConsole(newDialogName)
return true
end
end
if vlist[0]=="OnDialogRequest" and vlist[1]:find("add_label_with_icon|big|`wVending Machine``|left|2978|") then
if qast then
tilex = vlist[1]:match("tilex|(%d+)")
tiley = vlist[1]:match("tiley|(%d+)")
expectprice = vlist[1]:match("expectprice|(-%d+)")
if expectprice == nil then
expectprice = vlist[1]:match("expectprice|(%d+)")
end
expectitem = vlist[1]:match("embed_data|expectitem|(%d+)")
zilog("Tile X : " .. tilex .. " Tile Y : " .. tiley .. " Expect Item : " .. expectitem)
SendPacket(2, "action|dialog_return\ndialog_name|vending\ntilex|" .. tilex .. "|\ntiley|" .. tiley .. "|\nexpectprice|" .. expectprice .. "|\nexpectitem|"..expectitem.."|\nbuycount|" .. count)
Sleep(500)
SendPacket(2, "action|dialog_return\ndialog_name|vending\ntilex|".. tilex .. "|\ntiley|" .. tiley .. "|\nverify|1|\nbuycount|" .. count .. "|\nexpectprice|".. expectprice .. "|\nexpectitem|" .. expectitem .. "|")
Sleep(500)
return true
end
if fempty then
tilex = vlist[1]:match("tilex|(%d+)")
tiley = vlist[1]:match("tiley|(%d+)")
setprice = vlist[1]:match("setprice|(%d+)")
chk = vlist[1]:match("chk_peritem|(%d+)")
chkp = vlist[1]:match("chk_perlock|(%d+)")
if chk == nil then chk = 0 end
if chkp == nil then chkp = 1 end
if setprice == nil then setprice = 0 end
SendPacket(2, "action|dialog_return\ndialog_name|vending\ntilex|" .. tilex .. "|\ntiley|" .. tiley .. "|\nbuttonClicked|pullstock" .. "\n\nsetprice|" .. setprice .. "\nchk_peritem|" .. chk .. "\nchk_perlock|"..chkp)
Sleep(500)
return true
end
if fadd then
tilex = vlist[1]:match("tilex|(%d+)")
tiley = vlist[1]:match("tiley|(%d+)")
setprice = vlist[1]:match("setprice|(%d+)")
chk = vlist[1]:match("chk_peritem|(%d+)")
chkp = vlist[1]:match("chk_perlock|(%d+)")
if chk == nil then chk = 0 end
if chkp == nil then chkp = 1 end
if setprice == nil then setprice = 0 end
SendPacket(2, "action|dialog_return\ndialog_name|vending\ntilex|" .. tilex .. "|\ntiley|" .. tiley .. "|\nbuttonClicked|addstock" .. "\n\nsetprice|" .. setprice .. "\nchk_peritem|" .. chk .. "\nchk_perlock|"..chkp)
Sleep(500)
return true
end

elseif vlist[0]=="OnConsoleMessage" then
    if spamming and  vlist[1]:find("Spam detected") then
            zilog("Spam detected... Closing spamming due for ban");spamming = false;
    end
    if fempty and vlist[1]:find("to remove") then
            zilog("Nothing to remove. Closing fast empty");fempty =false;
    end
    if fadd and vlist[1]:find("have any to add") then
            zilog("Nothing to add. Closing fast add");fadd= false;
    end
    if fastroulette and vlist[1]:find('spun the wheel and got') then
            text = vlist[1]:lower()
            if text:lower():find(playernama:gsub(" ", ""):lower()) then
                    MessageBox("Ziroi ; )  " .. os.date("%X") , 'You will get ' .. (split(text:removeColors(), " ")[7]:gsub("!]", "")))
            end
            
    end

elseif vlist[0]=="OnSpawn" then
a = vlist[1]:match("name|(`.[^`]+)")
if aban then   
Sleep(1000)
SendPacket(2, "action|input\n|text|/ban " .. a)
return true
end
if apull then   
Sleep(1000)
SendPacket(2, "action|input\n|text|/pull " .. a)
return true
end
if msgspamming then
RunThread(function()
SendPacket(2, "action|input\n|text|/msg /" .. a .. " " .. spamtext)
Sleep(sdelay)
end)
end

  elseif noblockdia == true then
  if vlist[0] == "OnDialogRequest" and vlist[1]:find("add_button|trade|`wTrade``|0|0|") and vlist[1]:lower():find("pull") then
  if wrenchpull then
  SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..vlist[1]:match("netID|(%d+)").."|\nnetID|"..vlist[1]:match("netID|(%d+)").."|\nbuttonClicked|pull")
  if pulltextya == true and pulljir == true then
    numnum()
  end
  return true
  elseif wrenchban then
  SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..vlist[1]:match("netID|(%d+)").."|\nnetID|"..vlist[1]:match("netID|(%d+)").."|\nbuttonClicked|world_ban")
  return true
  elseif wrenchkick then
  SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..vlist[1]:match("netID|(%d+)").."|\nnetID|"..vlist[1]:match("netID|(%d+)").."|\nbuttonClicked|kick")
  return true
  end

end
end
end


function logqw(text, file)
    file = io.open(file:lower(), "w")
    file:write(text.."\n")
    file:close()
end

---------------------
function tofloat(number)
    return (number .. ".000000")
end

sended = false
function change_clothes()
x1, y1,z1 = 0,0,0
x2, y2, z2 = 0,0,0
x3, y3, z3 = 0,0,0
x5 = 0
if maskint ~= 0 then
        x1 = maskint
end
if shirtint ~= 0 then
        y1 = shirtint
end
if patint ~= 0 then
        z1 = patint
end
if shoeint ~= 0 then
        x2 = shoeint
end
if faceint ~= 0 then
        y2 = faceint
end
if handint ~= 0 then
        z2 = handint
end
if wingint ~= 0 then
        x3 = wingint
end
if hatint ~= 0 then
        y3 = hatint
end
if neckint ~= 0 then
        z3 = neckint
end
if ancesint ~= 0 then
        x5 = ancesint
end

SendPacket(2,"action|setSkin\ncolor|3033464831");
local var = {}
var[0] = "OnSetClothing"
var[1] = {tofloat(x1) , tofloat(y1),  tofloat(z1)}
var[2] = {tofloat(x2) , tofloat(y2), tofloat(z2)}
var[3] = {tofloat(x3) , tofloat(y3),tofloat(z3)}
var[4] = "3033464831"
var[5] = {tofloat(x5)  , tofloat(0), tofloat(0)}
var.netid = GetLocal().netid
SendVariantList(var)
end

function blinks()
    while blink do
    local skin = {1348237567, 1685231359, 2022356223, 2190853119, 2527912447, 2864971775, 3033464831, 3370516479, 3033464831, 2864971775, 2527912447, 2190853119, 2022356223, 1685231359, 1348237567}
            SendPacket(2,"action|setSkin\ncolor|".. skin[math.random(#skin)]); Sleep(50);
    end
end

function get_line(filename, line_number)
    local BUFSIZE = 2^13 
    local buf = ""
    local i = 0
    local f = io.open(filename, "r")
    while true do
      local chunk = f:read(BUFSIZE)
      if not chunk then break end
      buf = buf .. chunk
      repeat
        local nl_pos = buf:find("\n", i + 1)
        if nl_pos then
          i = nl_pos
          line_number = line_number - 1
          if line_number == 0 then
            f:close()
            return buf:sub(1, i - 1)
          end
        else
          break
        end
      until line_number == 0
      buf = buf:sub(i + 1)
      i = 0
    end
    f:close()
    return nil
  end
  
  
  zilog("`9All Code Has Been Set, Enjoy !") 
  
  function find(a, type)
    zilog("Searching for : - > " .. a)
    itemnamed = ""
    if type == "name" then
     local found = false
     for i = 1,#database do
      if database[i]:gsub(" ", ""):lower():find(a:gsub(" ", ""):lower()) then 
       if database[i]:gsub(" ", ""):lower():find(a:gsub(" ", ""):lower()) then
       itemnamed = ("Item named : " .. database[i] .. " Id : " .. (i - 1))    
       found = true
       break
       end
      end
     end
     if not found then
      zilog("Item not found")
     else
      zilog(itemnamed)
     end
    end
   end

   function navigateToPos(x, y)
    FindPath(x, y)
    Sleep(1000)
    collect(2)
    Sleep(500)
end


local function commq(type, packet)


 emotes = {"(sleep)", "(punch)", "(bheart)", "(cry)", "(party)", "(oops)", "(sigh)", "(mad)", "(smile)", "(tongue)", "(wow)", "(no)", "(shy)", "(wink)", "(music)", "(lol)", "(yes)", "(love)", "(megaphone)", "(heart)", "(cool)", "(kiss)", "(agree)", "(see-no-evil)", "(dance)", "(build)"}
 numduar = {"`1", "`3", "`4", "`e", "`c", "`5", "`7", "`8", "`9"}
if packet:find("action|input\n|text|") then
         randomNumduar = numduar[math.random(1, #numduar)]
         textduar = packet:gsub("action|input\n|text|", "")
         randomEmoteduar = emotes[math.random(1, #emotes)]
        if textduar:sub(1, 1) == "/" then
        LogToConsole("`w[`9COMMANDS INPUT `w] : " .. textduar)
    else
        if moder == true then
        SendPacket(2, "action|input\n|text|".. randomNumduar .. randomEmoteduar .." : ".. textduar)
        elseif modec == true then
        SendPacket(2, "action|input\n|text|`".. cmode .. textduar)
        else
        SendPacket(2, "action|input\n|text|".. textduar)
        end
        return true
    end
end

if packet:find("action|dialog_return\ndialog_name|") then
    local id = tonumber(packet:match("item_drop|(%d+)"))
    local cn = tonumber(packet:match("item_count|(%d+)"))
    if id and cn then
        local nem = GetItemInfo(id).name
        SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. cn .. " `9" .. nem)
        SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. id .."|\nitem_count|"..cn)
        return true
    end
end


if (type == 2 and packet:find("/vend")) then
vend()
return true
end

if (type == 2 and packet:find("/csn")) then
qazino()
return true
end


if (type == 2 and packet:find("/proxy")) then
proxy_menu()
return true 
end


if (type == 2 and packet:find("/gscan")) then
growscan(packet:sub(packet:find("/gscan") + 7))
return true
end

if (type == 2 and packet:find("/auto")) then
auto()
return true
end

if (type == 2 and packet:find("/wr")) then
wrench()
return true
end

if (type == 2 and packet:find("/dablek")) then
if findItem(11550) > 0 then
SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. 11550 .."|\nitem_count|"..findItem(11550))
return true
end
end

---------------------
if (type == 2 and packet:find("/dabgl")) then
if findItem(7188) > 0 then
SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. 7188 .."|\nitem_count|"..findItem(7188))
return true
end
end

if (type == 2 and packet:find("/dadl")) then
if findItem(1796) > 0 then
SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. 1796 .."|\nitem_count|"..findItem(1796))
return true
end
end

if (type == 2 and packet:find("/setsave")) then
        zilog("World Save setted to : `2" .. packet:sub(packet:find("/setsave") + 9))
        worldsave = packet:sub(packet:find("/setsave") + 9)
return true
end

if (type == 2 and packet:find("/setspam")) then
        zilog("Spam text setted to : `2" .. packet:sub(packet:find("/setspam") + 9))
        spamtext = packet:sub(packet:find("/setspam") + 9)
return true
end

if (type ==2 and packet:find("/setdelay")) then
        zilog("Spam delay setted to : `2" .. packet:sub(packet:find("/setdelay") + 10))
        sdelay = packet:sub(packet:find("/setdelay") + 10)
return true
end

if (type == 2 and packet:find("/drop")) then
local chat = packet:gsub("action|input\n|text|", "")
local amountStr = chat:sub(6)
local amount, unit = amountStr:match("(%d+)%s*(%a+)")
cdrop(amount, unit)
return true
end


if (type == 2 and packet:find("/wl")) then
local amount = packet:match("action|input\n|text|/wl(%s%d+)")
cdrop(amount, "wl")
return true
end

if (type == 2 and packet:find("/dl")) then
local amount = packet:match("action|input\n|text|/dl(%s%d+)")
cdrop(amount, "dl")
return true
end

if (type == 2 and packet:find("/bgl")) then
local amount = packet:match("action|input\n|text|/bgl(%s%d+)")
cdrop(amount, "bgl")
return true
end

if (type == 2 and packet:find("/bbgl")) then
local amount = packet:match("action|input\n|text|/bbgl(%s%d+)")
cdrop(amount, "bbgl")
return true
end

if (type == 2 and packet:find("buttonClicked|changenow")) then
    sdelay = packet:match("sdelay|(%d+)")
    spamtext = packet:match("spamtextjir|(%S*)")
    zilog("Spam delay setted to : `2" .. sdelay)
    zilog("Spam text setted to : `2" .. spamtext)
    return true
end

if (type == 2 and packet:find("/startspam") or packet:find("buttonClicked|startspam")) then
if spamming then
 spamming = false
else 
 spamming = true
end

RunThread(function()
        setspam()
end)

return true
end

if (type == 2 and packet:find("/stopspam")) then
    spamming = false
    RemoveHook("RunThread")
    zilog("`4Spam stopped")
    return true
end

if (type == 2 and packet:find("/spam")) then
    spammer()
end

if (type == 2 and packet:find("/cv")) then
    convertdl()
    return true
end

if (type ==2 and packet:find("/blink")) then
        if blink then
                blink = false
        else
                blink = true
        end
RunThread(function()
        blinks()
end)
return true
end

local fd = false
if (type == 2 and packet:find("/fd")) then
    if fd == false then
        noblockdia = true
    overlayText("`9Fast Drop `2On!")
    SendPacket(2, "action|dialog_return\ndialog_name|cheats\n|check_fastdrop|1")
    else
    SendPacket(2, "action|dialog_return\ndialog_name|cheats\n|check_fastdrop|0")
end
end

if (type ==2 and packet:find("/setplayer")) then
zilog("Fast Roulette name changed to : `2" .. packet:find("/setplayer") + 10)
playernama = packet:find("/setplayer") + 10
return true
end

if (type ==2 and packet:find("/set1")) then
pos1x, pos1y = GetLocal().pos.x//32 , GetLocal().pos.y//32
zilog("Pos setted to : " .. GetLocal().pos.x//32 .. "," .. GetLocal().pos.y//32 )
return true
end
if (type ==2 and packet:find("/set2")) then
pos2x, pos2y = GetLocal().pos.x//32 , GetLocal().pos.y//32
zilog("Pos setted to : " .. GetLocal().pos.x//32 .. "," .. GetLocal().pos.y//32 )
return true
end
if (type ==2 and packet:find("/set3")) then
pos3x, pos3y = GetLocal().pos.x//32 , GetLocal().pos.y//32
zilog("Pos setted to : " .. GetLocal().pos.x//32 .. "," .. GetLocal().pos.y//32 )
return true
end
if (type ==2 and packet:find("/set4")) then
pos4x, pos4y = GetLocal().pos.x//32 , GetLocal().pos.y//32
zilog("Pos setted to : " .. GetLocal().pos.x//32 .. "," .. GetLocal().pos.y//32 )
return true
end

if (type ==2 and packet:find("/w1")) then
FindPath(pos1x, pos1y)
local amountStr = packet:sub(6)
local amount, unit = amountStr:match("(%d+)%s*(%a+)")
cdrop(amount, unit)
SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9".. unit)
return true
end


if (type ==2 and packet:find("/w2")) then
FindPath(pos2x, pos2y)
local amountStr = packet:sub(6)
local amount, unit = amountStr:match("(%d+)%s*(%a+)")
cdrop(amount, unit)
SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9".. unit)
return true
end


if (type ==2 and packet:find("/w3")) then
FindPath(pos3x, pos3y)
local amountStr = packet:sub(6)
local amount, unit = amountStr:match("(%d+)%s*(%a+)")
cdrop(amount, unit)
SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9".. unit)
return true
end


if (type ==2 and packet:find("/w4")) then
FindPath(pos4x, pos4y)
local amountStr = packet:sub(6)
local amount, unit = amountStr:match("(%d+)%s*(%a+)")
cdrop(amount, unit)
SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `4Dropped `w" .. amount .. " `9".. unit)
return true
end

if (type ==2 and packet:find("/take")) then
RunThread(function()
    if (pos1x and pos1y and pos2x and pos2y and pos3x and pos3y and pos4x and pos4y) then
        if (pos1x ~= 0 and pos1y ~= 0) then
            navigateToPos(pos1x, pos1y)
        end
        if (pos2x ~= 0 and pos2y ~= 0) then
            navigateToPos(pos2x, pos2y)
        end
        if (pos3x ~= 0 and pos3y ~= 0) then
            navigateToPos(pos3x, pos3y)
        end
        if (pos4x ~= 0 and pos4y ~= 0) then
            navigateToPos(pos4x, pos4y)
        end
    end
end)
end


if (type == 2 and packet:find("/save")) then
        siviworld = packet:find("/save") + 6
        if (siviworld == nil) or (siviworld == "") or (siviworld == " ") then
         if saveworld ~= nil or saveworld ~= " " or saveworld ~= "" then
                 RunThread(function()
          zilog("Warping to world : `2" .. saveworld)
          Sleep(2000)
          SendPacket(3, ("action|join_request\nname|%s\ninvitedWorld|0"):format(saveworld))
          Sleep(4000)
                end)
         end
        else
                saveworld = siviworld:upper()
                zilog("Save world changed to : `9" .. saveworld)
        end
        return true
end

if (type == 2 and packet:find("/cs")) then
RunThread(function()
cs()
end)
return true
end

if (type == 2 and packet:find("/item")) then
add_item()
return true
end

if (type == 2 and packet:find("/add")) then
added(addiditem,addcountitem)
return true
end

if (type == 2 and packet:find("/ss")) then
ss = [[
qast = ]] .. tostring(qast) .. [[;
aban = ]] .. tostring(aban) .. [[;
apull = ]] .. tostring(apull) .. [[;
wrenchban =]].. tostring(wrenchban) .. [[;
wrenchpull = ]].. tostring(wrenchpull) .. [[;
wrenchkick = ]].. tostring(wrenchkick) .. [[;
cdropping = ]].. tostring(cdropping) .. [[;
blink = ]].. tostring(blink) .. [[;
fadd = ]]..tostring(fadd)..[[;
fempty = ]] ..tostring(fempty).. [[;
fastdice = ]] ..tostring(fastdice)..[[;
fastroulette =]] .. tostring(fastroulette)..[[;
msgspamming = ]] .. tostring(msgspamming)..[[;
count = ]].. tostring(count) .. [[;
acount = ]].. tostring(acount) .. [[;
sdelay = ]].. tostring(sdelay) .. [[;
spamtext = ']] .. tostring(spamtext) ..[[';
saveworld = ']] .. tostring(saveworld) ..[[';
playernama = ']] .. tostring(playernama) .. [[';
pos1x, pos1y = ]] .. pos1x .. ',' .. pos1y ..[[;
pos2x, pos2y = ]] .. pos2x .. ',' .. pos2y ..[[;
pos3x, pos3y = ]] .. pos3x .. ',' .. pos3y ..[[;
pos4x, pos4y = ]] .. pos4x .. ',' .. pos4y ..[[;
clotheauto = ]] .. tostring(clotheauto) .. [[;
hatint, patint ,shirtint ,wingint ,shoeint ,handint, maskint, faceint, neckint , ancesint = ]] .. hatint .. ',' .. patint .. ',' .. shirtint .. ',' .. wingint .. ',' .. shoeint .. ',' .. handint .. ',' .. maskint .. ',' .. faceint .. ',' .. neckint .. ',' .. ancesint .. [[;
]]
logqw(ss, "settings.txt")
return true
end

if (type == 2 and packet:find("/ls")) then
dofile("settings.txt")
return true
end

if (type ==2 and packet:find("/fast")) then
fasting()
        return true
end
if (type == 2 and packet:find("/finditemname")) then
id = packet:find("/finditemname") + 14

RunThread(function()
find(id , "name")
end)
return true
end

if (type == 2 and packet:find("/cmd")) then
    allcmd()
end



if (type == 2 and packet:find("/startmsgpam")) then
if not msgspamming then
                msgspamming = true;zilog("Started")
else
                msgspamming = false;zilog("Closed")
end
return true
end
if (type == 2 and packet:find("/clothe")) then
visualclothe()
return true
end
if (type == 2 and packet:find("/change")) then
        change_clothes()
        return true
end
if (type == 2 and packet:find("buttonClicked|wrenchban")) then
    if isifban == "`4Off" then
    isifkick = "`4Off"
    isifpull = "`4Off"
    isifban = "`2On"
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Fast Ban `2On!")
    noblockdia = true
    wrenchban = true
    wrenchpull = false
    wrenchkick = false
else
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Fast Ban `4Off!")
    isifban = "`4Off"
    noblockdia = false
    wrenchban = false
end
end
if (type == 2 and packet:find("buttonClicked|wrenchkick")) then
    if isifkick == "`4Off" then
    isifpull = "`4Off"
    isifban = "`4Off"
    isifkick = "`2On"
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Fast Kick `2On!")
    noblockdia = true
    wrenchkick = true
    wrenchpull = false
    wrenchban = false
else
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Fast Kick `4Off!")
    isifkick = "`4Off"
    noblockdia = false
    wrenchkick = false
end
end
if (type == 2 and packet:find("buttonClicked|wrenchpull")) then
    if isifpull == "`4Off" then
    isifpull = "`2On"
    isifban = "`4Off"
    isifkick = "`4Off"
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Fast Pull `2On!")
    noblockdia = true
    wrenchpull = true
    wrenchban = false
    wrenchkick = false
else
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Fast Pull `4Off!")
    isifpull = "`4Off"
    noblockdia = false
    wrenchpull = false
end
end

if (type == 2 and packet:find("buttonClicked|cekspin")) then
    if isiceksp == "`4Off" then
    cekspin = true
    isiceksp = "`2On"
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Cek Spin `2On!")
    hostmenu()
else
    cekspin = false
    isiceksp = "`4Off"
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Cek Spin `4Off!")
    hostmenu()
end
end

if (type == 2 and packet:find("buttonClicked|hostmodeon")) then
    if isihostm == "`4Off" then
    noblockdia = true
    isihostm = "`2On"
    hostmode = true
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Host mode `2On!")
    wrenchpull = true
    if pulltextya == true then
        pulltext = packet:match("pulltext|([^\n]+)")
        zilog("Pull text setted to : `2" .. pulltext)
    else
        pulltext = ""
        zilog("Pull text `4not setted")
    end
else
    noblockdia = false
    wrenchpull = false
    isihostm = "`4Off"
    isiptext = "`4Off"
    hostmode = false
    pulljir = false
    pulltextya = false
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Host mode `4Off!")
    pulltext = ""
    zilog("Pull text setted to : `4NIL")
    hostmenu()
end
end

if (type ==2 and packet:find("buttonClicked|pulltextya")) then
    if isiptext == "`4Off" then
    isiptext = "`2On"
    pulltextya = true
    pulljir = true
    hostmenu()
    else
    isiptext = "`4Off"
    pulljir = false
    pulltextya = false
    hostmenu()
    end
end


if (type ==2 and packet:find("aban|1")) then
                aban = true
if apull then
apull = false; zilog("Auto pull closed")
end
end

if (type == 2 and packet:find("aban|0")) then
        aban = false
end

if (type == 2 and packet:find("apull|0")) then
        apull = false
end

if (type == 2 and packet:find("apull|1")) then
        apull = true
if aban then
aban = false; zilog("Auto ban closed")
end
end

if (type ==2 and packet:find("zivend|1")) then
                qast = true
            count = packet:match("zicount|(%d+)")
end

if (type == 2 and packet:find("zivend|0")) then
        qast = false
            count = packet:match("zicount|(%d+)")
end

if (type == 2 and packet:find("clotheint")) then
hatint = packet:match("hatint|(%d+)")
patint = packet:match("patint|(%d+)")
shirtint = packet:match("shirtint|(%d+)")
wingint = packet:match("wingint|(%d+)")
shoeint = packet:match("shoeint|(%d+)")
handint = packet:match("handint|(%d+)")
maskint = packet:match("maskint|(%d+)")
faceint = packet:match("faceint|(%d+)")
neckint = packet:match("neckint|(%d+)")
ancesint = packet:match("ancesint|(%d+)")
end

if (type == 2 and packet:find("addItem")) then
addiditem = packet:match("addiditem|(%d+)")
addcountitem = packet:match("addcountitem|(%d+)")
end

if (type == 2 and packet:find("buttonClicked|Ziroi")) then
    return true
end
if (type == 2 and packet:find("buttonClicked|hostermenu")) then

addButton("hostermenu", "Hoster")
addSpacer("small")
addButton("visualmenu", "Visual")
addSpacer("small")
addButton("fastmenu", "Fast Things")
addSpacer("small")
addButton("othermenu", "Other Things")

casino_menu("hoster_command")
return true
end

if (type == 2 and packet:find("/hoster")) then
    hostmenu()
end

if (type == 2 and packet:find("buttonClicked|modec")) then
    if isimodec == "`4Off" then
    isimodec = "`2On"
    moder = false
    cmode = packet:match("cmode|(.)")
    zilog("Color Chat setted to : `" .. cmode .. "Color")
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Custom Chat `2On!")
    else
    isimodec = "`4Off"
    moder = false
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `9Custom Chat `4Off!")
    chatmenu()
    end
    return true
end

if (type == 2 and packet:find("buttonClicked|moder")) then
    if isimoder == "`4Off" then
    isimoder = "`2On"
    moder = true
    zilog("Color Chat setted to : `1R`2a`3n`4d`5o`6m")
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `1R`2a`3n`4d`5o`6m `7C`8h`9a`0t `2On!")
    else
    isimoder = "`4Off"
    moder = false
    SendPacket(2, "action|input\n|text|`c[`b@Ziroi `9Proxy`c] `1R`2a`3n`4d`5o`6m `7C`8h`9a`0t `4Off!")
    chatmenu()
    end
    return true
end

if (type == 2 and packet:find("/chat")) then
    chatmenu()
end

if (type == 2 and packet:find("buttonClicked|posinf")) then
    posinf()
    return true
end

  if (type == 2 and packet:find("buttonClicked|spammer")) then
    spammer()
    return true
end

if (type == 2 and packet:find("buttonClicked|chatex")) then
    chatmenu()
    return true
end

if (type == 2 and packet:find("buttonClicked|wrench")) then
  wrench()
  return true
end

if (type == 2 and packet:find("buttonClicked|bproxy")) then
  proxy_menu()
  return true
end

if (type == 2 and packet:find("buttonClicked|allcmd")) then
    allcmd()
    return true
end

if (type == 2 and packet:find("buttonClicked|bankmenu")) then
  bankmenu()
  return true
end

if (type == 2 and packet:find("buttonClicked|wrmenu")) then
  wrmenu()
  return true
end

if (type == 2 and packet:find("buttonClicked|hostmenu")) then
  hostmenu()
  return true
end

if (type == 2 and packet:find("buttonClicked|bank")) then
  SendPacket(2, "action|dialog_return\ndialog_name|popup\nbuttonClicked|bgls")
  return true
end

if (type == 2 and packet:find("buttonClicked|visualmenu")) then
casino_menu("visual_command")
return true
end

if (type == 2 and packet:find("buttonClicked|fastmenu")) then
casino_menu("fast_command")
return true
end

if (type == 2 and packet:find("buttonClicked|othermenu")) then
    casino_menu("other_command")
    return true
end
if (type ==2 and packet:find("fasttake|0")) then
fempty = false
end
if (type == 2 and packet:find("fasttake|1")) then
        if fadd then fadd = false; end
fempty = true
end
if (type == 2 and packet:find("fadd|0")) then
        fadd = false
end
if(type ==2 and packet:find("fadd|1")) then
        if fempty then fempty = false; end
        fadd = true
end
if (type ==2 and packet:find("fastdice|0")) then
        fastdice=false
end
if (type ==2 and packet:find("fastdice|1")) then
        fastdice = true
end
if (type ==2 and packet:find("fastroulette|0")) then
        fastroulette = false
end
if (type == 2 and packet:find("fastroulette|1")) then
        fastroulette = true
end

if (type == 8) then
if fastdice then
dice = tostring(packet.count2 + 1)
MessageBox("Ziroi ; )  " .. os.date("%X") , 'You will get ' .. dice) --not working for now :(
end
end

return false
end
    
AddHook("onsendpacket", "packet", commq)
AddHook("onvariant", "hook", hook)
