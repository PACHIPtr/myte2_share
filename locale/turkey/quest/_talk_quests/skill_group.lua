--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest skill_group begin
        state start begin
                when login or levelup with pc.level>=5 and pc.skillgroup ==0 begin
                        set_state(run)
                end
        end
		
        state run begin
                -- Arahan Troop
                when
						skill_group1_1.chat."Bedensel Sava� e�itimine ba�la" or
                        skill_group2_1.chat."Bedensel Sava� e�itimine ba�la" or
                        skill_group3_1.chat."Bedensel Sava� e�itimine ba�la" with pc.skillgroup == 0 begin
                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 0 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r dilerim.")
                                say("Sadece Sava���lar Bedensel Sava�� se�ebilir.")
                                say("")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yakin D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir �aman, Ejderha G�c� e�itimini")
                                        say_reward("veya �yile�tirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------
                        say_title("Bedensel Sava� e�itimi")
                        ---                                                   l
                        say("Bedensel sava� e�itimi h�zl� sava�ma e�itimi ve")
                        say("metodlar�n�, ayr�ca geli�mi� temel sald�r� ")
                        say("tiplerini i�erir.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")


                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=0 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(1) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek.")
                        ----------------------------------------------

                        say_title("Bedensel sava� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")
						
                        if not pc.is_clear_skill_group() then
                                ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (1,0)
                                                                pc.set_skill_level (2,0)
                                                                pc.set_skill_level (3,0)
                                                                pc.set_skill_level (4,0)
                                                                pc.set_skill_level (5,0)
								pc.set_skill_level (6,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end

                -- Byulki Troop
                when
                        skill_group1_2.chat."Zihinsel-Sava� e�itimine ba�la" or
                        skill_group2_2.chat."Zihinsel-Sava� e�itimine ba�la" or
                        skill_group3_2.chat."Zihinsel-Sava� e�itimine ba�la" with pc.skillgroup == 0 
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 0 then
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece Sava���lar Zihinsel Sava�� ")
                                say("se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava��� , Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman ,Ejderha G�c� e�itimini")
                                        say_reward("veya iyilestirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------

                        say_title("Zihinsel Sava� e�itimi")
                        say("")
                        ---                                                   l
                        say("Zihinsel sava� e�itimi sana d��manlar�na nas�l")
                        say("g��l� chi-sald�r�lar� yapabilece�ini ve kendini")
                        say("d��man sald�r�lar�ndan koruyabilece�ini ��retir.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=0 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(2)
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek")
                        ----------------------------------------------


                        say_title("Zihinsel sava� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (17,0)
                                pc.set_skill_level (18,0)
                                pc.set_skill_level (19,0)
                                pc.set_skill_level (20,0)
                                pc.set_skill_level (16,0)
								pc.set_skill_level (21,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end


                -- Bisal Troop
                when
                        skill_group1_3.chat."Yakin D�v�� e�itimine ba�la" or
                        skill_group2_3.chat."Yakin D�v�� e�itimine ba�la" or
                        skill_group3_3.chat."Yakin D�v�� e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 1 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece Ninjalar Yak�n D�v�� e�itimini se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja ,Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman, Ejderha G�c� e�itimini")
                                        say_reward("veya iyilestirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------
                        say_title("Yak�n D�v�� e�itimi")
                        say("")
                        ---                                                   l
                        say("Yakin D�v�� e�itiminde ,Ninjalara d��manlar�n�n ")
                        say("zay�f noktalar�na , nas�l h�zl� ve �l�mc�l")
                        say("vuru�lar yapabilecekleri ��retilir.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha Sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=1 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(1) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek")
                        ----------------------------------------------

                        say_title("Yak�n D�v�� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (31,0)
                                pc.set_skill_level (32,0)
                                pc.set_skill_level (33,0)
                                pc.set_skill_level (34,0)
                                pc.set_skill_level (35,0)
								pc.set_skill_level (36,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
								pc.set_skill_level (140,20)
                        else
                                say_reward("Yeni bir ders se�ti�inde,")
                                say_reward("daha fazla tecr�be puan� almayacaks�n.")
                                say("")
                        end
                        clear_letter()
                end


                -- Kangno Troop
                when
                        skill_group1_4.chat."Yak�n D�v�� e�itimine ba�la" or
                        skill_group2_4.chat."Yak�n D�v�� e�itimine ba�la" or
                        skill_group3_4.chat."Yak�n D�v�� e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 1 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece Ninjalar Uzak D�v�� e�itimini se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman ,Ejderha G�c� e�itimini")
                                        say_reward("veya �yile�tirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------

                        say_title("Uzak D�v�� e�itimi")
                        say("")
                        ---                                                   l
                        say("Uzak D�v�� e�itiminde ,Ninjalara nas�l ok")
                        say("kullanmalar� gerekti�i ve uzak mesafeden")
                        say("d��manlar�yla dikkatli sava�malar� ��retilir.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=1 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(2) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek")
                        ----------------------------------------------

                        say_title("Uzak D�v�� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (49,0)
                                pc.set_skill_level (50,0)
                                pc.set_skill_level (48,0)
                                pc.set_skill_level (47,0)
                                pc.set_skill_level (46,0)
								pc.set_skill_level (51,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
								pc.set_skill_level (140,20)
                        else
                                say_reward("Yeni bir ders se�ti�inde,")
                                say_reward("daha fazla tecr�be puan� almayacaks�n.")
                                say("")
                        end
                        clear_letter()
                end


                -- Hwanmoo Troop
                when
                        skill_group1_5.chat."B�y�l� Silah e�itimine ba�la" or
                        skill_group2_5.chat."B�y�l� Silah e�itimine ba�la" or
                        skill_group3_5.chat."B�y�l� Silah e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 2 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece Suralar B�y�l� Silah e�itimini")
                                say("se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman, Ejderha G�c� e�itimini")
                                        say_reward("veya �yile�tirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------

                        say_title("B�y�l� Silah e�itimi")
                        say("")
                        ---                                                   l
                        say("B�y� Silah e�itiminde ,zay�flat�lm�� d��manlara")
                        say("kar�� ,lanetli b��aklar� kullanarak g��l� ")
                        say("darbe vurma y�ntemleri ��retilir.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=2 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(1) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek")
                        ----------------------------------------------


                        say_title("B�y�l� Silah e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (61,0)
                                pc.set_skill_level (62,0)
                                pc.set_skill_level (63,0)
                                pc.set_skill_level (64,0)
                                pc.set_skill_level (65,0)
								pc.set_skill_level (66,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end


                -- Black Horse Troop
                when
                        skill_group1_6.chat."Kara B�y� e�itimine ba�la" or
                        skill_group2_6.chat."Kara B�y� e�itimine ba�la" or
                        skill_group3_6.chat."Kara B�y� e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 2 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece Suralar Kara B�y� e�itimini")
                                say("se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman, Ejderha G�c� e�itimini")
                                        say_reward("veya �yile�tirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------

                        say_title("Kara B�y� e�itimi")
                        say("")
                        ---                                                   l
                        say("Kara B�y� e�itiminde, uzak mesafeden ")
                        say("d�smanlarini zayif d�s�ren  lanet y�ntemleri")
                        say("�gretilir.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=2 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(2) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek.")
                        ----------------------------------------------

                        say_title("Kara B�y� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (76,0)
                                pc.set_skill_level (77,0)
                                pc.set_skill_level (78,0)
                                pc.set_skill_level (79,0)
                                pc.set_skill_level (80,0)
								pc.set_skill_level (81,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end


                -- Heavenly Dragon Troop
                when
                        skill_group1_7.chat."Ejderha G�c� e�itimine ba�la" or
                        skill_group2_7.chat."Ejderha G�c� e�itimine ba�la" or
                        skill_group3_7.chat."Ejderha G�c� e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 3 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece samanlar Ejderha G�c� e�itimini")
                                say("se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���, Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yakin D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman, Ejderha G�c� e�itimini")
                                        say_reward("veya iyilestirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end
                        ----------------------------------------------

                        say_title("Ejderha G�c� e�itimi")
                        say("")
                        ---                                                   l
                        say("Ejderha G�c� e�itiminde, Ejderha Tanr�n�n ")
                        say("g��l� ate� sald�r�lar�n� y�netmeyi ve ")
                        say("dayan�kl�l�k b�y�leriyle Ejderha Tanr�n�n ")
                        say("korumas�n� kullanmayi �grenirler.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=3 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(1) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek.")
                        ----------------------------------------------

                        say_title("Ejderha G�c� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (91,0)
                                pc.set_skill_level (92,0)
                                pc.set_skill_level (93,0)
                                pc.set_skill_level (94,0)
                                pc.set_skill_level (95,0)
								pc.set_skill_level (96,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end


                -- Thunder Light Troop
                when
                        skill_group1_8.chat."�yile�tirme e�itimine ba�la" or
                        skill_group2_8.chat."�yile�tirme e�itimine ba�la" or
                        skill_group3_8.chat."�yile�tirme e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 3 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece �amanlar �yile�tirme E�itimi")
                                say("se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman ,Ejderha G�c� e�itimini")
                                        say_reward("veya �yile�tirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end

                        ----------------------------------------------

                        say_title("�yile�tirme e�itimi")
                        say("")
                        ---                                                   l
                        say("�yile�tirme e�itiminde, d��manlar�n� ")
                        say("uyu�turmay�, ve kendi grup �yelerini")
                        say("iyile�tirerek g��lendirmeyi ��renirler.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=3 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(2) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek.")
                        ----------------------------------------------

                        say_title("�yile�tirme e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (106,0)
                                pc.set_skill_level (107,0)
                                pc.set_skill_level (108,0)
                                pc.set_skill_level (109,0)
                                pc.set_skill_level (110,0)
								pc.set_skill_level (111,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end
				
                when
                        20402.chat."�� g�d� e�itimine ba�la" with pc.skillgroup == 0
                        begin

                        ----------------------------------------------
                        local pc_job=pc.get_job()
                        if pc_job != 4 then -- !!!
                                ---                                                   l
                                say_title("Yanl�� E�itim ")
                                say("")
                                say("�z�r Dilerim.")
                                say("Sadece Lycanlar �� g�d� E�itimi")
                                say("se�ebilir.")
                                say("")

                                if pc_job==0 then
                                        ---                                                   l
                                        say_reward("Bir Sava���,  Zihinsel Sava�� ")
                                        say_reward("veya Bedensel Sava�� ")
                                        say_reward("se�ebilir.")
                                elseif pc_job==1 then
                                        say_reward("Bir Ninja, Yak�n D�v�� veya")
                                        say_reward("Uzak D�v�� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==2 then
                                        say_reward("Bir Sura, B�y�l� Silah")
                                        say_reward("veya Kara B�y� e�itimini")
                                        say_reward("se�ebilir.")
                                elseif pc_job==3 then
                                        say_reward("Bir saman ,Ejderha G�c� e�itimini")
                                        say_reward("veya �yile�tirme e�itimini")
                                        say_reward("se�ebilir.")
								elseif pc_job==4 then
										say_reward("Bir Lycan, sadece �� g�d� e�itimini")
										say_reward("se�ebilir.")
                                end
                                say("")
                                return
                        end

                        ----------------------------------------------

                        say_title("��g�d� e�itimi")
                        say("")
                        ---                                                   l
                        say("��g�d� ��retiminde size ola�an�st� [ENTER]d���� sanat�n� �gretecegim.")
                        say_reward("Gereksinim: Seviye 5 ve �st� bir sava��� olmak")
                        say("")

                        ----------------------------------------------
                        local s=select("Ba�la", "Daha sonra")

                        if 2 == s then
                                return
                        end

                        if pc.get_job()!=4 or pc.get_skill_group()!=0 then
                                test_chat("npc_is_same_job:"..bool_to_str(npc_is_same_job()))
                                test_chat("pc.get_skill_group:"..pc.get_skill_group())
                                test_chat("pc_job:"..pc.get_job())
                                return
                        end

                        set_state("start")
                        pc.set_skill_group(1) -- !!!
                        pc.clear_skill()
                        char_log(0, "CLEAR_SKILL", "�gretmen silindikten sonraki dogal yetenek.")
                        ----------------------------------------------

                        say_title("�� g�d� e�itimini se�tin.")
                        ---                                                   l
                        say("Ho�geldin!")

                        if not pc.is_clear_skill_group() then
                                           ---                                                   l
								local beceripuan = pc.get_level()
								local beceripuanhesapla = beceripuan-1
                                say("Ders almay� se�ti�in i�in "..beceripuanhesapla.." yetenek puan� ")
                                say("kazand�n. Bu puanlar� diledi�in herhangi bir")
                                say("yetene�ini geli�tirmek i�in kullabilirsin.")
                                say_title("Bilgi:")
                                say_reward(""..beceripuanhesapla.." yetenek puan� kazand�n.")
                                say("")
								pc.set_skill_level (170,0)
                                pc.set_skill_level (171,0)
                                pc.set_skill_level (172,0)
                                pc.set_skill_level (173,0)
                                pc.set_skill_level (174,0)
								pc.set_skill_level (175,0)
								pc.set_skill_level (121,20)
								pc.set_skill_level (137,20)
								pc.set_skill_level (138,20)
								pc.set_skill_level (139,20)
                        else
                                say_reward("Yeni bir ders se�tiginde,")
                                say_reward("daha fazla tecr�be puani almayacaksin.")
                                say("")
                        end
                        clear_letter()
                end
        end -- end_of_state: run
end -- end_of_quest
