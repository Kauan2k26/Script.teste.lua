
local arch = gg.getTargetInfo().x64

--cod tabela china edu
function getFloat(b)if b then gg.searchNumber(b,16)if gg.getResultsCount()>0 then a=tonumber(gg.getResults(gg.getResultsCount())[1].value)gg.clearResults()return a end end end;function getDouble(c)if c then gg.searchNumber(c,16)if gg.getResultsCount()>0 then a=tonumber(gg.getResults(gg.getResultsCount())[1].value)gg.clearResults()return a end end end;function getQword(d)if d then gg.searchNumber(d,16)if gg.getResultsCount()>0 then a=tonumber(gg.getResults(gg.getResultsCount())[1].value)gg.clearResults()return a end end end;function getXor(e)if e then gg.searchNumber(e,16)if gg.getResultsCount()>0 then a=tonumber(gg.getResults(gg.getResultsCount())[1].value)gg.clearResults()return a end end end;function SearchGet(f,g,h)if f and g and not h then h=g;g=nil end;if not f then f=gg.REGION_ANONYMOUS else function getRanges(i)if i then rangesIds={{"Jh","gg.REGION_JAVA_HEAP"},{"Ch","gg.REGION_C_HEAP"},{"Ca","gg.REGION_C_ALLOC"},{"Cd","gg.REGION_C_DATA"},{"Cb","gg.REGION_C_BSS"},{"PS","gg.REGION_PPSSPP"},{"A","gg.REGION_ANONYMOUS"},{"J","gg.REGION_JAVA"},{"S","gg.REGION_STACK"},{"As","gg.REGION_ASHMEM"},{"V","gg.REGION_VIDEO"},{"O","gg.REGION_OTHER"},{"B","gg.REGION_BAD"},{"Xa","gg.REGION_CODE_APP"},{"Xs","gg.REGION_CODE_SYS"}}returnRange=nil;for j,k in pairs(rangesIds)do if i:match("|")then if i:match(k[1].." ")or i:match(" "..k[1])then returnRange=returnRange or""returnRange=returnRange:gsub(k[1],k[2])break end else if i==k[1]then returnRange=k[2]break end end end;return returnRange end end;f=getRanges(f)if f then gg.setRanges(load("return "..f)())gg.clearResults()gg.setVisible(false)if g then flagsIds={{"d",gg.TYPE_DWORD},{"f",gg.TYPE_FLOAT},{"e",gg.TYPE_DOUBLE},{"w",gg.TYPE_WORD},{"b",gg.TYPE_BYTE},{"q",gg.TYPE_QWORD},{"x",gg.TYPE_XOR}}for j,k in pairs(flagsIds)do if g==k[1]then g=k[2]end end;if type(g)=="number"then gg.searchNumber(h[1][1],g)count=gg.getResultCount()result=gg.getResults(count)gg.clearResults()data={}base=h[1][2]if count>0 then for j,k in ipairs(result)do k.isUseful=true end;for l=2,#h do tmp={}offset=h[l][2]-base;num=h[l][1]for j,k in ipairs(result)do tmp[#tmp+1]={address=k.address+offset,flags=k.flags}end;tmp=gg.getValues(tmp)for j,k in ipairs(tmp)do if tostring(k.value)~=tostring(num)then result[j].isUseful=false end end end;for j,k in ipairs(result)do if k.isUseful then data[#data+1]={address=k.address,flags=k.flags}end end;if#data>0 then gg.clearList()gg.clearResults()gg.loadResults(data)return data else gg.toast("[ERROR]: não encontrou nenhum resultado na pesquisa.")end else gg.toast("[ERROR]: não encontrou nenhum resultado na pesquisa.")end else gg.alert("[ERROR]: flag não definida!")return end else flagsIds={{"d",gg.TYPE_DWORD},{"f",gg.TYPE_FLOAT},{"e",gg.TYPE_DOUBLE},{"w",gg.TYPE_WORD},{"b",gg.TYPE_BYTE},{"q",gg.TYPE_QWORD},{"x",gg.TYPE_XOR}}for m,j in pairs(h)do for m,k in pairs(flagsIds)do if j[3]==k[1]then j[3]=k[2]end end;if type(h[1][3])~="number"then gg.alert("[ERROR]: flag não definida!")return end end;gg.searchNumber(h[1][1],f[3])count=gg.getResultCount()result=gg.getResults(count)gg.clearResults()data={}base=h[1][2]if count>0 then for j,k in ipairs(result)do k.isUseful=true end;for l=2,#h do tmp={}offset=h[l][2]-base;num=h[l][1]for j,k in ipairs(result)do tmp[#tmp+1]={address=k.address+offset,flags=h[l][3]}end;tmp=gg.getValues(tmp)for j,k in ipairs(tmp)do if tostring(k.value)~=tostring(num)then result[j].isUseful=false end end end;for j,k in ipairs(result)do if k.isUseful then data[#data+1]={address=k.address,flags=k.flags}end end;if#data>0 then gg.clearList()gg.clearResults()gg.loadResults(data)return data else gg.toast("[ERROR]: não encontrou nenhum resultado na pesquisa.")end else gg.toast("[ERROR]: não encontrou nenhum resultado na pesquisa.")end end else gg.alert("[ERROR]: range não definida!")return end end end;function editGet(n,o,p)if n then if o then if p then flagsIds={{"d",gg.TYPE_DWORD},{"f",gg.TYPE_FLOAT},{"e",gg.TYPE_DOUBLE},{"w",gg.TYPE_WORD},{"b",gg.TYPE_BYTE},{"q",gg.TYPE_QWORD},{"x",gg.TYPE_XOR}}for j,k in pairs(flagsIds)do if p==k[1]then p=k[2]end end;if type(p)=="number"then edits={}for m,k in pairs(o)do for m,j in pairs(n)do edits[#edits+1]={address=j.address+k[2],value=k[1],flags=p}end end;gg.setValues(edits)return edits else gg.alert("[ERROR]: flag não definida!")return end else flagsIds={{"d",gg.TYPE_DWORD},{"f",gg.TYPE_FLOAT},{"e",gg.TYPE_DOUBLE},{"w",gg.TYPE_WORD},{"b",gg.TYPE_BYTE},{"q",gg.TYPE_QWORD},{"x",gg.TYPE_XOR}}for m,a in pairs(flagsIds)do for m,q in pairs(o)do if q[3]==a[1]then q[3]=a[2]end end end;if type(o[1][3])~="number"then gg.alert("[ERROR]: flag não definida!")return end;edits={}for m,k in pairs(o)do for m,j in pairs(n)do edits[#edits+1]={address=j.address+k[2],value=k[1],flags=k[3]}end end;gg.setValues(edits)return edits end end end end


 function loop(fun, const)
    gg.setVisible(true)
	while true do
		if gg.isVisible() then
			gg.setVisible(false)
			if fun() == const then
				break
			end
		end
	end
 end



 function Main()
 menu = gg.choice({
                     
                      "❤️ GODMOD",
                      "🔫 ARMAS",
                      "💎 MENU SECUNDÁRIO",
                      "❌ SAIR"}, nil,
 "┏━─────────▄︻̷̿┻̿═━一──────━┓\n               ▬ι═ﺤKAUAN MODS▬ι═ﺤ  \n                       \n                   \n ┗━────────▄︻̷̿┻̿═━一──────━┛\n")



  if menu == 1 then vida() end
  if menu == 2 then weaponchanger() end
  if menu == 3 then loop(menupremium,"prem") end
  if menu == 4 then os.exit() end
  MAINLUA = -1				
 end





 
 


 function weaponchanger()
   if not guns or #guns == 0 then
      weaponbase() -- Carregar dados
   end

   if not guns or #guns == 0 then
      gg.alert("Erro: LoadTP está vazio após tentar carregar.")
      return
   end

   menu = gg.choice({
      "🗡️ Armas Brancas",
      "🔫 Pistolas",
      "🔫 Espingardas",
      "🔫 Submetralhadoras",
      "🔫 Fuzis", 
      "🔫 Rifles",
      "💣Pesadas",
      "🎯 Especiais",
      "🧨 Projéteis",
      "📸 Itens Especiais",
      "🎁 Presentes",
      "↩️ Voltar"
   }, nil, "🇧🇷PUXAR ARMAS🇧🇷")

   if menu == 1 then loop(w_brancas, "brancas") end
   if menu == 2 then loop(w_pistolas, "pts") end
   if menu == 3 then loop(w_escopeta, "doze") end
   if menu == 4 then loop(w_sub, "sub") end
   if menu == 5 then loop(w_fuzis, "fuzis") end
   if menu == 6 then loop(w_rifle, "rifle") end
   if menu == 7 then loop(w_pesadas, "pesadas") end
   if menu == 8 then loop(w_especiais, "esp") end
   if menu == 9 then loop(w_projeteis, "proj") end
   if menu == 10 then loop(w_itens, "itens") end
   if menu == 11 then loop(w_presentes, "presentes") end
   if menu == 12 then loop(Main, "Main") end

   MAINLUA = -1
