--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest istiridye begin
	state start begin
		when 27987.use begin
			if pc.is_busy() == true then
				syschat("Me�gul durumda oldu�un i�in bu i�lemi ger�ekle�tiremezsin.")
				return
			elseif pc.is_dead() == true then
				syschat("�l� durumda oldu�un i�in bu i�lemi ger�ekle�tiremezsin.")
				return
			end
			if pc.get_empty_inventory_count() >= 1 then
				pc.remove_item("27987",1)
				local cikacaklar = {
				[1] = {0,0}, -- Bo�
				[2] = {0,0}, -- Bo�
				[3] = {0,0}, -- Bo�
				[4] = {0,0}, -- Bo�
				[5] = {0,0}, -- Bo�
				[6] = {0,0}, -- Bo�
				[7] = {0,0}, -- Bo�
				[8] = {0,0}, -- Bo�
				[9] = {0,0}, -- Bo�
				[10] = {1,0}, -- Bo�
				[11] = {0,0}, -- Bo�
				[12] = {0,0}, -- Bo�
				[13] = {0,0}, -- Bo�
				[14] = {0,0}, -- Bo�
				[15] = {1,27990}, -- Ta�
				[16] = {1,27990}, -- Ta�
				[17] = {1,27990}, -- Ta�
				[18] = {1,27990}, -- Ta�
				[19] = {1,27990}, -- Ta�
				[20] = {1,27990}, -- Ta�
				[21] = {1,27990}, -- Ta�
				[21] = {1,27990}, -- Ta�
				[22] = {1,27992}, -- Beyaz �nci
				[23] = {1,27993}, -- Mavi �nci
				[24] = {1,27994}, -- K�rm�z� �nci
				}
				local sans = number(1, table.getn(cikacaklar))
				if sans >= 1 and sans <= 14 then
					syschat("�stiridye kayboldu. ")
				elseif sans >= 15 and sans <= 21 then
					pc.give_item2("27990",1)
					syschat("�stiridyenin i�inde s�radan bir ta� par�as� var. ")
				elseif sans == 22 then
					pc.give_item2("27992",1)
					syschat("�stiridyenin i�inde Beyaz �nci var. ")
				elseif sans == 23 then
					pc.give_item2("27993",1)
					syschat("�stiridyenin i�inde Mavi �nci var. ")
				elseif sans == 24 then
					pc.give_item2("27994",1)
					syschat("�stiridyenin i�inde K�rm�z� �nci var. ")
				end
			else
				syschat("Envanterde yeteri kadar yerin yok!")
			end
		end
	end
end