--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest alignment_box begin
	state start begin
		when 81500.use begin
			if item.get_socket(1) > 0 then
				if pc.is_busy() == true then
					syschat("Me�gul durumdayken bu i�lemi ger�ekle�tiremezsin.")
				elseif pc.is_dead() == true then
					syschat("�l� durumdayken bu i�lemi ger�ekle�tiremezsin.")
				elseif pc.get_alignment() + item.get_socket(1) > 1000000 then
					syschat(string.format("%s'den fazla Derece ta��yamazs�n.", 1000000))
				elseif pc.count_item(81500) < 1 then
					syschat("Envanterinde Derece kutusu bulamad�m.")
				else
					pc.change_alignment(item.get_socket(1))
					if item.get_count() > 1 then
						item.set_count(item.get_count()-1)
					else
						item.remove()
					end
				end
			else
				say_title("Derece Kutusu: ")
				say("")
				say_reward("Ne kadar Derece Yat�rmak istiyorsun ?")
				local sinput = tonumber(input())
				if sinput == nil then
					say_title("Derece Kutusu: ")
					say("")
					say_reward("Bo� b�rakamazs�n.")
				elseif pc.get_alignment() < sinput then
					say_title("Derece Kutusu: ")
					say("")
					say_reward("Yeterli miktarda Dereceye sahip de�ilsin.")
				elseif sinput > 1000000 then
					say_title("Derece Kutusu: ")
					say("")
					say_reward(string.format("%s'den fazla Dereceye yat�ramazs�n.", 1000000))
				elseif sinput < 0 then
					say_title("Derece Kutusu: ")
					say("")
					say_reward("0'dan az derece yat�ramazs�n.")
				elseif pc.is_busy() == true then
					say_title("Derece Kutusu: ")
					say("")
					say_reward("Me�gulken bu i�lemi ger�ekle�tiremezsin.")
				elseif pc.is_dead() == true then
					say_title("Derece Kutusu: ")
					say("")
					say_reward("�l� durumdayken bu i�lemi ger�ekle�tiremezsin.")
				else
					if pc.count_item(81500) < 1 then
						say_title("Derece Kutusu: ")
						say("")
						say_reward("Envanterinde Derece Kutusu bulamad�m.")
					else
						pc.change_alignment(-sinput)
						item.set_socket(1, sinput)
						syschat(string.format("Ba�ar�l� bir �ekilde kutuya %s Derece aktard�n.",sinput))
					end
				end
			end
		end
	end
end