--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest petskill begin
	state start begin
		when 55028.use begin
			if newpet.count_summoned() < 1 then
				say_title("Pet Revertus")
				say("")
				say_reward("Evcil hayvan�n� �a��rm�� olmal�s�n.")
			else
				say_title("Pet Revertus")
				say("")
				say_reward("Ka��nc� beceriyi s�f�rlamak istiyorsun ?")
				say_reward("0 - 1 - 2")
				local input = tonumber(input(''))
				if input == nil then
					say_title("Pet Revertus")
					say("")
					say_reward("Bo� b�rakamazs�n.")
				elseif input < 0 then
					say_title("Pet Revertus")
					say("")
					say_reward("S�f�rdan d���k bir rakam giremezsin.")
				elseif pc.count_item(55028) < 1 then
					say_title("Pet Revertus")
					say("")
					say_reward("Envanterinde Pet Revertus bulamad�m.")
				else
					local ret = newpet.resetskill(input)
					if ret == true then
						say_title("Pet Revertus")
						say("")
						say_reward("Evcil Hayvan�n�z�n becerisi ba�ar�yla s�f�rland�.")
						say_reward("Evcil hayvan�n�z� g�nderin ve tekrar �a��r�n.")
						pc.remove_item(55028,1)
					else
						say_title("Pet Revertus")
						say("")
						say_reward("Bilinmeyen bir hata olu�tu.")
					end
				end
			end
		end
		when 55029.use begin
			if newpet.count_summoned() < 1 then
				say_title("Pet Revertus")
				say("")
				say_reward("Evcil hayvan�n� �a��rm�� olmal�s�n.")
			else
				say_title("Pet Revertus")
				say("")
				say_reward("Evcil Hayvan�n T�m Becerilerini S�f�rlamak �stiyor musun ?")
				local s = select("Evet","Hay�r")
				if s == 1 then
					if pc.count_item(55029) < 1 then
						say_title("Pet Revertus")
						say("")
						say_reward("Envanterinde Pet Beceri Par�omeni bulamad�m.")
					else
						newpet.resetskill(0)
						newpet.resetskill(1)
						newpet.resetskill(2)
						say_reward("Evcil Hayvan�n�z�n becerileri s�f�rland�.")
						say_reward("Evcil hayvan�n�z� g�nderin ve tekrar �a��r�n.")
						pc.remove_item(55029,1)
					end
				else
				end
			end
		end
	end
end