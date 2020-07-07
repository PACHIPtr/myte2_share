--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest miningevent begin
	state start begin
		function buildRanking()
			if get_time() < pc.getqf("mining_event_time") then
				say_title("  "..mob_name(20015))
				say("")
				say("Madencilik s�ralamas�n� 5 dakikada bir a�abilirsin.")
				say("")
				return
			else
				say_title("  "..mob_name(20015))
				say("")
				say("Madencilik s�ralamas�: ")
				pc.setqf("mining_event_time", get_time()+60*5)
				local res1, rankingPositions = mysql.query("SELECT * FROM log.mining_event ORDER BY total_points DESC LIMIT 10;")

				for saye = 1, 10 do
					if rankingPositions[saye].name != 0 then
						say(""..saye..".\t"..rankingPositions[saye].name.." - "..rankingPositions[saye].total_points.." Puan.")
					else
						say("" ..saye..".\tBo�.")
					end
				end
				say("")
				say("")
			end
		end
		
		when 20015.chat."Madencilik Etkinli�i" with game.get_event_flag("mining_event") == 1 begin
			say_title("   "..mob_name(20015))
			say("")
			say("Oh, sonunda buradas�n. Bende seni ar�yordum.")
			say("Geleneksel madencilik etkinlikleri ba�lad�!")
			say("maden kazarak puan toplayabilecek ve")
			say("etkinlik sonunda ejderha paras� kazanabileceksin.")
			say("")
			say_reward("350 Puan kar��l���: 5 Ejderha Paras� ")
			say_reward("700 Puan kar��l���: 10 Ejderha Paras� ")
			say_reward("1000 Puan kar��l���: 15 Ejderha Paras� ")
			say_reward("Toplanan madencilik puan�: "..pc.getqf("currentMiningPoint").." Puan")
		end
		when 20015.chat."Madencilik S�ralamas� " with game.get_event_flag("mining_event") == 1 begin
			miningevent.buildRanking()
		end
		when 20015.chat."Madencilik �d�lleri " with game.get_event_flag("mining_event") == 2 begin
			say_title("   "..mob_name(20015))
			say("")
			say("Ho�geldin. Ne kadar puan toplad�ysan")
			say("o kadar fazla ejderha paras� alacaks�n.")
			say_reward("Toplanan madencilik puan�: "..pc.getqf("currentMiningPoint").." Puan")
			say_reward("Devam etmek istiyor musun?")
			local miningSelect = select("Elbette!","Daha sonra.")
			if miningSelect == 1 then
				local miningSelectCash = select("350 Puan - 5 EP ", "700 Puan - 10 EP ", "1000 Puan - 15 EP ", "Vazge� ")
				local miningPoints = pc.getqf("currentMiningPoint")
				if miningSelectCash == 1 then
					if miningPoints < 350 then
						say_title("   "..mob_name(20015))
						say("")
						say("Yeterli miktarda madencilik puan�na sahip de�ilsin.")
					elseif pc.is_busy() == true then
						say_title("   "..mob_name(20015))
						say("")
						say("Me�gul durumda iken bu i�lemi ger�ekle�tiremezsin.")
					elseif pc.is_dead() == true then
						say_title("   "..mob_name(20015))
						say("")
						say("�l� durumda iken bu i�lemi ger�ekle�tiremezsin.")
					else
						local result = pc.charge_cash(5, "cash")
						if result == true then
							say_title("   "..mob_name(20015))
							say("")
							say("Etkinlik �d�l� olarak 5 ejderha paras� kazand�n.")
							pc.setqf("currentMiningPoint", pc.getqf("currentMiningPoint")-350)
						end
					end
				elseif miningSelectCash == 2 then
					if miningPoints < 700 then
						say_title("   "..mob_name(20015))
						say("")
						say("Yeterli miktarda madencilik puan�na sahip de�ilsin.")
					elseif pc.is_busy() == true then
						say_title("   "..mob_name(20015))
						say("")
						say("Me�gul durumda iken bu i�lemi ger�ekle�tiremezsin.")
					elseif pc.is_dead() == true then
						say_title("   "..mob_name(20015))
						say("")
						say("�l� durumda iken bu i�lemi ger�ekle�tiremezsin.")
					else
						local result = pc.charge_cash(10, "cash")
						if result == true then
							say_title("   "..mob_name(20015))
							say("")
							say("Etkinlik �d�l� olarak 10 ejderha paras� kazand�n.")
							pc.setqf("currentMiningPoint", pc.getqf("currentMiningPoint")-700)
						end
					end
				elseif miningSelectCash == 3 then
					if miningPoints < 1000 then
						say_title("   "..mob_name(20015))
						say("")
						say("Yeterli miktarda madencilik puan�na sahip de�ilsin.")
					elseif pc.is_busy() == true then
						say_title("   "..mob_name(20015))
						say("")
						say("Me�gul durumda iken bu i�lemi ger�ekle�tiremezsin.")
					elseif pc.is_dead() == true then
						say_title("   "..mob_name(20015))
						say("")
						say("�l� durumda iken bu i�lemi ger�ekle�tiremezsin.")
					else
						local result = pc.charge_cash(15, "cash")
						if result == true then
							say_title("   "..mob_name(20015))
							say("")
							say("Etkinlik �d�l� olarak 15 ejderha paras� kazand�n.")
							pc.setqf("currentMiningPoint", pc.getqf("currentMiningPoint")-1000)
						end
					end
				else
				end
			else
			end
		end
	end
end