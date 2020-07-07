--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest zodiac_info begin
	state start begin
		when levelup or letter with pc.level >= 20 begin
			send_letter("Elementer G��ler")
			local v = find_npc_by_vnum(20438)
			
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20438))
			end
		end
		when info or button begin
			say_title("Elementer G��ler:")
			say("[ENTER]Ke�i� Milbon seni ar�yor. Galiba sana �nemli bir �ey[ENTER]anlatacak.")
		end

		when 20438.chat."Elementer G��ler" with pc.level >= 20 begin
			target.delete("__TARGET__")
			say_title("Elementer G��ler:")
				say("")
				say("Ho� geldin! Bu kadar �abuk gelmen iyi oldu")
				say("")
				say("Zodyak tap�na��n�n durumundan haberin var m�?")
				say("Demir ejderin bir zamanlar ate�li nefesinin bir[ENTER]solu�uyla 12 Zodyak bek�isinin onuruna tap�nak[ENTER]tesisini kurdu�u s�yleniyor. Bek�ilerin kutsal[ENTER]salonlar�ndan canl� ��kanlar� �an, ��hret ve paha[ENTER]bi�ilmez hazineler bekliyormu�.")
				say("�lgili bek�ilerin tap�naklar� da yaln�zca belli[ENTER]g�nlerde a��l�yor. L�tfen bunu unutma.")
				wait()
			say_title("Elementer G��ler:")
				say("")
				say("Miin haritan�n �st sol kenar�nda bulunan k���k[ENTER]k�reyi g�r�yor musun? Animasferler burada[ENTER]say�l�r. Bu yo�unla�t�r�lm�� ya�am enerjisi[ENTER]olmadan bek�ilerin kap�lar�ndan ge�emezsin.[ENTER]Duydu�uma g�re Zodyak tap�na�� i�in 12 animasfer[ENTER]gerekiyormu�.")
				say("")
			set_state(state_learning)
		end
	end
	state state_learning begin
		when 20438.chat."Elementer G��ler" begin
			say_title("Elementer G��ler:")
				say("")
				say("Ho� geldin! Bu kadar �abuk gelmen iyi oldu")
				say("")
				say("Zodyak tap�na��n�n durumundan haberin var m�?")
				say("Demir ejderin bir zamanlar ate�li nefesinin bir[ENTER]solu�uyla 12 Zodyak bek�isinin onuruna tap�nak[ENTER]tesisini kurdu�u s�yleniyor. Bek�ilerin kutsal[ENTER]salonlar�ndan canl� ��kanlar� �an, ��hret ve paha[ENTER]bi�ilmez hazineler bekliyormu�.")
				say("�lgili bek�ilerin tap�naklar� da yaln�zca belli[ENTER]g�nlerde a��l�yor. L�tfen bunu unutma.")
				wait()
			say_title("Elementer G��ler:")
				say("")
				say("Miin haritan�n �st sol kenar�nda bulunan k���k[ENTER]k�reyi g�r�yor musun? Animasferler burada[ENTER]say�l�r. Bu yo�unla�t�r�lm�� ya�am enerjisi[ENTER]olmadan bek�ilerin kap�lar�ndan ge�emezsin.[ENTER]Duydu�uma g�re Zodyak tap�na�� i�in 12 animasfer[ENTER]gerekiyormu�.")
				say("")
		end
	end
	state state_1 begin
		when login begin
			set_state(state_learning)
		end
	end
end
