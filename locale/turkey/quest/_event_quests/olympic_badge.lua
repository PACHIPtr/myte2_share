--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest olympic_badge begin
	state start begin
		function has_it()
			local a = pc.count_item(30265)
			local b = pc.count_item(30266)
			local c = pc.count_item(30267)
			local d = pc.count_item(30268)
			local e = pc.count_item(30269)

			local perfect = a > 0 and b > 0 and  c > 0 and d > 0 and e > 0 
			local notyet = a >0 or b > 0 or  c > 0 or d > 0 or  e > 0 
			if perfect then 
				return 1
			elseif notyet  then
				return 0
			end
		end
		when login with game.get_event_flag("ex_olympic_drop") >= 1  begin
			set_state(information)
		end
	end

	state information begin
		when letter with pc.level>=30 and game.get_event_flag("ex_olympic_drop") >= 1 begin
			local v = find_npc_by_vnum(20017)
			if 0 != v then
				target.vid("__TARGET__", v, "")
			end
			send_letter("Kahramanl�k Madalyas� ")
		end

		when info or button with pc.level>=30 and game.get_event_flag("ex_olympic_drop") >= 1 begin
			say("")
			say("Yu-Hwan'�n sana ihtiyac� var.[ENTER]Bir an �nce onun yan�na gitmelisin.[ENTER]Onu 2.k�yde bulabilirsin. ")
			say("")
		end
		when __TARGET__.target.click or 20017.chat."Kahramanl�k Madalyas� "	with  game.get_event_flag("ex_olympic_drop") >= 1 and pc.level>=30 begin
			target.delete("__TARGET__")

			say("")
			say_title(mob_name(20017))
			say(" Yard�m! ")
			say(" Sefil h�rs�zlar...[ENTER]D�n gece benimle kald�lar.[ENTER]Kahramanl�k Madalyas�n� �ald�lar.O madalya imparatorluk [ENTER]sava��nda b�y�k babama zafer �d�l�[ENTER]olarak verilmi�ti. [ENTER]Ama �imdi o madalya �al�nd� ve[ENTER]h�rs�zlar kay�p oldu! ")
			wait()
			say("")
			say_title(mob_name(20017))
			say("O madalya ailem i�in paha bi�ilmez![ENTER]ne yapmal�y�m? ")
			say(" Bana yard�m edecek misin? ")
			local s = select(locale.yes, locale.no)
			if 2 == s then
				say(" �imdi bana bir daha hay�r dersen[ENTER]sana bir daha yard�m teklifinde[ENTER]bulunmayaca��m.Emin misin? ")
				local a = select(locale.yes, locale.no)
				if 2 == a then
					say_title(mob_name(20017))
					say("Zaman�n yok anl�yorum! Daha uygun bir zamanda[ENTER]gel.Ama beni �ok bekletme! ")
					say("")
					return
				end
				say("")
				say_title(mob_name(20017))
				say("Ne yaz�k ki �ok ge�! Art�k bana yard�m edemezsin.[ENTER]Sana izledi�in yolda ba�ar�lar! ")
				set_state(__GIVEUP__)
				return
			end	
			
			say("")
			say_title(mob_name(20017))
			say("Beni soyan canavarlar� avla! Ama[ENTER] �ok dikkatli olmal�s�n.Onlar �ok g��l�.[ENTER]30.Seviyeden sonra bana Kahramanl�k Madalyas�[ENTER]getirir isen, seni �d�llendirece�im. ")
			set_state(step1)
		end	
	end

	state step1 begin
		when letter with pc.level>=30 begin
			send_letter("Kahramanl�k Madalyas� ")
		end

		when info or button with pc.level>=30 begin
			say("")
			say("Kahramanl�k Madalyas� kayboldu.[ENTER]Bul ve Yu-Hwan'a geri d�n. ")
			say("")
		end
		
		when login or enter with game.get_event_flag("ex_olympic_drop") == 0 begin
			test = pc.getqf("medal_done")
			if test != 0 then
				pc.setqf("medal_done", 0)
			end
		end
		
		when 20017.chat."Kahramanl�k Madalyas� " with  game.get_event_flag("ex_olympic_drop") >= 1 and pc.level>=30 begin
			say_title(mob_name(20017))
			say("Sonunda! Geri d�nd�n![ENTER]Kahramanl�k Madalyas�'n� buldu�unu s�yle bana.")
			wait()
			if  count_item_range(30265,30269)== 0  then
				say("Oh, hay�r! Elin bo� mu geldin?[ENTER]Kendimi umutsuz hissetmeye ba�lad�m![ENTER]Sen bile bana yard�mc� olamazsan[ENTER]derdime kim derman olur? L�tfen[ENTER]git ve onu benim i�in ara! ")
				return
			elseif olympic_badge.has_it() ==0  then
				say("Kahramanl�k Madalya'm� buldun![ENTER]Ama bekle... bu sadece bir par�as�.[ENTER]Be� b�l�me ayr�lm�� olan par�alar�ndan[ENTER]eksikler var! Bana t�m[ENTER]par�alar� getir l�tfen! [ENTER]Belki sonra yeniden bir madalya[ENTER]olu�turabiliriz! ")
				return
			else 
				say_title(mob_name(20017))
				say("Bu berbat su�lular benim de�erli[ENTER]e�yam� �ald�lar![ENTER]Ama sen bana b�t�n par�alar� getirerek[ENTER]yeniden bir Madalya yapmama olanak[ENTER]sa�l�yorsun.Biraz bekle tek tek[ENTER]par�alar� birle�tiril madalya yapmay�[ENTER]deneyece�im...")
				wait()	
				pc.remove_item(30265)
				pc.remove_item(30266) 
				pc.remove_item(30267) 
				pc.remove_item(30268) 
				pc.remove_item(30269) 
				if pc.getqf ("medal_done") == 0 then
					say_title(mob_name(20017))
					say("Bir milyon kere te�ekk�r[ENTER]Bana yeniden madalya yapmam i�in[ENTER]b�t�n par�alar� getirdin.[ENTER]Ve madalyam� yapt�m.Te�ekk�rler[ENTER]sava���! ��te �d�l�n. ")
					-- show items
					say_item_vnum(71158)
					--say_item_vnum(71159)
					
					pc.give_item2(71158)
					pc.setqf("medal_done", 1)
					return
				end   --if
				
				say_title(mob_name(20017))
				say("Bir milyon kere te�ekk�r[ENTER]Bana yeniden madalya yapmam i�in[ENTER]b�t�n par�alar� getirdin.[ENTER]Ve madalyam� yapt�m.Te�ekk�rler[ENTER]sava���! ��te �d�l�n. ")
				say_item_vnum(50249)
				pc.give_item2(50249)
			end    --if 

		end	   --when 

		end   --state

	state __GIVEUP__ begin
	end
end  --quest
