local Map = game.GetMap():lower() or ""
if Map:find("gm_redline") then
    Metrostroi.PlatformMap = "gm_redline"
    Metrostroi.CurrentMap = "gm_redline"
else
    return
end


local AnnouncerRecords = {
    -- Шлак
    announcer_ready = {"subway_announcers/announcer_ready.mp3", 11.56},
    spec_attention_last = {"subway_announcers/program2/last.mp3", 5,12},
    spec_attention_train_depart = {"subway_announcers/program2/techstop.mp3", 4.02},
    spec_attention_train_stop = {"subway_announcers/program2/techstop.mp3", 4.024},
    click1 = {"subway_announcers/click2.mp3", 0.522},
    click2 = {"subway_announcers/click2.mp3", 0.444},

    --  Обережно двері зачиняються та станції
    
    dveri = {"subway_announcers/sbl2021/dveri.mp3", 4.12},
    arr_arsenalna = {"subway_announcers/sbl2021/arr_arsenalna.mp3", 14.50},
    next_arsenalna = {"subway_announcers/sbl2021/next_arsenalna.mp3", 5.30},
    arr_dnipro = {"subway_announcers/sbl2021/arr_dnipro.mp3", 5.50},
    next_dnipro = {"subway_announcers/sbl2021/next_dnipro.mp3", 9.00},
    arr_gidropark = {"subway_announcers/sbl2021/arr_gidropark.mp3", 4.00},
    next_gidropark = {"subway_announcers/sbl2021/next_gidropark.mp3", 4.50},
    arr_livoberezhna = {"subway_announcers/sbl2021/arr_livoberezhna.mp3", 9.00},
    next_livoberezhna = {"subway_announcers/sbl2021/next_livoberezhna.mp3", 11.01},
    arr_darnytsia = {"subway_announcers/sbl2021/arr_darnytsia.mp3", 4.03},
    next_darnytsia = {"subway_announcers/sbl2021/next_darnytsia.mp3", 8.02},
    arr_chernihivska = {"subway_announcers/sbl2021/arr_chernihivska.mp3", 6.04},
    next_chernihivska = {"subway_announcers/sbl2021/next_chernihivska.mp3", 5.00},
    arr_lisova = {"subway_announcers/sbl2021/arr_lisova.mp3", 13.03},
    next_lisova = {"subway_announcers/sbl2021/next_lisova.mp3", 5.02},
    -- До дарниці
    to_darnytsia = {"subway_announcers/to_station/to_darnytsia.mp3", 3.12},
    -- Напрямки руху
    napr_lisova = {"subway_announcers/napr_lisova.mp3", 0.8},
    napr_arsenalna = {"subway_announcers/napr_arsenalna.mp3", 1.3},
    napr_darnytsia = {"subway_announcers/napr_darnytsia.mp3", 0.9},

 
}

