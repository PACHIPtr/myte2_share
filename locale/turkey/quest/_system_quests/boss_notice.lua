--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest boss_notice begin
	state start begin
		when 1192.kill begin
			notice_all(string.format("CH%s: %s, G��l� Buz Cad�s�'n� �ld�rd�!", pc.get_channel_id(), pc.get_name()))
			notice_all(string.format("Bilgi: G��l� Buz Cad�s� 1 saatte bir S�rg�n Ma�aras� 1. Kat'ta ��kar."))
		end
		when 2206.kill begin
			notice_all(string.format("CH%s: %s, Alev Kral�'n� �ld�rd�!", pc.get_channel_id(), pc.get_name()))
			notice_all(string.format("Bilgi: Alev Kral 15 dakikada bir Doyyumhwan'da ��kar."))
		end
		when 2306.kill begin
			notice_all(string.format("CH%s: %s, Dev Hayalet A�ac'� �ld�rd�!", pc.get_channel_id(), pc.get_name()))
			notice_all(string.format("Bilgi: Dev Hayalet A�a� 1 saatte bir K�z�l Orman'da ��kar."))
		end
	end
end