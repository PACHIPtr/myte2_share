--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest rarity_refine begin
	state start begin
		when 20008.chat."Eritme ��lemi " begin
			say_title("Octavio: ")
			say("")
			say("Silah�na bonuslar kazan�p e�siz �ekilde ")
			say("parlatmak istiyorsun demek...")
			say("heh arad���n ki�iye geldin. silah�na ")
			say("belli elementler kar��l���nda bonus kazand�rabilirim.")
			say("")
			say_reward("Pencereyi a�mak istiyor musun?")
			local result = select("Evet, istiyorum.","Hay�r, istemiyorum.")
			if result == 1 then
				pc.open_rarity_refine()
				setskin(NOWINDOW)
			else
				setskin(NOWINDOW)
			end
		end
	end
end