end



function w_brancas()
   menu = gg.choice({
      "《🔪》《Faca》",
      "《🦯》《Cassetete》",
      "《🗡️》《Katana》",
      "《🏏》《Taco de Beisebol》",
      "《⛳》《Taco de Golf》",
      "《🪚》《Pá》",
      "《🎱》《Taco de Sinuca》",
      "《🪚》《Serrote》",
      "《↩️》Voltar"
   }, nil, "🇧🇷ARMAS BRANCAS🇧🇷")

   if menu == 1 then faca() end
   if menu == 2 then cassetete() end
   if menu == 3 then katana() end
   if menu == 4 then tacobeisebol() end
   if menu == 5 then tacogolf() end
   if menu == 6 then pa() end
   if menu == 7 then tacosinuca() end
   if menu == 8 then serrote() end
   if menu == 9 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end


function w_pistolas()
   menu = gg.choice({
      "《🔫》《Colt 45》",
      "《🔫》《Pistola Silenciada》",
      "《🔫》《Desert Eagle》",
      "《↩️》Voltar"
   }, nil, "🇧🇷PISTOLAS🇧🇷")

   if menu == 1 then colt45() end
   if menu == 2 then silenciada() end
   if menu == 3 then eagle() end
   if menu == 4 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_escopeta()
   menu = gg.choice({
      "《🔫》《Espingarda》",
      "《🔫》《Espingarda Serrada》",
      "《🔫》《Espingarda de Combate》",
      "《↩️》Voltar"
   }, nil, "🇧🇷ESPINGARDAS🇧🇷")

   if menu == 1 then esping() end
   if menu == 2 then espingcerrada() end
   if menu == 3 then espingdecombate() end
   if menu == 4 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_sub()
   menu = gg.choice({
      "《🔫》《Uzi》",
      "《🔫》《Tec-9》",
      "《🔫》《MP5》",
      "《↩️》Voltar"
   }, nil, "🇧🇷SUBMETRALHADORAS🇧🇷")

   if menu == 1 then uzi() end
   if menu == 2 then tec9() end
   if menu == 3 then mp5() end
   if menu == 4 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_rifle()
   menu = gg.choice({
      "🔫 Rifle",
      "🔫 Sniper Rifle",
      "↩️ Voltar"
   }, nil, "🇧🇷RIFLES🇧🇷")

   if menu == 1 then rifle() end
   if menu == 2 then sniper() end
   if menu == 3 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_fuzis()
   menu = gg.choice({
      "🔫 AK-47",
      "🔫 M4",
      "↩️ Voltar"
   }, nil, "🇧🇷FUZIS🇧🇷")

   if menu == 1 then ak47() end
   if menu == 2 then m4() end
   if menu == 3 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end


function w_pesadas()
   menu = gg.choice({
      "《💣》《Lança-Foguetes》",
      "《💣》《Lança-Chamas》",
      "《💣》《Minigun》",
      "《↩️》Voltar"
   }, nil, "🇧🇷ARMAS PESADAS🇧🇷")

   if menu == 1 then lancafoguete() end
   if menu == 2 then lancachamas() end
   if menu == 3 then minigun() end
   if menu == 4 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_especiais()
   menu = gg.choice({
      "《🎯》《Visão Noturna》",
      "《🎯》《Visão Térmica》",
      "《🪂》《Paraquedas》",
      "《↩️》Voltar"
   }, nil, "🇧🇷ITENS ESPECIAIS🇧🇷")

   if menu == 1 then nightvision() end
   if menu == 2 then thermalvision() end
   if menu == 3 then paraquedas() end
   if menu == 4 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end


function w_projeteis()
   menu = gg.choice({
      "《💣》《Granada》",
      "《💨》《Gás Lacrimogêneo》",
      "《🔥》《Molotov》",
      "《🧨》《Carga Explosiva (Satchel)》",
      "《↩️》Voltar"
   }, nil, "🇧🇷EXPLOSIVOS / PROJÉTEIS🇧🇷")

   if menu == 1 then granada() end
   if menu == 2 then lacrimogeno() end
   if menu == 3 then molotov() end
   if menu == 4 then satchel() end
   if menu == 5 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_especiais()
   menu = gg.choice({
      "《🧴》《Spray》",
      "《🧯》《Extintor》",
      "《📷》《Câmera》",
      "《↩️》Voltar"
   }, nil, "🇧🇷ITENS ESPECIAIS🇧🇷")

   if menu == 1 then spray() end
   if menu == 2 then extintor() end
   if menu == 3 then camera() end
   if menu == 4 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end

function w_itens()
   menu = gg.choice({
      "《🧯》《Spray de Tinta》",
      "《🧯》《Extintor de Incêndio》",
      "《📸》《Câmera》",
      "《↩️》Voltar"
   }, nil, "🇧🇷ITENS ESPECIAIS🇧🇷")

   if menu == 1 then spray() end
   if menu == 2 then extintor() end
   if menu == 3 then camera() end
   if menu == 4 then loop(weaponchanger, "back") end

   MAINLUA = -1
end


function w_presentes()
   menu = gg.choice({
      "《🍆》《Dildo》",
      "《🍆》《Dildo 2》",
      "《🔋》《Vibrador》",
      "《🌹》《Flores》",
      "《🦯》《Bengala》",
      "《↩️》Voltar"
   }, nil, "🎁 MENU DE PRESENTES 🎁")

   if menu == 1 then dildo1() end
   if menu == 2 then dildo2() end
   if menu == 3 then vibrador() end
   if menu == 4 then flores() end
   if menu == 5 then bengala() end
   if menu == 6 then loop(weaponchanger, "wpc") end

   MAINLUA = -1
end






 function weaponbase()

   weapon_base = {
     {99999.9921875, 0}
   }
  
   wp = SearchGet("Ca","f", weapon_base)
  
   gg.addListItems(wp)
   gg.loadResults(gg.getListItems())
   guns = gg.getResults(100)
   gg.toast("Carregado com sucesso")
  
end




