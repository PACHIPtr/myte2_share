--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest login_info begin
	state start begin
		when login begin
			syschat("Kanal-"..pc.get_channel_id().." ile ba�l�s�n. ")
			-- Events
			if game.get_event_flag("ex_moon_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Ay���n�� define sand��� etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_hexagon_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Alt�gen hediye paketi etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_carving_stone_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Oyma ta�� etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_ramadan_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Ramazan etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_xmas_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Noel etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("enable_easter_event") > 0 then
				syschat("<Etkinlik Duyurusu> Paskalya etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_football_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Futbol topu etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_valentine_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Sevgililer g�n� etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_pet_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Evcil hayvan etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_kids_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Bulmaca kutusu etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_halloween_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Cad�lar bayram� etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_olympic_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Olimpiyat etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("cards_event") > 0 then
				syschat("<Etkinlik Duyurusu> Okey kart etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("ex_mount_drop") > 0 then
				syschat("<Etkinlik Duyurusu> Binek par�omeni etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("alignment_event") > 0 then
				syschat("<Etkinlik Duyurusu> Derece etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("2017_year_round_event") > 0 then
				syschat("<Etkinlik Duyurusu> Y�ld�n�m� etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("enable_attendance_event") > 0 then
				syschat("<Etkinlik Duyurusu> Patron avc�lar� etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("2018_fish_event") > 0 then
				syschat("<Etkinlik Duyurusu> Bal�k yapboz etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("mining_event") > 0 then
				syschat("<Etkinlik Duyurusu> Madencilik etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("harvest_festival") > 0 then
				syschat("<Etkinlik Duyurusu> Ya�mac�lar� avla etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("newyear_wonso") > 0 then
				syschat("<Etkinlik Duyurusu> Tatl� yap�m etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("enable_catch_king_event") > 0 then
				syschat("<Etkinlik Duyurusu> Kral� yakala etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("golden_rain_event") > 0 then
				syschat("<Etkinlik Duyurusu> Yang ya�muru etkinli�i �uanda aktif.")
			end
			if game.get_event_flag("super_metin_event") > 0 then
				syschat("<Etkinlik Duyurusu> S�per metin etkinli�i �uanda aktif.")
			end
		end
	end
end
