--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest new_christmas_2012_gift_box begin
	state start begin
		function gift ()
--			local pct_table = {4, 8, 12, 16, 21, 26, 31, 40, 50, 61, 73, 86, 100}
--			local gift_table = {25100, 71084, 71085, 71109, 25040, 71101, 71107, 50513, 0, 0, 0, 0, 0}
--			local gift_cont = {1,1,1,1,1,5,1,1,100000,50000,30000,20000,10000}
			local n = number (1,100)
			if n <= 4 then
				pc.give_item2(71520,1)
			elseif n <= 8 then
				pc.give_item2(71521,1)
			elseif n <= 12 then
				pc.give_item2(71522,1)
			elseif n <= 16 then
				pc.give_item2(70005,1)
			elseif n <= 21 then
				pc.give_item2(56001,1)
			elseif n <= 26 then
				pc.give_item2(80060,1)
			elseif n <= 31 then
				pc.give_item2(30327,1)
			elseif n <= 40 then
				pc.give_item2(30329,1)
			elseif n <= 50 then
				pc.changegold (20000000)
			elseif n <= 61 then
				pc.changegold (15000000)
			elseif n <= 73 then
				pc.changegold (10000000)
			elseif n <= 86 then
				pc.changegold (5000000)
			else
				pc.changegold (3000000)
			end

		end

		when 71144.use begin
			new_christmas_2012_gift_box.gift()
			item.remove()
		end
	end
end
