
 -- configuration 
 local proxy = {} 
 local command = {} 
 local user = {} 
 local config = {} 
 proxy.dev = "9mocha." 
 proxy.name = "Mochas Proxy" 
 proxy.version = "v1.2" 
 proxy.support = "undefined" 
 proxy.password = "1" 
 proxy.error = "`4[ERROR]`` " 
 proxy.log = "`2[Mochas Proxy]`` " 
 proxy.logn = "`6[Mochas Proxy]`` " 
 proxy.errlogin = "Please login to use the proxy. - /login [password]" 
  
  
 -- main user vars 
 user.haslogin = false 
  
  
 -- comamnd vars
 command.var = {} 
 command.var.test = "hello" 
 command.var.invis = false 
 command.var.gforg = false
 command.var.wrenchpull = false
 command.var.savedworld = false
 command.var.rfspin = true
 
  
  
 -- config vars 
 config.lang = "en"
 
 -- checkbox vars
 local gforgg
 local drtitle
 local mod
 local rfspin = true
 local wrenchp
 local wrenchk
 local reme
 local qeme
 
 
  
  
 -- custom funcs 
 function errc(str) 
   LogToConsole(proxy.error .. str) 
 end 
  
 function plog(str) 
   LogToConsole(proxy.log .. str) 
 end 
  
 function plogn(str) 
   LogToConsole(proxy.logn .. str) 
 end 
  
 function user_changename(name) 
   SendVariant({ 
           [0] = "OnNameChanged", 
       [1] = name, 
   }, GetLocal().netid, 100) 
 end 
  
 function user_oninvis() 
   SendVariant({ 
     [0] = "OnSetClothing", 
     [1] = {0,0,0}, 
     [2] = {0,0,0}, 
     [3] = {0,0,0}, 
     [4] = 2, 
     [5] = {0, 0, 0}, 
   },GetLocal().netid,100) 
 end 
  
 function user_deinvis() 
   SendVariant({ 
     [0] = "OnSetClothing", 
     [1] = {0,0,0}, 
     [2] = {0,0,0}, 
     [3] = {0,0,0}, 
     [4] = -1, 
     [5] = {0, 0, 0}, 
   },GetLocal().netid,100) 
 end 
  
 function user_skincolor(num) 
   SendVariant({ 
     [0] = "OnSetClothing", 
     [1] = {0,0,0}, 
     [2] = {0,0,0}, 
     [3] = {0,0,0}, 
     [4] = num, 
     [5] = {0, 0, 0}, 
   },GetLocal().netid,100) 
 end 
  
 function user_ong4g() 
   SendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|donor", 
   },GetLocal().netid) 
 end 
  
 function user_deg4g() 
   SendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|tr", 
   },GetLocal().netid) 
 end
 
 function dropLock(id, amount) 
     for _,item in pairs(GetInventory()) do 
         if item.id == 242 or item.id == 1796 then 
             if item.amount < amount then 
                 if id == 242 then 
                     SendPacketRaw(false,{ 
                         type = 10, 
                         value = 1796, 
                     }) 
                 SleepMS(200) 
                 elseif id == 1796 then 
                     SendPacketRaw(false,{ 
                         type = 10, 
                         value = 242, 
                     }) 
                 SleepMS(200) 
                 end 
             end 
         end 
     end 
     SendPacket(2, "action|drop\n|itemID|" .. id) 
     SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. id .. "|\ncount|" .. amount) 
 end 
  
 function showHelp() 
   SendVariant({ 
           [0] = "OnDialogRequest", 
       [1] = help, 
   }, -1, 100) 
 end 
  
 function sendVisualMessage(str) 
   SendVariant({ 
           [0] = "OnTalkBubble", 
       [1] = str, 
   }, -1, 100) 
 end 
  
 function GetRealName(id)
    for _, g in pairs(GetPlayerlist()) do
        if g.netid == id then
            return g.name
        end
    end
end

function GetName(id)
    for _, name in pairs(PlayerList) do
        if name.netid == id then
            return name.name
        end
    end
end
 
 function multiboxChecker(boolean)
    local hasil = ""
    if boolean then
        hasil = "1"
        else
            hasil = "0"
    end
    return hasil
 end
 
 function tOverlay(str)
   SendVariant({
   	[0] = "OnTextOverlay",
       [1] = str,
   }, GetLocal().netid)
 end
 
 function qemefunc(number)
    if number >= 10 then
        hasil = string.sub(number, -1)
    else
        hasil = number
    end
    return hasil
end