local weapon = {

   -- Pistolas
   colt45_w        = {{22, 0x70},  {346, 0x78},  {99999, 0x7C,  true}},
   silenciada_w    = {{23, 0x70},  {347, 0x78},  {99999, 0x7C,  true}},
   eagle_w         = {{24, 0x70},  {348, 0x78},  {99999, 0x7C,  true}},

   -- Escopetas
   espingarda_w         = {{25, 0x90},  {349, 0x98},  {99999, 0x9C,  true}},
   espingardacerrada_w  = {{26, 0x90},  {350, 0x98},  {99999, 0x9C,  true}},
   espingardadcombate_w = {{27, 0x90},  {351, 0x98},  {99999, 0x9C,  true}},

   -- Submetralhadoras
   uzi_w           = {{28, 0xB0},  {352, 0xB8},  {99999, 0xBC,  true}},
   mp5_w           = {{29, 0xB0},  {353, 0xB8},  {99999, 0xBC,  true}},
   tec9_w          = {{32, 0xB0},  {354, 0xB8},  {99999, 0xBC,  true}},

   -- Rifles
   rifle_w         = {{33, 0xF0},  {355, 0xF8},  {99999, 0xFC,  true}},
   sniper_w        = {{34, 0xF0},  {356, 0xF8},  {99999, 0xFC,  true}},

   -- Fuzil de assalto
   ak47_w          = {{30, 0xD0},  {355, 0xD8},  {99999, 0xDC,  true}},
   m4_w            = {{31, 0xD0},  {356, 0xD8},  {99999, 0xDC,  true}},

   -- Armas Pesadas
   rpg_w           = {{35, 0x110}, {357, 0x118}, {99999, 0x11C, true}},
   heatseeker_w    = {{36, 0x110}, {358, 0x118}, {99999, 0x11C, true}},
   lanca_chamas_w  = {{37, 0x110}, {359, 0x118}, {99999, 0x11C, true}},
   minigun_w       = {{38, 0x110}, {360, 0x118}, {99999, 0x11C, true}},

   -- Armas Brancas
   faca_w          = {{4,  0x50},  {335, 0x58},  {99999, 0x5C,  true}},
   cassetete_w     = {{3,  0x50},  {334, 0x58},  {99999, 0x5C,  true}},
   katana_w        = {{8,  0x50},  {339, 0x58},  {99999, 0x5C,  true}},
   tacobeisebol_w  = {{5,  0x50},  {336, 0x58},  {99999, 0x5C,  true}},
   tacogolf_w      = {{2,  0x50},  {333, 0x58},  {99999, 0x5C,  true}},
   pa_w            = {{6,  0x50},  {337, 0x58},  {99999, 0x5C,  true}},
   tacosinuca_w    = {{7,  0x50},  {338, 0x58},  {99999, 0x5C,  true}},
   serrote_w       = {{9,  0x50},  {340, 0x58},  {99999, 0x5C,  true}},

   -- Visores Especiais
   nightvision_w   = {{44, 0x190}, {368, 0x198}, {99999, 0x19C, true}},
   thermalvision_w = {{45, 0x190}, {369, 0x198}, {99999, 0x19C, true}},
   paraquedas_w    = {{46, 0x190}, {370, 0x198}, {99999, 0x19C, true}},

   -- Explosivos / Projéteis
   granada_w       = {{16, 0x130}, {361, 0x138}, {99999, 0x13C, true}},
   acrimogeno_w    = {{17, 0x130}, {362, 0x138}, {99999, 0x13C, true}},
   molotov_w       = {{18, 0x130}, {363, 0x138}, {99999, 0x13C, true}},
   satchel_w       = {{39, 0x130}, {364, 0x138}, {99999, 0x13C, true}},

   -- Itens Especiais
   spray_w         = {{41, 0x150}, {365, 0x158}, {99999, 0x15C, true}},
   extintor_w      = {{42, 0x150}, {366, 0x158}, {99999, 0x15C, true}},
   camera_w        = {{43, 0x150}, {367, 0x158}, {99999, 0x15C, true}},

   -- Presentes
   dildo1_w        = {{10, 0x170}, {341, 0x178}, {99999, 0x17C, true}},
   dildo2_w        = {{11, 0x170}, {342, 0x178}, {99999, 0x17C, true}},
   vibrador_w      = {{12, 0x170}, {343, 0x178}, {99999, 0x17C, true}},
   flores_w        = {{14, 0x170}, {344, 0x178}, {99999, 0x17C, true}},
   bengala_w       = {{15, 0x170}, {345, 0x178}, {99999, 0x17C, true}}
}

 

-- Armas Brancas
function faca() editGet(guns, weapon.faca_w, "d") end
function cassetete() editGet(guns, weapon.cassetete_w, "d") end
function katana() editGet(guns, weapon.katana_w, "d") end
function tacobeisebol() editGet(guns, weapon.tacobeisebol_w, "d") end
function tacogolf() editGet(guns, weapon.tacogolf_w, "d") end
function pa() editGet(guns, weapon.pa_w, "d") end
function tacosinuca() editGet(guns, weapon.tacosinuca_w, "d") end
function serrote() editGet(guns, weapon.serrote_w, "d") end

-- Pistolas
function colt45() editGet(guns, weapon.colt45_w, "d") end
function silenciada() editGet(guns, weapon.silenciada_w, "d") end
function eagle() editGet(guns, weapon.eagle_w, "d") end

-- Escopetas
function esping() editGet(guns, weapon.espingarda_w, "d") end
function espingcerrada() editGet(guns, weapon.espingardacerrada_w, "d") end
function espingdecombate() editGet(guns, weapon.espingardadcombate_w, "d") end

-- Submetralhadoras
function uzi() editGet(guns, weapon.uzi_w, "d") end
function tec9() editGet(guns, weapon.tec9_w, "d") end
function mp5() editGet(guns, weapon.mp5_w, "d") end

-- Rifles
function rifle() editGet(guns, weapon.rifle_w, "d") end
function sniper() editGet(guns, weapon.sniper_w, "d") end

-- Fuzis
function ak47() editGet(guns, weapon.ak47_w, "d") end
function m4() editGet(guns, weapon.m4_w, "d") end

-- Pesadas
function lancafoguete() editGet(guns, weapon.lancafoguetes_w, "d") end
function lancachamas() editGet(guns, weapon.lancachamas_w, "d") end
function minigun() editGet(guns, weapon.minigun_w, "d") end

-- Especiais
function nightvision() editGet(guns, weapon.visaonoturna_w, "d") end
function thermalvision() editGet(guns, weapon.visaotermal_w, "d") end
function paraquedas() editGet(guns, weapon.paraquedas_w, "d") end


function granada() editGet(guns, weapon.granada_w, "d") end
function lacrimogeno() editGet(guns, weapon.lacrimogeno_w, "d") end
function molotov() editGet(guns, weapon.molotov_w, "d") end
function satchel() editGet(guns, weapon.satchel_w, "d") end


function spray() editGet(guns, weapon.spray_w, "d") end
function extintor() editGet(guns, weapon.extintor_w, "d") end
function camera() editGet(guns, weapon.camera_w, "d") end

function dildo1() editGet(guns, weapon.dildo1_w, "d") end
function dildo2() editGet(guns, weapon.dildo2_w, "d") end
function vibrador() editGet(guns, weapon.vibrador_w, "d") end
function flores() editGet(guns, weapon.flores_w, "d") end
function bengala() editGet(guns, weapon.bengala_w, "d") end

-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
 
local vida_local = nil  -- Variável para armazenar o endereço da vida

function vida()
    -- Criar um prompt para definir o valor da vida
    local input = gg.prompt({"Defina o valor da vida:"}, {999}, {"number"})
   
    if input == nil then
        gg.toast("Operação cancelada")
        return
    end
    
    local valor_vida = tonumber(input[1])
    
    if valor_vida == nil or valor_vida <= 0 then
        gg.toast("Valor inválido")
        return
    end
    
    -- Ajustar a quantidade elegível de vida estipulada
    local vida_maxima = 99999  -- Definir um limite máximo
    if valor_vida > vida_maxima then
        valor_vida = vida_maxima
        gg.toast("Valor ajustado para o máximo permitido: " .. vida_maxima)
    end
    
    -- Definir valor base de vida a ser pesquisado
    local vida_base = 99999.9921875 -- Valor base esperado no jogo
    
    if vida_local == nil then
        -- Aumentar HP com base na entrada do usuário
        local vida_inf = {
            {vida_base, 0}, 
        }
        
        vida_local = SearchGet("Ca", "f", vida_inf)  -- Armazena o endereço encontrado
    end
    
    if vida_local then
        local vida_edit = {
            {valor_vida, -0x54}, -- Aplicando o novo valor de vida
        }
        
        editGet(vida_local, vida_edit, "f")
        gg.toast("Vida ajustada com sucesso! Novo valor: " .. valor_vida)
    else
        gg.toast("Erro ao encontrar o endereço da vida.")
    end
end




 
 
 
 




function setFloat(address, value, message)
   gg.setValues({{address = address, flags = gg.TYPE_FLOAT, value = value}})
   gg.toast(message)
end

gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_HEAP | gg.REGION_C_ALLOC | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_PPSSPP | gg.REGION_ANONYMOUS | gg.REGION_OTHER | gg.REGION_CODE_APP | gg.REGION_CODE_SYS)

function menupremium()
   local mainMenu = gg.choice({
       "𝐌𝐄𝐍𝐔 𝐉𝐎𝐆𝐀𝐃𝐎𝐑",
       "𝐌𝐄𝐍𝐔 𝐂𝐀𝐑𝐑𝐎",
       "𝐌𝐄𝐍𝐔 𝐀𝐑𝐌𝐀𝐒",
       "𝐌𝐄𝐍𝐔 𝐓𝐄𝐋𝐀",
       "𝐃𝐎𝐍𝐎 𝐃𝐎 𝐌𝐎𝐃",
       "《↩️》Voltar"
   }, nil, versao)

   if mainMenu == 1 then loop(menuPlayer,"play") end
   if mainMenu == 2 then loop(menuVeiculos,"vei") end
   if mainMenu == 3 then loop(menuArmas,"arm") end
   if mainMenu == 4 then loop(menuGame,"gam") end
   if mainMenu == 5 then loop(criadores,"cria") end
   if mainMenu == 6 then loop(Main,"ma") end
end


