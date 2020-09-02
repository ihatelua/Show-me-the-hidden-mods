Hooks:PostHook(NetworkPeer, "set_ip_verified", "cheaterz_go_to_hell_haha", function(self, state)

	if not Network:is_server() then
		return
	end
	
	DelayedCalls:Add( "cheaterz_go_to_hell_d", 2, function()
		local user = Steam:user(self:ip())
		if user and user:rich_presence("is_modded") == "1" or self:is_modded() then
			managers.chat:feed_system_message(1, self:name() .. " HAS MODS! Checking...")
			for i, mod in ipairs(self:synced_mods()) do
				local mod_mini = string.lower(mod.name)	
				managers.chat:feed_system_message(1, self:name() .. " mod : " .. mod.name)
			end
		else
			managers.chat:feed_system_message(1, self:name() .. " doesn't seem to have mods.")
		end
	end)
end)