function getGame(num)
    if reme and not qeme then
        return "`2[R:"..remefunc(tonumber(num)).."]"
    elseif not reme and qeme then
            return "`2[Q:"..qemefunc(tonumber(num)).."]"
    elseif reme and qeme then
            return "`2[R:"..remefunc(num).." and Q:"..qemefunc(num).."]"
            else
                return ""
    end
end

function remefunc(number)
    if number == 19 or number == 28 or number == 0 then
        hasil = 0
    else
        num1 = math.floor(number / 10)
        num2 = number % 10
        hasil = string.sub(tostring(num1 + num2), -1)
    end
    return hasil
end
 
 
 
 
  
  
 -- DIALOGS 
help = string.format([[ 
set_default_color|`7 
add_label_with_icon|big|`2[Mochas Proxy]`` Commands Gazette              |left|5016| 
add_spacer|small| 
add_label_with_icon|small|`3Commands:|left|32| 
add_textbox|`6/cname`` [changes your nickname]|| 
add_textbox|`6/invis`` [you become invisible]|| 
add_textbox|`6/scolor`` [you change your skin color]|| 
add_textbox|`6/wd`` [drop wl (if u have)]|| 
add_textbox|`6/dd`` [drop dl (if u have)]|| 
add_textbox|`6/bd`` [drop bgl (if u have)]||
add_textbox|`6/w`` [warping world]||
add_textbox|`6/save`` [Saves the world name you are in (warping system)]||
add_textbox|`6/back`` [You warp into the world you saved]||
add_textbox|`6/relog`` [re-login]||
add_spacer|big|
add_label_with_icon|big|`6Other:|left|32|
add_button|proxywrenchm|`wExtra Cheats|
add_spacer|small| 
add_smalltext|ı Thanks for using `#Mochas Proxy``| 
add_smalltext|Coded by `6@9mocha ``- `3[DISCORD]: ``9mocha.| 
add_spacer|big| 
add_quick_exit||| 
end_dialog|proxymenu|Close||
]])

