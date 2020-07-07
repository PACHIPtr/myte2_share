--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest gaya begin
    state start begin
        function CreateGaya()
			say("Bana 10 s�s ta��, 5000 Yang ve ")
			say("+0, +1, +2, ya da +3.basamak bir zihin ta�� laz�m, ")
			say("bunlarla k�ymetli bir Gaya �retebilirim. ")
			say("")
			say("Ba�ar� oran�m 30%, ha, maliyeti de 5000 Yang. ")
			say("Devam edeyim mi? ")
			say("")
			
			local s = select("Evet", "Hay�r")
			if s == 1 then
				if pc.get_gold() < 5000 then
					return
				end

				local SELECTED_CELL = select_item_ex()
				if SELECTED_CELL == 6969 then
					return
				end
				
				local old_item = item.get_id()
				if not item.select_cell_ex(SELECTED_CELL) then
					say("Bu e�ya gerekmiyor.")
					say("")
					return
				end

				if item.vnum < 28000 or item.vnum >= 28400 then
					say("Sadece ta� e�yalar� gerekli.")
					say("")
					return
				end

				item.select(old_item)
				
				if pc.create_gaya(5000, 30, SELECTED_CELL, 10) then
					syschat("[Gaya] Kazan�lan Gaya: 1")
					syschat("[Gaya] Bileme ba�ar�l�.")
				else
					syschat("[Gaya] Bileme ba�ar�s�z.")
				end
				
				gaya.CreateGayaWithoutText()
			end
		end
		
        function CreateGayaWithoutText()
			local SELECTED_CELL = select_item_ex()
			if SELECTED_CELL == 6969 then
				return
			end
			
			local old_item = item.get_id()
			if not item.select_cell_ex(SELECTED_CELL) then
				say("Bir e�ya se�melisin.")
				say("")
				return
			end

			if item.vnum < 28000 or item.vnum >= 28400 then
				say("Yanl�� bir e�ya tercih ettin.")
				say("")
				return
			end

			item.select(old_item)
			
			if pc.create_gaya(5000, 30, SELECTED_CELL, 10) then
				syschat("[Gaya] Kazan�lan: 1")
				syschat("[Gaya] Bileme ba�ar�l�.")
			else
				syschat("[Gaya] Bileme ba�ar�s�z.")
			end
			
			gaya.CreateGayaWithoutText()
		end

		-- when 20503.take with item.vnum == 50926 begin
			-- gaya.CreateGaya()
		-- end

        -- when 20503.click begin
			-- local s=select("S�s Ta�� Bile", "Kapat")
			-- if s==1 then
				-- say("S�s ta�lar�n� yontararak Gaya haline getirmek ")
				-- say("istiyor musun? ")
				-- say("L�tfen bana bu kadar s�s ta�� ver: 10 ")
			-- end
        -- end
		
        when 20504.click begin
			local s1=select("Metin Gaya Ma�azas� ", "Kapat")
			if s1==1 then
				say("Gaya ma�azas�n� hi� duydun mu? ")
				say("Hay�r m�? Ah, bir ziyaret etmeye de�er, ��nk� ")
				say("burada son derece kiymetli par�alar alabilirsin. ")
				say("Hatta bazen �ok arzulanan, nadir hazineler de ")
				say("bulunabiliyor. ")
				say("Gaya ma�azas�n� �imdi a�mak istiyor musun? ")
				say("")
				local s2=select("Evet", "Hay�r")
				if s2==1 then
					pc.open_gem_shop(0)
				end
			end
        end
		
        when 20503.click begin
			local s1=select("Boss Gaya Ma�azas� ", "Kapat")
			if s1==1 then
				say("Gaya ma�azas�n� hi� duydun mu? ")
				say("Hay�r m�? Ah, bir ziyaret etmeye de�er, ��nk� ")
				say("burada son derece kiymetli par�alar alabilirsin. ")
				say("Hatta bazen �ok arzulanan, nadir hazineler de ")
				say("bulunabiliyor. ")
				say("Gaya ma�azas�n� �imdi a�mak istiyor musun? ")
				say("")
				local s2=select("Evet", "Hay�r")
				if s2==1 then
					pc.open_gem_shop(1)
				end
			end
        end
		
    end
end
