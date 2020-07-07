--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest assassin_shop_box begin
	state start begin
	
		function give_costume_item(costume_vnum, duration)
			
			-- provide the new costume
			local remain_time = 86400*duration
			pc.give_item2_select(costume_vnum,1)
			item.set_socket(0, get_global_time()+remain_time)
		end

		
		when 38054.use begin
			local n = number (1,1000)
			if n <= 120 then
				pc.give_item2(71012,1)
			elseif n <= 240 then
				pc.give_item2(71130,3)
			elseif n <= 360 then
				pc.give_item2(71083,1)
			elseif n <= 480 then
				pc.give_item2(71004,10)
			elseif n <= 600 then
				pc.give_item2(71018,2)
			elseif n <= 675 then
				pc.give_item2(25040,1)
			elseif n <= 680 then
				pc.give_item2(25041,1)
			elseif n <= 690 then
				pc.give_item2(71085,1)
			elseif n <= 700 then
				pc.give_item2(70039,1)
			elseif n <= 740 then
				pc.give_item2(71032,1)
			elseif n <= 780 then
				pc.give_item2(70024,1)
			elseif n <= 840 then
        assassin_shop_box.give_costume_item(41030, 14)
			elseif n <= 900 then
        assassin_shop_box.give_costume_item(41029, 14)
			elseif n <= 950 then
        assassin_shop_box.give_costume_item(41030, 30)
			else 
				assassin_shop_box.give_costume_item(41029, 30)
			end
			
			pc.remove_item(38054,1)
		end

	end
end

