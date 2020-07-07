--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest oxevent_manager begin
	state start begin
		when 20011.chat."OX-Yar��mas� " begin
			say_title("Uriel:")
			say("Hey Evet Sen.")
			say("Sen ger�ekten �ok zeki g�r�n�yorsun.")
			say("Yar��man�n ismi Ox Yar��mas�. ") 
			say("Sorular sorulacak cevap vereceksin,")
			say("bilirsen s�priz bir hediye kazanacaks�n.")

			if game.get_event_flag("oxevent_status") == 0 then
				wait()
				say_title("Uriel:")
				say("Yar��maya kat�lmana izin veriyorum.")
				say("�stersen ayr�ca izleyici de olabilirsin.")
				say("Ba�lama zaman� hen�z kararla�t�r�lmad�.")
				say("Zaman geldi�inde seni bilgilendirece�im.")
				say("Tetikte kal!")
			elseif game.get_event_flag("oxevent_status") == 1 then
				wait()
				say_title("Uriel:")
				say("Yar��maya kat�lmak istiyormusun?")

				local s = select("Evet", "Hay�r", "�zlemek istiyorum.")

				if s == 1 then
				if game.get_event_flag("oxevent_status") == 1 then
					if pc.get_level() < 1 then
					say_title("Uriel:")
					say("OX-Yar��mas�na kat�labilmen i�in en az")
					say("1. seviyede olmal�s�n.")
					say("")
					elseif pc.is_riding() then
					say_title("Uriel:")
					say("Binek veya at kullan�rken OX yar��mas�na giremezsin.")
					else
					pc.warp(896500, 24600)
					end
				elseif game.get_event_flag("oxevent_status") == 2 then
				say("Yar��ma ba�lad�, giremezsin!")
				end
				elseif s == 3 then
					say_title("Uriel:")
					say("�zleyici olarak m� kat�lmak istiyorsun?")
					say("Tamam, ���nl�yorum seni.")

					wait()

					pc.warp(896300, 28900)
				end
			elseif game.get_event_flag("oxevent_status") == 2 then
				
					say_title("Uriel:")
					say("Yar��ma ba�lad�, giremezsin!")
					say("Ancak izleyici olarak kat�labilirsin.")

					local s = select("Kat�l", "Kat�lma")
					if s == 1 then
						say_title("Uriel:")
						say("Tamam, ���nl�yorum seni.")

						wait()

						pc.warp(896300, 28900)
					end
			end
		end

		when 20358.chat."OX-Yar��mas� " with pc.is_gm() begin

			local stat = oxevent.get_status()

			if stat == 0 then
				
				say_title("OX �i�ekleri: ")
				say("Yar��may� ba�latmak istiyormusun? ")


				local s = select("Evet", "Hay�r ")

				if s == 1 then
					local v = oxevent.open()

					if v == 0 then
						say_title("OX �i�ekleri: ")
						say("OX-Yar��mas� zaten ba�lat�lm��. ")
					elseif v == 1 then
						say_title("OX �i�ekleri:")
						say("Ox-Yar��mas� ba�ar�yla ba�lat�ld�. ")
						notice_all("Ox Yar��mas� ba�lad�! Uriel'den giri� yapabilirsin. ")
					else
						say_title("OX �i�ekleri: ")
						say("Bir hata meydana geldi. ")
					end
				end
			elseif stat == 1 then
					say_title("OX �i�ekleri:")
					say("Ox-Yar��mas�nda "..oxevent.get_attender().." ki�i var. ")
					say("Yar��may� ba�latmak istiyormusun? ")

					local s = select("Evet", "Hay�r ")

					if s == 1 then
						oxevent.close()

						say_title("OX �i�ekleri: ")
						say("Giri�ler kapat�ld�.")
						say("Yar��ma ba�lamas� i�in ayn� i�lemi yap�n! ")
					end
			elseif stat == 2 then

					say_title("OX �i�ekleri:")
					say("Ne Yapmak �stiyorsunuz?")

					local s = select("Yar��may� ba�lat ", "�tem ver ", "Yar��may� sonland�r ","Konu�may� Engelle", "Kapat")

					if s == 1 then
						local v = oxevent.quiz(1, 30)

						if v == 0 then
							say_title("OX �i�ekleri: ")
							say("Yar��ma ba�lat�lamad�! ")
						elseif v == 1 then
							say_title("OX �i�ekleri: ")
							say("Soru g�nderildi! ")
						else
							say_title("OX �i�ekleri: ")
							say("Zaten bir soru sordunuz! ")
						end
					elseif s == 2 then
						say_title("OX �i�ekleri: ")
						say("Verilecek itemin kodunu gir. ")

						local item_vnum = input()

						say_title("OX �i�ekleri: ")
						say("Verilecek itemin adetini gir. ")

						local item_count = input()

						oxevent.give_item(item_vnum, item_count)

						say_title("OX �i�ekleri: ")
						say(""..item_count.." adet "..item_name(item_vnum)..", "..oxevent.get_attender().." adl� ")
						say("oyuncuya verildi.")
					elseif s == 3 then
						oxevent.end_event()

						notice_all("Ox Yar��mas� sona erdi.")

						say_title("OX �i�ekleri: ")
						say("Ox-Yar��mas� bitirildi. ")
					elseif s == 4 then
						say_title("OX �i�ekleri: ")
						say("Ne yapmak istiyorsunuz? ")
						local s = select("Konu�may� Engelle ","Konu�ma Engelini A� ","�ptal ")
						if s == 1 then
						say_title("OX �i�ekleri: ")
						say("OX yar��mas�nda konu�ma engellendi. ")
						game.set_event_flag("ox_chat",1)
						elseif s == 2 then
						say("OX yar��mas�nda konu�ma engeli a��ld�. ")
						game.set_event_flag("ox_chat",0)
						elseif s == 3 then
							return
						end
					end
			elseif stat == 3 then
					say_title("OX �i�ekleri: ")
					say("L�tfen bekleyiniz. ")
				else
					say("Bir hata olu�tu! ")
				end
			end
			
			

		when login with pc.get_map_index() == 113 and not pc.is_gm() begin
			if pc.is_mount() then
				pc.unmount()
				horse.unsummon()
			end
		end
	end
end

