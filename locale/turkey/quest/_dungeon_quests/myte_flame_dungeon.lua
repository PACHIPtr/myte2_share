--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest flame_dungeon begin
	state start begin
		when 20394.click with pc.get_level() >= 90 begin
			--pc.give_item2(71174, 1)
			
			set_state(run)
		end

		when login with flame_dungeon.is_flamed(pc.get_map_index()) begin
			--pc.give_item2(71174, 1)
			set_state(run)		
			flame_dungeon.entry_setting()
		end

				
		when flame_dungeon_45m_left_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(string.format("Kalan zaman: %d dakika", 45),d.notice)
				notice_multiline("S�re bitince  kale'nin d���na at�lacaks�n�z.",d.notice)
				server_timer('flame_dungeon_30m_left_timer', 15*60, get_server_timer_arg())
			end
		end
		when flame_dungeon_30m_left_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(string.format("Kalan zaman: %d dakika", 30),d.notice)
				notice_multiline("S�re bitince kale'nin d���na at�lacaks�n�z.",d.notice)
				server_timer('flame_dungeon_15m_left_timer', 15*60, get_server_timer_arg())
			end
		end
		when flame_dungeon_15m_left_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(string.format("Kalan zaman: %d dakika", 15),d.notice)
				notice_multiline("S�re bitince kale'nin d���na at�lacaks�n�z.",d.notice)
				server_timer('flame_dungeon_5m_left_timer', 10*60, get_server_timer_arg())
			end
		end
		when flame_dungeon_5m_left_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(string.format("Kalan zaman: %d dakika", 5),d.notice)
				notice_multiline("S�re bitince kale'nin d���na at�lacaks�n�z.",d.notice)
				server_timer('flame_dungeon_1m_left_timer', 4*60, get_server_timer_arg())
			end
		end
		when flame_dungeon_1m_left_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(string.format("Kalan zaman: %d dakika(lar)", 1),d.notice)
				notice_multiline("S�re bitince kale'nin d���na at�lacaks�n�z.",d.notice)
				server_timer ("flame_dungeon_0m_left_timer", 60, get_server_timer_arg())
			end
		end
		when flame_dungeon_0m_left_timer.server_timer begin
			local setting = flame_dungeon.setting()
			if d.select(get_server_timer_arg()) then		
				notice_multiline("Size ay�r�lan s�re doldu.10 Saniye[ENTER]i�inde kale'nin kap�lar� sizin i�in a��lacak.",d.notice)
				notice_multiline("10 Saniye i�inde herkes ���nlanacak.",d.notice)
				server_timer("dungeon_end_timer",10,d.get_map_index())	
			end
		end	
		
		when dungeon_end_timer.server_timer begin -- ?? ??? (??? ????)
			local setting = flame_dungeon.setting()
			if d.select(get_server_timer_arg()) then
				flame_dungeon.clear_timer(d.get_map_index())		
				d.set_warp_location(62, setting.outside_entry_pos[1] , setting.outside_entry_pos[2]) 
				d.exit_all()
			end
		end

		when killed_A_1.server_timer begin -- ??? ???1 (level1,level3)
			if d.select(get_server_timer_arg()) then
				if d.count_monster() <= 0 then -- 1?? ??? ???
					if d.getf("level") == 11 then
						notice_multiline("B�t�n �eytanlar� yendiniz,",d.notice)
						notice_multiline("Yeni g�rev i�in Am-heh ile g�r���n...",d.notice)
					else
						notice_multiline("B�t�n �eytanlar� yendiniz,",d.notice)
						notice_multiline("Yeni g�rev i�in Am-heh ile g�r���n...",d.notice)
					end
					d.setf("level",0)
				else 
					server_timer ("killed_A_2", 6, get_server_timer_arg())
				end
			end
		end

		when killed_A_2.server_timer begin -- ??? ???2 (1? 2 ?????? ???)
			if d.select(get_server_timer_arg()) then
				if d.count_monster() <= 0 then -- 1?? ??? ???
					if d.getf("level") == 11 then
						notice_multiline("B�t�n �eytanlar� yendiniz,",d.notice)
						notice_multiline("Yeni g�rev i�in Am-heh ile g�r���n...",d.notice)
					else
						notice_multiline("B�t�n �eytanlar� yendiniz,",d.notice)
						notice_multiline("Yeni g�rev i�in Am-heh ile g�r���n...",d.notice)
					end
					d.setf("level",0)
				else 
					server_timer ("killed_A_1", 6, get_server_timer_arg())
				end
			end
		end
	end

	state run begin
	
	function setting()
		return 
		{
		["bossroom_entry_pos"] = {8109,6867},
		["boss_pos"] = {686,637},
		["doors_pos"] = {
			{320,394},
			{293,359},
			{333,321},
			{378,320},
			{400,355},
			{394,401}
		},
		["idoors_pos"] = {
			{268,447},
			{234,359},
			{300,264},
			{454,217},
			{470,355},
			{467,469}
		},
		["doors_dir"] = {135,90,210,152,90,223},
		["idoors_dir"] = {135,90,210,135,90,239},
		["dungeon_entry_pos"] = {7762, 6739},-- ??? ?? ???? ?
		["20385_bpos"] = {690,722},
		["20385_pos"] = {354,362},
		["LEVEL2_STONE_pos"] = {195,352},
		["LEVEL4_TARGET_pos"] = {470,175},
		["LEVEL5_STONE_pos"] = {
				{486, 345},
				{511, 336},
				{525, 349},
				{521, 365},
				{503, 372},
				{486, 365},
				{500, 354}
		},
		["LEVEL6_TARGET_pos"] = {511,480},
		["outside_entry_pos"] = {6142,7068}, --??????? ??? ?
		["YAK_pos"] = {376, 397} -- ?? ??
		
		}
	end

	function is_flamed(idx) -- ???? ??? ?? 
		return (idx >= 351 * 10000 and idx < (351 + 1) *10000) or idx==351
	end

	function make_dungeon() -- ?? ???
		local setting = flame_dungeon.setting()
		d.new_jump(351, setting.dungeon_entry_pos[1] * 100, setting.dungeon_entry_pos[2] * 100)

		d.regen_file("data/dungeon/flame_dungeon/npc.txt")
		d.setf("level",0)
		for i=1,6 do
			d.set_unique("door"..i, d.spawn_mob_ac_dir(20387, setting.doors_pos[i][1], setting.doors_pos[i][2],setting.doors_dir[i]))
			d.set_unique("idoor"..i, d.spawn_mob_ac_dir(20388, setting.idoors_pos[i][1], setting.idoors_pos[i][2],setting.idoors_dir[i]))
		end
		d.setf("clear_count",0)
		d.setf("started",0)
		pc.setf("flame_dungeon","dungeon_enter",0) -- ????? ?????? // ??? : 0 ?? : 1 // ??? ??????? ?? ??
	end

	function go_boss() -- ??? ?? 
		local setting = flame_dungeon.setting()
		if pc.get_level() < 90 then --????
            say("Sizin seviyeniz devam etmek i�in yeterli de�il.[ENTER]90.Seviyeye ula�t���n�z zaman tekrar gelin.")
            return
		else
            say("Kaderinle kar��la�mak i�in haz�r m�s�n?")
			local warp = select("Devam Et","Daha Sonra")
			if warp == 1 then
			d.setf("level",17)
			d.jump_all(setting.bossroom_entry_pos[1],setting.bossroom_entry_pos[2])
			d.set_regen_file ("data/dungeon/flame_dungeon/".."fd_fild_boss.txt")
			d.spawn_mob(6091,setting.boss_pos[1],setting.boss_pos[2])
		end
		end
	end

	function level_clear()
		d.setf("level",0)
		d.clear_regen()
		d.purge_area(750000,620000,817400,689400)
	end

	function clear_timer(inx)
		clear_server_timer ("flame_dungeon_0m_left_timer", inx)
		clear_server_timer ("flame_dungeon_1m_left_timer", inx)
		clear_server_timer ("flame_dungeon_5m_left_timer", inx)
		clear_server_timer ("flame_dungeon_10m_left_timer", inx)
		clear_server_timer ("flame_dungeon_15m_left_timer", inx)
		clear_server_timer ("flame_dungeon_30m_left_timer", inx)
		clear_server_timer ("flame_dungeon_45m_left_timer", inx)
		clear_server_timer ("killed_A_1", inx)
		clear_server_timer ("killed_A_2", inx)
	end

	function map_index_compare()
		if flame_dungeon.is_flamed(pc.getf("flame_dungeon","dungeon_index")) then
			return (pc.getf("flame_dungeon","dungeon_index") == pc.getf("flame_dungeon","dungeon_index"))
		end
	end

	function entry_setting()
		local idx = pc.get_map_index()
		local setting = flame_dungeon.setting()			
		if idx == 351 then
			pc.warp(setting.outside_entry_pos[1]*100, setting.outside_entry_pos[2] * 100, 62)
		elseif flame_dungeon.is_flamed(idx) then
			if not flame_dungeon.map_index_compare() and pc.getf("flame_dungeon","dungeon_enter") == 1 then
				pc.setf("flame_dungeon","dungeon_index", d.get_map_index())
			end
		------------------------------------------------------------------------------------------------------------------------------------------------------
		--??? ??? ???? ???? ???? ?????? ?? ?? ??? ????. ???? ??? ?? ???? ???? ?? ?? ??? ??? ??.
		--???? ???? ?? ?? ?? ??? ??? ??, ???? ??? ??? ????? ?? ??? ????? ???? ??? ??? ??? ??.
		------------------------------------------------------------------------------------------------------------------------------------------------------
			-- pc.set_warp_location(62, setting.outside_entry_pos[1] , setting.outside_entry_pos[2]) -- ?? ??? ? ??? ????
		elseif not d.find(pc.getf("flame_dungeon","dungeon_index"))then
				pc.setf("flame_dungeon","dungeon_index",0)
		end
	end

		when login begin -- 
			flame_dungeon.entry_setting()
			local idx = pc.get_map_index()
			if flame_dungeon.is_flamed(idx) and flame_dungeon.map_index_compare() then
				pc.setf("flame_dungeon","exit_time",get_global_time()) -- ???? ???? ??? ??? ??, ?? ???? ??? or ?? ???? ???
			end
			
			if flame_dungeon.is_flamed(idx) then
				 pc.setf("flame_dungeon","exit_time",get_global_time())
			end
		end

		when logout begin
			local idx = pc.get_map_index()
			if flame_dungeon.is_flamed(idx) and flame_dungeon.map_index_compare() then 
				pc.setf("flame_dungeon","exit_time",get_global_time()) -- ???? ???? ??? ??? ??, ?? ???? ??? or ?? ???? ???
			end
			if flame_dungeon.is_flamed(idx) then
				------------ Dungeon Turn Back System ----------------------
				pc.setf("flame_dungeon","dungeon_turn",1)
				------------------------------------------------------------
				pc.setf("flame_dungeon","exit_time",get_global_time())
			end
		end
		when 20394.chat."Razad�r Kulesi (Bireysel)" begin
			addimage(35,35,'razador.tga')
			if party.is_leader() or party.is_party() then
				say("")
				say("")
				say("")
				say("")
				say("")
				say_reward("Bu zindana grup halinde giremezsin")
				say_reward("l�tfen �nce bulundugun grupdan ayril !")
				return
			end
			--sys_log(0,"flame_dungeon quest open")
			local setting = flame_dungeon.setting()
			if (game.get_event_flag("enable_time_flame") == 1 and  get_global_time() - pc.getf("flame_dungeon","exit_time") < 60 * 60) then
				addimage(35,35,'razador.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say("Beta Server; s�reyi s�f�rlamak m� istiyorsun?")
				say("Kalan s�re: "..dungeon_get_duration(pc.getf("flame_dungeon","exit_time") - get_global_time()).."")
				if select("Evet","Hay�r") == 1 then
					pc.setf("flame_dungeon","exit_time",0)
					return
				end
			end
			
			if get_global_time() - pc.getf("flame_dungeon","exit_time") < 60 * 60 then
				say_title(mob_name(20394))
				addimage(35,35,'razador.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say("Soguma sureniz henuz dolmadi!")
				say("Kalan s�re: "..dungeon_get_duration(pc.getf("flame_dungeon","exit_time") - get_global_time()).."")
				return
			end

			if pc.level < 90 then
				say_title(mob_name(20394))
				addimage(35,35,'razador.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say("Zindana giris icin seviyeniz yetersiz!")
				return
			end
			
			
			if pc.count_item(71174) < 1 then
				say_title(mob_name(20394))
				addimage(35,35,'razador.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say("Envanterinde yeterli miktarda yok:")
				say(string.format("%s.", item_name(71174)))
				say("")
				return
			end
			
			say_title(mob_name(20394))
			addimage(35,35,'razador.tga')
			say("")
			say("")
			say("")
			say("")
			say("")
			say("K�rm�z� Ejderha Kulesi'ne girmek i�in emin misin?")
			local warp = select("Evet.","Belki daha sonra...")
			if warp == 1 then
				-- ------------ Dungeon Turn Back System ----------------------
				-- pc.remove_turn_back_dungeon()
				-- ------------------------------------------------------------
				pc.remove_item(71174, 1)
				flame_dungeon.make_dungeon()
			end
			pc.setf("flame_dungeon","flame_dungeon_boss_kill_count", 0)
		end

		when 20394.chat."TEST : Init time limit init" with is_test_server() begin -- ????
			pc.setf("flame_dungeon","exit_time",get_global_time()-1800)
			say("Done")
		end

		when 20385.chat."Test : Boss Room" with is_test_server() begin -- ????
			flame_dungeon.go_boss()
		end
		
		when 20385.chat."Am-heh Uyan�� " with npc.lock() begin
			local setting = flame_dungeon.setting()
			if d.getf("started") == 0 then
				char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'STARTED')
                say("Am-heh Uyand�!")
                say("K�z�l Ejderha Kale'si bir saat boyunca[ENTER]ba�kalar�na kapat�ld�.")
				wait()
				d.setf("started",1)
				-- ???? ?????? ??? ??? exit timer? ???? ???? ????? ????? ????? ?
				server_timer ("flame_dungeon_45m_left_timer",15*60, d.get_map_index())
                notice_multiline("Kalan zaman: 60 Dakika(lar) ",d.notice)
                notice_multiline("S�re doldu�unda disariya g�nderileceksiniz.",d.notice)

				pc.setf("flame_dungeon","dungeon_enter",1)
			end

			if d.getf("level") == 0 then --??? ??????
				if d.getf("clear_count") == 6 then -- ? ??? ??? ???
					d.setf("level",7)
				else
					local rand = number(1,6)--???? ????? ?? ???? ?? ?? ?????? ???
					local setlev = 0
					d.setf("level",7) -- ?? ?? ??? ?? ??? ?????? ??? ????? ????
					for i=1,50 do
						setlev = setlev + 1
						if setlev > 6 then
							setlev = 1
						end
						if not d.is_unique_dead("door"..setlev) then
							rand = rand - 1
							if rand == 0 then
								d.setf("level",setlev)
								d.setf("clear_count",d.getf("clear_count")+1)
								break
							end
						end
					end
				end
			end
			if d.getf("level") == 1 then
				say("�eytanlar kilitli kap�n�n arkas�nda[ENTER]gidin ve onlar� ma�lup edin.")
				notice_multiline("Sava���lar ve Ejderha kral aras�ndaki ayaklanma birazdan ba�layacak.",d.notice)
				d.kill_unique("door1")
				d.kill_unique("idoor1")
				d.setf("level",11)
				d.regen_file ("data/dungeon/flame_dungeon/".."fd_a.txt")
				
				server_timer ("killed_A_1", 12, d.get_map_index())
			elseif d.getf("level") == 11 then
				say("B�t�n �eytanlar yenilmedi.")
				say_title("Kalan: " .. d.count_monster())
			elseif d.getf("level") == 2 then
					char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'LEVEL 2 started')
					say("Alt�n Di�li �ark� bul ve m�hr� a�.")
					notice_multiline("Alt�n Di�li �ark� ele ge�irmek i�in yarat�klar� �ld�r ve m�hr� a�.",d.notice)
					d.spawn_mob(20386, setting.LEVEL2_STONE_pos[1], setting.LEVEL2_STONE_pos[2]) -- ??? ??
					d.kill_unique("door2")
					d.kill_unique("idoor2")
					d.set_regen_file ("data/dungeon/flame_dungeon/".."fd_b.txt")
					d.setf("level",12)
			elseif d.getf("level") == 12 then
				say("Alt�n di�li �ark ile m�hr� a�madan ilerleyemezsin.")
			elseif d.getf("level") == 3 then
				char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'LEVEL 3 started')
				say("T�m yarat�klar� �ld�r�n.[ENTER]Kaderinizi belirleyin.")
				notice_multiline("T�m yarat�klar� �ld�r�n ve kaderinizi belirleyin.",d.notice)
				d.kill_unique("door3")
				d.kill_unique("idoor3")
				d.setf("level",13)
				d.regen_file ("data/dungeon/flame_dungeon/".."fd_c.txt")
				server_timer ("killed_A_1", 12, d.get_map_index())
			elseif d.getf("level") == 13 then
				say("Yarat�klar�n hepsi �lmedi.")
				say_title("Kalan: "..d.count_monster())
			elseif d.getf("level") == 4 then -- 474 178
				char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'LEVEL 4 started')	
				say("Devam edebilmek i�in, Ignator'u yok edin.")
				d.notice("Gidin ve Ignatoru ma�lup edin.")
				d.setf("level",14)
				d.kill_unique("door4")
				d.kill_unique("idoor4")
				d.set_regen_file ("data/dungeon/flame_dungeon/".."fd_d.txt")
				d.spawn_mob(6051,setting.LEVEL4_TARGET_pos[1],setting.LEVEL4_TARGET_pos[2] ) -- ????? ??
			elseif d.getf("level") == 14 then
				say("Ignator hala Ya��yor.[ENTER]Kendinizi g�clendirin ve tekrar deneyin.[ENTER]Ebedi lanetten temizlenin.")
			elseif d.getf("level") == 5 then -- 510 355
				char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'LEVEL 5 started')
				say("Maat Ta�'lar�n� bulunuz ve tek tek a��n.")
				notice_multiline("Maat Ta�lar�n� bulunuz ve[ENTER]7 Maat Ta��n� s�ras�yla ve do�ru �ekilde a��n�z.",d.notice)
				d.kill_unique("door5")
				d.kill_unique("idoor5")
				d.setf("level",15)
				d.set_regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
				local vis = { 0,0,0,0,0,0,0}
				for i=1,7 do
					vis[i] = 0
				end
				for i = 1, 7 do -- ???? ???
					local ran = number(1,7)
					local st = 0
					for j = 1, 50 do
						st = st + 1
						if st > 7 then
							st = 1
						end
						if vis[st] == 0 then
							ran = ran - 1
							if ran == 0 then
								vis[st] = 1
								d.set_unique("stone5_"..st, d.spawn_mob(20386, setting.LEVEL5_STONE_pos[i][1], setting.LEVEL5_STONE_pos[i][2]))
								break
							end
						end
					end
				end  
			elseif d.getf("level") == 15 then
				say("Ey Sava�c�! Gizemi Bulmak i�in [ENTER]do�ru Secim yap�n ve[ENTER]g�rev yerine gelin.")
			elseif d.getf("level") == 6 then -- 507 490
				say("S�cak ve korku dolu [ENTER]Cehennem Ate�i Metin Ta��'n� bulun ve yok edin.")
				notice_multiline("S�cak ve korku dolu [ENTER]Cehennem Ate�i Metin ta��n� bulun ve yok edin.",d.notice)
				d.setf("level",16)
				d.kill_unique("door6")
				d.kill_unique("idoor6")
				d.set_regen_file ("data/dungeon/flame_dungeon/".."fd_f.txt")
				d.spawn_mob(8057, setting.LEVEL6_TARGET_pos[1],setting.LEVEL6_TARGET_pos[2]) -- ?????? ??
			elseif d.getf("level") == 16 then
				char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'LEVEL 6 started')
				say("Cehennem Ate�i Metini Henuz yok edilmedi.[ENTER]G�rev Tamamlan�nca Tekrar Gel.")
			elseif d.getf("level") == 7 then
				flame_dungeon.go_boss()
			else
				say("Ge�ersiz Parametre Y�neticiye Bildirin!")
			end
			npc.unlock()
		end

		when kill with flame_dungeon.is_flamed(pc.get_map_index()) and d.getf("level") == 12 begin
			local i = number(1, 80)
			if i == 1 then
				game.drop_item (30329, 1)
			end
		end

		when 20386.take with flame_dungeon.is_flamed(pc.get_map_index()) and item.vnum == 30329 and d.getf("level") == 12 begin
			local i = number(1, 3)
			if i == 1 then
				npc.purge()
				item.remove()
                notice_multiline("Maat mekan�zmas�n� a��ld�,",d.notice)
                notice_multiline("Am-heh ile g�r���n...",d.notice)
				flame_dungeon.level_clear()
			else
				item.remove()
				say("Bu par�a yanl�� yok oldu.[ENTER]Do�ru Alt�n Di�li �ark� bul.")
			end
		end

		when 6051.kill with flame_dungeon.is_flamed(pc.get_map_index()) and d.getf("level") == 14 begin
			notice_multiline("Tebrikler!.. Ignator yok edildi.",d.notice)
			notice_multiline("Am-heh ile g�r���n...",d.notice)
			flame_dungeon.level_clear()
		end

		when kill with flame_dungeon.is_flamed(pc.get_map_index()) and d.getf("level") == 15 begin
			local i = number(1, 30) -- 30?? 1 ??? ????
			if i == 1 then
				game.drop_item (30330, 1)
			end
		end

		when 20386.take with flame_dungeon.is_flamed(d.get_map_index()) and item.vnum == 30330 and d.getf("level") == 15 begin
			local setting = flame_dungeon.setting()
			if npc.get_vid() == d.get_unique_vid("stone5_1") then -- ??? ?? ????? ? ?? ????? ???? ????
				npc.purge()
				item.remove()
				say("Bu ak�ll�ca bir se�im oldu.[ENTER]�imdi di�erlerinide yok et.")
				d.setf("stonekill",2) -- 2? ?? ???
				if d.count_monster() < 100 then
					d.regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
				end
			elseif npc.get_vid() == d.get_unique_vid("stone5_2") then 
				if d.getf("stonekill") == 2 then -- 2??? ?? ??? 2???? ??? ??? ?
					npc.purge()
					item.remove()
				say("Bu ak�ll�ca bir se�im oldu.[ENTER]�imdi di�erlerinide yok et.")
					d.setf("stonekill",3)
					if d.count_monster() < 100 then
						d.regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
					end
				else
					item.remove()
					say("Yanl�� se�im. Maat Ta�� yok oldu.")
					if is_test_server() then
						say("2")
					end
				end
			elseif npc.get_vid() == d.get_unique_vid("stone5_3") then
				if d.getf("stonekill") == 3 then
					npc.purge()
					item.remove()
					say("Bu ak�ll�ca bir se�im oldu.[ENTER]�imdi di�er m�h�rleri yok et.")
					d.setf("stonekill",4)
					if d.count_monster() < 100 then
						d.regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
					end
				else
					item.remove()
					say("Yanl�� se�im. Maat Ta�� Yok Oldu.")
					if is_test_server() then
						say("3")
					end
				end
			elseif npc.get_vid() == d.get_unique_vid("stone5_4") then
				if d.getf("stonekill") == 4 then
					npc.purge()
					item.remove()
					say("Bu ak�ll�ca bir se�im oldu.[ENTER]�imdi di�er m�h�rleri yok et.")
					d.setf("stonekill",5)
					if d.count_monster() < 100 then
						d.regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
					end
				else
					item.remove()
					say("Yanl�� se�im. Maat Ta�� Yok Oldu.")
					if is_test_server() then
						say("4")
					end
				end
			elseif npc.get_vid() == d.get_unique_vid("stone5_5") then
				if d.getf("stonekill") == 5 then
					npc.purge()
					item.remove()
					say("Bu ak�ll�ca bir se�im oldu.[ENTER]�imdi di�er m�h�rleri yok et.")
					d.setf("stonekill",6)
					if d.count_monster() < 100 then
						d.regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
					end
				else
					item.remove()
					say("Yanl�� se�im. Maat Ta�� Yok Oldu.")
					if is_test_server() then
						say("5")
					end
				end
			elseif npc.get_vid() == d.get_unique_vid("stone5_6") then
				if d.getf("stonekill") == 6 then
					npc.purge()
					item.remove()
					say("Bu ak�ll�ca bir se�im oldu.[ENTER]�imdi son m�hr� yok et.")
					d.setf("stonekill",7)
					if d.count_monster() < 100 then
						d.regen_file ("data/dungeon/flame_dungeon/".."fd_e.txt")
					end
				else
					item.remove()
					say("Yanl�� se�im. Maat Ta�� Yok Oldu.")
					if is_test_server() then
						say("6")
					end
				end
			else 
				if d.getf("stonekill") == 7 then
					npc.purge()
					item.remove()
                    notice_multiline("Maat ta�lar� yok edildi!",d.notice)
                    notice_multiline("Am-heh ile g�r���n...",d.notice)
					flame_dungeon.level_clear()
				else
					item.remove()
					say("Yanl�� se�im. Maat Ta�� Yok Oldu.")
					if is_test_server() then
						say("7")
					end
				end
			end
		end

		when 8057.kill with flame_dungeon.is_flamed(d.get_map_index()) and d.getf("level") ==16 begin
			char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', '8057 KILLED')		
            notice_multiline("Araf Metini Yok Edildi.",d.notice)
            notice_multiline("Yeni g�rev i�in Am-heh ile g�r���n...",d.notice)
			flame_dungeon.level_clear()
		end

		when 6091.kill with flame_dungeon.is_flamed(d.get_map_index()) and d.getf("level") ==17 begin 
			char_log(pc.get_channel_id().. ''..d.get_map_index(), 'BP', 'BOSS KILLED')		
            notice_all("Razador "..pc.get_name().." taraf�ndan yok edildi.")
            notice_multiline("Ejderha Tap�na�� i�indeki T�m Sava�c�lar [ENTER]Bir dakika i�erisinde ���nlanacakt�r.",d.notice)
            d.notice("Razad�r yok edildi.")
            d.notice("B�t�n sava���lar 60 saniye i�erisinde Ejderha")
			d.notice("Tap�na��'ndan d��ar� ���nlanacak.")
			server_timer("dungeon_end_timer", 60,d.get_map_index())	
			flame_dungeon.level_clear()
			d.setf("level",8)
		end
	end
end
		
