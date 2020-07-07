--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest kids_day_quiz begin
    state start begin
        when 20041.chat."GM: Bilgi Yar��mas� Drop De�i�tir " with pc.is_gm() begin
            local low_value=game.get_event_flag("kids_day_drop")
            local high_value=game.get_event_flag("kids_day_drop_high")
            say_title("Bulmaca Kutusu D��me Y�zdesi:")
            say(string.format("D���k seviyeler i�in y�zde : 1/%d ", low_value))
            say(string.format("Y�ksek seviyeler i�in y�zde  : 1/%d ", high_value))
            local s=select("D���k Seviyeler ��in Drop Ayarla ", "Y�ksek Seviyeler ��in Drop Ayarla ", "Vazge� ")
            if s==1 then
                say_title("D���k seviyeler i�in y�zde de�i�ikli�i :")
                say(string.format("D���k seviyede yap�lacak de�i�iklik 1/%d -> ", low_value))
                local v=tonumber(input())
                if v<300 then
                    say("300'�n alt�nda de�er yazamazs�n!")
                end

                say(string.format("D���k seviyede yap�lacak de�i�iklik 1/%d -> 1/%d ", low_value, v))
                local s=select("De�i�tir ", "Vazge� ")
                if s==1 then
                    say("De�i�tirildi!")
                    game.set_event_flag("kids_day_drop", v)
                else
                    say("�ptal Edildi.")
                end
            elseif s==2 then
                say_title("Y�ksek seviyeler i�in y�zde de�i�ikli�i :")
                say(string.format("D���k seviyede yap�lacak de�i�iklik 1/%d -> ", high_value))
                local v=tonumber(input())
                if v<300 then
                    say("300'�n alt�nda de�er yazamazs�n!")
                end

                say(string.format("D���k seviyede yap�lacak de�i�iklik 1/%d -> 1/%d ", high_value, v))
                local s=select("De�i�tir ", "Vazge� ")
                if s==1 then
                    say("De�i�tirildi!")
                    game.set_event_flag("kids_day_drop_high", v)
                else
                    say("�ptal Edildi.")
                end
            end
        end
        when 50034.use begin
            say_title("Bilgi Yar��mas�! ")
            say("")
            ----"123456789012345678901234567890123456789012345678901234567890"|
            say("Bilgi yar��mas�na ho� geldin! E�er 3 soruyu ")
            say("do�ru cevaplarsan �d�l kazanacaks�n. ")
            say("")
            say("Haz�r m�s�n? ")
            say("")
            local s=select("Hadi Ba�layal�m! ", "Vazge�tim. ")
            if 2==s then
                return
            end

            --pc.remove_item(50034, 1)
            item.remove()

            local size=3
            local chance=pc.getqf("chance")

            -- Chance!
            if 0==chance then
                pc.setqf("chance", number(3, 5))
            elseif pc.getqf("success_count")==chance then
                pc.setqf("success_count", 0)
                pc.setqf("chance", number(3, 5))
                size=5
            end

            say_title("Bilgi Yar��mas�! ")

		say("")
		----"123456789012345678901234567890123456789012345678901234567890"|
		say(""..size.." soruyu do�ru cevaplarsan ")
		say("�d�l kazanacaks�n. ")

            wait()

            for i=1, size+1 do

                local quiz_index=number(1, table.getn(locale.quiz))
                local quiz_data=locale.quiz[quiz_index]

                say_title("Bilgi Yar��mas� #"..i.." ")
                say("")
                say(quiz_data[1])
                say("")
                local s=select(quiz_data[2], quiz_data[3], quiz_data[4], quiz_data[5])
                if s==quiz_data[6] then
                    if i==size then
                        say_title("Bilgi Yar��mas�! ")
                        say("")
                        say("T�m sorular� do�ru cevaplad�n, ")
                        say("i�te �d�l�n! ")
                        say("")

                        pc.setqf("success_count", pc.getqf("success_count")+1)

                        if 5==size then
                            say_item_vnum(50036)
                            say_reward("Mor hediye sand��� kazand�n. ")
                            pc.give_item2(50036)
                        else
                            say_item_vnum(50035)
                            say_reward("Sar� hediye sand��� kazand�n. ")
                            pc.give_item2(50035)
                        end
                        say("")
                        return
                    else
                        say_title("Bilgi Yar��mas�! ")
                        say("")
                        say_reward("Do�ru! ")
                        say("")
                        say("Bir sonraki soruya ge�iliyor. ")
                        say("")
                        wait()
                    end
                else
                    say_title("Bilgi Yar��mas�! ")
                    say("")
                    say("Yanl�� cevap! ")
                    say("")
                    say("�zg�n�m, daha sonra tekrar dene! ")
                    say("") 
                    return
                end
            end

        end
    end
end
