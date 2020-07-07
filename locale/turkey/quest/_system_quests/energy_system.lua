--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest energy_system begin
	state start begin
		when 20001.chat." Yeni bir teknik! " begin
			say_title(mob_name(20001)) 
			say("Ba�ard�m![ENTER]Nihayet yepyeni bir teknik geli�tirebildim.[ENTER]E�yalar� tekrar i�leyerek onlardan saf enerji elde etmenin yolunu buldum. Ne �ahane! ")
			wait()
			say_title(mob_name(20001)) 
			say("E�ya benim buldu�um teknikle tahrip edilir ve[ENTER]enerji par�alar�na ayr�l�r. Bu par�alar�n 30 tane [ENTER]tanesi birle�tirilince de g��l� bir enerji kristali elde edilir! Bir m�cevher i�erisinde toplanm�� saf ve filtrelenmi� bir enerji.[ENTER]Bu g�� t�m te�hizat�na i�ler. �lgini �ekiyor mu?")
			wait()
			say_title(mob_name(20001)) 
			say("Avlan�rken buldu�un silah, tak� ve k�yafet gibi[ENTER]te�hizat malzemelerini bana getir.[ENTER]Onlar� i�leyip [ENTER]enerji par�alar�na ay�raca��m. [ENTER]Krall���m�z�n [ENTER]gelece�i ve umudu bu tekni�e ba�l�. Yenilmez olaca��z! ")
			setstate(can_make)
		end
	end

	state can_make begin
		function setting () 
			return
			{
				["prob_acc_table"] = 
				{
					["65to75"] = {30,55,70,80,90,95,97,98,99,100},
					["76to85"] = {20,40,60,75,85,91,96,98,99,100},
					["upto85"] = {10,25,45,65,80,88,94,97,99,100}
				},
				["item_num_table"] ={0,1,2,3,4,6,8,10,12,15},
				["energy_stone"] = 51001,
				["charging_stone"] = 51002
			}
		end	
		function getItemNum ( str, r )
			local setting = energy_system.setting()
			for i = 1, 10 do
				if r < setting.prob_acc_table[str][i] then
					return setting.item_num_table[i]
				end
			end
			return 0
		end

		when 20001.chat." Enerji Par�as� " begin
			say_title(mob_name(20001)) 
			say("Yapabildin mi? Enerji par�as� elde edebildin mi?[ENTER]Simya yard�m�yla par�alayabilece�im daha fazla[ENTER]e�ya getir bana.Tekni�im hen�z m�kemmelle�medi.[ENTER]Bu y�zden ne kadar par�a elde edilece�ine dair[ENTER]bir garanti veremeyece�im.")
			wait()
			say_title(mob_name(20001)) 
			say("Tek bir �art var:[ENTER]Kendi seviyen ve e�yan�n seviyesi[ENTER]en az 65 olmal�. H�m bir g�z atal�m bakal�m... ")
			wait()
			if pc.get_level() < 65 then 
				say_title(mob_name(20001)) 
				say("Hen�z yeterince g��l� de�ilsin![ENTER]En az 65. seviyede olmal�s�n. ")
			else
				say_title(mob_name(20001)) 
				say("Ah s�per! G��l� ve tecr�belisin. ��lenecek[ENTER]e�yay� ver bakal�m. ")
			end
		end

		when 20001.take begin
			if pc.get_level() < 65 then 
				say_title(mob_name(20001)) 
				say("65. seviye'ye ula�t���nda gel.")
				return
			end
			local item_vnum = item.vnum
			local levelLimit = item.get_level_limit(item_vnum)
			local setting = energy_system.setting()
			
			if levelLimit == nil then
				say_title(mob_name(20001)) 
				say("Bu ��e tekni�ime uygun de�il. ")
				wait()
			elseif item.get_type() == ITEM_WEAPON and item.get_sub_type() == WEAPON_ARROW then
				say_title (mob_name(20001)) 
				say ("Bu ��e tekni�ime uygun de�il. ")
				wait()
			elseif item.is_sealed() == true then
				say_title(mob_name(20001))
				say ("Ruha ba�lanm�� bir ��eyi enerji par�as�na d�n��t�remezsin.")
				wait()
			elseif item.is_basic() == true then
				say_title(mob_name(20001))
				say ("Temel (Ba�lang��) e�yalar�n� enerji par�as�na d�n��t�remezsin.")
				wait()
			elseif levelLimit < 65 then
				say_title(mob_name(20001)) 
				say("Bu ��e yeterli seviyeye sahip de�il.")
			else
				say_title(mob_name(20001)) 
				say(item_name(item_vnum))
				say("Bu itemi enerji par�as�na d�n��t�rmek istermisin? ")
				local s = select (" Evet! "," Hay�r, �imdi de�il!")
				if s == 1 then
					item.remove()
					local r = number(1, 100)
					local n
					if levelLimit >= 65 and levelLimit <= 75 then
						n = energy_system.getItemNum ("65to75",r)
					elseif levelLimit > 75 and levelLimit <= 85 then
						n = energy_system.getItemNum ("75to85",r)
					else
						n = energy_system.getItemNum ("upto85",r)
					end
					if (n == 0) then
						say_title(mob_name(20001)) 
						say("Ne yaz�kki i�e yaramad�.[ENTER]Enerji kristali �retemedik. ")
					else
						pc.give_item2(setting.energy_stone, n)
						say_title(mob_name(20001)) 
						say(string.format("Harika! %d Enerji par�as� olu�turuldu..[ENTER]Hadi bakal�m. ",n))
					end
				end
			end
		end

		when 20001.chat."Enerji Kristali �ret " begin
			local setting = energy_system.setting()
			local need = 30
			say_title(mob_name(20001)) 
			say(string.format("Enerji par�alar� t�kendi. Sende var m�?[ENTER]Bu kadar s�k� �al��ma ve pervas�zca riski[ENTER]hayat�n�z� koymak gerekir.[ENTER]Enerji Kristali olu�turmak i�in 30 tane[ENTER]Enerji Par�as� gerekir. ",need))
			wait()
			
			if pc.get_level() < 65 then 
				say_title(mob_name(20001)) 
				say("Hen�z yeterince g��l� de�ilsin![ENTER]En az 65. seviyede olmal�s�n. ")
				return
			end
			
			if pc.count_item(setting.energy_stone) < need then
				say_title(mob_name(20001)) 
				say(string.format("Yeterince Enerji Par�as� yok.[ENTER]Malesef Enerji Kristali �retemem.[ENTER]Enerji Par�alar�n� tamamlad���n zaman gel. ",need))
				return
			else
				say_title(mob_name(20001)) 
				say(string.format("�ok g�zel. Gerekli Enerji Par�alar� sende var.[ENTER]�imdi Enerji Kristali olu�turabilirim.[ENTER]L�tfen biraz bekleyin. Enerji Kristali olu�turmay�[ENTER]deneyece�im, ama ba�ar�l� olaca��n�n�n garantisini[ENTER]veremem. ", need))
				wait()
			end
			
			local charge = 1000
			say_title(mob_name(20001)) 
			say(string.format("Her �ey haz�r durumda. Par�alar� birle�tirip[ENTER]enerji kristali �retebiliriz. Ama bende bir[ENTER]�ekilde ekme�imi kazanmal�y�m. Tamir[ENTER]aletleri de g�kten inmiyor yani.[ENTER]Masraflar� kar��lamak i�in 1000 yang[ENTER]�demeni istiyorum. �demeye haz�r m�s�n?", charge))
			local s = select (" Elbette! "," Hay�r, �imdi de�il. ")
			if s == 2 then
				say_title(mob_name(20001)) 
				say("Tamam, karar�na sayg� duyuyorum.[ENTER]Fikrini de�i�tirdi�inde gel.")
				return
			end

			if pc.get_gold() < charge then
				say_title(mob_name(20001)) 
				say("�zg�n�m, yeterli �crete sahip[ENTER]oldu�unda tekrar gel.")
				return
			end
			
			if pc.count_item (setting.energy_stone) < need then
				return
			end			

			pc.change_gold(-charge)
			pc.remove_item(setting.energy_stone, need)

			if pc.getqf("hasExperience") == 0 then
				say_title(mob_name(20001)) 
				say("��te enerki kristalin. Sadece ilk giri�imde[ENTER]ba�ar�l� olunur hep. Simya sa�� solu belli[Enter]olmayan bir bilim. Ufak tefek farkl�l�klar[ENTER]ba�ar�s�zl��a neden olabilir.Yani[ENTER]deneylerde genelde k���k de olsa ba�ar�s�zl��a[ENTER]u�rama riski bulunur. ")
				pc.give_item2 (setting.charging_stone, 1)
				pc.setqf("hasExperience", 1)
				return
			end

			local r = number (1, 100)
			if r > 30 then
				say_title(mob_name(20001)) 
				say("Ne yaz�kki i�e yaramad�.[ENTER]Enerji kristali �retemedik.")
				return
			end
			say_title(mob_name(20001)) 
			say("Harika! ��te enerki kristalin.[ENTER]Enerjiyi hissedebiliyor musun? ")
			pc.give_item2(setting.charging_stone, 1)

		end
	end
end