-- MENU PLAYER
function menuPlayer()
   local playerMenu = gg.choice({
       "👣 Speed Player Andando",
       "👣 Speed Player Agachado",
       "🦘 Super Pulo",
       -- "🧑‍🦯 Drone Visão(não ative!) 🧟",
       "↩️ Voltar"
   }, nil, "👤 MENU PLAYER 👤")

   if playerMenu == 1 then loop(speedHackOptions, "spdwalk") end
   if playerMenu == 2 then loop(speedHackOptionsagachado, "spdcrouch") end
   if playerMenu == 3 then loop(menuSuperPulo2, "jump") end
   -- if playerMenu == 4 then loop(droneVisaoOptions, "drone") end
   if playerMenu == 5 then loop(menupremium, "prin") end
end







-- MENU VEÍCULOS
function menuVeiculos()
   local veiculosMenu = gg.choice({
       "🚗 Aim Kill (Precisa de um veículo)",
       "🚗 Lataria Infinita (Precisa estar em um veículo)",
       "🚗 Quebrar veículo (Precisa estar em um veículo)",
       "🚗💨 Speed Veiculos",
       "↩️ Voltar"
   }, nil, "🚗 MENU VEÍCULOS 🚗")

   if veiculosMenu == 1 then aimkillcarro() end
   if veiculosMenu == 2 then latariainf() end
   if veiculosMenu == 3 then quebrarveiculo() end
   if veiculosMenu == 4 then speedveiculo() end
   if veiculosMenu == 5 then loop(menupremium,"prin") end
end


function speedveiculo()
   local speedspeedveiculoMenu = gg.choice({
       "🚗💨 Speed Hack 2x",
       "🚗💨 Speed Hack 4x",
       "🚗💨 Speed Hack 6x",
       "🚗💨 Speed Hack 8x",
       "❌ Desativar Speed Hack"
   }, nil, "Selecione a opção de Speed Hack:")

       if speedspeedveiculoMenu == 1 then
           ativarspeedveiculo(2)
       elseif speedspeedveiculoMenu == 2 then
           ativarspeedveiculo(4)
       elseif speedspeedveiculoMenu == 3 then
           ativarspeedveiculo(6)
       elseif speedspeedveiculoMenu == 4 then
           ativarspeedveiculo(8)
       elseif speedspeedveiculoMenu == 5 then
           ativarspeedveiculo(1)
       end
     end
   
   
   
   -- Módulo de cache para velocidade de veículo
local vehicleSpeedCache = {
   addresses = nil,
   lastSpeedValue = nil,
   lastTargetValue = nil
}

-- Configurações
local speedSettings = {
   maxResults = 100,          -- Limite de resultados para evitar sobrecarga
   searchRange = 64,          -- Intervalo para modificar (em bytes)
   freezeEnabled = true,      -- Congelar valores por padrão
   validationThreshold = 0.1  -- Margem para validação de valores
}

-- Função para validar e preparar os endereços
local function prepareSpeedAddresses(targetValue, newSpeed)
   gg.clearResults()
   gg.searchNumber(targetValue, gg.TYPE_FLOAT)
   
   local results = gg.getResults(speedSettings.maxResults)
   if #results == 0 then
       return nil, "Nenhum valor encontrado!"
   end
   
   -- Filtrar resultados válidos
   local validAddresses = {}
   for _, result in ipairs(results) do
       if math.abs(result.value - targetValue) < speedSettings.validationThreshold then
           table.insert(validAddresses, result.address + speedSettings.searchRange)
       end
   end
   
   if #validAddresses == 0 then
       return nil, "Nenhum endereço válido encontrado!"
   end
   
   return validAddresses
end

-- Função principal para ativar/modificar speed
function ativarspeedveiculo(velocidadespeedveiculo)
   -- Validação do input
   if type(velocidadespeedveiculo) ~= "number" or velocidadespeedveiculo <= 0 then
       gg.toast("ERRO: Velocidade deve ser um número positivo!")
       return false
   end

   local targetValue = "479320161982472000000000"
   
   -- Verificar se podemos usar o cache
   if vehicleSpeedCache.addresses and vehicleSpeedCache.lastTargetValue == targetValue then
       -- Atualizar valores usando cache
       local updateList = {}
       for _, addr in ipairs(vehicleSpeedCache.addresses) do
           table.insert(updateList, {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = velocidadespeedveiculo,
               freeze = speedSettings.freezeEnabled
           })
       end
       
       gg.setValues(updateList)
       if speedSettings.freezeEnabled then
           gg.addListItems(updateList)
       end
       
       vehicleSpeedCache.lastSpeedValue = velocidadespeedveiculo
       gg.toast(string.format("Velocidade atualizada para %.1f", velocidadespeedveiculo))
       gg.clearResults()
       return true
   end

   -- Pesquisa necessária
   local addresses, err = prepareSpeedAddresses(targetValue, velocidadespeedveiculo)
   if not addresses then
       gg.toast(err)
       return false
   end

   -- Preparar lista de modificação
   local modifyList = {}
   for _, addr in ipairs(addresses) do
       table.insert(modifyList, {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = velocidadespeedveiculo,
           freeze = speedSettings.freezeEnabled
       })
   end

   -- Aplicar mudanças
   gg.setValues(modifyList)
   if speedSettings.freezeEnabled then
       gg.addListItems(modifyList)
   end

   -- Atualizar cache
   vehicleSpeedCache.addresses = addresses
   vehicleSpeedCache.lastSpeedValue = velocidadespeedveiculo
   vehicleSpeedCache.lastTargetValue = targetValue

   gg.toast(string.format("Speed veicular ativado: %.1f 🚗💨", velocidadespeedveiculo))
   gg.clearResults()
   return true
end

-- Função para desativar o speed
function desativarspeedveiculo()
   if not vehicleSpeedCache.addresses then
       gg.toast("Nenhum speed ativo para desativar")
       return
   end

   -- Remover itens congelados
   gg.removeListItems(gg.getListItems())
   vehicleSpeedCache.addresses = nil
   vehicleSpeedCache.lastSpeedValue = nil
   gg.toast("Speed veicular desativado 🚗✋")
   gg.clearResults()
   return true
end

-- Função para ajustar configurações
function configSpeedVeiculo(opcoes)
   if opcoes.maxResults then
       speedSettings.maxResults = math.min(math.max(opcoes.maxResults, 1), 5000)
   end
   if opcoes.searchRange then
       speedSettings.searchRange = opcoes.searchRange
   end
   if opcoes.freezeEnabled ~= nil then
       speedSettings.freezeEnabled = opcoes.freezeEnabled
   end
   
   gg.toast("Configurações de speed atualizadas")
end




















-- MENU ARMAS
function menuArmas()
   local armasMenu = gg.choice({
       "🔫 Munição Infinita (é necessário nível 2 para atirar)",
       "🔫 Puxar Armas",
       "↩️ Voltar"
   }, nil, "🔫 MENU ARMAS 🔫")

   if armasMenu == 1 then loop(cheatarmas, "cheat") end
   if armasMenu == 2 then loop(puxararmas, "puxar") end
   if armasMenu == 3 then loop(menupremium, "prin") end
end


-- MENU PUXAR ARMAS
function puxararmas()
   local armasMenu = gg.choice({
       "🔪 Armas Brancas",
       "🔫 Revólveres",
       "🔫 Espingardas",
       "🔫 Submetralhadoras",
       "🔫 Rifles de Assalto",
       "🔫 Fuzis",
       "💣 Armas Pesadas",
       "🚀 Projéteis",
       "🎯 Especial 1",
       "🎁 Presentes",
       "🎯 Especial 2",
       "↩️ Voltar"
   }, nil, "🔫 MENU PUXAR ARMAS 🔫")

   if armasMenu == 1 then loop(menuArmasBrancas, "ab") end
   if armasMenu == 2 then loop(menuRevolveres, "rev") end
   if armasMenu == 3 then loop(menuEspingardas, "esp") end
   if armasMenu == 4 then loop(menuSubmetralhadoras, "sub") end
   if armasMenu == 5 then loop(menuRiflesAssalto, "ra") end
   if armasMenu == 6 then loop(menuFuzis, "fuz") end
   if armasMenu == 7 then loop(menuArmasPesadas, "pes") end
   if armasMenu == 8 then loop(menuProjeteis, "proj") end
   if armasMenu == 9 then loop(menuEspecial1, "esp1") end
   if armasMenu == 10 then loop(menuPresentes, "pres") end
   if armasMenu == 11 then loop(menuEspecial2, "esp2") end
   if armasMenu == 12 then loop(menupremium, "prin") end
