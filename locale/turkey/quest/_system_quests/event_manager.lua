--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest event_manager begin
	state start begin
		when letter with pc.is_gm() == true begin
			if pc.is_gm() == true then
				send_letter("*GM: Etkinlik Y�netimi")
			end
		end
		when button or info with pc.is_gm() == true begin
			say_size(350,400)
			if pc.is_gm() == false then
				say_title("Etkinlik Y�netimi:")
				say("")
				say("Y�netici olmad���n�z i�in bunu")
				say("kullanamazs�n�z.")
			else
				say_title("Etkinlik Y�netimi:")
				say("")
				say_reward("Hangi etkinli�i a�mak istiyorsun?")
				local events = select("Ay����� Define Sand��� ", "Alt�gen Hediye Paketi ", "Oyma Ta� ", "Ramazan Bayram� ", "Noel ", "Paskalya ", "Futbol Topu ", "Sevgililer G�n� ", "Evcil Hayvan ", "Bulmaca Kutusu ", "Cad�lar Bayram� ", "Olimpiyat ", "Okey Kart ", "Binek Hayvan� ", "Derece ", "Y�ld�n�m� ", "Patron Avc�lar� ", "Bal�k Yapboz ", "Madencilik ", "Ya�mac�lar� Avla ", "Tatl� Yap�m ", "Kral� Yakala ", "Yang Ya�muru ", "S�per Metin ", "Vazge� ")
				if events == 1 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_moon_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_moon_drop",1)
							game.set_event_time(0, (sure*60))
							notice_all("Ay����� define sand��� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_moon_drop",0)
							game.set_event_time(0, 0)
							notice_all("Ay����� define sand��� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 2 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_hexagon_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_hexagon_drop",1)
							game.set_event_time(1, (sure*60))
							notice_all("Alt�gen hediye paketi etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_hexagon_drop",0)
							game.set_event_time(1, 0)
							notice_all("Alt�gen hediye paketi etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 3 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_carving_stone_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_carving_stone_drop",1)
							game.set_event_time(2, (sure*60))
							notice_all("Oyma ta� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_carving_stone_drop",0)
							game.set_event_time(2, 0)
							notice_all("Oyma ta� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 4 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_ramadan_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_ramadan_drop",1)
							game.set_event_time(3, (sure*60))
							notice_all("Ramazan bayram� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_ramadan_drop",0)
							game.set_event_time(3, 0)
							notice_all("Ramazan bayram� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 5 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_xmas_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_xmas_drop",1)
							game.set_event_time(4, (sure*60))
							notice_all("Noel etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_xmas_drop",0)
							game.set_event_time(4, 0)
							notice_all("Noel etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 6 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("enable_easter_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("enable_easter_event",1)
							game.set_event_time(5, (sure*60))
							notice_all("Paskalya etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("enable_easter_event",0)
							game.set_event_time(5, 0)
							notice_all("Paskalya etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 7 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_football_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_football_drop",1)
							game.set_event_time(6, (sure*60))
							notice_all("Futbol topu etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_football_drop",0)
							game.set_event_time(6, 0)
							notice_all("Futbol topu etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 8 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_valentine_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_valentine_drop",1)
							game.set_event_time(7, (sure*60))
							notice_all("Sevgililer g�n� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_valentine_drop",0)
							game.set_event_time(7, 0)
							notice_all("Sevgililer g�n� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 9 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_pet_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_pet_drop",1)
							game.set_event_time(8, (sure*60))
							notice_all("Evcil hayvan etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_pet_drop",0)
							game.set_event_time(8, 0)
							notice_all("Evcil hayvan etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 10 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_kids_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_kids_drop",1)
							game.set_event_time(9, (sure*60))
							notice_all("Bulmaca kutusu etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_kids_drop",0)
							game.set_event_time(9, 0)
							notice_all("Bulmaca kutusu etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 11 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_halloween_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_halloween_drop",1)
							game.set_event_time(10, (sure*60))
							notice_all("Cad�lar bayram� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_halloween_drop",0)
							game.set_event_time(10, 0)
							notice_all("Cad�lar bayram� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 12 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_olympic_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_olympic_drop",1)
							game.set_event_time(11, (sure*60))
							notice_all("Olimpiyat etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_olympic_drop",0)
							game.set_event_time(11, 0)
							notice_all("Olimpiyat etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 13 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("cards_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("cards_event",1)
							game.set_event_time(12, (sure*60))
							notice_all("Okey kart etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("cards_event",0)
							game.set_event_time(12, 0)
							notice_all("Okey kart etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 14 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("ex_mount_drop") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("ex_mount_drop",1)
							game.set_event_time(13, (sure*60))
							notice_all("Binek par�omen etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("ex_mount_drop",0)
							game.set_event_time(13, 0)
							notice_all("Binek par�omen etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 15 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("alignment_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("alignment_event",1)
							game.set_event_time(14, (sure*60))
							notice_all("Derece etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("alignment_event",0)
							game.set_event_time(14, 0)
							notice_all("Derece etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 16 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("2017_year_round_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("2017_year_round_event",1)
							game.set_event_time(15, (sure*60))
							notice_all("Y�ld�n�m� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("2017_year_round_event",0)
							game.set_event_time(15, 0)
							notice_all("Y�ld�n�m� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 17 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("enable_attendance_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("enable_attendance_event",1)
							game.set_event_time(16, (sure*60))
							notice_all("Patron avc�lar� etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("enable_attendance_event",0)
							game.set_event_time(16, 0)
							notice_all("Patron avc�lar� etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 18 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("2018_fish_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("2018_fish_event",1)
							game.set_event_time(17, (sure*60))
							notice_all("Bal�k yapboz etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("2018_fish_event",0)
							game.set_event_time(17, 0)
							notice_all("Bal�k yapboz etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 19 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("mining_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("mining_event",1)
							game.set_event_time(18, (sure*60))
							notice_all("Madencilik etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("mining_event",0)
							game.set_event_time(18, 0)
							notice_all("Madencilik etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 20 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("harvest_festival") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("harvest_festival",1)
							game.set_event_time(19, (sure*60))
							notice_all("Ya�mac�lar� avla etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("harvest_festival",0)
							game.set_event_time(19, 0)
							notice_all("Ya�mac�lar� avla etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 21 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("newyear_wonso") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("newyear_wonso",1)
							game.set_event_time(20, (sure*60))
							notice_all("Ya�mac�lar� avla etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("newyear_wonso",0)
							game.set_event_time(20, 0)
							notice_all("Ya�mac�lar� avla etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 22 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("enable_catch_king_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("enable_catch_king_event",1)
							game.set_event_time(21, (sure*60))
							notice_all("Kral� yakala etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("enable_catch_king_event",0)
							game.set_event_time(21, 0)
							notice_all("Kral� yakala etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 23 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("golden_rain_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("golden_rain_event",1)
							game.set_event_time(22, (sure*60))
							notice_all("Yang ya�muru etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("golden_rain_event",0)
							game.set_event_time(22, 0)
							notice_all("Yang ya�muru etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 24 then
					say_title("Etkinlik Y�netimi:")
					say("")
					if game.get_event_flag("super_metin_event") > 0 then
						say_reward("Etkinlik �u anda aktif!")
					else
						say_reward("Etkinlik �u anda kapal�.")
					end
					say_reward("Etkinlik hakk�nda ne yapmak istiyorsun ?")
					local sec = select("Etkinli�i Aktif Et ","Etkinli�i Kapat ","Vazge� ")
					if sec == 1 then
						say_title("Etkinlik Y�netimi:")
						say("")
						say_reward("Ne kadar s�re a��k kalaca��n� girin.")
						say_reward("Yaz�lacak rakam dakika cinsindendir.")
						local sure = tonumber(input())
						if sure == nil then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure == "" then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�re bo� b�rak�lamaz.")
						elseif sure < 0 then
							say_title("Etkinlik Y�netimi:")
							say("")
							say_reward("S�f�rdan k���k de�er girilemez.")
						else
							game.set_event_flag("super_metin_event",1)
							game.set_event_time(23, (sure*60))
							notice_all("S�per metin etkinli�i aktif!")
							notice_all(string.format("Etkinlik S�resi: %s", LIB_duration(sure*60)))
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					elseif sec == 2 then
						say_title("Etkinlik Y�netimi: ")
						say("")
						say_reward("Etkinli�i ger�ekten kapatmak istiyor musun?")
						local onay = select("Evet","Hay�r")
						if onay == 1 then
							game.set_event_flag("super_metin_event",0)
							game.set_event_time(23, 0)
							notice_all("S�per metin etkinli�i sona erdi!")
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						else
							send_letter("*GM: Etkinlik Y�netimi")
							setskin(NOWINDOW)
						end
					else
						send_letter("*GM: Etkinlik Y�netimi")
						setskin(NOWINDOW)
					end
				elseif events == 25 then
					send_letter("*GM: Etkinlik Y�netimi")
					setskin(NOWINDOW)
				end
			end
		end
	end
end