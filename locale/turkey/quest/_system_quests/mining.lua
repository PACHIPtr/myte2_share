--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest mining begin
        state start begin
                when 20015.chat."Market" begin
                        setskin(NOWINDOW)
                        npc.open_shop()
                end

                when 20015.take with item.vnum >= 29101 and item.vnum < 29200 and item.get_socket(0) < item.get_value(2) begin
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Deokbae:")
                        say("")
                        ---                                                   l
                        say("Kazman� hen�z y�kseltemem. S�k� �al��mal�s�n!")
                        say("")
                end
                when 20015.take with item.vnum >= 29101 and item.vnum < 29200 and item.get_socket(0) >= item.get_value(2) begin
                        say_title("Deokbae:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Kazman� geli�tirmek istiyor musun?")
                        say("Pekala ...")
                        say("")
                        say("Kazman ".. item.get_level().. " seviye.")
                        say("")

                        if item.get_value(3) == 100 then
                        say_title("Deokbae:")
                        	say("")
                                say("Geli�tirmek istiyor musun?")
                                say("")
                        else
                                ---                                                   l
                                say(" " .. (100-item.get_value(3)).."% �ans�n var. ") 
                                say("Ba�ar�s�z olma ihtimalide var.")
                                say("")
                                say("Geli�tirmek istiyor musun?")
                                say("")
                        end

                        local s = select("Evet ","Hay�r ")
                        if s == 2 then
                        	say_title("Deokbae:")
                        	say("")
                                say("Denemek istedi�inde tekrar gel.")
                                say("")
                                return
                        end

                        local f = __refine_pick(item.get_cell())
                        if f == 2 then
                        	say_title("Deokbae:")
                        	say("")
                                ---                                                   l
                                say("Bir sorun var daha sonra ")
                                say("tekrar gel.")
                                say("")

                        elseif f == 1 then
                        say_title("Deokbae:")
                        	say("")
                                say("Kazman yeni seviyeye ula�t�!")
                                say("")
                        else
                        say_title("Deokbae:")
                        say("")
                                ---                                                   l
                                say("�zg�n�m!")
                                say("Ba�aramad�m, kazman� yakt�m.")
                                say("")
                        end
                end

                when 20047.click or
                        20048.click or
                        20049.click or
                        20050.click or
                        20051.click or
                        20052.click or
                        20053.click or
                        20054.click or
                        20055.click or
                        20056.click or
                        20057.click or
                        20058.click or
						30301.click or
						30302.click or
						30303.click or
						30304.click or
						30305.click or
                        20059.click begin

                        if pc.is_mount() != true then
                        	if game.get_event_flag("labor_day") > 0 then
                                	char_log(0, "MINING", "Log for Labor Day")
                                end
                                pc.mining()
                        end
                end
        end
end
