--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest ticaret_duyur begin
	state start begin
		when 70019.use begin
		if pc . count_item ( 70019 ) < 1 then 
		say_title ( "Bug Kontrol" ) 
		say ( "Envanterindeki Milyonerin kolyesi kaybolmu�." ) 
		return 
		end
		
		if pc.get_level() < 80 then 
		say("80. seviye olmadan bu e�yay� kullanamazs�n." ) 
		return 
		end
		
	    local kalan = pc.getqf("ticaret_sure") - get_time()
        if kalan > 0 then
        say_title("Milyonerin Kolyesi")
        say("")
        say("30 dakikada 1 bu kolyeyi kullanabilirsin.")
        say("")
        say_reward("Kalan s�re: "..kalan.." saniye.")
        say("")
        else
        say_title("Milyonerin Kolyesi")
        say("")
        say("Ne yapmak istiyorsun?")
        say("")
        local panpa = select("E�ya sataca��m.","E�ya ar�yorum.","Hi�bir �ey")
        if panpa == 1 then
            say_title("Milyonerin Kolyesi")
            say("")
            say("Satmak istedi�in e�yan�n ad�n� yaz.")
            say("")
            local esya = input()
                if esya == "" then
                    say_title("Milyonerin Kolyesi")
                    say("")
                    say("Ne sataca��n� bilmiyor musun?")
                    say("")
                else
                    say_title("Milyonerin Kolyesi")
                    say("")
                    say("Sat�� �eklini se�.")
                    say("")
                    local s = select("Takasla satmak istiyorum.","Yang kar��l��� satmak istiyorum.","Vazge� ")
                        if s == 1 then
                            if pc.get_empire() == 1 then
                                say_title("Milyonerin Kolyesi")
                                say("")
                                say("Duyuru �u �ekilde olacak.")
                                say("")
                                say_reward(""..esya..", takasla sat�lacakt�r.")
                                say_reward("Teklif vermek i�in Shinso �lkesinden")
                                say_reward(""..pc.get_name().." ile g�r���n.")
                            elseif pc.get_empire() == 2 then
                                say_title("Milyonerin Kolyesi")
                                say("")
                                say("Duyuru �u �ekilde olacak.")
                                say("")
                                say_reward(""..esya..", takasla sat�lacakt�r.")
                                say_reward("Teklif vermek i�in Chunjo �lkesinden")
                                say_reward(""..pc.get_name().." ile g�r���n.")
                            elseif pc.get_empire() == 3 then
                                say_title("Milyonerin Kolyesi")
                                say("")
                                say("Duyuru �u �ekilde olacak.")
                                say("")
                                say_reward(""..esya..", takasla sat�lacakt�r.")
                                say_reward("Teklif vermek i�in Jinno �lkesinden")
                                say_reward(""..pc.get_name().." ile g�r���n.")
                            end
                                say("")
                                say("Onayl�yor musun?")
                                say("")
                            local ss = select("Onayl�yorum.","Vazge�tim.")
                                if ss == 1 then
                                    if pc.get_empire() == 1 then
                                        notice_all(""..esya..", takasla sat�lacakt�r. Teklif vermek i�in")
                                        notice_all("Shinso �lkesinden "..pc.get_name().." ile g�r���n.")
                                        pc.remove_item("70019",1)
                                        pc.setqf("ticaret_sure",get_time() + 1800)
                                    elseif pc.get_empire() == 2 then
                                        notice_all(""..esya..", takasla sat�lacakt�r. Teklif vermek i�in")
                                        notice_all("Chunjo �lkesinden "..pc.get_name().." ile g�r���n.")
                                        pc.remove_item("70019",1)
                                        pc.setqf("ticaret_sure",get_time() + 1800)
                                    elseif pc.get_empire() == 3 then
                                        notice_all(""..esya..", takasla sat�lacakt�r. Teklif vermek i�in")
                                        notice_all("Jinno �lkesinden "..pc.get_name().." ile g�r���n.")
                                        pc.remove_item("70019",1)
                                        pc.setqf("ticaret_sure",get_time() + 1800)
                                    end
                                elseif ss == 2 then
                                    return
                                end
                        elseif s == 2 then
                            say_title("Milyonerin Kolyesi")
                            say("")
                            say("E�yan�n fiyat�n� a�a��daki kutuya yaz.")
                            say("")
                            say_reward("�rnek: 500000")
                            say("")
                            local fiyat = tonumber(input(""))
                                if fiyat == "" then
                                    say_title("Milyonerin Kolyesi")
                                    say("")
                                    say("E�ya fiyat�n� yazmad�n. Yoksa bedavaya m� ")
                                    say("vermek istiyorsun?")
                                    say("")
                                elseif fiyat < 9999999999999999 then
                                    say_title("Milyonerin Kolyesi")
                                    say("")
                                    say("Duyuru �u �ekilde olacak.")
                                    say("")
                                    if pc.get_empire() == 1 then
                                        say_reward(""..esya..", sat�l�kt�r. Fiyat�: "..fiyat.." Yang")
                                        say_reward("Sat�n almak i�in Shinso �lkesinden "..pc.get_name().."")
                                        say_reward("ile g�r���n.")
                                    elseif pc.get_empire() == 2 then
                                        say_reward(""..esya..", sat�l�kt�r. Fiyat�: "..fiyat.." Yang")
                                        say_reward("Sat�n almak i�in Chunjo �lkesinden "..pc.get_name().."")
                                        say_reward("ile g�r���n.")
                                    elseif pc.get_empire() == 3 then
                                        say_reward(""..esya..", sat�l�kt�r. Fiyat�: "..fiyat.." Yang")
                                        say_reward("Sat�n almak i�in Jinno �lkesinden "..pc.get_name().."")
                                        say_reward("ile g�r���n.")
                                    end
                                    say("")
                                    say("Onayl�yor musun?")
                                    say("")
                                    local sss = select("Onayl�yorum.","Vazge�tim.")
                                        if sss == 1 then
                                            if pc.get_empire() == 1 then
                                                notice_all(""..esya..", sat�l�kt�r. Fiyat�: "..fiyat.." Yang")
                                                notice_all("Sat�n almak i�in Shinso �lkesinden "..pc.get_name().." ile g�r���n.")
                                                pc.remove_item("70019",1)
                                                pc.setqf("ticaret_sure",get_time() + 1800)
                                            elseif pc.get_empire() == 2 then
                                                notice_all(""..esya..", sat�l�kt�r. Fiyat�: "..fiyat.." Yang")
                                                notice_all("Sat�n almak i�in Chunjo �lkesinden "..pc.get_name().." ile g�r���n.")
                                                pc.remove_item("70019",1)
                                                pc.setqf("ticaret_sure",get_time() + 1800)
                                            elseif pc.get_empire() == 3 then
                                                notice_all(""..esya..", sat�l�kt�r. Fiyat�: "..fiyat.." Yang")
                                                notice_all("Sat�n almak i�in Jinno �lkesinden "..pc.get_name().." ile g�r���n.")
                                                pc.remove_item("70019",1)
                                                pc.setqf("ticaret_sure",get_time() + 1800)
                                            end
                                        elseif sss == 2 then
                                            return
                                        end
                                    end
                                else
                                say_title("Milyonerin Kolyesi")
                                say("")
                                say("Bir hata olu�tu. Fiyat rakamlardan olu�mal�.")
                                say("")
                                end
                            end
                            elseif panpa == 2 then
                            say_title("Milyonerin Kolyesi")
                            say("")
                            say("Arad���n e�yan�n ad�n� yaz.")
                            local esya2 = input()
                            if esya2 == "" then
                            say_title("Milyonerin Kolyesi")
                            say("")
                            say("Ne arada��n� bilmiyor musun?")
                            else
                            say_title("Milyonerin Kolyesi")
                                    say("")
                                    say("Duyuru �u �ekilde olacak.")
                                    say("")
                                    if pc.get_empire() == 1 then
                                        say_reward(""..esya2.." al�nacakt�r. ")
                                        say_reward("Shinso �lkesinden "..pc.get_name().."")
                                        say_reward("ile g�r���n.")
                                    elseif pc.get_empire() == 2 then
                                        say_reward(""..esya.." al�nacakt�r.")
                                        say_reward("Chunjo �lkesinden "..pc.get_name().."")
                                        say_reward("ile g�r���n.")
                                    elseif pc.get_empire() == 3 then
                                        say_reward(""..esya2.." al�nacakt�r.")
                                        say_reward("Jinno �lkesinden "..pc.get_name().."")
                                        say_reward("ile g�r���n.")
                                    end
                                    say("")
                                    say("Onayl�yor musun?")
                                    say("")
                                    local ssss = select("Onayl�yorum.","Vazge�tim.")
                                    if ssss == 1 then
                                    if pc.get_empire() == 1 then
                                        notice_all(""..esya2.." al�nacakt�r. ")
                                        notice_all("Shinso �lkesinden "..pc.get_name().." ile g�r���n.")
                                    elseif pc.get_empire() == 2 then
                                        notice_all(""..esya2.." al�nacakt�r.")
                                        notice_all("Chunjo �lkesinden "..pc.get_name().." ile g�r���n.")
                                    elseif pc.get_empire() == 3 then
                                        notice_all(""..esya2.." al�nacakt�r.")
                                        notice_all("Jinno �lkesinden "..pc.get_name().." ile g�r���n.")
                                    end
                                    pc.remove_item("70019",1)
                                    pc.setqf("ticaret_sure",get_time() + 1800)
                                    elseif ssss == 2 then
                                    return
                                    end
                                    end
                                end
                            end
                        end
                    end
                end  