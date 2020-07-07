--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest ork_maze begin
	state start begin
		when 20403.chat."Ork Zindan� " begin
			if party.is_leader() or party.is_party() then
				say_reward("Bu zindana grup halinde giremezsin")
				say_reward("l�tfen �nce bulundugun grupdan ayril !")
				return
			end
			if not pc.get_channel_id() == 1 then
				say_title("Ork Zindani:")
				say("Sadece 1. kanaldan giri� yapabilirsin.")
				return
			end
			-- sys_log(0,"ork_maze quest open")

			say_title(mob_name(20403))
			say("")
			say("Ork Zindan� yeralt�ndaki en tehlikeli[ENTER]yarat�klar�n bulundugu bir yeralt� zindan�[ENTER]giri� yapabilmek i�in 40 ila 70 seviye aras�nda olman gerekiyor")
			say_item(item_name(90005),90005, "")
			wait()
			say_title(mob_name(20403))
			say("")
			say("Giri� yapt���nda e�ya yok olacak. ")
			say("")
			say_reward("Devam etmek istiyor musun?")
			say("")
			local s = select("Evet", "Hay�r")
			-- ------------ Dungeon Turn Back System ----------------------
			-- pc.remove_turn_back_dungeon()
			-- ------------------------------------------------------------
			if s == 1 then
				if not pc.can_warp() then
					say_title(mob_name(20403))
					say("")
					say("Hen�z ���nlanamazs�n.")
					say("")
					return
				elseif pc.count_item(90005) < 1 then
					say_title(mob_name(20403))
					say("")
					say("Envanterinde yeterli miktarda yok:")
					say(string.format("%s.", item_name(90005)))
					say("")
					return
				elseif pc.level < 40 or pc.level > 70 then
					say_title(mob_name(20403))
					say("")
					say("Seviyen giri� gereksinimlerini kar��lam�yor. ")
					say("Gereksinimler:")
					say(string.format("Minimum Seviye: %d.",40))
					say(string.format("Maksimum Seviye: %d.",70))
					say("")
					return
				elseif get_time() < pc.getqf("ork_player_time_110") then
					say_title(mob_name(20403))
					say("")
					say("Soguma sureniz henuz dolmadi!")
					say("Kalan s�re: "..dungeon_get_duration(pc.getqf("ork_player_time_110") - get_global_time()).."")
					say("")
					if (game.get_event_flag("enable_time_orkmaze") == 1) then
						say("Beta Server; s�reyi s�f�rlamak m� istiyorsun?")
						if select("Evet","Hay�r") == 1 then
							pc.setqf("ork_player_time_110",0)
							return
						end
					end
					return
				elseif game.get_event_flag("enable_orcmaze_dungeon") == 1 then
					say_title(mob_name(20403))
					say("")
					say("Ork Zindan� hen�z aktif durumda de�ildir.")
					say("")
					return
				else
					pc.remove_item(90005, 1)
					pc.setqf("ork_player_time_110", get_time()+60*60*1)
					pc.setqf("join_orcmaze_dung", 1)
					d.new_jump(245, 12143 * 100, 7273 * 100)
				end
			end
		end

		--d.MapControl
		when login with pc.get_map_index() == 245 begin
			pc.set_warp_location(67, 2894, 66)
			d.exit()
		end
		
		when logout with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2459999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("ork_maze","dungeon_turn",1)
			------------------------------------------------------------
		end

		--d.FloorOne
		when login with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 begin
			if pc.getqf("join_orcmaze_dung") > 0 then
				pc.setqf("join_orcmaze_dung", 0)
				d.setqf2("orcmaze_dungeon","last_exit_time", get_global_time())
				d.setf("orc_level", 1)
				d.regen_file("data/dungeon/orcmaze/regen_1.txt")
				server_timer('orclogintime1', 5, d.get_map_index())
				d.set_unique("door", d.spawn_mob_ac_dir(20387, 236, 229, 195))
				server_timer ("orcfloor1_eli_check_timer", 5,d.get_map_index())
			end
			--cmdchat("OpenMidgardCoolTime")
		end

		--d.FloorOneStart
		when orcfloor1_eli_check_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("floor_one_finish") == 1 then
					d.jump_all (577+12032, 1048+7168)
					local per = number(1,100)
					if per <= 33 then
						d.regen_file("data/dungeon/orcmaze/regen_2_1.txt")
					elseif per >= 34 and per <= 66 then
						d.regen_file("data/dungeon/orcmaze/regen_2_2.txt")
					else
						d.regen_file("data/dungeon/orcmaze/regen_2_3.txt")
					end
					d.setf("floor_two_stone_count", 0)
					d.zodiac_notice_clear()
					d.zodiac_notice("(2. G�rev) �� Sonsuzluk ta�� labirentin d�rt bir yan�na g�nderildi. Onlar� bulup yok etmelisiniz!")
				end
			end
		end

		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 8116 begin
			local per = number(1,100)
			if d.getf("floor_one_stone_count") < 6 then
				if per <= 10 then
					d.clear_regen()
					d.kill_all()
					d.zodiac_notice_clear()
					d.zodiac_notice("(1.G�rev) Do�ru metin ta��n� buldunuz, bir �st kata ���nlan�yorsunuz.")
					d.setf("floor_one_finish", 1)
					server_timer ("orcfloor1_eli_check_timer", 5,d.get_map_index())
				else
					d.zodiac_notice_clear()
					d.zodiac_notice("(1.G�rev) Yanl�� metin ta��n� kestiniz!")
					d.setf("floor_one_stone_count", d.getf("floor_one_stone_count") + 1)
					pc.aggregate_monster()
				end
			else
				d.kill_all()
				d.clear_regen()
				d.regen_file("data/dungeon/orcmaze/regen_1.txt")
				d.setf("floor_one_stone_count", 0)
				d.zodiac_notice_clear()
				d.zodiac_notice("(1.G�rev) Metin ta�lar�n�n hepsi yok oldu ve do�ru metin ta��n� bulamad�n�z. Metin ta�lar� ve yarat�klar yenilendi.")
			end
		end

		when orcfloor2_1_eli_check_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("floor_two_finish") == 1 then
					d.jump_all (386+12032, 1393+7168)
					d.regen_file("data/dungeon/orcmaze/regen_3.txt")
					d.zodiac_notice_clear()
					d.zodiac_notice("(3. G�rev) Yolun sonuna gidin ve cehennemle tan���n! Onu yenerseniz kilitli kap� sizin i�in a��lacak.")
					--server_timer('orcfloor3_eli_check_timer', 5,d.get_map_index())
				end
			end
		end

		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 692 begin
			d.clear_regen()
			d.kill_all()
			d.zodiac_notice_clear()
			d.zodiac_notice("(3. G�rev) Cehennemi yendiniz. Ork anahtar�n�z� kullanarak kap�y� a��n.")
			d.set_unique("door", d.spawn_mob_ac_dir(20387, 236, 229, 195))
			d.setf("floor_three_finish", 1)
			server_timer('orcfloor3_1_eli_check_timer', 5,d.get_map_index())
		end

		when orcfloor3_1_eli_check_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.jump_all (242+12032, 200+7168)
			end
		end

		when orcfloor3_eli_check_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("floor_three_finish") == 1 then
					d.regen_file("data/dungeon/orcmaze/regen_4.txt")
					d.zodiac_notice_clear()
					d.zodiac_notice("(4. G�rev) Koridordan gidin ve Orc Vezirini yok edin!")
				end
			end
		end

		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 693 begin
			d.setf("floor_four_finish", 1)
			d.clear_regen()
			d.kill_all()
			d.zodiac_notice_clear()
			d.zodiac_notice("(3. G�rev) Orc Vezirini yok ettiniz! Boss Odas�na ���nlan�yorsunuz.")
			server_timer('orcfloor4_eli_check_timer', 5,d.get_map_index())
		end

		when orcfloor4_eli_check_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("floor_four_finish") == 1 then
					d.jump_all (138+12032, 934+7168)
					d.regen_file("data/dungeon/orcmaze/regen_boss.txt")
					d.zodiac_notice_clear()
					d.zodiac_notice("(4. G�rev) Kara Ork Reisi deh�et sa��yor. Onu yok etmelisiniz!")
					-- server_timer('orcfloor_boss_eli_check_timer', 5,d.get_map_index())
				end
			end
		end
		
		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 694 begin
			d.setf("floor_boss_finish", 1)
			d.clear_regen()
			d.kill_all()
			d.zodiac_notice_clear()
			d.zodiac_notice("(Boss G�revi) Ork Zindan�n� Yok Ettiniz! 2 Dakika Sonra D��ar� G�nderileceksiniz.")
			timer('exit_orkmaze', 60*2)
		end

		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 8001 begin
			if d.getf("floor_two_stone_count") == 0 then
				d.zodiac_notice_clear()
				d.zodiac_notice("(2.G�rev) Kesilen metin ta��: 1 - Kalan metin ta��: 2")
				d.setf("floor_two_stone_count", 1)
			elseif d.getf("floor_two_stone_count") == 1 then 
				d.zodiac_notice_clear()
				d.zodiac_notice("(2.G�rev) Kesilen metin ta��: 2 - Kalan metin ta��: 1")
				d.setf("floor_two_stone_count", 2)
			else
				d.zodiac_notice_clear()
				d.zodiac_notice("(2.G�rev) Metin ta�lar�n� yok ettiniz! �imdi canavarlar� �ld�r�p ork anahtar�n� al�n o sizi �st kata ���nlayacakt�r.")
				d.setf("floor_two_stone_count", 3)
			end
		end

		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 696 or npc.get_race() == 695 begin
			local per = number(600,650)
			if d.count_monster() <= per and d.getf("floor_two_stone_count") == 3 then
				d.zodiac_notice_clear()
				d.zodiac_notice("(2.G�rev) Ork Anahtar�n� elde ettiniz. Onunla bir �st kata ���nlanabilirsiniz.")
				d.clear_regen()
				d.kill_all()
				game.drop_item(50904,1)
				d.setf("use_lock", 1)
			end
		end

		when 50904.use with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 begin
			if d.getf("use_lock") == 1 then
				d.setf("use_lock", 0)
				d.setf("floor_two_finish", 1)
				d.zodiac_notice_clear()
				d.zodiac_notice("(2. G�rev) Anahtar sizi 5 saniye sonra ���nlayacak.")
				server_timer('orcfloor2_1_eli_check_timer', 5,d.get_map_index())
			else
				syschat("Anahtar� tekrar kullanamazs�n�z. Sadece kilitli olan kap�n�n �zerine s�r�kleyebilirsiniz.")
			end
		end
		
		when 20387.take with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and item.vnum == 50904 begin
			d.purge_unique("door")
			d.zodiac_notice_clear()
			d.zodiac_notice("(4. G�rev) Kap� kilidini a�t�n�z. 5 Saniye sonra Ork Veziri G�nderilecek! Bol �ans")
			server_timer('orcfloor3_eli_check_timer', 5,d.get_map_index())
		end
		--d.TimerControl
		when orclogintime1.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("(1.G�rev) A��k Olan Kap�dan Gidin ve Do�ru Metin Ta��n� Yok Edin! - (Zindan� tamamlamak i�in 45 dakika vaktiniz kald�)")
				server_timer('orclogintime2', 10*60,d.get_map_index())
			end
		end
		when orclogintime2.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 35 dakika vaktiniz kald�.")
				server_timer('orclogintime3', 10*60,d.get_map_index())
			end
		end
		when orclogintime3.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 25 dakika vaktiniz kald�.")
				server_timer('orclogintime4', 10*60,d.get_map_index())
			end
		end
		when orclogintime4.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 15 dakika vaktiniz kald�.")
				server_timer('orclogintime5', 10*60,d.get_map_index())
			end
		end
		when orclogintime5.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 5 dakika vaktiniz kald�.")
				server_timer('orclogintime6', 4*60,d.get_map_index())
			end
		end

		when orclogintime6.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 1 dakika vaktiniz kald�.")
				server_timer('orclogintimeend', 60,d.get_map_index())
			end
		end
		when orclogintimeend.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamakta ba�ar�s�z oldun. 5 saniye i�erisinde d��ar� ���nlan�yorsunuz.")
				server_timer('orctimefail', 5,d.get_map_index())
			end
		end
		when orctimefail.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.exit_all_to_start_position()
			end
		end

		when exit_orkmaze.timer begin
			d.setqf2("orcmaze_dungeon","last_exit_time", get_global_time())
			d.exit_all_to_start_position()
		end
		--d.TimerControl
	end
end