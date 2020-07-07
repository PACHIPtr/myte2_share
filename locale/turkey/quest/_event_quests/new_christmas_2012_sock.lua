--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest new_christmas_2012_sock begin
	state start begin
	end
	state baby_dear_give begin
		when 20126.chat."�orap ile ne? " begin
			say_title(mob_name(20126))
			say ("�orap! Neredeyse unutuyordum![ENTER]�oraplar�m� her zaman Noel A�ac�'n�n[ENTER]�zerine as�yordum. Ama yarat�klar hepsini �ald�lar![ENTER][ENTER]Onlar� geri al, l�tfen. ")
			wait()
			say_title(mob_name(20126))
			say ("Sana Ren Geyi�i Yavrusu veriyorum.")
			wait()
			say_title(mob_name(20126))
			say ("�ok tatl� de�il mi?[ENTER]Ve m�kemmel bir koku alma duyusu vard�r. Bir �orap uzman� bulun![ENTER]Sizinle 2 saat boyunca kal�r ve aray��� i�inde size yard�mc� olur. ")
			wait()
			say_title(mob_name(20126))
			pc.give_item2_select (53002, 1)
			item.set_socket (0, get_global_time() + 21600)
			pc.setqf ("last_reindeer_give_time", get_global_time())
			set_state(sock_take)
		end
	end
	state sock_take begin
		when 20126.chat."Gen� Ren Geyi�i " begin
			if get_global_time() - pc.getqf ("last_reindeer_give_time") < 86400 then
				say_title (mob_name (20126))
                say ("Bug�n zaten bir Ren Geyi�i ald�n.[ENTER]Yar�na kadar beklemelisin.[ENTER]E�er beklemek istemiyorsan,[ENTER]a�a��daki d�nen paraya t�klay�p alabilirsin. ")
			else
				say_title (mob_name (20126))
                say ("�ok tatl� de�il mi?[ENTER]Ve m�kemmel bir koku alma duyusu vard�r. Bir �orap uzman� buldun![ENTER]Sizinle 2 saat boyunca kal�r ve aray��� i�inde size yard�mc� olur. ")
				pc.give_item2_select (53002, 1)
				item.set_socket (0, get_global_time() + 21600)
				pc.setqf ("last_reindeer_give_time", get_global_time())
			end
		end
		
		when 20126.chat."reset flags / reindeer, socks" with is_test_server() begin
			pc.setqf ("last_reindeer_give_time", 0)
			pc.setqf("last_sock_cooldown_time", 0) 
		end
		
		when 20126.chat."Bana �orap getir! " begin
			local n = pc.count_item(50010)
			if n < 25 then
				say_title(mob_name(20126))
				say ("Bana en az 5 �orap getir.[ENTER]Kar��l���nda bir �d�l verece�im.[ENTER]Urgh, y�pranm�� �orap kokusu dayan�lmaz![ENTER]Mutlu noeller! ")
				wait()
			else
				say_title(mob_name(20126))
				say ("Ha ha ha yeterince birikmi� �orap var.[ENTER]Sonra bakay�m.[ENTER]Urrgh, bu koku ... Bu kesinlikle do�ru �orap![ENTER]Mutlu noeller! ")
				wait()
				pc.remove_item (50010, 5)
				say_title(locale.reward)
				
				pc.give_item2(71144)
				say_reward (string.format("%s : 1%s",item_name(71144), locale.count_postfix))
			end
		end
	end
end