local AnnouncerData = {
    { --МАРШРУТ ПО ЛІНІЇ
        LED = {5,5,5,5,5,5},
        Name = "Святошинсько-Броварська Лiнiя",
	    spec_wait = {{"spec_attention_train_stop"},{"spec_attention_train_depart"}},
        spec_last = {"spec_attention_last"},
	    Loop = false,
        {
            121,"Арсенальна",
	    	arrlast = {nil, {"arr_arsenalna",0,9,"spec_attention_last"},"napr_arsenalna"},
	    	dep = {{"dveri",1.5,"next_dnipro"}, nil},
        },
        {
            122,"Днiпро",
            arr = {"arr_dnipro","arr_dnipro"},
            dep = {{"dveri",1.5,"next_gidropark"},{"dveri",1.5,"next_arsenalna"}},
            have_inrerchange = true,
        },
        {
            123,"Гiдропарк",
            arr = {"arr_gidropark","arr_gidropark"},
            dep = {{"dveri",1.5,"next_livoberezhna"},{"dveri",1.5,"next_dnipro"}},
            have_inrerchange = true,
        },
        {
            124,"Лiвобережна",
            arr = {"arr_livoberezhna","arr_livoberezhna"},
            dep = {{"dveri",1.5,"next_darnytsia"},{"dveri",1.5,"next_gidropark"}},
            have_inrerchange = true,
        },
        {
            125,"Дарниця",
            arr = {"arr_darnytsia","arr_darnytsia"},
            dep = {{"dveri",1.5,"next_chernihivska"},{"dveri",1.5,"next_livoberezhna"}},
            have_inrerchange = true,
            arrlast = {{"arr_darnytsia",0.68,"spec_attention_last"},{"arr_darnytsia",0.68,"spec_attention_last"},"napr_darnytsia"},
            not_last = {0.58, "to_darnytsia"},
        },
        {
            126,"Чернiгiвська",
            arr = {"arr_chernihivska","arr_chernihivska"},
            dep = {{"dveri",1.5,"next_lisova"},{"dveri",1.5,"next_darnytsia"}},
            have_inrerchange = true,
        },
        {
            127,"Лiсова",
	    	arrlast = {{"arr_lisova"}, nil, "napr_lisova"},
            dep = {nil, {"dveri",1.5,"next_chernihivska"}},
        },
    },
}



Metrostroi.AddANSPAnnouncer("SBL 2021",AnnouncerRecords, AnnouncerData)
Metrostroi.SetRRIAnnouncer(AnnouncerRecords, AnnouncerData)
Metrostroi.AddSarmatUPOAnnouncer("SBL 2021", AnnouncerRecords, AnnouncerDataLQ)
Metrostroi.SetUPOAnnouncer(AnnouncerRecords, {AnnouncerDataLQ})

-- config
Metrostroi.StationConfigurations = {


	[127] =
	{
		names = {"Лісова","Lisova"},
		positions = {
			{Vector(-2651.232222, -14664.232444, 4596.245555),Angle(0.000000, 270.043999, 0.000000)},
		}
	},	
	oborot_lisova =
	{
		names = {"ПТО","PTO"},
		positions = {
			{Vector(14611.232877, -2627.012432, 4599),Angle(0.000000, 270.822422, 0.000000)},
		}
	},		
	[126] =
	{
		names = {"Чернігівська","Chernihivska"},
		positions = {
			{Vector(-14092.470703, -1018.464355, 3644.028320),Angle(0.000000, 0.000000, 0.000000)},
		}
	},
	[125] =
	{
		names = {"Дарниця","Darnytsia"},
		positions = {
			{Vector(14578.466309, -4309.025879, 3482.031250),Angle(0.000000, 180.608124, 0.000000)},
		}
	},
	[124] =
	{
		names = {"Лівобережна","Livoberezhna"},
		positions = {
			{Vector(1198, 5908, 1698),Angle(0.000000, 89.610161, 0.000000)},
		}
	},
	[123] =
	{
		names = {"Гідропарк","Hidropark"},
		positions = {
			{Vector(-1717.916016, -10473.455200, 729.031250),Angle(0.000000, 89.863411, 0.000000)},
		}
	},
	[122] =
	{
		names = {"Дніпро","Dnipro"},
		positions = {
			{Vector(-6340.074219, -7300.051758, -1371.604004),Angle(0.000000, 0.000000, 0.000000)},
		}
	},
	[121] =
	{
		names = {"Арсенальна","Arsenalna"},
		positions = {
			{Vector(10128.584961, 14292.788818, -2681.313965),Angle(0.000000, 179.994919, 0.000000)},
		}

	},
	oborot_arsenalna =
	{
		names = {"Оборот Арсенальна","Oborot Arsenalna"},
		positions = {
			{Vector(-3624.313477, 14647.185547, -2688.012596),Angle(0.000000, 0.000000, 0.000000)},
		}

	},
}

-- Схеми хуєми
Metrostroi.AddPassSchemeTex("717_new", "Kyiv Metro SBL",{
	"metrostroi_skins/81-717_schemes/Pechenka_Kalinin_2023_SBL",
})
