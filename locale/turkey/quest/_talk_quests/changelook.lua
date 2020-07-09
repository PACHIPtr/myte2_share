--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest changelook begin
	state start begin
		when 20406.chat."Yans�tma " with utils.is_feature_changelook_enabled() == true begin
			say_title(mob_name(20406))
			say("")
			say("Yans�tma sistemi ekipmanlar�n�z�n g�r�n���n� ")
			say("kal�c� olarak de�i�tirmeye yarar. Yans�tt���n�z ekipman")
			say("ekipman�n�z�n seviyesinden y�ksek olsa bile,")
			say("g�r���n� de�i�tirir.")
			say("Devam etmek istiyor musun?")
			say("")
			local confirm = select("Evet", "Hay�r")
			if confirm == 2 then
				return
			end
			
			setskin(NOWINDOW)
			pc.open_changelook(false)
		end
		
		when 20406.chat."Binek d�n���m� " with utils.is_feature_changelook_enabled() == true begin
			setskin(NOWINDOW)
			pc.open_changelook(true)
		end
	end
end