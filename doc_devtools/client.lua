ESX                           = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


RegisterNetEvent('doc_getcoords')
AddEventHandler('doc_getcoords', function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local codeA = "{x = "..round(x,2)..",  y = "..round(y,2)..",  z = "..round(z,2).."},"
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'coordmenu',
        {
          title = "Nombre"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('doc_getcoords:print', name.." : "..codeA)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
    
end)

RegisterNetEvent('doc_getcoords1')
AddEventHandler('doc_getcoords1', function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local codeA = round(x,2)..", "..round(y,2)..", "..round(z,2)
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'coordmenu',
        {
          title = "Nombre"
        },
        function(data, menu)
            local name = data.value
            TriggerServerEvent('doc_getcoords:print', name.." : "..codeA)
            menu.close()
        end,
      function(data, menu)
        menu.close()
      end)
end)

RegisterCommand('copyc', function(source, args, rawCommand)
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	SendNUIMessage({
		coords = ""..round(x, 2)..", "..round(y, 2)..", "..round(z, 2)..""
	})
end)

RegisterCommand('copyc1', function(source, args, rawCommand)
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	SendNUIMessage({
		coords = "{x = "..round(x,2)..",  y = "..round(y,2)..",  z = "..round(z,2).."},"
	})
end)



function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end