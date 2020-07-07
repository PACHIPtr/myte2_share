--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest enchanted_forest_make_key begin
	state start begin
		when letter with pc.get_map_index() == 302 and pc.get_level() >= 95 begin
		local v = find_npc_by_vnum(20409)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Bek�isi")
			end
		end
		
		when 20409.chat."�lk Ke�if" begin
		say_title("�lk Ke�if")
		say("Y�z�n �ok tan�d�k geliyor... daha �nce hi� ")
		say("kar��la�m�� m�yd�k? Belki ondand�r. Efsunlu Orman")
		say("h�zla de�i�iyor, duymu�sundur herhalde. Yeni")
		say("belirmelere kar�� tek ba��na sava�amay�z. Bize")
		say("yard�m eder misin? Bize destek olursan harika")
		say("olur.")
		select("Evet kat�l�r�m.")
		target.delete("__TARGET__")
		say("Harika!")
		say("Olay ��yle geli�ti: �u k��ede b�lgeyi ara�t�ran")
		say("ve b�y�k tehlikelerle kar��la�an karde�lerime")
		say("verece�im bir ila� �antas� sakl�yordum. Bu")
		say("�antay� bir s�redir bulam�yorum. Her yere bakt�m")
		say("ama sanki yer yar�lm�� i�ine girmi�. San�r�m En")
		say("Tai Sava���'lar� bu �antay� y�r�tt�. Buralarda bu")
		say("sava���lardan �ok g�rd�m ve �ok garip bir halleri")
		say("vard�... Bu i�in arkas�ndakiler onlar m�, l�tfen")
		say("��ren.")
		pc.setqf("entai_1",0)
		set_state(kill_1)
		end
	end
	
	state kill_1 begin
		when letter begin
		send_letter("&En Tai Sava���s� �ld�r.")
		loop_timer("kill_1",1)
		q.set_counter("Kalan say� ", 50 - pc.getqf("entai_1"))
		end
		
		when button or info begin
		say_title("�lk Ke�if")
		say("Efsunlu Orman'da En Tai Sava���s� �ld�r ve Orman")
		say("Bek�isi'ne geri d�n.")
		q.set_counter("Kalan say� ", 50 - pc.getqf("entai_1"))
		end
		
		when kill with npc.get_race() == 6401 begin
		local count = pc.getqf("entai_1")+1
			if party.is_party() then
			party.setqf("entai_1",count)
			else
			pc.setqf("entai_1",count)
			end
		q.set_counter("Kalan say� ", 50 - count)
		end
		
		when kill_1.timer begin
		q.set_counter("Kalan say� ", 50 - pc.getqf("entai_1"))
			if pc.getqf("entai_1") >= 50 then
			notice("En Tai Sava���lar�'n� �ld�rd�n. Orman Bek�isi'ne")
			notice("geri d�n.")
			cleartimer("kill_1")
			clear_letter()
			pc.setqf("entai_1",0)
			set_state(return_1)
			end
		end
	end
	
	state return_1 begin
		when letter begin
		local v = find_npc_by_vnum(20409)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Bek�isi")
			end
		send_letter("&�lk Ke�if")
		end
		
		when button or info begin
		say_title("�lk Ke�if")
		say("Orman Bek�isi'ni bul ve onunla konu�.")
		end
		
		when 20409.chat."�lk Ke�if" begin
		target.delete("__TARGET__")
		say_title("�lk Ke�if")
		say("Geri d�nd�n demek! En Tai Sava���lar�'ndan bir")
		say("�ey ald�n m�?")
		say_reward("Her �eyi inceledim. Ama �nemli bir �ey bulamad�m.")
		say("")
		say("�ok tuhaf. Tahminlerimden olduk�a emindim...")
		say("Tamam. Her �eyi tekrar enine boyuna d���nece�im.")
		say("Sonra seni �a��r�r�m. O zamana kadar bekle.")
		say_reward("Tamam.")
		say_reward("776600 Tecr�be puan� al�rs�n.")
		pc.give_exp2("776600")
		clear_letter()
		set_state(quest_2)
		end
	end
	
	state quest_2 begin
		when letter begin
		local v = find_npc_by_vnum(20409)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Bek�isi")
			end
		send_letter("&�la� �antas�n� bul.")
		end
		
		when button or info begin
		say_title("�la� �antas�n� bul.")
		say("Orman Bek�isi'ni bul ve onunla konu�.")
		end
		
		when 20409.chat."�la� �antas�n� bul." begin
		say_title(mob_name(npc.get_race()))
		say("Ho� geldin cesur sava���! B�y�k bir hata yapm���m!")
		say("�imdi eminim: Bu tuhaf yarat�klar her �eyin")
		say("sorumlusu. B�y�k ihtimalle bir sihir yapm��. O")
		say("gitti�inde ila� �antas� da kaybolmu�tu. Bu")
		say("b�y�c�, sihirbaz, �ifac� veya her neyse buradan")
		say("�ok fazla uzakla�m�� olamaz. L�tfen onu bul.")
		select("Tamam, onu arayaca��m.")
		target.delete("__TARGET__")
		say("�ok g�zel. Seni burada bekleyece�im. Kendine")
		say("dikkat et.")
		pc.setqf("entai_killed",0)
		set_state(kill_2)
		end
	end
	
	state kill_2 begin
		when letter begin
		send_letter("&�la� �antas�n� ara.")
		loop_timer("kill_2",1)
		end
		
		when button or info begin
		say_title("�la� �antas�n� ara.")
		say("En Tai Rahibi'ni �ld�r ve ila� �antas�n� ele")
		say("ge�ir.")
		end
		
		when kill with npc.get_race() == 6403 begin
			if number(1,100) <= 100 and pc.getqf("entai_killed") == 0 then
				if party.is_party() then
				party.setqf("entai_killed",1)
				else
				pc.setqf("entai_killed",1)
				end
			end
		end
		
		when kill_2.timer begin
			if pc.getqf("entai_killed") == 1 then
			pc.setqf("entai_killed",0)
			cleartimer("kill_2")
			notice("En Tai Rahibi'nden bir ila� �antas� ele ge�irdin.")
			set_state(return_2)
			end
		end
	end
	
	state return_2 begin
		when letter begin
		local v = find_npc_by_vnum(20409)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Bek�isi")
			end
		send_letter("&�la� �antas�n� bul.")
		end
		
		when button or info begin
		say_title("�la� �antas�n� bul.")
		say("Orman Bek�isi'ni bul ve onunla konu�.")
		end
		
		when 20409.chat."�la� �antas�n� ara." begin
		target.delete("__TARGET__")
		say_title(mob_name(npc.get_race()))
		say("Dur bir bakay�m. Evet! Bu o! Art�k ila� �antas�n� ")
		say("karde�lerime g�nderebilirim. Sana �ok te�ekk�r")
		say("ederim. Benim i�in yapt�klar�n� asla")
		say("unutmayaca��m.")
		say("Uzun bir s�redir d��ar�day�z. Stoklar�m�z")
		say("gittik�e azal�yor. En iyisi bunlar� onlara hemen")
		say("g�ndereyim. Bakal�m bir eksik var m�. Sonra seni")
		say("�a��r�r�m. Sen bu arada dinlen.")
		say_reward("776600 Tecr�be puan� al�rs�n.")
		pc.give_exp2("776600")
		set_state(quest_3)
		end
	end
	
	state quest_3 begin
		when letter begin
		local v = find_npc_by_vnum(20409)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Bek�isi")
			end
		send_letter("&�la� �antas�n� teslim et")
		end
		
		when button or info begin
		say("Orman Bek�isi'ni bul ve onunla konu�.")
		end
		
		when 20409.chat."�la� �antas�n� teslim et" begin
		say_title(mob_name(npc.get_race()))
		say("Dinlenebildin mi? �yi ila� �antas�na bakt�m,")
		say("hi�bir eksik yok. �antay� karde�lerime")
		say("g�ndermenin zaman� geldi. Sak�n yolda bir �ey")
		say("kaybetme.")
		select("Tabii ki.")
		target.delete("__TARGET__")
		say("Tamam, dikkatli ol!")
		pc.give_item2("31100",1)
		set_state(go_3)
		end
	end
	
	state go_3 begin
		when letter begin
		local v = find_npc_by_vnum(20410)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Casusu")
			end
		send_letter("&�la� �antas�n� teslim et")
		end
		
		when button or info begin
		say_title("�la� �antas�n� teslim et")
		say("�la� �antas�n� Orman Casusu'na teslim et.")
		end
		
		when 20410.chat."�la� �antas�n� teslim et" with pc.count_item("31100") > 0 begin
		target.delete("__TARGET__")
		say_title(mob_name(npc.get_race()))
		say("Kim geldi? Senin ne i�in var burada?")
		say_reward("Beni Orman Bek�isi g�nderdi. Sana bunu")
		say_reward("verecekmi�im.")
		say("L�tfen kabal���m� ho� g�r. Bana ila� �antam� ")
		say("getirdi�in i�in �ok te�ekk�r ederim. �la�lara")
		say("acilen ihtiyac�m�z var. �antay� g�t�rmeme izin")
		say("ver. K�saca bekler misin?")
		say_reward("Tabii ki beklerim.")
		say_reward("Gango K�k� kazand�n. 10Uniteler")
		say_reward("5825000 Tecr�be puan� al�rs�n.")
		pc.remove_item("31100",pc.count_item("31100"))
		pc.give_item2("50724",10)
		pc.give_exp2("5825000")
		set_state(quest_4)
		end
	end
	
	state quest_4 begin
		when letter begin
		local v = find_npc_by_vnum(20410)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Casusu")
			end
		send_letter("&�kinci Ke�if")
		end
		
		when button or info begin
		say_title("�kinci Ke�if")
		say("Orman Casusu'nu bul ve onunla konu�.")
		end
		
		when 20410.chat."�kinci Ke�if" begin
		say_title(mob_name(npc.get_race()))
		say("Seni bu kadar bekletti�im i�in �ok �zg�n�m.")
		say("Buray� nas�l buldun?")
		say_reward("Tap�nak Bek�isi, Efsunlu Orman'� ara�t�rmada ona")
		say_reward("Ona yard�mc� olmam� istedi. Bana ne yapabilece�imi")
		say_reward("s�yler misin?")
		say("Cesaretinden �ok etkilendim.")
		say("Bu orman�n bir �ok a�ac� ta�a d�n��m��. Bu")
		say("ta�lardan g��l� ve mistik bir enerji yay�l�yor bu")
		say("da ��k b�y�k bir g�r�lt�ye yol a��yor. Bu ta�lar� ")
		say("yok etmeme yard�m et l�tfen.")
		select("Tabii, yapar�m.")
		target.delete("__TARGET__")
		pc.setqf("stone_4",0)
		set_state(kill_4)
		end
	end
	
	state kill_4 begin
		when letter begin
		send_letter("&Ta�lar� yok et")
		q.set_counter("Kalan say� ", 5 - pc.getqf("stone_4"))
		loop_timer("kill_4",1)
		end
		
		when button or info begin
		say_title("Ta�lar� yok et")
		say("A�a� Yarat��� Metinleri'ni yok et ve Orman")
		say("Casusu'na geri d�n.")
		q.set_counter("Kalan say� ", 5 - pc.getqf("stone_4"))
		end
		
		when kill with npc.get_race() == 8059 begin
		local count = pc.getqf("stone_4")+1
			if party.is_party() then
			party.setqf("stone_4",count)
			else
			pc.setqf("stone_4",count)
			end
		q.set_counter("Kalan say� ", 5 - count)
		end
		
		when kill_4.timer begin
		q.set_counter("Kalan say� ", 5 - pc.getqf("stone_4"))
			if pc.getqf("stone_4") >= 5 then
			notice("T�m A�a� Yarat��� Metinleri'ni yok ettin. Orman")
			notice("Casusu'na rapor ver.")
			cleartimer("kill_4")
			clear_letter()
			pc.setqf("stone_4",0)
			set_state(return_4)
			end
		end
	end
	
	state return_4 begin
		when letter begin
		local v = find_npc_by_vnum(20410)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Casusu")
			end
		send_letter("&�kinci Ke�if")
		end
		
		when button or info begin
		say_title("�kinci Ke�if")
		say("Orman Casusu'nu bul ve onunla konu�.")
		end
		
		when 20410.chat."�kinci Ke�if" begin
		say_title(mob_name(npc.get_race()))
		say("Ba�ard�n! Harika! Sen A�a� Yarat��� Metinleri'ni")
		say("yok ederken ben de buradaki mantar h�crelerinden")
		say("mantar elde ettim. Bakal�m bunlardan nas�l")
		say("yararlanabiliriz. Ama �nce ba�ka bir i�le")
		say("ilgilenmeliyiz.")
		say_reward("7766000 Tecr�be puan� al�rs�n.")
		target.delete("__TARGET__")
		pc.give_exp2("7766000")
		clear_letter()
		set_state(quest_5)
		end
	end
	
	state quest_5 begin
		when letter begin
		local v = find_npc_by_vnum(20410)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Casusu")
			end
		send_letter("&En Tai �ebnemi")
		end
		
		when button or info begin
		say_title("En Tai �ebnemi")
		say("Orman Casusu'nu bul ve onunla konu�.")
		end
		
		when 20410.chat."En Tai �ebnemi" begin
		say_title(mob_name(npc.get_race()))
		say("Hmm... acaba bu ger�ekten s�k�a bahsedilen")
		say("efsanevi En Tai �ebnemi mi? Efsaneye g�re")
		say("insanlar bu �ebnemi �eytanlar� defetmek i�in")
		say("kullan�rm��.")
		say("Bu m�thi� s�v�y� En Tai �mhac�'lar�n�n")
		say("kendisinden ele ge�irmek en iyisi olacakt�r.")
		say("Bu �ebnemi benim i�in bulur musun? Bunu")
		say("yapabilece�inden eminim.")
		select("Bulurum!")
		target.delete("__TARGET__")
		set_state(kill_5)
		end
	end
	
	state kill_5 begin
		when letter begin
		send_letter("&En Tai �ebnemi bul")
		pc.setqf("entai_killed_11",0)
		loop_timer("kill_5",1)
		q.set_counter("Kalan say� ", 5 - pc.count_item("31097"))
		end
		
		when button or info begin
		say_title("En Tai �ebnemi bul")
		say("En Tai �mhac�s� �ld�r ve 5 En Tai �ebnemi topla.")
		q.set_counter("Kalan say� ",pc.count_item("31097"))
		end
		
		when kill with npc.get_race() == 6406 begin
			if number(1,5) == 3 and pc.getqf("entai_killed_11") == 0 then
				if party.is_party() then
				party.setqf("entai_killed_11",1)
				else
				pc.setqf("entai_killed_11",1)
				end
			end
		end
		
		when kill_5.timer with pc.getqf("entai_killed_11") == 1 begin
		pc.setqf("entai_killed_11",0)
		pc.give_item2("31097",1)
		q.set_counter("Kalan say� ", 5 - pc.count_item("31097"))
			if pc.count_item("31097") == 5 then
			notice("En Tai �mhac�'lar�ndan En Tai �ebnemi elde ettin.")
			notice("Bunlar� Orman Casusu'na g�t�r.")
			cleartimer("kill_5")
			clear_letter()
			set_state(return_5)
			end
		end
	end
	
	state return_5 begin
		when letter begin
		local v = find_npc_by_vnum(20410)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Casusu")
			end
		send_letter("&En Tai �ebnemi")
		end
		
		when button or info begin
		say_title("En Tai �ebnemi")
		say("En Tai �mhac�'lar�ndan En Tai �ebnemi elde ettin.")
		say("Bunlar� Orman Casusu'na g�t�r.")
		end
		
		
		when 20410.chat."En Tai �ebnemi" with pc.count_item("31097") >= 5 begin
		target.delete("__TARGET__")
		say_title(mob_name(npc.get_race()))
		say("En Tai �mhac�s�'n� bulup En Tai �ebnemini elde")
		say("ettin mi? Hakl� ��kt�m yani! Yard�mlar�n")
		say("sayesinde art�k En Tai �ebnemini bulduk. Bununla")
		say("g�r�lt�y� durdurabilece�im. Buyur. �am sak�z� ")
		say("�oban arma��n�. �imdi Orman Ka�ifi'ni bul.")
		say_reward("Y�ng Suyu kazand�n. 10Uniteler")
		say_reward("7766000 Tecr�be puan� al�rs�n.")
		pc.remove_item("31097",pc.count_item("31097"))
		pc.give_exp2("7766000")
		set_state(quest_6)
		end
	end
	
	state quest_6 begin
		when letter begin
		local v = find_npc_by_vnum(20411)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Ka�ifi")
			end
		send_letter("&En Tai H�k�mdar�'n� �ld�r")
		end
		
		when button or info begin
		say_title("En Tai H�k�mdar�'n� �ld�r")
		say("Orman Ka�ifi'ni bul ve onunla konu�.")
		end
		
		when 20411.chat."En Tai H�k�mdar�'n� �ld�r" begin
		say_title(mob_name(npc.get_race()))
		say("Sen Orman Casusu'nun bahsetti�i cesur sava��� ")
		say("olmal�s�n. Ad�n� Orman Casusu'ndan duydu�umdan")
		say("beri d�rt g�zle seni bekliyorum. �imdi beni �ok")
		say("iyi dinle.")
		wait()
		say("Benim g�revim orman� ke�fetmek. En Tailerin son")
		say("zamanlarda gittik�e tehlikeli olmaya")
		say("ba�lad�klar�n� fark ettim. Hepimiz i�in b�y�k bir")
		say("tehdit olu�turuyorlar. H�k�mdarlar�n� ")
		say("�ld�rmelisin.")
		say("Onu bizzat ben �ld�rmek isterdim ama kat�ld���m")
		say("onca sava�tan sonra k�l�c�m k�rle�mi�. En Tai")
		say("H�k�mdar�'n� bul ve bana ondaki de�erli tahtadan")
		say("getir.")
		select("Tamam.")
		target.delete("__TARGET__")
		set_state(kill_6)
		end
	end
	
	state kill_6 begin
		when letter begin
		send_letter("&En Tai H�k�mdar�'n� �ld�r")
		target.pos("__BOSS__", 610, 78, 354, "En Tai H�k�mdar� ")
		loop_timer("kill_6",1)
		pc.setqf("boss_1",0)
		end
		
		when button or info begin
		say_title("En Tai H�k�mdar�'n� �ld�r")
		say("En Tai H�k�mdar�'n� �ld�r ve de�erli tahta elde")
		say("et.")
		end
		
		when kill with npc.get_race() == 6407 begin
			if party.is_party() then
			party.setqf("boss_1",1)
			else
			pc.setqf("boss_1",1)
			end
		end
		
		when kill_6.timer with pc.getqf("boss_1") > 0 begin
		target.delete("__BOSS__")
		pc.give_item2("31096",1)
		pc.setqf("boss_1",0)
		notice("En Tai H�k�mdar�'ndan de�erli tahta elde ettin.")
		notice("Orman Ka�ifi'ne git ve rapor ver.")
		cleartimer("kill_6")
		set_state(return_6)
		end
	end
	
	state return_6 begin
		when letter begin
		local v = find_npc_by_vnum(20411)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Ka�ifi")
			end
		send_letter("&En Tai H�k�mdar�'n� �ld�r")
		end
		
		when button or info begin
		say_title("En Tai H�k�mdar�'n� �ld�r")
		say("En Tai H�k�mdar�'ndan de�erli tahta elde ettin.")
		say("Orman Ka�ifi'ne git ve rapor ver.")
		end
		
		when 20411.chat."En Tai H�k�mdar�'n� �ld�r" with pc.count_item("31096") > 0 begin
		say_title(mob_name(npc.get_race()))
		say("�nan�lmaz! Ba�ard�n!")
		say("Bu tahtay� m�mk�n oldu�unca k�sa s�rede")
		say("analiz etmeye �al��aca��m.")
		say("")
		say("Sak�ncas� yoksa i�im bitine kadar")
		say("bekleyebilir misin?")
		say_reward("11650000 Tecr�be puan� al�rs�n.")
		pc.remove_item("31096",pc.count_item("31096"))
		pc.give_exp2("11650000")
		set_state(quest_7)
		end
	end
	
	state quest_7 begin
		when letter begin
		local v = find_npc_by_vnum(20411)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Ka�ifi")
			end
		send_letter("&Bir a�a� z�mr�t� ")
		end
		
		when button or info begin
		say_title("Bir a�a� z�mr�t� ")
		say("Orman Ka�ifi'ni bul ve onunla konu�.")
		end
		
		when 20411.chat."Bir a�a� z�mr�t� " begin
		say_title(mob_name(npc.get_race()))
		say("Tekrar d�nd���ne sevindim. Tahtan�n analizi")
		say("�zerinde uzun zaman ge�irdim. Arad���m�z�n bu")
		say("oldu�undan emindim fakat analiz s�ras�nda")
		say("fark ettim.... Eksik bir �ey var. A�a� ")
		say("z�mr�t� gerekli. Tekrar En Tai H�k�mdar�'n� ")
		say("ziyaret edebilir misin? Bu ger�ekten gerekli.")
		wait()
		say("En Tai H�k�mdar�'ndan bunu almal�y�z. Bu kadar")
		say("kolay vazge�mek istemiyoruz.")
		select("Tamam, gidece�im.")
		target.delete("__TARGET__")
		set_state(kill_7)
		end
	end
	
	state kill_7 begin
		when letter begin
		send_letter("&Bir a�a� z�mr�t� ")
		target.pos("__BOSS__", 610, 78, 213, "En Tai H�k�mdar� ")
		loop_timer("kill_7",1)
		pc.setqf("boss_2",0)
		end
		
		when button or info begin
		say_title("Bir a�a� z�mr�t� ")
		say("En Tai H�k�mdar�'n� �ld�r ve a�a� z�mr�t� elde")
		say("et.")
		end
		
		when kill with npc.get_race() == 6407 begin
			if party.is_party() then
			party.setqf("boss_2",1)
			else
			pc.setqf("boss_2",1)
			end
		end
		
		when kill_7.timer with pc.getqf("boss_2") > 0 begin
		target.delete("__BOSS__")
		pc.give_item2("31099",1)
		pc.setqf("boss_2",0)
		notice("En Tai H�k�mdar�'ndan a�a� z�mr�t� elde ettin.")
		notice("Orman Ka�ifi'ne git ve rapor ver.")
		cleartimer("kill_7")
		set_state(return_7)
		end
	end
	
	state return_7 begin
		when letter begin
		local v = find_npc_by_vnum(20411)
			if v != 0 then
			target.vid("__TARGET__", v, "Orman Ka�ifi")
			end
		send_letter("&Bir a�a� z�mr�t� ")
		end
		
		when button or info begin
		say_title("Bir a�a� z�mr�t� ")
		say("En Tai H�k�mdar�'ndan a�a� z�mr�t� elde ettin.")
		say("Orman Ka�ifi'ne git ve rapor ver.")
		end
		
		when 20411.chat."En Tai H�k�mdar�'n� �ld�r" with pc.count_item("31099") > 0 begin
		target.delete("__TARGET__")
		say_title(mob_name(npc.get_race()))
		say("Ba�ard�n! G�zlerime inanam�yorum - bir g�n")
		say("bunu g�rece�imi hi� d���nmemi�tim!")
		say("�imdi bu a�a� z�mr�t�n� analiz etmek i�in")
		say("gidiyorum.")
		say("Ba�ard�k! Yard�mlar�n ve cesaretin i�in")
		say("te�ekk�rler. Al bakal�m. Bu Orman Perisi ta��.")
		say("En Tai H�k�mdar�'ndan ald���m�z bu otantik ta� ")
		say("�ok b�y�k bir potansiyele sahip. Jotun Thrym")
		say("ile kar��la�mak sadece bu ta�la m�mk�n olabilir.")
		say("Onunla kar��la�mak i�in Orman Bek�ileri Lideri")
		say("ile konu�, hadi!")
		say_reward("Orman Perisi Ta�� kazand�n. 1Uniteler")
		say_reward("11650000 Tecr�be puan� al�rs�n.")
		pc.remove_item("31099",pc.count_item("31099"))
		pc.give_item2("30613",1)
		pc.give_exp2("11650000")
		set_state(start)
		end
	end
end
	