end


municao = 99999




-- MENU ARMAS BRANCAS
function menuArmasBrancas()
   local armasBrancasMenu = gg.choice({
       "⛳ Taco de Golf",
       "🦯 Cassetete",
       "🔪 Faca",
       "🏏 Taco de Beisebol",
       "🪚 Pá",
       "🎱 Taco de Sinuca",
       "🗡️ Katana",
       "🪚 Serrote",
       "↩️ Voltar"
   }, nil, "🔪 MENU ARMAS BRANCAS 🔪")

   if armasBrancasMenu == 1 then puxarArma(2, 333, municao, 80, 88, 92) end
   if armasBrancasMenu == 2 then puxarArma(3, 334, municao, 80, 88, 92) end
   if armasBrancasMenu == 3 then puxarArma(4, 335, municao, 80, 88, 92) end
   if armasBrancasMenu == 4 then puxarArma(5, 336, municao, 80, 88, 92) end
   if armasBrancasMenu == 5 then puxarArma(6, 337, municao, 80, 88, 92) end
   if armasBrancasMenu == 6 then puxarArma(7, 338, municao, 80, 88, 92) end
   if armasBrancasMenu == 7 then puxarArma(8, 339, municao, 80, 88, 92) end
   if armasBrancasMenu == 8 then puxarArma(9, 340, municao, 80, 88, 92) end
   if armasBrancasMenu == 9 then  loop(puxararmas,"prin") end
end

-- MENU REVÓLVERES
function menuRevolveres()
   local revolveresMenu = gg.choice({
       "🔫 Colt 45",
       "🔫 Pistola Silenciada",
       "🔫 Desert Eagle",
       "↩️ Voltar"
   }, nil, "🔫 MENU REVÓLVERES 🔫")

   if revolveresMenu == 1 then puxarArma(22, 346, municao, 112, 120, 124) end
   if revolveresMenu == 2 then puxarArma(23, 347, municao, 112, 120, 124) end
   if revolveresMenu == 3 then puxarArma(24, 348, municao, 112, 120, 124) end
   if revolveresMenu == 4 then  loop(puxararmas,"prin") end
end

-- MENU ESPINGARDAS
function menuEspingardas()
   local espingardasMenu = gg.choice({
       "🔫 Espingarda",
       "🔫 Espingarda Serrada",
       "🔫 Espingarda de Combate",
       "↩️ Voltar"
   }, nil, "🔫 MENU ESPINGARDAS 🔫")

   if espingardasMenu == 1 then puxarArma(25, 349, municao, 144, 152, 156) end
   if espingardasMenu == 2 then puxarArma(26, 350, municao, 144, 152, 156) end
   if espingardasMenu == 3 then puxarArma(27, 351, municao, 144, 152, 156) end
   if espingardasMenu == 4 then  loop(puxararmas,"prin") end
end

-- MENU SUBMETRALHADORAS
function menuSubmetralhadoras()
   local submetralhadorasMenu = gg.choice({
       "🔫 Uzi",
       "🔫 MP5",
       "🔫 Tec-9",
       "↩️ Voltar"
   }, nil, "🔫 MENU SUBMETRALHADORAS 🔫")

   if submetralhadorasMenu == 1 then puxarArma(28, 352, municao, 176, 184, 188) end
   if submetralhadorasMenu == 2 then puxarArma(29, 353, municao, 176, 184, 188) end
   if submetralhadorasMenu == 3 then puxarArma(32, 354, municao, 176, 184, 188) end
   if submetralhadorasMenu == 4 then  loop(puxararmas,"prin") end
end

-- MENU RIFLES DE ASSALTO
function menuRiflesAssalto()
   local riflesAssaltoMenu = gg.choice({
       "🔫 AK-47",
       "🔫 M4",
       "↩️ Voltar"
   }, nil, "🔫 MENU RIFLES DE ASSALTO 🔫")

   if riflesAssaltoMenu == 1 then puxarArma(30, 355, municao, 208, 216, 220) end
   if riflesAssaltoMenu == 2 then puxarArma(31, 356, municao, 208, 216, 220) end
   if riflesAssaltoMenu == 3 then  loop(puxararmas,"prin") end
end

-- MENU FUZIS
function menuFuzis()
   local fuzisMenu = gg.choice({
       "🔫 Rifle",
       "🔫 Rifle de Precisão",
       "↩️ Voltar"
   }, nil, "🔫 MENU FUZIS 🔫")

   if fuzisMenu == 1 then puxarArma(33, 357, municao, 240, 248, 252) end
   if fuzisMenu == 2 then puxarArma(34, 358, municao, 240, 248, 252) end
   if fuzisMenu == 3 then  loop(puxararmas,"prin") end
end

-- MENU ARMAS PESADAS
function menuArmasPesadas()
   local armasPesadasMenu = gg.choice({
       "💣 Lançador de Foguetes",
       "💣 Lançador de Foguetes Heatseek",
       "🔥 Lança-chamas",
       "💣 Minigun",
       "↩️ Voltar"
   }, nil, "💣 MENU ARMAS PESADAS 💣")

   if armasPesadasMenu == 1 then puxarArma(35, 359, municao, 272, 280, 284) end
   if armasPesadasMenu == 2 then puxarArma(36, 360, municao, 272, 280, 284) end
   if armasPesadasMenu == 3 then puxarArma(37, 361, municao, 272, 280, 284) end
   if armasPesadasMenu == 4 then puxarArma(38, 362, municao, 272, 280, 284) end
   if armasPesadasMenu == 5 then  loop(puxararmas,"prin") end
end

-- MENU PROJÉTEIS
function menuProjeteis()
   local projeteisMenu = gg.choice({
       "💣 Granada",
       "💣 Gás Lacrimogêneo",
       "🔥 Coquetel Molotov",
       "💣 Carga Explosiva",
       "↩️ Voltar"
   }, nil, "🚀 MENU PROJÉTEIS 🚀")

   if projeteisMenu == 1 then puxarArma(16, 342, municao, 304, 312, 316) end
   if projeteisMenu == 2 then puxarArma(17, 343, municao, 304, 312, 316) end
   if projeteisMenu == 3 then puxarArma(18, 344, municao, 304, 312, 316) end
   if projeteisMenu == 4 then puxarArma(39, 345, municao, 304, 312, 316) end
   if projeteisMenu == 5 then  loop(puxararmas,"prin") end
end

-- MENU ESPECIAL 1
function menuEspecial1()
   local especial1Menu = gg.choice({
       "🎯 Spray",
       "🧯 Extintor de Incêndio",
       "📷 Câmera",
       "↩️ Voltar"
   }, nil, "🎯 MENU ESPECIAL 1 🎯")

   if especial1Menu == 1 then puxarArma(41, 365, municao, 336, 344, 348) end
   if especial1Menu == 2 then puxarArma(42, 366, municao, 336, 344, 348) end
   if especial1Menu == 3 then puxarArma(43, 367, municao, 336, 344, 348) end
   if especial1Menu == 4 then  loop(puxararmas,"prin") end
end

-- MENU PRESENTES
function menuPresentes()
   local presentesMenu = gg.choice({
       "🎁 Dildo",
       "🎁 Dildo 2",
       "🎁 Vibrador",
       "🌸 Flores",
       "🦯 Bengala",
       "↩️ Voltar"
   }, nil, "🎁 MENU PRESENTES 🎁")

   if presentesMenu == 1 then puxarArma(10, 321, municao, 368, 376, 380) end
   if presentesMenu == 2 then puxarArma(11, 322, municao, 368, 376, 380) end
   if presentesMenu == 3 then puxarArma(12, 323, municao, 368, 376, 380) end
   if presentesMenu == 4 then puxarArma(14, 325, municao, 368, 376, 380) end
   if presentesMenu == 5 then puxarArma(15, 326, municao, 368, 376, 380) end
   if presentesMenu == 6 then  loop(puxararmas,"prin") end
end

-- MENU ESPECIAL 2
function menuEspecial2()
   local especial2Menu = gg.choice({
       "🎯 Visão Noturna",
       "🎯 Visão Térmica",
       "🪂 Paraquedas",
       "↩️ Voltar"
   }, nil, "🎯 MENU ESPECIAL 2 🎯")

   if especial2Menu == 1 then puxarArma(44, 368, municao, 400, 408, 412) end
   if especial2Menu == 2 then puxarArma(45, 369, municao, 400, 408, 412) end
   if especial2Menu == 3 then puxarArma(46, 370, municao, 400, 408, 412) end
   if especial2Menu == 4 then  loop(puxararmas,"prin") end
