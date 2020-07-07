--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest item_comb begin
	state start begin
		when 20406.chat."Kost�m bonuslar�n� aktar" with utils.is_feature_combination_enabled() == true begin
			say("Bonuslar�n� se�ti�in kost�m 2'den kost�m 1'e")
			say("aktarabilirsin. �nce 'kost�m bonusu aktar�m�' ")
			say("e�yas�n� i�ine �ekerek pencereyi etkinle�tir.")
			say("sonra kost�mleri se�ebilirsin.")
			say("Bonusun kost�m 2'den kost�m 1'e aktar�lmas� i�lemi")
			say("S�ras�nda Kost�m 2 yok edilir. Devam et?")
			say("")
			local confirm = select("Evet.", "Hay�r")
			if confirm == 2 then
				return
			end
			setskin(NOWINDOW)
			command("item_comb open_costume")
		end

		when 20095.chat."Kitaplar� nas�l takas ederim? " with utils.is_feature_combination_enabled() == true begin
			say('Ho� geldin! ')
			say('Bende kitap m� takas edeceksin? Harika! Beceri ve ')
			say('Ustal�k kitaplar�n� her zaman al�r�m. Bana ')
			say('bunlardan 10 tane getirirsen sana s�n�f�na uygun ')
			say('bir beceri kitab� veririm. Adil bir pazarl�k, ')
			say('de�il mi? Ha, neredeyse s�ylemeyi unutuyordum, bu ')
			say('Takas i�in 1.000.000 Yang isterim. ')
			say()
		end

		when 20095.chat."Kitap takas et " with utils.is_feature_combination_enabled() == true begin
            setskin(NOWINDOW)
			command("item_comb open_skillbook")
		end
	end
end
