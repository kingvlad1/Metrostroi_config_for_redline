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
    spec_attention_last = {"subway_announcers/program2/p2_last.mp3", 5,12},
    spec_attention_train_depart = {"subway_announcers/program2/p2_techstop.mp3", 4.02},
    spec_attention_train_stop = {"subway_announcers/program2/p2_techstop.mp3", 4.024},
    click1 = {"subway_announcers/click2.mp3", 0.522},
    click2 = {"subway_announcers/click2.mp3", 0.444},

    --  Обережно двері зачиняються та станції
    
    dveri = {"subway_announcers/sbl2021/dveri.mp3", 4.12},
    arr_vokzalna = {"subway_announcers/sbl2021/arr_vokzalna.mp3", 17.36850},
    next_vokzalna = {"subway_announcers/sbl2021/next_vokzalna.mp3", 6.9745},
    arr_universytet = {"subway_announcers/sbl2021/arr_universytet.mp3", 3.6830},
    next_universytet = {"subway_announcers/sbl2021/next_universytet.mp3", 8.5140},
    arr_teatralna = {"subway_announcers/sbl2021/arr_teatralna.mp3", 12.4865},
    next_teatralna = {"subway_announcers/sbl2021/next_teatralna.mp3", 7.13140},
    arr_hryshchatyk = {"subway_announcers/sbl2021/arr_hryshchatyk.mp3", 11.1540},
    next_hryshchatyk = {"subway_announcers/sbl2021/next_hryshchatyk.mp3", 7.36640},
    arr_arsenalna = {"subway_announcers/sbl2021/arr_arsenalna.mp3", 3.760},
    next_arsenalna = {"subway_announcers/sbl2021/next_arsenalna.mp3", 4.230},
    arr_arsenalna_last = {"subway_announcers/sbl2021/arr_arsenalna_last.mp3", 14.50},
    next_arsenalna_last = {"subway_announcers/sbl2021/next_arsenalna_last.mp3", 5.30},
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
    -- До станцій
    to_darnytsia = {"subway_announcers/to_station/to_darnytsia.mp3", 3.12},
    to_arsenalna = {"subway_announcers/to_station/to_arsenalna.mp3", 2.620},
    -- Напрямки руху
    napr_lisova = {"subway_announcers/napr_lisova.mp3", 0.8},
    napr_arsenalna = {"subway_announcers/napr_arsenalna.mp3", 1.3},
    napr_darnytsia = {"subway_announcers/napr_darnytsia.mp3", 0.9},
    napr_vokzalna = {"subway_announcers/napr_vokzalna.mp3", 0.810},

 
}

