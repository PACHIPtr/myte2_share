--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest gold_football begin
	state start begin
		when 20017.chat."Alt�n Futbol Topu" with pc.getqf("first_seen") == 0 begin
			say_title("Yu-Hwan")
			say("")
			say("20 Adet Futbol Topu kar��l��� sana 1 adet")
			say("Alt�n Futbol Topu verece�im.")
			say("Alt�n Futbol Topu i�erisinden seni g��lendirecek")
			say("iksirler ve inciler elde edebileceksin.")
			say_reward("Alt�n Futbol Topu istiyorsan burada olaca��m.")
			pc.setqf("first_seen",1)
		end
		when 20017.chat."Alt�n Futbol Topu D�n��t�r" with pc.getqf("first_seen") == 1 begin
			say_title("Yu-Hwan")
			say("")
			say_reward("Devam etmek istiyor musun?")
			local s = select("Evet, istiyorum.","Hay�r, istemiyorum.")
			if s == 2 then
				return
			else
				if pc.is_busy() == true then
					say_title("Yu-Hwan")
					say("")
					say_reward("�zg�n�mki me�gul g�r�n�yorsun.")
				elseif pc.is_dead() == true then
					say_title("Yu-Hwan")
					say("")
					say_reward("�l� bir adamdan futbol topu alamam herhalde.")
				elseif pc.count_item(50096) < 20 then
					say_title("Yu-Hwan")
					say("")
					say_reward("Envanterinde yeterli miktarda bulamad�m.")
				else
					pc.remove_item(50096, 20)
					pc.give_item2(50265, 1)
				end
			end
		end
	end
end