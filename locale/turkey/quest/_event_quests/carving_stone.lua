--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest carving_stone begin
	state start begin
		function is_start()
			local value = game.get_event_flag("ex_carving_stone_drop")
			return value
		end
		
		when 30129.chat."Oyma Ta��	" with carving_stone.is_start() == 1 begin
		say_title("Tav�an:")
		say("")
		say("�d�ller!")
		say("�ok g�zel �d�ller!.")
		say("")
		local panpa = select("Evet, istiyorum.","Maalesef.")
			if panpa == 1 then
			say_title("Tav�an:")
			say("")
			say("Demek ne oldu�unu biliyorsun?! Bu ")
			say("�d�llerin e�i benzeri yok!.")
			say("")
			wait()
			say_title("Tav�an:")
			say("")
			say("175 Adet Oyma Ta�� kar��l���nda sana �d�llerini verebilirim.")
			say("Anla�t�k m�?")
			say("")
			local panpa2 = select("Seve seve.","U�ra�amam.")
			if panpa2 == 1 then
			if pc.countitem(30178) >= 175 then
			say_title("Tav�an:")
			say("")
			say("Ahh harikas�n 175 adet Oyma Ta�� buldun demek.")
			say("��te sana �d�llerini veriyorum,.")
			say("Hay�rl� Ramazanlar!.")
			say("")
			pc.remove_item("30178",175)
			pc.give_item2("39002",1)
			pc.give_item2("39002",1)
			pc.give_item2("39002",1)
			pc.give_item2("39002",1)
			pc.give_item2("39002",1)
			pc.give_item2("50513",10)
			pc.give_item2("30199",5)
			pc.give_item2("81600",5)				
			else
			say_title("Tav�an:")
			say("")
			say("Her 175 Oyma Ta�� kar��l���nda sana �d�l verece�im.. ")
			say("verece�im.")
			say("")
			end
			elseif panpa2 == 2 then
			say_title("Tav�an:")
			say("")
			say("T�h. Neyse, tekrar g�r��mek �zere.")
			say("")
			end
			elseif panpa == 2 then
			say_title("Tav�an:")
			say("")
			say("T�h. Neyse, tekrar g�r��mek �zere.")
			say("")
			end
			end
		when 30129.chat."Tav�an mi?" with carving_stone.is_start() == 1 begin
			say_title("Tav�an:")
			say("")
			say("")
			say("Ge�mi�i olmayan�n gelece�i olmaz! Sana nas�l")
			say("yard�mc� olabilirim?")
			say("")
			wait()
			say_title(""..pc.get_name()..":")
			say("")
			say("Pardon, tan���yor muyuz?")
			say("")
			wait()
			say_title("Tav�an:")
			say("")
			say("Afedersin, kendimi tan�tmay� unutmu�um. Bir")
			say("Tav�an olarak g�steri�li bir insan�m.")
			say("RoyaL, beni sizlere hizmet etmem i�in,")
			say("g�nderdi.")
			say("")
			wait()
			say_title(""..pc.get_name()..":")
			say("")
			say("Seninle tan��t���ma �ok memnun oldum. Ramazanda")
			say("ziyaretine gelirim.")
		end
	end
end