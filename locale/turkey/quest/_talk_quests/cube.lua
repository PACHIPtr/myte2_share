--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest cube begin
    state start begin
        when 20018.chat."�ifal� Bitkiler Bilimi" begin
			say_title("Baek-Go:")
			say("")
			--
			say("Merhaba, nas�ls�n?")
			say("Seni g�clendirecek yada iyile�tirecek")
			say("iksirler yaratmakla ilgileniyormusun?")
			say("Bir �ifac� olarak kendimi")
			say("iksirlere adad�m.")
			say("Bir�ok tarif buldum.")
			say("Onlar� denemek istermisin?")
			say("")
			wait()
			setskin(NOWINDOW)
			command("cube open")

		end


        when 20017.chat."�ifal� Bitkiler Bilimi" begin
            say_title("Yu-Hwan:")
			say("")
			---
            say("Bitki bilimi heryerde biliniyor. �lgilenir")
			say("misin? Sana baz� re�eteler g�sterebilirim.")
            say("Bunlarla �ok daha iyi iksirler yaratabilirsin.")
            wait()
            setskin(NOWINDOW)
            command("cube open")

        end


        when 20022.chat."Gizli tarif" begin
            say_title("Huahn-So:")
			say("")
			--
            say("Gizli bir aile tarifi buldum.")
            say("Bununla neredeyse zarar verilemez olacaks�n!")
            say("Hahaha")
            say("San�r�m �lkede bunu bilen tek ki�i")
			say("benim. Bu iksirlerle neredeyse sana hi� ")
            say("bir�ey olmaz.")
            say("�ksirleri denemek istermisin?")
            say("")
            wait()
            setskin(NOWINDOW)
            command("cube open")

        end
		
		when 20383.take or 20421.take or 20470.take or 60003.take or 20015.take or 20016.take or 20091.take begin
			setskin(NOWINDOW)
			command("cube open")
		end
		
	end
end