local AnnouncerData = {
    { --МАРШРУТ ПО ЛІНІЇ
        LED = {5,5,5,5,5,5},
        Name = "Святошинсько-Броварська Лiнiя",
	    spec_wait = {{"spec_attention_train_stop"},{"spec_attention_train_depart"}},
        spec_last = {"spec_attention_last"},
	    Loop = false,
        {
            117,"Вокзальна",
	    	arrlast = {nil, {"arr_vokzalna"}, "napr_vokzalna"},
            dep = {{"dveri",1.5,"next_universytet"}, nil},
        },
        {
            118,"Унiверситет",
            arr = {"arr_universytet","arr_universytet"},
            dep = {{"dveri",1.5,"next_teatralna"},{"dveri",1.5,"next_vokzalna"}},
            have_inrerchange = true,
        },
        {
            119,"Театральна",
            arr = {"arr_teatralna","arr_teatralna"},
            dep = {{"dveri",1.5,"next_hryshchatyk"},{"dveri",1.5,"next_universytet"}},
            have_inrerchange = true,
        },
        {
            120,"Хрещатик",
            arr = {"arr_hryshchatyk","arr_hryshchatyk"},
            dep = {{"dveri",1.5,"next_arsenalna"},{"dveri",1.5,"next_teatralna"}},
            have_inrerchange = true,
        },
        {
            121,"Арсенальна",
            arr = {"arr_arsenalna","arr_arsenalna"},
            dep = {{"dveri",1.5,"next_dnipro"}, {"dveri",1.5,"next_hryshchatyk"}},
            have_inrerchange = true,
            arrlast = {{"arr_arsenalna_last"},{"arr_arsenalna_last"},"napr_arsenalna"},
            not_last = {0.88, "to_arsenalna"},
        },
        {
            122,"Днiпро",
            arr = {"arr_dnipro","arr_dnipro"},
            dep = {{"dveri",1.5,"next_gidropark"},{"dveri",1.5,"next_arsenalna_last"}},
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


local AnnouncerRecords2024 = {
    -- Записи інформатора надані K̷u̷r̷o̷s̷a̷k̷i̷_I̷c̷h̷i̷g̷o̷ (nikita_nomochevskiy)
    -- Шлак
    announcer_ready = {"subway_announcers/announcer_ready.mp3", 11.56},
    spec_attention_last = {"subway_announcers/program2/p2_last.mp3", 5,12},
    spec_attention_train_depart = {"subway_announcers/program2/p2_techstop.mp3", 4.02},
    spec_attention_train_stop = {"subway_announcers/program2/p2_techstop.mp3", 4.024},
    click1 = {"subway_announcers/click2.mp3", 0.522},
    click2 = {"subway_announcers/click2.mp3", 0.444},

    --  Обережно двері зачиняються та станції
    
    dveri = {"subway_announcers/sbl2024/dveri.mp3", 4.12},
    arr_vokzalna = {"subway_announcers/sbl2024/arr_vokzalna.mp3", 19.64140},
    next_vokzalna = {"subway_announcers/sbl2024/next_vokzalna.mp3", 8.672620},
    arr_universytet = {"subway_announcers/sbl2024/arr_universytet.mp3", 5.0000},
    next_universytet = {"subway_announcers/sbl2024/next_universytet.mp3", 10.170},
    arr_teatralna = {"subway_announcers/sbl2024/arr_teatralna.mp3", 13.30},
    next_teatralna = {"subway_announcers/sbl2024/next_teatralna.mp3", 7.50},
    arr_hryshchatyk = {"subway_announcers/sbl2024/arr_hryshchatyk.mp3", 11.90},
    next_hryshchatyk = {"subway_announcers/sbl2024/next_hryshchatyk.mp3", 7.740},
    arr_arsenalna = {"subway_announcers/sbl2024/arr_arsenalna.mp3", 4.36010},
    next_arsenalna = {"subway_announcers/sbl2024/next_arsenalna.mp3", 4.7080},
    arr_arsenalna_last = {"subway_announcers/sbl2024/arr_arsenalna_last.mp3", 16.3760},
    next_arsenalna_last = {"subway_announcers/sbl2024/next_arsenalna_last.mp3", 5.43490},
    arr_dnipro = {"subway_announcers/sbl2024/arr_dnipro.mp3", 6.34290},
    next_dnipro = {"subway_announcers/sbl2024/next_dnipro.mp3", 9.72450},
    arr_gidropark = {"subway_announcers/sbl2024/arr_gidropark.mp3", 4.17150},
    next_gidropark = {"subway_announcers/sbl2024/next_gidropark.mp3", 5.0650},
    arr_livoberezhna = {"subway_announcers/sbl2024/arr_livoberezhna.mp3", 9.2424},
    next_livoberezhna = {"subway_announcers/sbl2024/next_livoberezhna.mp3", 10.450},
    arr_darnytsia = {"subway_announcers/sbl2024/arr_darnytsia.mp3", 4.2190},
    next_darnytsia = {"subway_announcers/sbl2024/next_darnytsia.mp3", 7.6350},
    arr_chernihivska = {"subway_announcers/sbl2024/arr_chernihivska.mp3", 6.4540},
    next_chernihivska = {"subway_announcers/sbl2024/next_chernihivska.mp3", 5.020},
    arr_lisova = {"subway_announcers/sbl2024/arr_lisova.mp3", 15.6345},
    next_lisova = {"subway_announcers/sbl2024/next_lisova.mp3", 5.1},
    -- До станцій
    to_darnytsia = {"subway_announcers/to_station/to_darnytsia.mp3", 3.12},
    to_arsenalna = {"subway_announcers/to_station/to_arsenalna.mp3", 2.620},
    -- Напрямки руху
    napr_lisova = {"subway_announcers/napr_lisova.mp3", 0.8},
    napr_arsenalna = {"subway_announcers/napr_arsenalna.mp3", 1.3},
    napr_darnytsia = {"subway_announcers/napr_darnytsia.mp3", 0.9},
    napr_vokzalna = {"subway_announcers/napr_vokzalna.mp3", 0.810},

 
}

local AnnouncerData2024 = {
    { --МАРШРУТ ПО ЛІНІЇ
        LED = {5,5,5,5,5,5},
        Name = "Святошинсько-Броварська Лiнiя",
	    spec_wait = {{"spec_attention_train_stop"},{"spec_attention_train_depart"}},
        spec_last = {"spec_attention_last"},
	    Loop = false,
        {
            117,"Вокзальна",
	    	arrlast = {nil, {"arr_vokzalna"}, "napr_vokzalna"},
            dep = {{"dveri",1.5,"next_universytet"}, nil},
        },
        {
            118,"Унiверситет",
            arr = {"arr_universytet","arr_universytet"},
            dep = {{"dveri",1.5,"next_teatralna"},{"dveri",1.5,"next_vokzalna"}},
            have_inrerchange = true,
        },
        {
            119,"Театральна",
            arr = {"arr_teatralna","arr_teatralna"},
            dep = {{"dveri",1.5,"next_hryshchatyk"},{"dveri",1.5,"next_universytet"}},
            have_inrerchange = true,
        },
        {
            120,"Хрещатик",
            arr = {"arr_hryshchatyk","arr_hryshchatyk"},
            dep = {{"dveri",1.5,"next_arsenalna"},{"dveri",1.5,"next_teatralna"}},
            have_inrerchange = true,
        },
        {
            121,"Арсенальна",
            arr = {"arr_arsenalna","arr_arsenalna"},
            dep = {{"dveri",1.5,"next_dnipro"}, {"dveri",1.5,"next_hryshchatyk"}},
            have_inrerchange = true,
            arrlast = {{"arr_arsenalna_last"},{"arr_arsenalna_last"},"napr_arsenalna"},
            not_last = {0.88, "to_arsenalna"},
        },
        {
            122,"Днiпро",
            arr = {"arr_dnipro","arr_dnipro"},
            dep = {{"dveri",1.5,"next_gidropark"},{"dveri",1.5,"next_arsenalna_last"}},
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



local AnnouncerRecords2010 = {
    -- Записи інформатора надані ukrainianarmy
    -- Шлак
    announcer_ready = {"subway_announcers/sbl2010/announcer_ready_2010.mp3", 4.1950},
    spec_attention_last = {"subway_announcers/program2_2010/p2_last.mp3", 4,8880},
    spec_attention_train_depart = {"subway_announcers/program2_2010/p2_techstop.mp3", 6.34770},
    spec_attention_train_stop = {"subway_announcers/program2_2010/p2_techstop.mp3", 6.34770},
    click1 = {"subway_announcers/click2.mp3", 0.522},
    click2 = {"subway_announcers/click2.mp3", 0.444},

    --  Обережно двері зачиняються та станції
    arr_vokzalna = {"subway_announcers/sbl2010/arr_vokzalna.mp3", 5.27670},
    next_vokzalna = {"subway_announcers/sbl2010/next_vokzalna.mp3", 4.540},
    arr_universytet = {"subway_announcers/sbl2010/arr_universytet.mp3", 1.8280},
    next_universytet = {"subway_announcers/sbl2010/next_universytet.mp3", 4.6750},
    arr_teatralna = {"subway_announcers/sbl2010/arr_teatralna.mp3", 7.41870},
    next_teatralna = {"subway_announcers/sbl2010/next_teatralna.mp3", 4.6235},
    arr_hryshchatyk = {"subway_announcers/sbl2010/arr_hryshchatyk.mp3", 7.3140},
    next_hryshchatyk = {"subway_announcers/sbl2010/next_hryshchatyk.mp3", 4.4930},
    arr_arsenalna = {"subway_announcers/sbl2010/arr_arsenalna.mp3", 1.7240},
    next_arsenalna = {"subway_announcers/sbl2010/next_arsenalna.mp3", 4.64970},
    arr_arsenalna_last = {"subway_announcers/sbl2010/arr_arsenalna_last.mp3", 9.290},
    next_arsenalna_last = {"subway_announcers/sbl2010/next_arsenalna_last.mp3", 5.3170},
    arr_dnipro = {"subway_announcers/sbl2010/arr_dnipro.mp3", 2.7680},
    next_dnipro = {"subway_announcers/sbl2010/next_dnipro.mp3", 5.32890},
    arr_gidropark = {"subway_announcers/sbl2010/arr_gidropark.mp3", 1.540},
    next_gidropark = {"subway_announcers/sbl2010/next_gidropark.mp3", 4.4140},
    arr_livoberezhna = {"subway_announcers/sbl2010/arr_livoberezhna.mp3", 1.85465},
    next_livoberezhna = {"subway_announcers/sbl2010/next_livoberezhna.mp3", 4.67580},
    arr_darnytsia = {"subway_announcers/sbl2010/arr_darnytsia.mp3", 5.27670},
    next_darnytsia = {"subway_announcers/sbl2010/next_darnytsia.mp3", 4.51915},
    arr_chernihivska = {"subway_announcers/sbl2010/arr_chernihivska.mp3", 1.8285},
    next_chernihivska = {"subway_announcers/sbl2010/next_chernihivska.mp3", 4.649770},
    arr_lisova = {"subway_announcers/sbl2010/arr_lisova.mp3", 9.090570},
    next_lisova = {"subway_announcers/sbl2010/next_lisova.mp3", 5.120},
    -- До станцій
    to_darnytsia = {"subway_announcers/to_station_2010/to_darnytsia.mp3", 2.507730},
    to_arsenalna = {"subway_announcers/to_station_2010/to_arsenalna.mp3", 2.29875},
    -- Напрямки руху
    napr_lisova = {"subway_announcers/sbl2010/napr_lisova.mp3", 0.645140},
    napr_arsenalna = {"subway_announcers/sbl2010/napr_arsenalna.mp3", 0.84820},
    napr_darnytsia = {"subway_announcers/sbl2010/napr_darnytsia.mp3", 0.72585},
    napr_vokzalna = {"subway_announcers/sbl2010/napr_vokzalna.mp3", 0.7240},

 
}

local AnnouncerData2010 = {
    { --МАРШРУТ ПО ЛІНІЇ
        LED = {5,5,5,5,5,5},
        Name = "Святошинсько-Броварська Лiнiя",
	    spec_wait = {{"spec_attention_train_stop"},{"spec_attention_train_depart"}},
        spec_last = {"spec_attention_last"},
	    Loop = false,
        {
            117,"Вокзальна",
	    	arrlast = {nil, {"arr_vokzalna"}, "napr_vokzalna"},
            dep = {{"next_universytet"}, nil},
        },
        {
            118,"Унiверситет",
            arr = {"arr_universytet","arr_universytet"},
            dep = {{"next_teatralna"},{"next_vokzalna"}},
            have_inrerchange = true,
        },
        {
            119,"Театральна",
            arr = {"arr_teatralna","arr_teatralna"},
            dep = {{"next_hryshchatyk"},{"next_universytet"}},
            have_inrerchange = true,
        },
        {
            120,"Хрещатик",
            arr = {"arr_hryshchatyk","arr_hryshchatyk"},
            dep = {{"next_arsenalna"},{"next_teatralna"}},
            have_inrerchange = true,
        },
        {
            121,"Арсенальна",
            arr = {"arr_arsenalna","arr_arsenalna"},
            dep = {{"next_dnipro"}, {"next_hryshchatyk"}},
            have_inrerchange = true,
            arrlast = {{"arr_arsenalna_last"},{"arr_arsenalna_last"},"napr_arsenalna"},
            not_last = {0.88, "to_arsenalna"},
        },
        {
            122,"Днiпро",
            arr = {"arr_dnipro","arr_dnipro"},
            dep = {{"next_gidropark"},{"next_arsenalna_last"}},
            have_inrerchange = true,
        },
        {
            123,"Гiдропарк",
            arr = {"arr_gidropark","arr_gidropark"},
            dep = {{"next_livoberezhna"},{"next_dnipro"}},
            have_inrerchange = true,
        },
        {
            124,"Лiвобережна",
            arr = {"arr_livoberezhna","arr_livoberezhna"},
            dep = {{"next_darnytsia"},{"next_gidropark"}},
            have_inrerchange = true,
        },
        {
            125,"Дарниця",
            arr = {"arr_darnytsia","arr_darnytsia"},
            dep = {{"next_chernihivska"},{"next_livoberezhna"}},
            have_inrerchange = true,
            arrlast = {{"arr_darnytsia",0.68,"spec_attention_last"},{"arr_darnytsia",0.68,"spec_attention_last"},"napr_darnytsia"},
            not_last = {0.58, "to_darnytsia"},
        },
        {
            126,"Чернiгiвська",
            arr = {"arr_chernihivska","arr_chernihivska"},
            dep = {{"next_lisova"},{"next_darnytsia"}},
            have_inrerchange = true,
        },
        {
            127,"Лiсова",
	    	arrlast = {{"arr_lisova"}, nil, "napr_lisova"},
            dep = {nil, {"next_chernihivska"}},
        },
    },
}





Metrostroi.AddANSPAnnouncer("SBL 2021",AnnouncerRecords, AnnouncerData)
Metrostroi.SetRRIAnnouncer(AnnouncerRecords, AnnouncerData)
Metrostroi.AddSarmatUPOAnnouncer("SBL 2021", AnnouncerRecords, AnnouncerDataLQ)
Metrostroi.SetUPOAnnouncer(AnnouncerRecords, {AnnouncerDataLQ})

Metrostroi.AddANSPAnnouncer("SBL 2024",AnnouncerRecords2024, AnnouncerData2024)
Metrostroi.SetRRIAnnouncer(AnnouncerRecords2024, AnnouncerData)
Metrostroi.AddSarmatUPOAnnouncer("SBL 2024", AnnouncerRecords2024, AnnouncerDataLQ2024)
Metrostroi.SetUPOAnnouncer(AnnouncerRecords2024, {AnnouncerDataLQ})

Metrostroi.AddANSPAnnouncer("SBL 2010",AnnouncerRecords2010, AnnouncerData2010)
Metrostroi.SetRRIAnnouncer(AnnouncerRecords2010, AnnouncerData)
Metrostroi.AddSarmatUPOAnnouncer("SBL 2024", AnnouncerRecords2010, AnnouncerDataLQ2010)
Metrostroi.SetUPOAnnouncer(AnnouncerRecords2010, {AnnouncerDataLQ})

-- config
Metrostroi.StationConfigurations = {


	[127] =
	{
		names = {"Лісова","Lisova"},
		positions = {
			{Vector(-2651.232222, -14664.232444, 4596.245555),Angle(0.000000, 270.043999, 0.000000)},
		}
	},	
	pto =
	{
		names = {"ПТО Лісова","PTO Lisova"},
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
		names = {"Оборот","Oborot"},
		positions = {
			{Vector(-3624.313477, 14647.185547, -2688.012596),Angle(0.000000, 0.000000, 0.000000)},
		}

	},
}

-- Схеми хуєми
Metrostroi.AddPassSchemeTex("717_new", "Kyiv Metro SBL",{
	"metrostroi_skins/81-717_schemes/2024_sbl",
})

Metrostroi.AddPassSchemeTex("717_new", "Special Redline SBL",{
	"metrostroi_skins/81-717_schemes/redline_sbl",
})


Metrostroi.AddLastStationTex("717", 100,"metrostroi_skins/81-717_names/lisova")
Metrostroi.AddLastStationTex("717", 100,"metrostroi_skins/81-717_names/darnytsia")
Metrostroi.AddLastStationTex("717", 100,"metrostroi_skins/81-717_names/arsenalna")
Metrostroi.AddLastStationTex("717", 100,"metrostroi_skins/81-717_names/vokzalna")
Metrostroi.AddLastStationTex("717", 0,"metrostroi_skins/81-717_names/peregonka")
Metrostroi.AddLastStationTex("717", 100,"metrostroi_skins/81-717_names/photop")

Metrostroi.AddLastStationTex("710", 100,"metrostroi_skins/81-717_names/lisova")
Metrostroi.AddLastStationTex("710", 100,"metrostroi_skins/81-717_names/darnytsia")
Metrostroi.AddLastStationTex("710", 100,"metrostroi_skins/81-717_names/arsenalna")
Metrostroi.AddLastStationTex("710", 100,"metrostroi_skins/81-717_names/vokzalna")
Metrostroi.AddLastStationTex("710", 0,"metrostroi_skins/81-717_names/peregonka")
Metrostroi.AddLastStationTex("717", 100,"metrostroi_skins/81-717_names/photop")