--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest year_round_event begin
	state start begin
		when 20430.chat."Y�ld�n�m� Paras� " with game.get_event_flag("2017_year_round_event") > 0 begin
			say_title("Cherie")
			say("")
			say("Demek y�ld�n�m� paras� d�n��t�rmek istiyorsun...")
			say("500 Y�ld�n�m� puan� kar��l���nda")
			say("1 y�ld�n�m� paras� alacaks�n.")
			say_reward(string.format("Mevcut Y�ld�n�m� Puan�: %s",pc.get_year_round_point()))
			say_reward("Devam etmek istiyor musun?")
			local s = select("Evet","Hay�r")
			if s == 1 then
				if pc.is_busy() == true then
					say_title("Cherie")
					say("")
					say_reward("Me�gul durumdayken bunu ger�ekle�tiremezsin.")
				elseif pc.is_dead() == true then
					say_title("Cherie")
					say("")
					say_reward("�l� durumdayken bunu ger�ekle�tiremezsin.")
				elseif pc.get_year_round_point() < 500 then
					say_title("Cherie")
					say("")
					say_reward("Yeterli miktarda y�ld�n�m� puan�na sahip de�ilsin.")
				else
					say_title("Cherie")
					say("")
					say_reward("1 Y�ld�n�m� paras� kazand�n.")
					pc.change_year_round_point(-500)
					pc.give_item2("25105",1)
				end
			else
			end
		end
		
		when 6420.kill with game.get_event_flag("2017_year_round_event") > 0 and pc.get_channel_id() == 1 begin
			local stime = 60*60*3
			if pc.get_map_index() == 61 then
				server_timer("shadow_warrior_timer_61", stime)
			elseif pc.get_map_index() == 62 then
				server_timer("shadow_warrior_timer_62", stime)
			elseif pc.get_map_index() == 63 then
				server_timer("shadow_warrior_timer_63", stime)
			elseif pc.get_map_index() == 64 then
				server_timer("shadow_warrior_timer_64", stime)
			end
			notice_all(string.format("G�lge Sava���s� katledildi! %s dakika sonra tekrar d�necek.", stime/60/60))
		end
		
		when shadow_warrior_timer_61.server_timer begin
			spawn_mob0(6420, 61, 693, 290)
			clear_server_timer("shadow_warrior_timer_61")
		end
		
		when shadow_warrior_timer_62.server_timer begin
			spawn_mob0(6420, 62, 206, 710)
			clear_server_timer("shadow_warrior_timer_62")
		end
		
		when shadow_warrior_timer_63.server_timer begin
			spawn_mob0(6420, 63, 851, 624)
			clear_server_timer("shadow_warrior_timer_63")
		end
		
		when shadow_warrior_timer_64.server_timer begin
			spawn_mob0(6420, 64, 719, 1120)
			clear_server_timer("shadow_warrior_timer_64")
		end
	end
end