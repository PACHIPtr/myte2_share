--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest aura begin
	state start begin
		-- when 20406.chat."Bir omuz ku�a�� nedir?" begin
			-- say("Omuz ku�a�� sana iki imkan sa�lar:")
			-- say("Kombinasyon ve emi�.")
			-- say("")
			-- say("Kombinasyon ayn� derecedeki iki ku�akla")
			-- say("ger�ekle�tirilebilir. Kombine edilen iki ku�ak")
			-- say("daha de�erli bir ku�ak meydana getirir.")
			-- say("")
			-- say("Emi� i�leminde bir silah veya z�rh �zerinde")
			-- say("bulunan bonuslar")
			-- say("�e�itli oranlarla omuz ku�a��na aktar�l�r.")
			-- say("")
			-- say("Emi� oran� (%) ku�a��n derecesine ba�l�d�r. Bonus")
			-- say("i�lemi i�in se�ilen silah ve z�rh geri")
			-- say("d�nd�r�lemez �ekilde yok edilir.")
		-- end
		
		when 20406.chat."Aura Giysisi: Y�kseltme" with utils.is_feature_aura_enabled() == true begin
			say("Aura giysisini geli�tirmek istiyor musun?")
			say("")
			local confirm = select("Evet", "Hay�r")
			if confirm == 2 then
				return
			end
			
			setskin(NOWINDOW)
			pc.open_aura(true)
		end
		
		when 20406.chat."Aura Giysisi: De�erleri Aktar" with utils.is_feature_aura_enabled() == true begin
			say("Aura giysine bileklik,kolye,k�pe ve kalkan")
			say("degerlerini aktarmak istiyor musun?")
			say("")
			local confirm = select("Evet", "Hay�r")
			if confirm == 2 then
				return
			end
			
			setskin(NOWINDOW)
			pc.open_aura(false)
		end
	end
end