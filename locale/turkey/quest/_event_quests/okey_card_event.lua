--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest cards_event begin
	state start begin
		when 79505.pick with pc.count_item(79505) >= 24 begin
			pc.remove_item(79505, 24)
			pc.give_item2(79506)
		end
		when 20417.chat."Okey Kart T�m S�ralama" begin
			say_title(mob_name(20417))
			say("")
			say_reward("T�m s�ralama a�a��daki gibidir.")
			say(pc.get_okay_global_rank())
			if game.get_event_flag("cards_event") == 0 then
				npc.purge()
			end
		end
		when 20417.chat."Okey Kart �lk 10" begin
			say_title(mob_name(20417))
			say("")
			say_reward("�lk 10 s�ralama a�a��daki gibidir.")
			say(pc.get_okay_rund_rank())
			if game.get_event_flag("cards_event") == 0 then
				npc.purge()
			end
		end
	end
end