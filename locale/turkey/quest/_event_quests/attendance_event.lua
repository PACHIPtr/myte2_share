--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest attendance_event begin
	state start begin	
        function getInfoByMob(mobVnum)
            info_map = {
                [6415]     = { "beran_hit_points", 2000, 1000, 500 },
                [6416]     = { "nemere_hit_points", 2000, 1000, 500 },
                [6417]     = { "razador_hit_points", 2000, 1000, 500 },
				[6418]     = { "jotun_thrym_hit_points", 2000, 1000, 500 },
				[6419]     = { "red_dragon_hit_points", 2000, 1000, 500 },
            }

            mobVnum = tonumber(mobVnum)

            return info_map[mobVnum]
        end
	
		when 30131.chat."Patron Avc�lar� Etkinli�i" with game.get_event_flag("enable_attendance_event") >= 1 begin
			say("Patron av� etkinli�i seviye 30 �zeri oyuncular")
			say("i�in.")
			say("Ba�lang��ta patron canavarlar tarafs�z b�lgelerde")
			say("belirir.")
			say("Her g�n bir �d�l alabilirsin.")
			say("En az bir isabetle g�nl�k �d�l�n� elde edersin.")
			say("Ayr�ca bir etkinlik �d�l� kazanma �ans�n olur -")
			say("patron canavar ba�� isabetlerin ge�erli say�l�r.")
			say("")
			say("Oradan hayat puanlar�n�n g�ncel durumunu da")
			say("��renebilir ve �d�llerini alabilirsin. Hayat")
			say("puanlar�n ne kadar y�ksekse �d�l�n o kadar")
			say("y�kselir.")
		end
		
		when 30131.chat."�d�l�n� teslim al" with game.get_event_flag("enable_attendance_event") >= 1 begin
			local selectEvent = select(mob_name(6415), mob_name(6416), mob_name(6417), mob_name(6419), "Vazge� ")
			if selectEvent == 1 or selectEvent == 2 or selectEvent == 3 or selectEvent == 4 then
				local mob_vnum = 0
				
				if selectEvent == 1 then
					mob_vnum = 6415
				elseif selectEvent == 2 then
					mob_vnum = 6416
				elseif selectEvent == 3 then
					mob_vnum = 6417
				elseif selectEvent == 4 then
					mob_vnum = 6419
				end
				
				local map_info = attendance_event.getInfoByMob(mob_vnum)
				
				if mob_vnum != 0 and map_info != null then
					local selectReward = select(item_name(50272), item_name(50273), item_name(50274), "Vazge� ")
					if selectReward == 1 or selectReward == 2 or selectReward == 3 then
						local item_vnum = 0
						local rewardPoints = 0
						
						if selectReward == 1 then
							item_vnum = 50272
							rewardPoints = map_info[2]
						elseif selectReward == 2 then
							item_vnum = 50273
							rewardPoints = map_info[3]
						elseif selectReward == 3 then
							item_vnum = 50274
							rewardPoints = map_info[4]
						end

						if item_vnum != 0 and rewardPoints != 0 then
							if pc.getqf(map_info[1]) >= rewardPoints then
								say_title("Patron Avc�lar� Etkinli�i")
								say("Bu e�yay� se�mek istedi�ine emin misin ? "..item_name(item_vnum))
								say("("..rewardPoints.." Hayat puan� otomatik d��ecek)")
								say("")
								say(mob_name(mob_vnum).." Sahip Olunan Hayat Puan�: "..pc.getqf(map_info[1]))
								say("")
								
								local selectReturn = select("Evet", "Hay�r")
								if selectReturn == 1 then
									pc.setqf(map_info[1], pc.getqf(map_info[1]) - rewardPoints)
									pc.give_item2(item_vnum, 1)
								elseif selectReturn == 2 then
									return
								end
							else
								say_title("Patron Avc�lar� Etkinli�i")
								say("Karakterinden "..rewardPoints.." Hayat Puan� d���ld� ")
								say("E�ya envanterine eklendi.")
								say("Yeni hayat puan�: "..pc.getqf(map_info[1]))
							end
						end
					elseif selectReward == 4 then
						return
					end
				end
			elseif selectEvent == 5 then
				return
			end
		end

		when 30131.chat."Toplam Puan" with game.get_event_flag("enable_attendance_event") >= 1 begin
			say_title("Patron Avc�lar� Etkinli�i")
			say(mob_name(6415).." Hayat Puan�: "..pc.getqf("beran_hit_points"))
			say("")
			say(mob_name(6416).." Hayat Puan�: "..pc.getqf("nemere_hit_points"))
			say("")
			say(mob_name(6417).." Hayat Puan�: "..pc.getqf("razador_hit_points"))
			say("")
			say(mob_name(6192).." Hayat Puan�: "..pc.getqf("jotun_thrym_hit_points"))
			say("")
			say(mob_name(6419).." Hayat Puan�: "..pc.getqf("red_dragon_hit_points"))
			say("")
		end
	end
end
