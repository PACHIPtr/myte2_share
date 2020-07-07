--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest vip_packet begin
	state start begin
		when login or levelup with pc.level > 15 begin
			set_state(order_vip)
		end
	end
	state order_vip begin
		when login or enter begin
			send_letter("&Paketler")
		end
		when button or info begin
			say_title("Paketler: ")
			say("")
			say("Karakterini g��lendirecek paketler nesne markette.")
			say("Karakterinin geli�imini sa�layacak ekstra g��lendirmeler")
			say("120. seviyeye ula�mana yard�mc� olacak.")
			set_state(_COMPLETE)
		end
	end
	state _COMPLETE begin
	end
end