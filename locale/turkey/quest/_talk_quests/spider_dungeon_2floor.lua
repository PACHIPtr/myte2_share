--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest spider_dungeon_2floor begin
	state start begin
		when login or levelup with pc.level >0 begin
			set_state(to_spider_2floor)
		end
	end
		
	state to_spider_2floor begin
		when 20089.chat." Birinci kata d�n " begin
			say_title("Pung-Ho: ")
			say("Birinci kata ger�ekten d�nmek istiyor musun?")
			
			local a= select("Evet ", "Hay�r ")
			if 1==a then
			
				say_title("Pung-Ho: ")
				say("Ak�ll�ca bir se�im.[ENTER]Burada uzun s�re kalmak �ok tehlikeli.[ENTER]Git ve yaralar�n� sar. ")
				wait()

				pc.warp(91700, 525300)
				return
			end

			say_title("Pung-Ho: ")
			say("Nas�l dilersen...[ENTER]Dikkat et![ENTER]Buras� �ok tehlikeli.")
		end
	end
end