end

-- ODEIO A THALY SANTOS HAHAHA
-- FUNÇÃO GENÉRICA PARA PUXAR ARMAS
-- Módulo de cache para armas
local weaponCache = {
   baseAddress = nil,
   lastValues = {},
   lastOffsets = {}
}

-- Configurações
local weaponSettings = {
   searchValue = 99999.9921875,
   maxAttempts = 3,
   searchDelay = 150,
   validationThreshold = 0.001,
   autoFreeze = true
}

-- Função para encontrar o endereço base
local function findWeaponBaseAddress()
   gg.clearResults()
   gg.searchNumber(weaponSettings.searchValue, gg.TYPE_FLOAT)
   
   local results = gg.getResults(1)
   if #results == 0 then
       return nil
   end
   
   -- Validação precisa do valor encontrado
   if math.abs(results[1].value - weaponSettings.searchValue) > weaponSettings.validationThreshold then
       return nil
   end
   
   return results[1].address
end

-- Função principal para modificar valores da arma
function puxarArma(valor52, valor54, valor55, deslocamento52, deslocamento54, deslocamento55)
   -- Validação dos parâmetros
   if type(valor52) ~= "number" or type(valor54) ~= "number" or type(valor55) ~= "number" or
      type(deslocamento52) ~= "number" or type(deslocamento54) ~= "number" or type(deslocamento55) ~= "number" then
       gg.toast("ERRO: Parâmetros inválidos!")
       return false
   end

   -- Verificar se podemos usar o cache
   local useCache = weaponCache.baseAddress and
                   weaponCache.lastOffsets[1] == deslocamento52 and
                   weaponCache.lastOffsets[2] == deslocamento54 and
                   weaponCache.lastOffsets[3] == deslocamento55

   if not useCache then
       -- Tentar encontrar o endereço base
       local attempts = 0
       weaponCache.baseAddress = nil
       
       while attempts < weaponSettings.maxAttempts and not weaponCache.baseAddress do
           weaponCache.baseAddress = findWeaponBaseAddress()
           if not weaponCache.baseAddress then
               attempts = attempts + 1
               gg.sleep(weaponSettings.searchDelay)
           end
       end

       if not weaponCache.baseAddress then
           gg.toast("Falha ao encontrar endereço base da arma")
           return false
       end

       -- Armazenar offsets usados
       weaponCache.lastOffsets = {deslocamento52, deslocamento54, deslocamento55}
   end

   -- Preparar valores para edição
   local editValues = {
       {
           address = weaponCache.baseAddress + deslocamento52,
           flags = gg.TYPE_DWORD,
           value = valor52,
           freeze = false,
           name = "Valor 52"
       },
       {
           address = weaponCache.baseAddress + deslocamento54,
           flags = gg.TYPE_DWORD,
           value = valor54,
           freeze = weaponSettings.autoFreeze,
           name = "Valor 54"
       },
       {
           address = weaponCache.baseAddress + deslocamento55,
           flags = gg.TYPE_DWORD,
           value = valor55,
           freeze = weaponSettings.autoFreeze,
           name = "Valor 55"
       }
   }

   -- Aplicar mudanças
   gg.setValues(editValues)
   
   -- Congelar se necessário
   if weaponSettings.autoFreeze then
       gg.addListItems({editValues[2], editValues[3]})
   end

   -- Atualizar cache
   weaponCache.lastValues = {valor52, valor54, valor55}

   gg.toast("Arma puxada com sucesso!")
   gg.clearResults()
   return true
end

-- Função para resetar o cache
function resetarCacheArma()
   weaponCache.baseAddress = nil
   weaponCache.lastValues = {}
   weaponCache.lastOffsets = {}
   gg.removeListItems(gg.getListItems())
   gg.toast("Cache de armas resetado")
end

-- Função para configurar parâmetros
function configurarPuxarArma(opcoes)
   if opcoes.searchValue then
       weaponSettings.searchValue = opcoes.searchValue
   end
   if opcoes.maxAttempts then
       weaponSettings.maxAttempts = math.max(1, math.min(opcoes.maxAttempts, 10))
   end
   if opcoes.autoFreeze ~= nil then
       weaponSettings.autoFreeze = opcoes.autoFreeze
   end
   
   gg.toast("Configurações de arma atualizadas")

end






-- MENU GAME
function menuGame()
   local gameMenu = gg.choice({
       "📱 Tela Esticada",
       "🌆 Wall Hack (Teste/Beta)",
       "✍️ Light Map",
       "🌿 Vegetação",
       "↩️ Voltar"
   }, nil, "🎮 MENU GAME 🎮")

   if gameMenu == 1 then esticada() end
   if gameMenu == 2 then wallhack() end
   if gameMenu == 3 then lightMapOptions() end
   if gameMenu == 4 then vegetacaoOptions() end
   if gameMenu == 5 then loop(menupremium,"prin") end
end


function lightMapOptions()
   local lightMapOptionsmenu = gg.choice({
       "💡 Ativar Light Map",
       "💡 Desativar Light Map"
   }, nil, "Selecione a opção de Light Map:")

       if lightMapOptionsmenu == 1 then
           lightMapOptionsnoff(1)
       elseif lightMapOptionsmenu == 2 then
           lightMapOptionsnoff(0.20000000298)
       end
     end



-- Cache para armazenar endereços já encontrados
local lightMapCache = {
   addresses = nil,           -- Armazena os endereços modificáveis
   lastTarget = "974.40002441406",  -- Valor original de busca
   lastValue = nil            -- Último valor aplicado
}