loginp = string.format([[
set_default_color|`7
add_label_with_icon|big|`2[Mochas Proxy]`` Login Page|left|2|
add_spacer|big|
add_textbox|`6/login [password]|
add_spacer|small|
end_dialog|loginpend||Thanks|
]])

cr = string.format([[
set_default_color|`7
add_label_with_icon|big|`2[Mochas Proxy]`` Contributors          |left|32|
add_spacer|big|
add_textbox|- 9mocha. `6[LEAD]||
add_textbox|- psy0 `6[STAFF]||
add_spacer|small|
end_dialog|proxycredits|Close||
]])


  
  
  
 -- PROXY MAIN 
 AddHook("OnTextPacket", "on_events", function(type, packet) 
   clog = "action|input\n|text|" 
  
   -- /login command 
   if packet:find("/login") then 
     if user.haslogin == false then 
     str = packet:gsub("action|input\n|text|/login ", "") 
     if str == "" then 
       errc("Please enter the proxy password - /login [password]") 
     else if str == proxy.password then 
       user.haslogin = true 
       plog("You are logged in! welcome "..GetLocal().name)

     else 
       errc("Invalid password..") 
     end 
     end 
     else 
       errc("You are already logged in.") 
     end 
     return true 
   end 
  
  
  -- checkboxs
  if user.haslogin == true then
  if packet:find("g4gt|0") then
    gforgg = false
    SendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|tr", 
   },GetLocal().netid) 
  else if packet:find("g4gt|1") then
    gforgg = true
    SendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|donor", 
   },GetLocal().netid) 
    plog("Grow4Good title `2enabled.")
  end
  end
  if packet:find("drt|1") then
    drtitle = true
    plog("`4Dr. ``title `2enabled.")
    SendVariant({
            [0] = "OnNameChanged",
            [1] = "Dr."..GetLocal().name,
        },GetLocal().netid)
        SendVariant({
            [0] = "OnCountryState",
            [1] = "jp|doctor",
        },GetLocal().netid)
        
  else if packet:find("drt|0") then
    drtitle = false
    nick = GetLocal().name
    SendVariant({
            [0] = "OnNameChanged",
            [1] = nick:gsub("Dr%.", ""),
        },GetLocal().netid)
        SendVariant({
            [0] = "OnCountryState",
            [1] = "id|tr",
        },GetLocal().netid)
  end
  end
  if packet:find("mdetect|1") then
    mod = true
    plog("Invisible moderator detection `2enabled.")
  else if packet:find("mdetect|0") then
    mod = false
  end
  end
  if packet:find("realfakespin|1") then
    rfspin = true
    plog("`2REAL``-`4FAKE`` spin detection `2enabled.")
  else if packet:find("realfakespin|0") then
    rfspin = false
  end
  end
  if packet:find("wrenchpmode|1") then
    wrenchp = true
    plog("Wrench pull `2enabled.")
  else if packet:find("wrenchpmode|0") then
    wrenchp = false
  end
  end
  if packet:find("wrenchkmode|1") then
    wrenchk = true
    plog("Wrench kick `2enabled.")
  else if packet:find("wrenchkmode|0") then
    wrenchk = false
  end
  end
  if packet:find("gamereme|1") then
    reme = true
    plog("Reme checker `2enabled")
  else if packet:find("gamereme|0") then
    reme = false
  end
  end
  if packet:find("gameqeme|1") then
    qeme = true
    plog("Qeme checker `2enabled")
  else if packet:find("gameqeme|0") then
    qeme = false
  end
  end
  
  
  
  
  end -- user.haslogin
  
  
  
   -- /proxy command 
   if packet:find("/proxy") then 
     if user.haslogin == true then 
       showHelp() 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
   if packet:find("buttonClicked|listcommand") then
         if user.haslogin == true then
         SendVariant({ 
             [0] = "OnDialogRequest", 
             [1] = help, 
         },-1,100)
         else
         errc(proxy.errlogin)
         end
         return true 
   end
   if packet:find("buttonClicked|proxycredits") then
     SendVariant({
     	[0] = "OnDialogRequest",
         [1] = cr,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxyuserdetail") then
     SendVariant({
     	[0] = "OnDialogRequest",
         [1] = pudetails,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxywrenchm") then
     gforg = multiboxChecker(gforgg)
     drt = multiboxChecker(drtitle)
     modd = multiboxChecker(mod)
     realfakes = multiboxChecker(rfspin)
     wrenchpull = multiboxChecker(wrenchp)
     wrenchkick = multiboxChecker(wrenchk)
     remeg = multiboxChecker(reme)
     qemeg = multiboxChecker(qeme)
     
     SendVariant({
     	[0] = "OnDialogRequest",
         [1] = [[
add_label_with_icon|big|``Extra Cheats       |left|32|
add_spacer|big|
add_checkbox|g4gt|Grow4Good Title|]]..gforg..[[|
add_checkbox|drt|`4Dr.`` Title|]]..drt..[[|
add_checkbox|mdetect|Invisible Moderator Detection|]]..modd..[[|
add_checkbox|realfakespin|`2REAL``-`4FAKE`` Spin Detection|]]..realfakes..[[|
add_checkbox|gamereme|Reme Checker|]]..remeg..[[|
add_checkbox|gameqeme|Qeme Checker|]]..qemeg..[[|
add_checkbox|wrenchpmode|Wrench Pull|]]..wrenchpull..[[|
add_checkbox|wrenchkmode|Wrench Kick|]]..wrenchkick..[[|
add_spacer|small|
add_smalltext|`6Other features soon..|
add_spacer|big|
end_dialog|proxywrenchend|Close|Set|
]],
     }, -1, 500)
   end
  
  
   -- /cname command 
   if packet:find("/cname (.+)") then 
     if user.haslogin == true then 
       user_changename(packet:match("/cname (.+)")) 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /invis command 
   if packet:find("/invis") then 
     if user.haslogin == true then 
       if command.var.invis == false then 
         user_oninvis() 
         command.var.invis = true 
         plog("Invisible mode `2enabled") 
       else if command.var.invis == true then 
         command.var.invis = false 
         user_deinvis() 
         plog("Invisible mode `4disabled") 
       end 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /scolor command 
   if packet:find("/scolor") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/scolor", "") 
       if str == "" then 
         errc("Please enter the skin color - /scolor [number]") 
       else 
         user_skincolor(str) 
         plog("Changed skin color `2ID: "..str) 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /wd command 
   if packet:find("/wd") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/wd", "") 
       if str == "" then 
         errc("Please enter the amount to drop") 
       else 
         SendPacket(2, "action|drop\n|itemID|242") 
         SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|242|\ncount|"..str) 
         plog("dropped `0"..str.." `0World Lock") 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /dd command 
   if packet:find("/dd") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/dd", "") 
       if str == "" then 
         errc("Please enter the amount to drop") 
       else 
         SendPacket(2, "action|drop\n|itemID|1796") 
         SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|1796|\ncount|"..str) 
         plog("dropped `0"..str.." `0Diamond Lock") 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /bd command 
   if packet:find("/bd") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/bd", "") 
       if str == "" then 
         errc("Please enter the amount to drop") 
       else 
         SendPacket(2, "action|drop\n|itemID|7188") 
         SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|7188|\ncount|"..str) 
         plog("dropped `0"..str.." `0Blue Gem Lock") 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end
   
   
   -- /w command
   if packet:find("/w (.+)") then
     if user.haslogin == true then
       SendPacket(3, "action|join_request\nname|"..packet:match("/w (.+)").."\ninvitedWorld|0")
       tOverlay("Warping to `2"..packet:match("/w (.+)"))
       plog("Warping to `w"..packet:match("/w (.+)"))
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /save & /back command
   if packet:find("/save") then
     if user.haslogin == true then
       command.var.savedworld = GetWorld().name
       plog("World saved `w"..GetWorld().name)
     else
       err(proxy.errlogin)
     end
     return true
   end
   if packet:find("/back") then
     if user.haslogin == true then
       SendPacket(3, "action|join_request\nname|"..command.var.savedworld.."\ninvitedWorld|0")
       plog("Warping to `w"..command.var.savedworld)
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /relog command 
   if packet:find("/relog") then
     if user.haslogin == true then
       SendPacket(3, "action|quit")
       plog("Reloged.")
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   
   -- -- -- -- ( WRENCH MODES ) -- -- -- --
   -- pull
   if wrenchp == true then
   if packet:find("action|wrench\n|netid|(%d+)") then
     netid = packet:match("action|wrench\n|netid|(%d+)")
     if netid ~= GetLocal().netid then
       SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..netid.."|\nbuttonClicked|pull")
       return true
     end
   end
   end
   
   -- kick
   if wrenchk == true then
   if packet:find("action|wrench\n|netid|(%d+)") then
     netid = packet:match("action|wrench\n|netid|(%d+)")
     if netid ~= GetLocal().netid then
       SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..netid.."|\nbuttonClicked|kick")
       return true
     end
   end
   end
  
   
  
  
  
   return false 
end)
  
  
  
  
  
 -- ON_VARIANT 
 AddHook("OnVarlist", "variants", function(var) 
   if user.haslogin == true then 
     varcontent = var[1] 
     if var[0] == "OnConsoleMessage" then 
       plogn(varcontent) 
       return true 
     end
   end
  
  
     if var[0] == "OnDialogRequest" and var[1]:find("end_dialog|socialportal") then 
         SendVariant({ 
             [0] = "OnDialogRequest", 
             [1] = var[1]:gsub("(add_button|trade_history|`wTrade History``|noflags|0|0|)", "%1\nadd_button|listcommand|`2[Mochas Proxy]`w Commands Gazette|\nadd_button|proxycredits|`2[Mochas Proxy]`w Contributors|\nadd_url_button||`2[Mochas Proxy]`` Discord Server|NOFLAGS|https://discord.gg/Aj9UDmhz9b|Go Discord Link?|0|0|"), 
         },-1,100) 
         return true 
     end
     
     
     if var[0] == "OnDialogRequest" and var[1]:find("drop_item") then
        if var[1]:find("World Lock") or var[1]:find("Diamond Lock") or var[1]:find("Blue Gem Lock") then
            return true
        end
    end
    
    
    if mod == true then
      if var[1] == "OnSpawn" then
        if var[2] == "invis|1" then
          plog("Invisible `#@Moderator`` Joined!!")
          SendVariant({
          	[0] = "OnTextOverlay",
              [1] = "`4[WARNING] `w INVISIBLE `#@MODERATOR `wJOINED",
          }, GetLocal().netid)
        end
      end
    end
    
    
    if rfspin == true then
      if var[0] == "OnTalkBubble" then
        if var[2]:find("spun the wheel") then
          local fakem = "CT:"
          if var[2]:find(fakem) then
            SendVariant({
            	[0] = "OnTalkBubble",
                [1] = var[1],
                [2] = "`7[ `4FAKE`` ] " .. var[2]:match("player_chat=(.+)"),
            }, -1)
            return true
          else
            local num = string.gsub(string.gsub(var[2]:match("and got (.+)"), "!%]", ""), "`", "")
            local onlynumber = string.sub(num, 2)
            local clearspace = string.gsub(onlynumber, " ", "")
            local h = string.gsub(string.gsub(clearspace, "!7", ""), "]", "")
            SendVariant({
            	[0] = "OnTalkBubble",
                [1] = var[1],
                [2] = "`7[ `2REAL`` ] " .. var[2].." "..getGame(tonumber(h)),
                [3] = 0,
            }, -1)
            return true
          end
          return true
        end
      end
      return false
    end
    
    
    
    
    
    
 end) 
  
  
 SendVariant({ 
         [0] = "OnDialogRequest", 
         [1] = loginp, 
 }, -1, 100)
