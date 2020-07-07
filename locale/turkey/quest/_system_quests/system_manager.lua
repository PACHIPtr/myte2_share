--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest system_manager begin
	state start begin
		when letter with pc.is_gm() == true begin
			if pc.is_gm() == true then
				send_letter("*GM: Sistem Y�netimi")
			end
		end
		when button or info with pc.is_gm() == true begin
			say_size(350,400)
			if pc.is_gm() == false then
				say_title("Sistem Y�netimi:")
				say("")
				say("Y�netici olmad���n�z i�in bunu")
				say("kullanamazs�n�z.")
			else
				say_title("Sistem Y�netimi:")
				say("")
				say_reward("Hangi sistemi kapatmak istiyorsun?")
				local sistemler = select("Lycan Karakteri ", "Evrim Sistemi ", "Ticaret Cam� ", "Beceri Se�me ", "Sa� Se�me ", "Won Paras� ", "Omuz Ku�aklar� ", "Yans�tma Penceresi ", "Kombinasyon Penceresi ", "Ek Envanter ", "Gaya Ma�azas� ", "Kanal De�i�tirme ", "Aura Penceresi ", "Evcil Hayvan ", "Kost�m Set Bonus ", "Depo Bankas� ", "De�erli Paket ", "Patron Takip ", "Ep Kuponlar� ", "Posta Kutusu ", "Beceri Kapatma ", "Toplu Sand�k ", "Won/Yang Transfer", "Lonca S�ralamas� ", "Ortalama Fiyat ", "Tezgah Yang/Won ", "Vazge� ")
				if sistemler == 1 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_wolfman_test_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(1)
						syschat("Lycan karakteri aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(1)
						syschat("Lycan karakteri devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 2 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_weapon_rarity_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(2)
						syschat("Evrim sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(2)
						syschat("Evrim sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 3 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_privateshop_search_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(3)
						syschat("Ticaret cam� aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(3)
						syschat("Ticaret cam� devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 4 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_skill_select_ex_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(4)
						syschat("Beceri se�me sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(4)
						syschat("Beceri se�me sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 5 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_hair_select_ex_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(5)
						syschat("Sa� se�me sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(5)
						syschat("Sa� se�me sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 6 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_cheque_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(7)
						syschat("Won paras� sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(7)
						syschat("Won paras� sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 7 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_acce_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(8)
						syschat("Omuz ku�a�� sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(8)
						syschat("Omuz ku�a�� sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 8 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_changelook_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(9)
						syschat("Yans�tma penceresi sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(9)
						syschat("Yans�tma penceresi sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 9 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_combination_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(10)
						syschat("Kombinasyon penceresi sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(10)
						syschat("Kombinasyon penceresi sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 10 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_special_inventory_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(11)
						syschat("Ek envanter sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(11)
						syschat("Ek envanter sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 11 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_gem_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(12)
						syschat("Gaya ma�azas� sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(12)
						syschat("Gaya ma�azas� sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 12 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_channel_change_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(13)
						syschat("Kanal de�i�tirme sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(13)
						syschat("Kanal de�i�tirme sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 13 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_aura_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(14)
						syschat("Aura penceresi sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(14)
						syschat("Aura penceresi sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 14 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_pet_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(15)
						syschat("Pet sistemi aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(15)
						syschat("Pet sistemi devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 15 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_costume_set_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(16)
						syschat("Kost�m set bonusu aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(16)
						syschat("Kost�m set bonusu devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 16 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_safebox_money_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(17)
						syschat("Depo bankas� aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(17)
						syschat("Depo bankas� devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 17 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_value_pack_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(18)
						syschat("De�erli paketler aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(18)
						syschat("De�erli paketler devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 18 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_boss_tracking_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(19)
						syschat("Patron takip aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(19)
						syschat("Patron takip devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 19 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_dc_coupon_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(20)
						syschat("Ep kuponlar� aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(20)
						syschat("Ep kuponlar� devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 20 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_mail_box_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(21)
						syschat("Posta Kutusu aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(21)
						syschat("Posta Kutusu devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 21 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_remove_skill_affect_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(22)
						syschat("Beceri kapatma aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(22)
						syschat("Beceri kapatma devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 22 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_open_gift_box_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(23)
						syschat("Toplu Sand�k aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(23)
						syschat("Toplu Sand�k devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 23 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_transfer_money_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(24)
						syschat("Won aktarma aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(24)
						syschat("Won aktarma devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 24 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_guild_rank_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(25)
						syschat("Lonca s�ralamas� aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(25)
						syschat("Lonca s�ralamas� devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 25 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_average_price_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(26)
						syschat("Ortalama Fiyat aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(26)
						syschat("Ortalama Fiyat devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				elseif sistemler == 26 then
					say_title("Sistem Y�netimi: ")
					say("")
					if utils.is_feature_average_price_enabled() == true then
						say_reward("Sistem �uanda aktif.")
					else
						say_reward("Sistem �uanda deaktif.")
					end
					say_reward("Sistemi a�mak/kapatmak istiyor musun?")
					local sec = select("Sistemi A� ","Sistemi Kapat ", "Vazge� ")
					if sec == 1 then
						set_feature_enable(27)
						syschat("Tezgah Won aktif edilmi�tir.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					elseif sec == 2 then
						set_feature_disable(27)
						syschat("Tezgah Won devre d��� b�rak�lm��t�r.")
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					else
						send_letter("*GM: Sistem Y�netimi")
						setskin(NOWINDOW)
					end
				else
					send_letter("*GM: Sistem Y�netimi")
					setskin(NOWINDOW)
				end
			end
		end
	end
end