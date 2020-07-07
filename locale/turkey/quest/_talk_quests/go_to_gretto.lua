--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest go_to_gretto begin
	state start begin
		when login or levelup with pc.level >0 begin
			set_state(zone_enter)
		end
	end
		
	state zone_enter begin
		when 20093.chat."Giri� izni iste" begin
            if pc.level < 75 then
                        say_title("Koe-Pung:")
                        say("")
                        ---                                                   l
                        say("75. seviyenin alt�nda oldugun i�in")
                        say("seni buz zindan�na ���nlayamam..")
                        return
                end
                        say_title("Koe-Pung:")
			say("Dur! Ben Ejderha Mezhebinden Koe-Pung,")
			say("bu kap�n�n bek�isiyim. Sadece e�er bana")
			say("Kan Ta��n� g�sterirsen ve mezhebin")
			say("iznini al�rsan ge�ebilirsin!")
			wait()
			if pc.count_item(30190)>0 then
				say_title(""..pc.name.."")
				say("Ad�m "..pc.name.." ve Ejderha Mezhebinin iradesi")
				say("alt�nda buraday�m! Bunu kan�tlamak i�in ")
				say("kutsal Kan Ta��m var. �imdi geri �ekil!")
				say("")
				say("")
				pc.remove_item(30190)
		wait()
			say_title(""..mob_name(20093).."")
			say("Ejderha Tanr� seni se�ti.")	
			say("O her zaman seni izliyor olmal�!")	
			wait()
			pc.warp(10000, 1213200)				
			else
                        say_title("Koe-Pung:")
				say("Kan Ta��na sahip olursan")
				say("tekrar gel.")
				return
			end		
		end

	end

end

