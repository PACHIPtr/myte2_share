--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest lonca_turnuva begin
	state start begin
		when login with pc.getqf("turnuvadasin") == 0 and pc.isguildmaster() and game.get_event_flag("turnuva") == 1 and pc.getqf("uyarildin") == 0 begin
			send_letter("*Lonca Turnuvas� ")
		end
		when button or info begin
			addimage(20, 12, "gtournament.tga")
			say("")
			say("")
			say("")
			say("")
			say("Sava� sorumlusu seni bekliyor.")
			say("")
			say_reward("Arven2 Tak�m�n.")
			send_letter("*Lonca Turnuvas� Turnuvas� ")
		end
		
		when login or levelup or logout with game.get_event_flag("turnuva") == 0 begin
			if pc.getqf("turnuvadasin") == 1 then
			pc.delqf("turnuvadasin")
			pc.delqf("uyarildin")
			pc.delqf("odulver")
			elseif pc.getqf("uyarildin") == 1 then
			pc.delqf("turnuvadasin")
			pc.delqf("uyarildin")
			pc.delqf("odulver")
			elseif pc.getqf("odulver") == 1 then
			pc.delqf("turnuvadasin")
			pc.delqf("uyarildin")
			pc.delqf("odulver")		
			end
		end
		
		when 11001.chat."Lonca Sava�lar� Turnuvas� �d�l� " or 11003.chat."Lonca Sava�lar� Turnuvas� �d�l� " or 11005.chat."Lonca Sava�lar� Turnuvas� �d�l� " with game.get_event_flag("turnuva") == 3 begin
			if game.get_event_flag(guild.name(pc.get_guild())) == 1 then
				if pc.getqf("odulver") == 0 then
				say_title("Sava� Sorumlusu:")
				say("")
				say("Seni ve loncan� tebrik ederim "..pc.get_name().."")
				say("Ger�ekten bu �d�l� hak ettiniz. Bir sonraki")
				say("turnuvada g�r��mek dile�iyle.")
				say("")
				pc.give_item2("80014",1)
				pc.give_item2("80014",1)
				pc.give_item2("80014",1)
				pc.give_item2("83008",1)
				pc.give_item2("83008",1)
				pc.setqf("odulver",1)
				elseif pc.getqf("odulver") == 1 then
				say_title("Sava� Sorumlusu:")
				say("")
				say("Sen zaten �d�l�n� almam�� m�yd�n?")
				say("Yeterli gelmediyse bir dahaki turnuvay� ")
				say("kazanmak i�in �al��.")
				say("")
				end
			else
			say_title("Sava� Sorumlusu:")
			say("")
			say("�zg�n�m, bu turnuvay� sen kazanmad�n.")
			say("�d�l� de sen almayacaks�n.")
			say("")
			end
		end
		
		when 11001.chat."Turnuvaya kat�lanlar�n listesine bak" or 11003.chat."Turnuvaya kat�lanlar�n listesine bak" or 11005.chat."Turnuvaya kat�lanlar�n listesine bak" with game.get_event_flag("turnuva") == 1 and pc.hasguild() begin
		local guild_list = game.mysql_query("SELECT * FROM player.guild_tournement WHERE guild_tournement.guild_name NOT LIKE '[%]%' ORDER BY guild_tournement.number DESC")
		local inbox_table = {}
			for i = 1,table.getn(guild_list),1 do
			table.insert(inbox_table,guild_list.guild_name[i])
			end
		table.insert(inbox_table,"Kapat")
			if(table.getn(guild_list) == 0) then
			say_title("Sava� Sorumlusu:")
			say("Hen�z turnuvaya kat�lan lonca yok.")
			return
			end
		local m = select_table(inbox_table)
			if(table.getn(inbox_table) == m) then
			return
			elseif(table.getn(inbox_table) >= m) then
			say_title(guild_list.guild_name[m].." loncas� ")
			say("")
			say("Lonca lideri: "..guild_list.guild_master[m]..", Krall�k: "..guild_list.empire[m].."")
			say("�ye say�s�: "..guild.get_member_count(guild_list.guild_id[m])..", S�ralama: "..guild.get_rank(guild_list.guild_id[m]).."")
			say("")
			return
			end
		end
		
		when 11001.chat."Lonca Sava�lar� Turnuvas�'na kat�l" or 11003.chat."Lonca Sava�lar� Turnuvas�'na kat�l" or 11005.chat."Lonca Sava�lar� Turnuvas�'na kat�l" with game.get_event_flag("turnuva") == 1 and pc.isguildmaster() begin
			if pc.getqf("turnuvadasin") == 1 then
			say_title("Sava� Sorumlusu:")
			say("")
			say("Zaten turnuvaya kay�t oldun. Sava� zaman�n� ")
			say("bekle.")
			say("")
			return
			else
			say_title("Sava� Sorumlusu:")
			say("")
			say("Hey, loncana g�veniyor musun? Dostlar�n ger�ekten")
			say("g��l� m�? Seni yar� yolda b�rakmayacaklar�na")
			say("emin misin? O zaman Lonca Sava�lar� Turnuvas�'na")
			say("kat�larak en g��l�n�n "..guild.name(pc.get_guild()).." loncas� ")
			say("oldu�unu ispatla!")
			say("")
			wait()
				if guild.level(pc.get_guild()) < 20 and not pc.is_gm() then
				say_title("Sava� Sorumlusu:")
				say("")
				say("Lonca seviyesinin 20 olmas� gerekiyor.")
				say("Bu haldeyken turnuvaya kat�lman�za gerek yok.")
				say("Zaten kazanma �ans�n�z�n olmad��� a��k�a")
				say("g�r�l�yor. Belki loncan�z i�in biraz daha")
				say("fedak�rl�k etmelisiniz.")
				elseif guild.get_member_count(pc.get_guild()) < 30 and not pc.is_gm() then
				say_title("Sava� Sorumlusu:")
				say("")
				say("Loncan�n en az 30 �yeye sahip olmas� gerekir.")
				say("")
				else
				say_title("Sava� Sorumlusu:")
				say("")
				say("Herhangi bir engel g�r�nm�yor. Dilersen")
				say("loncan� turnuvaya hemen kaydedebilirim.")
				say("Ger�ekten kat�lmak istiyor musun?")
				say("")
				local gardas = select ("Evet, istiyorum.","Hay�r, kat�lmayaca��m.")
					if gardas == 1 then
					say_title("Sava� Sorumlusu:")
					say("")
					say_reward("Lonca sava��na en az 10 oyuncu kat�lmal�.")
					say_reward("5 dakika oyuncular�n alana giri� yapmas� ")
					say_reward("i�in beklenir. E�er 10 ki�i tamamlanmazsa")
					say_reward("lonca turnuvadan elenir.")
					say("")
						if not pc.is_gm() then
						pc.setqf("turnuvadasin",1)
						end
					lonca_turnuva.guild_tournement_create()
					notice_all(""..guild.name(pc.get_guild())..", Lonca Sava�lar� Turnuvas�'na kat�l�yor!")
					return
					else
					return
					end
				end
			end
		end
		
		function guild_tournement_create()
			if pc.get_empire() == 1 then
			game.mysql_query("INSERT INTO guild_tournement(guild_id,guild_name,guild_master,empire) VALUES ('"..pc.get_guild().."','"..guild.name(pc.get_guild()).."','"..pc.get_name().."','Shinso')")
			elseif pc.get_empire() == 2 then
			game.mysql_query("INSERT INTO guild_tournement(guild_id,guild_name,guild_master,empire) VALUES ('"..pc.get_guild().."','"..guild.name(pc.get_guild()).."','"..pc.get_name().."','Chunjo')")
			elseif pc.get_empire() == 3 then
			game.mysql_query("INSERT INTO guild_tournement(guild_id,guild_name,guild_master,empire) VALUES ('"..pc.get_guild().."','"..guild.name(pc.get_guild()).."','"..pc.get_name().."','Jinno')")
			end
		end
	end
end