--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest cheque begin
	state start begin
		when warehouse_keeper.chat."D�viz B�rosu" with utils.is_feature_cheque_enabled() == true begin
			say_title("Depocu:")
			say("")
			say("Ho�geldin !")
			say("Art�k daha fazla yang ta��yabileceksin.")
			say("Won para birimi ile bu m�mk�n!")
			say("1 Won paras�n�n de�eri 1.000.000.000 yang etmekte!")
			say("")
			say_reward("Won almak/satmak istiyor musun?")
			say("")
			local s = select("Won sat�n al","Won sat","Hen�z de�il.")
			if s == 1 then
				if pc.is_busy() == true then
					say_title("Depocu:")
					say("")
					say_reward("Me�gul durumdayken bunu ger�ekle�tiremezsin...")
				elseif pc.is_dead() == true then
					say_title("Depocu:")
					say("")
					say_reward("�l� durumdayken bunu ger�ekle�tiremezsin...")
				else
					if pc.get_cheque() + 1 > 999 then
						say_title("Depocu:")
						say("")
						say_reward("Envanterinde �ok fazla Won ta��yorsun.")
					elseif pc.get_money() < 100000000 then
						say_title("Depocu:")
						say("")
						say_reward("Envanterinde yeterli miktarda Yang mevcut de�il.")
					else
						pc.change_money(-100000000)
						pc.change_cheque(1)
					end
				end
			elseif s == 2 then
				if pc.is_busy() == true then
					say_title("Depocu:")
					say("")
					say_reward("Me�gul durumdayken bunu ger�ekle�tiremezsin...")
				elseif pc.is_dead() == true then
					say_title("Depocu:")
					say("")
					say_reward("�l� durumdayken bunu ger�ekle�tiremezsin...")
				else
					if pc.get_money() + 100000000 > 2000000000 then
						say_title("Depocu:")
						say("")
						say_reward("Envanterinde �ok fazla Yang ta��yorsun.")
					elseif pc.get_cheque() < 1 then
						say_title("Depocu:")
						say("")
						say_reward("Envanterinde yeterli miktarda Won mevcut de�il.")
					else
						pc.change_cheque(-1)
						pc.change_money(100000000)
					end
				end
			else
				say_title("Depocu: ")
				say("")
				say("E�er fikrini de�i�tirir isen")
				say("senin i�in burada olaca��m...")
			end
		end
	end
end