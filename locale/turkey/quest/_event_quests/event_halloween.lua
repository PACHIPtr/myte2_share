--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest event_halloween begin
	state start begin
		function pumpkin_count()
			return 410000 + 4100*game.get_event_flag("halloween_round")
		end
		
		function set_collected_pumpkin(a,b)
			mysql.query("update log.halloween_event set collected_pumpkin=collected_pumpkin + "..a.." where pid="..b.."")
		end
		
		function set_round_reward()
			mysql.query("update log.halloween_event set round_reward=round_reward + 1 where collected_pumpkin>=100")
		end	
		
		function set_rank_reward()
			mysql.query("update log.halloween_event set rank_reward=rank_reward + 1 ORDER BY collected_pumpkin DESC LIMIT 5")
		end
		
		function delete_round_reward(a)
			mysql.query("update log.halloween_event set round_reward=0 where pid="..a.."")
		end
		
		function delete_rank_reward(a)
			mysql.query("update log.halloween_event set rank_reward=0 where pid="..a.."")
		end
		
		function delete_collected_pumpkin()
			mysql.query("update log.halloween_event set collected_pumpkin=0 where pid>0")
		end
		
		function get_collected_pumpkin(a)
			local x = mysql.query("select collected_pumpkin from log.halloween_event where pid="..a.." ORDER BY collected_pumpkin DESC LIMIT 1")
			if x == nil then
				return 0
			end
			local y = tonumber(x[1][1])
			return y
		end
		
		function get_round_reward(a)
			local x = mysql.query("select round_reward from log.halloween_event where pid="..a.." ORDER BY collected_pumpkin DESC LIMIT 1")
			if x == nil then
				return 0
			end
			local y = tonumber(x[1][1])
			return y
		end
		
		function get_rank_reward(a)
			local x = mysql.query("select rank_reward from log.halloween_event where pid="..a.." ORDER BY collected_pumpkin DESC LIMIT 1")
			if x == nil then
				return 0
			end
			local y = tonumber(x[1][1])
			return y
		end

		when login or enter with game.get_event_flag("ex_halloween_drop") > 0 begin
		local mapIndex = pc.get_map_index()
			if mapIndex == 1 or mapIndex == 21 or mapIndex == 41 then
				if find_npc_by_vnum(20416) == 0 then  
					if mapIndex == 1 then
						mob.spawn(20416, 608, 617, 1, 1, 1)
					elseif mapIndex == 21 then
						mob.spawn(20416, 596, 610, 1, 1, 1)
					elseif mapIndex == 41 then
						mob.spawn(20416, 357, 743, 1, 1, 1)
					end
				end
			end
			if pc.getqf("noticed") == 0 then
				send_letter("Ek�i mi tatl� m�?")
			end
			if pc.getqf("inserted") == 0 then
				mysql.query("insert into log.halloween_event values('"..pc.get_player_id().."', '"..pc.get_name().."', '0', '0', '0')")
				pc.setqf("inserted",1)
			end
		end
		
		when button or info begin
			say_title("Ek�i mi tatl� m�?")
			say("")
			say("Cad�lar Bayram� Etkinli�i ba�lad�.")
			say("Sam pumpkin nerede? Herhalde yine sadece kendi")
			say("g�rd��� hayaletlerin �n�ne saklan�yordur.")
			say("Harika �d�ller kazanabilirsin!")
			say("")
			pc.setqf("noticed",1)
			clear_letter()
		end
		
		when 20416.chat."Ek�i mi tatl� m�?" begin
			say("K... Kim o? Sak�n bir ad�m daha yakla�ma!")
			say("�ok ��k�r! Ben de san�m�t�m ki...")
			say("Dur anlatay�m:")
			say("Hayaletlerden �ok korkar�m! Cad�lar Bayram� ")
			say("gecelerinde dirilip etrafta dola��rlar!")
			say("Ha...hayaletleri kendimden uzak tutmak i�in")
			say("mutlaka bir ka� bal kaba�� fenerine ihtiyac�m var!")
			say("Bana bunlardan getirir misin?")
			say("Ne kadar �ok, o kadar iyi! Bana toplam "..event_halloween.pumpkin_count().." bal")
			say("kaba�� feneri getir. Ama l�tfen acele et!")
			say("(Toplad���n fenerleri Sam Pumpkin �zerine �ek)")
			say("")
			if pc.getqf("inserted") == 0 then
				mysql.query("insert into log.halloween_event values('"..pc.get_player_id().."', '"..pc.get_name().."', '0', '0', '0')")
				pc.setqf("inserted",1)
			end
		end
		
		when 20416.chat."Toplananlar� kontrol et" begin
			say("En az "..event_halloween.pumpkin_count().." bal kaba�� fenerine ihtiyac�m var.")
			say("�imdiye kadar "..game.get_event_flag("collected_pumpkin").." adet toplanm��.")
			say("Hayaletleri sadece fener ����� uzak tutar.")
			say("Beni karanl�kta b�rakmay�n!")
			say("")
			say("�izelge yeri")
			say(pc.get_halloween_rank())
			say("")
			say("Toplanan: "..event_halloween.get_collected_pumpkin(pc.get_player_id()))
			say("")
		end
		
		when 20416.chat."�d�lleri g�r�nt�le" begin
			say("Toplama �d�l� (en az 100 fener):")
			say_item_vnum(71191)
			say("")
			say("�izelge konumu �d�l�:")
			say_item_vnum(71190)
			say("")
		end
		
		when 20416.take with item.get_vnum() == 30336 and game.get_event_flag("ex_halloween_drop") > 0 begin
			local count = item.get_count()
			local remain = game.get_event_flag("collected_pumpkin") + count - event_halloween.pumpkin_count()
			local cur_round = game.get_event_flag("halloween_round") + 1
			if pc.getqf("inserted") == 0 then
				mysql.query("insert into log.halloween_event values('"..pc.get_player_id().."', '"..pc.get_name().."', '0', '0', '0')")
				pc.setqf("inserted",1)
			end
			syschat("Verilen bal kaba�� fenerleri: "..count)
			item.remove()
			if game.get_event_flag("collected_pumpkin") + count >= event_halloween.pumpkin_count() then
				if cur_round == game.get_event_flag("halloween_last_round") then
					notice_all("Yeterince bal kaba�� feneri topland�.")
					notice_all("Bir �d�l hak edip etmedi�ini Sam Pumpkin'e sor.")
					game.set_event_flag("ex_halloween_drop",0)
					game.set_event_flag("ex_halloween_drop_2",0)
					game.set_event_flag("halloween_reward",get_time()+12*60*60)
					game.set_event_flag("halloween_round",0)
				end
				game.set_event_flag("collected_pumpkin",remain)
				event_halloween.set_rank_reward()
				event_halloween.set_round_reward()
				event_halloween.delete_collected_pumpkin()
				event_halloween.set_collected_pumpkin(remain,pc.get_player_id())
				syschat("Toplam bal kaba�� feneri say�s�: "..event_halloween.get_collected_pumpkin(pc.get_player_id()))
				return
			end
			event_halloween.set_collected_pumpkin(count,pc.get_player_id())
			game.set_event_flag("collected_pumpkin",game.get_event_flag("collected_pumpkin") + count)
			syschat("Toplam bal kaba�� feneri say�s�: "..event_halloween.get_collected_pumpkin(pc.get_player_id()))
		end
		
		when 20416.chat."�d�l�n� teslim al" begin
			if pc.getqf("inserted") == 0 then
				mysql.query("insert into log.halloween_event values('"..pc.get_player_id().."', '"..pc.get_name().."', '0', '0', '0')")
				pc.setqf("inserted",1)
			end
			
			if event_halloween.get_round_reward(pc.get_player_id()) == 0 and event_halloween.get_rank_reward(pc.get_player_id()) == 0 then
				say("Hey! Ne? Beni s�rekli korkutmay� KES art�k! Zaten")
				say("yeterince korkuyorum. Beni koruyacak olan")
				say("fenerler nerede? Bunlardan bana yeteri kadar")
				say("getirirsen seni c�mert�e �d�llendiririm.")
				return
			end
			
			if event_halloween.get_round_reward(pc.get_player_id()) > 0 then
				say("Vay can�na! "..event_halloween.get_round_reward(pc.get_player_id()).." adet �ekerleme po�eti kazand�n!")
				say("")
				say_item_vnum(71191)
			say("�d�l�n� �imdi almak ister misin?")
				say("")
				if select("Evet","Hay�r") == 1 then
					pc.give_item2("71191",event_halloween.get_round_reward(pc.get_player_id()))
					event_halloween.delete_round_reward(pc.get_player_id())
					if game.get_event_flag("halloween_reward") == 0 then
						return
					end
				else
					if game.get_event_flag("halloween_reward") == 0 then
						return
					end
				end
			end
			
			if event_halloween.get_rank_reward(pc.get_player_id()) > 0 then
				if game.get_event_flag("halloween_reward") - get_time() < 0 then
					say("Hey! Ne? Beni s�rekli korkutmay� KES art�k! Zaten")
					say("yeterince korkuyorum. Beni koruyacak olan")
					say("fenerler nerede? Bunlardan bana yeteri kadar")
					say("getirirsen seni c�mert�e �d�llendiririm.")
					return
				end
				say("Oooo! �izelge konumun i�in "..event_halloween.get_rank_reward(pc.get_player_id()).." bal kaba�� kutusu")
				say("kazand�n!")
				say("")
				say_item_vnum(71190)
				say("�d�l�n� �imdi almak ister misin?")
				say("")
				if select("Evet","Hay�r") == 1 then
					pc.give_item2("71190",event_halloween.get_rank_reward(pc.get_player_id()))
					event_halloween.delete_rank_reward(pc.get_player_id())
				end
			end
		end
		
		when login or enter with game.get_event_flag("ex_halloween_drop") == 0 begin
			if pc.getqf("inserted") == 1 then
				pc.setqf("inserted",0)
			end
			if pc.getqf("noticed") == 1 then
				pc.setqf("noticed",0)
			end
		end
	end
end	