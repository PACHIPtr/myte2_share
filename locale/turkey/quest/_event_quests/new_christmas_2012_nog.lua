--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest new_christmas_2012_nog begin
	state start begin
	end
	state nog_first_give begin
		when 20126.chat."Bir s�cak �arap ister misiniz? "  begin
			say_title(mob_name(20126))
			say ("�yi bir �arap, bir tutam[ENTER]tar��n, birka� karanfil ... Mmmmmh al! ")
			wait()
			say_title(mob_name(20126))
			say ("Bu so�ukta bir yudum s�cak �arap, sana iyi gelecektir![ENTER]Sana g�� verir ve daha h�zl� hareket edersin.[ENTER]Denemek ister misin?[ENTER]�ok g�zel, �imdi geliyor! ")
			wait()
			pc.give_item2 (50216, 6)
			pc.setqf ("last_nog_give_time", get_global_time())
			say_title(mob_name(20126))
			say ("S�cak �arap sizin i�in iyi bir[ENTER]tat gibi g�r�n�yor, ha ha![ENTER]Sizi i�inizden nas�l �s�tt���n�[ENTER]hissedebiliyor musunuz? Tad� �ok iyi ve meyveli.[ENTER]Mutlu noeller! ")
			set_state(nog_give)
		end
	end
	state nog_give begin
		when 20126.chat."Biraz daha �arap, l�tfen! " begin
			say_title(mob_name(20126))
			say ("Ah, bekle![ENTER]Unuttu�um k���k bir �ey var![ENTER]S�cak �arab� g�nde sadece bir[ENTER]kere verebilirim. ��nk� s�cak �arap[ENTER]20 saat boyunca etki eder. ")
			wait()
			if get_global_time() - pc.getqf ("last_nog_give_time") >= 21600 then
				say_title(mob_name(20126))
				say ("L�tfen! Uzun bir s�re beklemelisin.[ENTER]Bu harika i�ki sizi kanatland�racak![ENTER]Ha ha ha. Mutlu noeller! ")
				pc.setqf ("last_nog_give_time", get_global_time())
				pc.give_item2 (50216, 6)
			else
				say_title(mob_name(20126))
				say ("Ne, daha m� istiyorsun?[ENTER]�zg�n�m, yeterince �arap i�tin.[ENTER]24 saat sonra yeniden i�ebilirsin.[ENTER]Fazlas� sizin i�in yararl� olmaz. ")
			end
		end
	end
end

