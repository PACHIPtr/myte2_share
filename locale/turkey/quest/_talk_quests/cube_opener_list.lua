--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest cube_opener_list begin
	state start begin
		when 20383.chat."Ar�nd�rma Penceresini A� " or 20016.chat."Zihin Ta�� Penceresi A� " or 30129.chat."Event Penceresini A� " or 20421.chat."Kask Penceresini A� " or 20406.chat."Ku�ak Penceresini A� " or 20413.chat."Geli�tirme Penceresini A� " begin
			say("Senin i�in bir�eyleri y�kseltebilirim...")
			say("E�yay� s�r�kle ve yeni bir e�ya olu�tur.")
			command("cube open")
		end
		when 20091.chat."G��l� Silah �retimi " begin
			setskin(NOWINDOW)
			command("cube open")
		end
		when 20092.chat."Ekipman �retimi " begin
			setskin(NOWINDOW)
			command("cube open")
		end
	end
end