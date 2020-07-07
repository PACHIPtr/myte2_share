--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest goldbar begin
	state start begin
		function check_item(vnum)
			if pc.count_item(vnum) < 1 then return false end
			return true
		end
		function check_pc()
			if pc.is_busy() == true then return false end
			return true
		end
		function check_gold(value)
			if pc.get_gold() + value >= 2000000000 then return false end
			return true
		end
		when 80003.use or 80004.use or 80005.use or 80006.use or 80007.use begin
			if goldbar.check_item(item.get_vnum()) == false then
				syschat("Envanterinde yeterli miktarda k�l�e bulamad�m.")
			elseif goldbar.check_pc() == false then
				syschat("�u anda me�gul g�r�n�yorsun.")
			elseif item.get_value(0) < 0 then
				syschat("Bilinmeyen bir hata olu�tu l�tfen y�neticiye bildirin.")
			elseif goldbar.check_gold(item.get_value(0)) == false then
				syschat("Envanterinde �ok fazla Yang ta��yorsun.")
			else
				pc.give_gold(item.get_value(0))
				if item.get_count() > 1 then
					item.set_count(item.get_count()-1)
				else
					item.remove()
				end
			end
		end
	end
end