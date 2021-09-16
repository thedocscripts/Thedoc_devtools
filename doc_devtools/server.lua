local Webhook = ''

local SystemName = 'Thedoc_devtools'

RegisterCommand("getcoords", function(source, args, rawCommand)
    local source = source
    TriggerClientEvent('doc_getcoords', source)
end, true)

RegisterCommand("vcoords", function(source, args, rawCommand)
    local source = source
	TriggerClientEvent('doc_getcoords1', source)
end, true)

RegisterServerEvent('doc_getcoords:print')
AddEventHandler('doc_getcoords:print', function(msg)
    ToDiscord(SystemName, '```css\n '..msg..'\n```')
end)

function ToDiscord(Name, Message, Image)
	if Message == nil or Message == '' then
		return false
	end
	
	if Image then
		PerformHttpRequest(Webhook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image}), { ['Content-Type'] = 'application/json' })
	else
		PerformHttpRequest(Webhook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message}), { ['Content-Type'] = 'application/json' })
	end
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end