-- Função PRINCIPAL (rápida com cache)
function lightMapOptionsnoff(lightMapffoffvalor)
   -- Se já temos os endereços em cache, apenas atualiza os valores
   if lightMapCache.addresses then
       local edits = {}
       for i, addr in ipairs(lightMapCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = lightMapffoffvalor
           }
       end
       gg.setValues(edits)
       lightMapCache.lastValue = lightMapffoffvalor
       gg.toast("💡 Light Map atualizado 💡")
       gg.clearResults()
       return
   end

   -- Busca inicial (executada apenas uma vez)
   gg.clearResults()
   gg.searchNumber(lightMapCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("Nenhum valor encontrado!")
       return
   end

   -- Extrai endereços válidos (+64 bytes) e armazena em cache
   lightMapCache.addresses = {}
   for i, result in ipairs(results) do
       lightMapCache.addresses[i] = result.address + 64
   end

   -- Aplica o valor desejado
   local edits = {}
   for i, addr in ipairs(lightMapCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = lightMapffoffvalor
       }
   end
   gg.setValues(edits)
   lightMapCache.lastValue = lightMapffoffvalor
   
   gg.toast("💡 Light Map modificado 💡")
   gg.clearResults()
end

-- Função para resetar o cache (opcional)
function resetLightMapCache()
   lightMapCache.addresses = nil
   gg.toast("Cache resetado (próxima chamada fará busca novamente)")
end




















-- Cache para armazenar endereços de vegetação
local vegetacaoCache = {
   addresses = nil,            -- Armazena os endereços encontrados
   lastTarget = "223.27423095703", -- Valor original de busca
   lastValue = nil             -- Último valor aplicado
}

-- Função principal otimizada
function vegetacaonoff(vegetacaonoffvalor)
   -- Se já temos cache, apenas atualiza os valores
   if vegetacaoCache.addresses then
       local edits = {}
       for i, addr in ipairs(vegetacaoCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = vegetacaonoffvalor
           }
       end
       gg.setValues(edits)
       vegetacaoCache.lastValue = vegetacaonoffvalor
       gg.toast("🌿 Vegetação atualizada 🌿")
       gg.clearResults()
       return
   end

   -- Busca inicial (executa apenas na primeira vez)
   gg.clearResults()
   gg.searchNumber(vegetacaoCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("Nenhum valor de vegetação encontrado!")
       return
   end

   -- Armazena endereços no cache (+32 bytes)
   vegetacaoCache.addresses = {}
   for i, result in ipairs(results) do
       vegetacaoCache.addresses[i] = result.address + 32
   end

   -- Aplica as edições
   local edits = {}
   for i, addr in ipairs(vegetacaoCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = vegetacaonoffvalor
       }
   end
   gg.setValues(edits)
   vegetacaoCache.lastValue = vegetacaonoffvalor
   
   gg.toast("🌿 Vegetação modificada 🌿")
   gg.clearResults()
end

-- Menu de opções (original otimizado)
function vegetacaoOptions()
   local choice = gg.choice({
       "🌿 Desativar Vegetação",
       "🌿 Ativar Vegetação"
   }, nil, "Opções de Vegetação:")
   
   if choice == 1 then vegetacaonoff(1.0) end
   if choice == 2 then vegetacaonoff(0.2) end
end

-- Função para resetar cache (opcional)
function resetVegetacaoCache()
   vegetacaoCache.addresses = nil
   gg.toast("Cache de vegetação resetado")
end






















-- Funções específicas para cada opção
function speedHackOptions()
   local speedMenu = gg.choice({
       "👣 Speed Hack 2x",
       "👣 Speed Hack 4x",
       "👣 Speed Hack 6x",
       "👣 Speed Hack 8x",
       "↩️ Voltar"
   }, nil, "Selecione a opção de Speed Hack:")

       if speedMenu == 1 then
           ativarspeed(2)
       elseif speedMenu == 2 then
           ativarspeed(4)
       elseif speedMenu == 3 then
           ativarspeed(6)
       elseif speedMenu == 4 then
           ativarspeed(8)
       elseif speedMenu == 5 then
           ativarspeed(1)
       end
     end
   
   
   
   -- Cache para armazenar endereços de speed
local speedCache = {
   addresses = nil,            -- Armazena os endereços encontrados
   lastTarget = "3.14159274101", -- Valor original de busca
   lastSpeed = nil             -- Última velocidade aplicada
}

-- Função principal otimizada
function ativarspeed(velocidadespeed)
   -- Validação do input
   if type(velocidadespeed) ~= "number" or velocidadespeed <= 0 then
       gg.toast("⚠️ Velocidade inválida! Deve ser um número positivo")
       return false
   end

   -- Se já temos cache, apenas atualiza os valores
   if speedCache.addresses then
       local edits = {}
       for i, addr in ipairs(speedCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = velocidadespeed
           }
       end
       gg.setValues(edits)
       speedCache.lastSpeed = velocidadespeed
       gg.toast(string.format("👣 Speed: %.1fx 👣", velocidadespeed))
       gg.clearResults()
       return true
   end

   -- Busca inicial (executa apenas na primeira vez)
   gg.clearResults()
   gg.searchNumber(speedCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("❌ Nenhum valor de speed encontrado!")
       return false
   end

   -- Armazena endereços no cache (-36 bytes)
   speedCache.addresses = {}
   for i, result in ipairs(results) do
       speedCache.addresses[i] = result.address - 36
   end

   -- Aplica as edições
   local edits = {}
   for i, addr in ipairs(speedCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = velocidadespeed
       }
   end
   gg.setValues(edits)
   speedCache.lastSpeed = velocidadespeed
   
   gg.toast(string.format("👣 Speed Hack: %.1fx ativado 👣", velocidadespeed))
   gg.clearResults()
   return true
end

-- Função para resetar cache (opcional)
function resetSpeedCache()
   speedCache.addresses = nil
   gg.toast("🔄 Cache de speed resetado")
end

-- Exemplo de uso:
-- ativarspeed(2.0)  -- 2x speed
-- ativarspeed(1.0)  -- Volta ao normal
-- resetSpeedCache()  -- Se precisar forçar nova busca






   function speedHackOptionsagachado()
       local speedMenuagachado = gg.choice({
           "👣 Speed Hack Agachado 2x",
           "👣 Speed Hack Agachado 4x",
           "👣 Speed Hack Agachado 6x",
           "👣 Speed Hack Agachado 8x",
           "↩️ Voltar"
       }, nil, "Selecione a opção de Speed Hack Agachado :")
   
           if speedMenuagachado == 1 then
               ativarspeedagachado(2)
           elseif speedMenuagachado == 2 then
               ativarspeedagachado(4)
           elseif speedMenuagachado == 3 then
               ativarspeedagachado(6)
           elseif speedMenuagachado == 4 then
               ativarspeedagachado(8)
           elseif speedMenuagachado == 5 then
               ativarspeedagachado(1)
           end
         end
       
       
       
       -- Cache para speed agachado
local speedAgachadoCache = {
   addresses = nil,
   lastTarget = "974.40002441406",
   lastSpeed = nil
}

-- Função principal otimizada
function ativarspeedagachado(velocidadespeed)
   -- Validação do input
   if type(velocidadespeed) ~= "number" or velocidadespeed <= 0 then
       gg.toast("⚠️ Velocidade inválida! Use um número positivo")
       return false
   end

   -- Se já existe cache, apenas atualiza
   if speedAgachadoCache.addresses then
       local edits = {}
       for i, addr in ipairs(speedAgachadoCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = velocidadespeed
           }
       end
       gg.setValues(edits)
       speedAgachadoCache.lastSpeed = velocidadespeed
       gg.toast(string.format("🦇 Speed Agachado: %.1fx ", velocidadespeed))
       gg.clearResults()
       return true
   end

   -- Busca inicial
   gg.clearResults()
   gg.searchNumber(speedAgachadoCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("❌ Valor base não encontrado!")
       return false
   end

   -- Armazena endereços (offset -72)
   speedAgachadoCache.addresses = {}
   for i, result in ipairs(results) do
       speedAgachadoCache.addresses[i] = result.address - 72
   end

   -- Aplica as edições
   local edits = {}
   for i, addr in ipairs(speedAgachadoCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = velocidadespeed
       }
   end
   gg.setValues(edits)
   speedAgachadoCache.lastSpeed = velocidadespeed
   
   gg.toast(string.format("🦇 Speed Agachado: %.1fx ativado", velocidadespeed))
   gg.clearResults()
   return true
end

-- Reset de cache
function resetSpeedAgachadoCache()
   speedAgachadoCache.addresses = nil
   gg.toast("🔄 Cache de speed agachado resetado")
end

-- Exemplo de uso:
-- ativarspeedagachado(3.0)  -- 3x de velocidade
-- resetSpeedAgachadoCache()  -- Força nova busca





















   function menuSuperPulo2()
       local menuSuperPulo = gg.choice({
         "🦘 Super Pulo 2X",
         "🦘 Super Pulo 4X",
         "🦘 Super Pulo 6X",
         "🦘 Super Pulo 8X",
         "❌ Desativar Super Pulo 2"
       }, nil, "📜 Menu Super Pulo 2")
       
       if menuSuperPulo == 1 then
         ativarSuperPulo2(2.5641089)
       elseif menuSuperPulo == 2 then
         ativarSuperPulo2(4.5641089)
       elseif menuSuperPulo == 3 then
         ativarSuperPulo2(6.5641089)
       elseif menuSuperPulo == 4 then
         ativarSuperPulo2(8.5641089)
       elseif menuSuperPulo == 5 then
         desativarSuperPulo2()
       end
     end





     -- Cache para super pulo
local superPuloCache = {
   addresses = nil,
   lastTarget = "4.15768349e21",
   lastJumpValue = nil
}

-- Função principal otimizada
function ativarSuperPulo2(valordosuperpulo)
   -- Validação do input
   if type(valordosuperpulo) ~= "number" or valordosuperpulo <= 0 then
       gg.toast("⚠️ Valor inválido! Use um número positivo")
       return false
   end

   -- Se já existe cache, apenas atualiza
   if superPuloCache.addresses then
       local edits = {}
       for i, addr in ipairs(superPuloCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = valordosuperpulo
           }
       end
       gg.setValues(edits)
       superPuloCache.lastJumpValue = valordosuperpulo
       gg.toast(string.format("🦘 Super Pulo: %.1f", valordosuperpulo))
       gg.clearResults()
       return true
   end

   -- Busca inicial
   gg.clearResults()
   gg.searchNumber(superPuloCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("❌ Valor base não encontrado!")
       return false
   end

   -- Armazena endereços (offset -36)
   superPuloCache.addresses = {}
   for i, result in ipairs(results) do
       superPuloCache.addresses[i] = result.address - 36
   end

   -- Aplica as edições
   local edits = {}
   for i, addr in ipairs(superPuloCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = valordosuperpulo
       }
   end
   gg.setValues(edits)
   superPuloCache.lastJumpValue = valordosuperpulo
   
   gg.toast(string.format("🦘 Super Pulo %.1f ativado", valordosuperpulo))
   gg.clearResults()
   return true
end

-- Reset de cache
function resetSuperPuloCache()
   superPuloCache.addresses = nil
   gg.toast("🔄 Cache de super pulo resetado")
end

-- Exemplo de uso:
-- ativarSuperPulo2(10.0)  -- Pulo 10x
-- ativarSuperPulo2(5.0)   -- Ajusta para 5x (instantâneo)
-- resetSuperPuloCache()   -- Força nova busca




       -- Cache para super pulo (compartilhado com ativarSuperPulo2)
local superPuloCache = {
   addresses = nil,
   lastTarget = "4.15768349e21",
   lastJumpValue = nil
}

-- Função de desativação otimizada
function desativarSuperPulo2()
   -- Valor padrão para desativação
   local defaultJumpValue = 0.8

   -- Se já temos cache, apenas atualiza
   if superPuloCache.addresses then
       local edits = {}
       for i, addr in ipairs(superPuloCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = defaultJumpValue
           }
       end
       gg.setValues(edits)
       superPuloCache.lastJumpValue = defaultJumpValue
       gg.toast("🦘 Super Pulo DESATIVADO")
       gg.clearResults()
       return true
   end

   -- Busca inicial se não tiver cache
   gg.clearResults()
   gg.searchNumber(superPuloCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("❌ Valor base não encontrado!")
       return false
   end

   -- Armazena endereços (offset -36)
   superPuloCache.addresses = {}
   for i, result in ipairs(results) do
       superPuloCache.addresses[i] = result.address - 36
   end

   -- Aplica desativação
   local edits = {}
   for i, addr in ipairs(superPuloCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = defaultJumpValue
       }
   end
   gg.setValues(edits)
   superPuloCache.lastJumpValue = defaultJumpValue
   
   gg.toast("🦘 Super Pulo DESATIVADO")
   gg.clearResults()
   return true
end




-- Cache para lataria de carro
local latariaCache = {
   addresses = nil,
   lastTarget = "1.18920695781708",
   lastValue = nil
}

-- Função principal otimizada
function editarlatariadocarro(valordalataria)
   -- Validação do input
   if type(valordalataria) ~= "number" then
       gg.toast("⚠️ Valor inválido! Use um número")
       return false
   end

   -- Se já temos cache, apenas atualiza
   if latariaCache.addresses then
       local edits = {}
       for i, addr in ipairs(latariaCache.addresses) do
           edits[i] = {
               address = addr,
               flags = gg.TYPE_FLOAT,
               value = valordalataria
           }
       end
       gg.setValues(edits)
       latariaCache.lastValue = valordalataria
       gg.toast(string.format("🚗 Lataria: %.2f", valordalataria))
       gg.clearResults()
       return true
   end

   -- Busca inicial
   gg.clearResults()
   gg.searchNumber(latariaCache.lastTarget, gg.TYPE_FLOAT)
   
   local results = gg.getResults(5000)
   if #results == 0 then
       gg.toast("❌ Valor base não encontrado!")
       return false
   end

   -- Armazena endereços (offset +1020)
   latariaCache.addresses = {}
   for i, result in ipairs(results) do
       latariaCache.addresses[i] = result.address + 1020
   end

   -- Aplica edições
   local edits = {}
   for i, addr in ipairs(latariaCache.addresses) do
       edits[i] = {
           address = addr,
           flags = gg.TYPE_FLOAT,
           value = valordalataria
       }
   end
   gg.setValues(edits)
   latariaCache.lastValue = valordalataria
   
   gg.toast(string.format("🚗 Lataria modificada: %.2f", valordalataria))
   gg.clearResults()
   return true
end

-- Reset de cache
function resetLatariaCache()
   latariaCache.addresses = nil
   gg.toast("🔄 Cache de lataria resetado")
end

-- Exemplo de uso:
-- editarlatariadocarro(10000000000)  -- Valor alto para efeitos visuais
-- editarlatariadocarro(1.0)          -- Volta ao normal
-- resetLatariaCache()                -- Força nova busca










function aimkillcarro()
   local aimkillcarroonoff = gg.choice({"🚗 Ativar", "🚗 Desativar", "◀️ Voltar"}, nil, versao)
   if aimkillcarroonoff == nil then
       gg.toast("Nenhuma opção selecionada")
       verificarAutenticacao()
       verificarExpiracao()
       return
   end

   if aimkillcarroonoff == 1 then aimkillcarroon() end
   if aimkillcarroonoff == 2 then aimkillcarrooff() end
   if aimkillcarroonoff == 3 then loop(menupremium,"prin") end
end

function aimkillcarroon()
   editarlatariadocarro(10000000000)
end

function aimkillcarrooff()
   editarlatariadocarro(1000)
end

-- Cheat das armas
function cheatarmas()
   local weapon = gg.prompt({"Digite a quantidade de munição da arma\nEx: 100-50\nVocê digita 150"}, {"0"}, {"number"})
   if weapon == nil then
       gg.toast("Cancelado")
       return
   end

   gg.searchNumber(weapon[1], gg.TYPE_DWORD)
   gg.alert("Gaste uma munição da arma!!")
   gg.toast("Você tem 5 segundos para gastar uma munição")
   gg.sleep(5000)

   local weapon2 = gg.prompt({"Agora digite a quantidade de munição que está após 1 tiro\nEx: 99-50\nVocê digita 149"}, {"0"}, {"number"})
   if weapon2 == nil then
       gg.toast("Cancelado")
       return
   end

   gg.refineNumber(weapon2[1], gg.TYPE_DWORD)
   local t = gg.getResults(99999)
   for i, v in ipairs(t) do
       if v.flags == gg.TYPE_DWORD then
           v.value = weapon[1]
           v.freeze = true
       end
   end
   gg.addListItems(t)
   gg.clearResults()
   gg.toast("Ativo")
end

-- Tela esticada
function esticada()
esticadat = gg.choice({"✔️ Ativar", "❌ Desativar", "Voltar"}, nil, versao)

   if esticadat == 1 then esticadaon() end
   if esticadat == 2 then esticadaoff() end
   if esticadat == 3 then loop(menupremium,"prin") end
end

function esticadaon()
   gg.searchNumber("70", gg.TYPE_FLOAT)
   gg.getResults(99999)
   gg.editAll("120", gg.TYPE_FLOAT)
   gg.toast("Tela esticada ON")
   gg.clearResults()
end

function esticadaoff()
   gg.searchNumber("120", gg.TYPE_FLOAT)
   gg.getResults(99999)
   gg.editAll("70", gg.TYPE_FLOAT)
   gg.toast("Tela esticada OFF")
   gg.clearResults()
end

-- Wallhack
function wallhack()
wallhack1 = gg.choice({"👻 Ativar", "👻 Desativar", "◀️ Voltar"}, nil, versao)

   if wallhack1 == 1 then wallon() end
   if wallhack1 == 2 then walloff() end
   if wallhack1 == 3 then loop(menupremium,"prin") end
end

function wallon()
   gg.searchNumber("60", gg.TYPE_FLOAT)
   gg.getResults(99999)
   gg.editAll("60.7", gg.TYPE_FLOAT)
   gg.toast("Wall hack ON")
   gg.clearResults()
end

function walloff()
   gg.searchNumber("60.7", gg.TYPE_FLOAT)
   gg.getResults(99999)
   gg.editAll("60", gg.TYPE_FLOAT)
   gg.toast("Wall hack OFF")
   gg.clearResults()
end

-- Lataria infinita
function latariainf()
latariainfonoff = gg.choice({"🚗 Ativar", "🚗 Desativar", "◀️ Voltar"}, nil, versao)
   if latariainfonoff == 1 then latariainfon() end
   if latariainfonoff == 2 then latariainfoff() end
   if latariainfonoff == 3 then loop(menupremium,"prin") end
end

function latariainfon()
   editarlatariadocarro(999999)
end

function latariainfoff()
   editarlatariadocarro(1000)
end


function quebrarveiculo()
   editarlatariadocarro(0)
   end







-- Criadores
function criadores()
   gg.alert("👨🏻‍💻CRIADORES DA SCRIPTS:\n\n\n\nBY KAUAN MODS ")
end

-- Sair
function exit()
   gg.alert("Script finalizada com sucesso, Obrigado por adquirir e usar nossas scripts, até mais ❤️!")
   os.exit()
end




function setFloat(address, value, message)
   gg.setValues({{address = address, flags = gg.TYPE_FLOAT, value = value}})
   gg.toast(message)
end



while true do
if gg.isVisible(true) then
MAINLUA = 1
gg.setVisible(false)
end
if MAINLUA == 1 then
Main()
end
end
