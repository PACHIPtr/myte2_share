--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest event_ramadan begin
	state start begin
		function is_running()
			return (game.get_event_flag("ex_ramadan_drop") > 0)    --npc spawn
		end
		function reward_period()
			return (game.get_event_flag("ramazan_etkinlik_bitti") > 0)    --reward menu appear
		end

			
		function setting()
			return {  
			["bread"]	= 30315,
			["candy"]	= 50183,
			["plate"]	= 30316,
			["iftar"]	= 30317,
			["fruit"]	= 30318,
			["box"]	    = 50182,
			["horse1"]	= 71131,
			["horse2"]	= 71132,
			["horse3"]	= 71133,
			["horse4"]	= 71134,
			["historian"]	= 33002,
			["beggar1"]	    = 33003, 
			["beggar2"]	    = 33004,
			["beggar3"]	    = 33005, 
			["beggar4"]	    = 33006, 
			["beggar5"]	    = 33007 
			}
		end
		
		when 33002.chat."Tarih�i mi? " with pc.getf("event_ramadan","first_notice")==0 and event_ramadan.is_running()  begin
			local setting = event_ramadan.setting()
			say_title("Tarih�i: ")
			say("")
			say("Ge�mi�i olmayan�n gelece�i olmaz![ENTER]Sana nas�l yard�mc� olabilirim? ")
			wait()

			say_pc_name()
			say("Pardon, tan���yor muyuz? ")
			wait()

			say_title("Tarih�i: ")
			say("Afedersin, kendimi tan�tmay� unutmu�um. Bir[ENTER]tarih�i olarak gezip g�rmedi�im yer yoktur. E�er[ENTER]tarihle ilgili bir �ey bilmek istersen, �ekinmeden[ENTER]sorabilirsin. ")
			wait()
			
			say_pc_name()
			say("Seninle tan��t���ma �ok memnun oldum. Art�k s�k s�k[ENTER]ziyaretine gelirim. ")
			

			pc.setqf("first_notice",1)
		end  
	
	when 33002.chat."Tatl� yiyelim tatl� konu�al�m  " with pc.getf("event_ramadan","first_notice")==1 and event_ramadan.is_running() begin
		
		local setting = event_ramadan.setting()
		if pc.count_item(setting.bread) == 0  then
			say_title("Tarih�i: ")
			say("Tatl� g�rd�n m� hi�?[ENTER]Baklava tatl�s� derler.")
			local s=select("Evet, g�rd�m. " ,"Maalesef. ")
			if 2==s then
				say_title("Tarih�i: ")
				say("T�h. Neyse, tekrar g�r��mek �zere. ")
				return
			end
			say_title("Tarih�i: ")
			say("Demek ne oldu�unu biliyorsun?[ENTER]Bu tatl�lar� istiyorsan,[ENTER]bana on tane simit getirmelisin.  ")
			wait()
			say_title("Tarih�i: ")
			say("10 simit kar��l���nda sana bir tatl� verebilirim.[ENTER]Anla�t�k m�? ")
			local s=select("Seve seve. ","U�ra�amam. ")
			if 2==s then
				say_title("Tarih�i: ")
				say("T�h. Neyse, tekrar g�r��mek �zere. ")
			return
			end
			say_title("Tarih�i: ")
			say("Her 10 simit kar��l���nda sana bir tane tatl�[ENTER]verece�im. ")
		elseif	pc.count_item(setting.bread) > 0 and  pc.count_item(setting.bread) < 10  then
			say_title("Tarih�i: ")
			say("10 simit buldu�unda gel. ")
		elseif	pc.count_item(setting.bread) >= 10  then
			say_title("Tarih�i: ")
			say("Ahh harikas�n 10 simit buldun demek.[ENTER]��te sana nefis baklava tatl�s�.[ENTER]Afiyet olsun. ")
			wait()	
			say_title("Tarih�i: ")
			say("Her 10 simit kar��l���nda sana bir tane tatl�[ENTER]verece�im. ")
			pc.give_item2(setting.candy,1)
			pc.remove_item(setting.bread,10)
		end  --if
		if not event_ramadan.is_running() then
			npc.purge()
		end
	end	  --when
		when 33002.chat."Enfes Simit " with pc.getqf("first_notice")== 1 and event_ramadan.is_running() begin
			local setting = event_ramadan.setting()
			say_title("Tarih�i: ")
			say("Bana getirdi�in simitle karn�m� doyurdum.")
			say("Burada o kadar a� dilenci var ki, onlara iftar[ENTER]yeme�i versen �ok sevap kazan�rs�n. ")
			say("Tevazu g�sterip al�ak g�n�ll� davranmal�s�n.[ENTER]�ftar yeme�ini de�erli bir tabakta vermen gerekir. ")
			say_item_vnum(setting.plate)
			wait()
			say_title("Tarih�i: ")
			say("Bu nefis simit i�in ne kadar te�ekk�r etsem[ENTER]azd�r! �ok yard�msever ve merhametli bir insans�n.[ENTER]Tuttu�un alt�n olsun, g�nl�n ne�eyle dolsun!")
		end	

		when 33003.chat." A��m... " or 33004.chat." A��m... " or 33005.chat." A��m... " or 33006.chat." A��m... " or 33007.chat." A��m... " begin
			local setting = event_ramadan.setting()
			if pc.count_item(setting.iftar) == 0  then 
				say_title(" Niyetli Vatanda�: ")
				say("")
				say("Ger�ekten �ok a��m.[ENTER]Bana merhamet et.[ENTER]L�tfen bana iftar yeme�i ver, yoksa a�l�ktan �lece�im. ")

			elseif pc.count_item(setting.iftar) > 0  then 
				
				say_title(" Niyetli Vatanda�: ")
				say("")
				say("Aaa, bu iftar yeme�i de�il mi? Simitler ne kadar[ENTER]da nefis kokuyor...Karn�m� doyurursan �m�r boyu sana dua edece�im.")
				local s = select("Tabi, buyur. ","Malesef veremem. ")
				if 2==s then
					say_title(" Niyetli Vatanda�: ")
					say("")
					say("�ok te�ekk�r ederim. Hakikaten �ok yard�msever ve merhametli bir insanm��s�n. ")
					return
				end
				-- reward
				say_title(" Niyetli Vatanda�: ")
				say("")
				say("Bu iyili�ini hi� [ENTER]unutmayaca��m. B�t�n dualar�n kabul olsun. ")
				
				pc.give_item2(setting.box,1)
				pc.remove_item(setting.iftar,1)
				end --if

				if not event_ramadan.is_running() then
					npc.purge()
				end
			end	
		
		when 33002.chat." Bereket Meyvesi " with  pc.getf("event_ramadan","fig_exchange")==0 and event_ramadan.is_running() begin
			local setting = event_ramadan.setting()
			if get_time() > pc.getqf("duration") then
				say_title("Tarih�i: ")
				say("")
				say("Senin karn�n� doyurmad�m m� ben bug�n?!  ")
				say_reward("Bereket meyvesini 6 saatte bir alabilirsin.")
				pc.give_item2(setting.fruit)
				pc.setqf("duration",get_time()+60*60*6) 			--24h
			else	
				say_title("Tarih�i: ")
				say("Bak sana[ENTER]�ok �nemli bir �ey s�yleyece�im, kula��n� d�rt a�:[ENTER]Sabreden dervi� murad�na ermi�! ")
			end
		end

		when 33002.chat."Bereket Meyvesi getirdim " with event_ramadan.reward_period() and  pc.getf("event_ramadan","fig_exchange")==0 and event_ramadan.is_running() begin
			local setting = event_ramadan.setting()
			say_title("Tarih�i: ")
			say("")
			say("Bu kadar az m�?[ENTER]�zg�n�m, bu kadar az meyve kar��l���nda sadece[ENTER]at verebilirim. Daha sab�rl� olmal�yd�n. ")
			wait()
			if  pc.count_item(setting.fruit)>= 5 then		--more than 5
				say_title("Tarih�i: ")
				say("")
				say(string.format("%d tane Bereket Meyvesi var. ", pc.count_item(setting.fruit)))
				say("H�mm, �ok fazla de�il ama olsun.[ENTER]Kar��l���n� alacaks�n.[ENTER]Beni daha fazla ziyaret etmeliydin. ")
				local s=select("L�tfen, al. ", "Hay�r. ")
				if 2==s then 
					say_title("Tarih�i: ")
					say("")
					say("�yice d���n... Ben bir s�re burada de�ilim. ")
					return
				end
				say_title("Tarih�i: ")
				say("")
				say("C�mertli�in i�in te�ekk�r ederim! ")
				say_reward("�d�l: Kara Ya��z At� ")
				say("")
				if pc.count_item(setting.fruit)>= 5 and pc.count_item(setting.fruit)<= 10 then
					pc.give_item2(setting.horse1,1)
				elseif pc.count_item(setting.fruit)>= 11 and pc.count_item(setting.fruit)<= 19 then
					pc.give_item2(setting.horse2,1)
				elseif pc.count_item(setting.fruit)>= 20 and pc.count_item(setting.fruit)<= 27 then
					pc.give_item2(setting.horse3,1)
				elseif pc.count_item(setting.fruit)>= 28 then
					pc.give_item2(setting.horse4,1)
				end
				pc.remove_item(setting.fruit,pc.count_item(setting.fruit))
				pc.setqf("fig_exchange",1)
			else										--less  than  5
				say_title("Tarih�i: ")
				say("")
				say("5 taneden az m�? Bununla fazla bir �ey yapamam. Belki ba�ka zaman. ")
			end
	end
	when 30316.use begin
		local setting = event_ramadan.setting()
		if pc.count_item(setting.bread) >= 10 then
			pc.remove_item(setting.bread, 10)
			pc.remove_item(setting.plate, 1)
			pc.give_item2(setting.iftar, 1)
		end
	end

	end --state
end		--quest