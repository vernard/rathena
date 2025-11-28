#
# Table structure for table `item_db2`
#

DROP TABLE IF EXISTS `item_db2`;
CREATE TABLE `item_db2` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name_aegis` varchar(50) DEFAULT NULL,
  `name_english` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `price_buy` mediumint(8) unsigned DEFAULT NULL,
  `price_sell` mediumint(8) unsigned DEFAULT NULL,
  `weight` smallint(5) unsigned DEFAULT NULL,
  `attack` smallint(5) unsigned DEFAULT NULL,
  `defense` smallint(5) unsigned DEFAULT NULL,
  `range` tinyint(2) unsigned DEFAULT NULL,
  `slots` tinyint(2) unsigned DEFAULT NULL,
  `job_all` tinyint(1) unsigned DEFAULT NULL,
  `job_acolyte` tinyint(1) unsigned DEFAULT NULL,
  `job_alchemist` tinyint(1) unsigned DEFAULT NULL,
  `job_archer` tinyint(1) unsigned DEFAULT NULL,
  `job_assassin` tinyint(1) unsigned DEFAULT NULL,
  `job_barddancer` tinyint(1) unsigned DEFAULT NULL,
  `job_blacksmith` tinyint(1) unsigned DEFAULT NULL,
  `job_crusader` tinyint(1) unsigned DEFAULT NULL,
  `job_gunslinger` tinyint(1) unsigned DEFAULT NULL,
  `job_hunter` tinyint(1) unsigned DEFAULT NULL,
  `job_knight` tinyint(1) unsigned DEFAULT NULL,
  `job_mage` tinyint(1) unsigned DEFAULT NULL,
  `job_merchant` tinyint(1) unsigned DEFAULT NULL,
  `job_monk` tinyint(1) unsigned DEFAULT NULL,
  `job_ninja` tinyint(1) unsigned DEFAULT NULL,
  `job_novice` tinyint(1) unsigned DEFAULT NULL,
  `job_priest` tinyint(1) unsigned DEFAULT NULL,
  `job_rogue` tinyint(1) unsigned DEFAULT NULL,
  `job_sage` tinyint(1) unsigned DEFAULT NULL,
  `job_soullinker` tinyint(1) unsigned DEFAULT NULL,
  `job_stargladiator` tinyint(1) unsigned DEFAULT NULL,
  `job_supernovice` tinyint(1) unsigned DEFAULT NULL,
  `job_swordman` tinyint(1) unsigned DEFAULT NULL,
  `job_taekwon` tinyint(1) unsigned DEFAULT NULL,
  `job_thief` tinyint(1) unsigned DEFAULT NULL,
  `job_wizard` tinyint(1) unsigned DEFAULT NULL,
  `class_all` tinyint(1) unsigned DEFAULT NULL,
  `class_normal` tinyint(1) unsigned DEFAULT NULL,
  `class_upper` tinyint(1) unsigned DEFAULT NULL,
  `class_baby` tinyint(1) unsigned DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `location_head_top` tinyint(1) unsigned DEFAULT NULL,
  `location_head_mid` tinyint(1) unsigned DEFAULT NULL,
  `location_head_low` tinyint(1) unsigned DEFAULT NULL,
  `location_armor` tinyint(1) unsigned DEFAULT NULL,
  `location_right_hand` tinyint(1) unsigned DEFAULT NULL,
  `location_left_hand` tinyint(1) unsigned DEFAULT NULL,
  `location_garment` tinyint(1) unsigned DEFAULT NULL,
  `location_shoes` tinyint(1) unsigned DEFAULT NULL,
  `location_right_accessory` tinyint(1) unsigned DEFAULT NULL,
  `location_left_accessory` tinyint(1) unsigned DEFAULT NULL,
  `location_costume_head_top` tinyint(1) unsigned DEFAULT NULL,
  `location_costume_head_mid` tinyint(1) unsigned DEFAULT NULL,
  `location_costume_head_low` tinyint(1) unsigned DEFAULT NULL,
  `location_costume_garment` tinyint(1) unsigned DEFAULT NULL,
  `location_ammo` tinyint(1) unsigned DEFAULT NULL,
  `location_shadow_armor` tinyint(1) unsigned DEFAULT NULL,
  `location_shadow_weapon` tinyint(1) unsigned DEFAULT NULL,
  `location_shadow_shield` tinyint(1) unsigned DEFAULT NULL,
  `location_shadow_shoes` tinyint(1) unsigned DEFAULT NULL,
  `location_shadow_right_accessory` tinyint(1) unsigned DEFAULT NULL,
  `location_shadow_left_accessory` tinyint(1) unsigned DEFAULT NULL,
  `weapon_level` tinyint(1) unsigned DEFAULT NULL,
  `armor_level` tinyint(1) unsigned DEFAULT NULL,
  `equip_level_min` tinyint(3) unsigned DEFAULT NULL,
  `equip_level_max` tinyint(3) unsigned DEFAULT NULL,
  `refineable` tinyint(1) unsigned DEFAULT NULL,
  `view` smallint(5) unsigned DEFAULT NULL,
  `alias_name` varchar(50) DEFAULT NULL,
  `flag_buyingstore` tinyint(1) unsigned DEFAULT NULL,
  `flag_deadbranch` tinyint(1) unsigned DEFAULT NULL,
  `flag_container` tinyint(1) unsigned DEFAULT NULL,
  `flag_uniqueid` tinyint(1) unsigned DEFAULT NULL,
  `flag_bindonequip` tinyint(1) unsigned DEFAULT NULL,
  `flag_dropannounce` tinyint(1) unsigned DEFAULT NULL,
  `flag_noconsume` tinyint(1) unsigned DEFAULT NULL,
  `flag_dropeffect` varchar(20) DEFAULT NULL,
  `delay_duration` bigint(20) unsigned DEFAULT NULL,
  `delay_status` varchar(30) DEFAULT NULL,
  `stack_amount` smallint(5) unsigned DEFAULT NULL,
  `stack_inventory` tinyint(1) unsigned DEFAULT NULL,
  `stack_cart` tinyint(1) unsigned DEFAULT NULL,
  `stack_storage` tinyint(1) unsigned DEFAULT NULL,
  `stack_guildstorage` tinyint(1) unsigned DEFAULT NULL,
  `nouse_override` smallint(5) unsigned DEFAULT NULL,
  `nouse_sitting` tinyint(1) unsigned DEFAULT NULL,
  `trade_override` smallint(5) unsigned DEFAULT NULL,
  `trade_nodrop` tinyint(1) unsigned DEFAULT NULL,
  `trade_notrade` tinyint(1) unsigned DEFAULT NULL,
  `trade_tradepartner` tinyint(1) unsigned DEFAULT NULL,
  `trade_nosell` tinyint(1) unsigned DEFAULT NULL,
  `trade_nocart` tinyint(1) unsigned DEFAULT NULL,
  `trade_nostorage` tinyint(1) unsigned DEFAULT NULL,
  `trade_noguildstorage` tinyint(1) unsigned DEFAULT NULL,
  `trade_nomail` tinyint(1) unsigned DEFAULT NULL,
  `trade_noauction` tinyint(1) unsigned DEFAULT NULL,
  `script` text,
  `equip_script` text,
  `unequip_script` text,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UniqueAegisName` (`name_aegis`)
) ENGINE=MyISAM;

REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`weight`,`alias_name`,`trade_nodrop`,`trade_notrade`,`trade_nosell`,`trade_nocart`,`trade_nostorage`,`trade_noguildstorage`,`trade_nomail`,`trade_noauction`,`script`) VALUES (30000,'Starter_Healing_Box','Starter Healing Box','Usable',10,'Gift_Box',true,true,true,true,true,true,true,true,'getitem 30001,100;\ngetitem 30002,100;\ngetitem 30003,100;\ndispbottom "You received 100 Starter Red Potions, 100 Starter Orange Potions, and 100 Starter Blue Potions!";');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`weight`,`alias_name`,`trade_nodrop`,`trade_notrade`,`trade_nosell`,`trade_nocart`,`trade_nostorage`,`trade_noguildstorage`,`trade_nomail`,`trade_noauction`,`script`) VALUES (30001,'Starter_Red_Potion','Starter Red Potion','Healing',0,'Red_Potion',true,true,true,true,true,true,true,true,'itemheal rand(45,65),0;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`weight`,`alias_name`,`trade_nodrop`,`trade_notrade`,`trade_nosell`,`trade_nocart`,`trade_nostorage`,`trade_noguildstorage`,`trade_nomail`,`trade_noauction`,`script`) VALUES (30002,'Starter_Orange_Potion','Starter Orange Potion','Healing',0,'Orange_Potion',true,true,true,true,true,true,true,true,'itemheal rand(105,145),0;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`weight`,`alias_name`,`trade_nodrop`,`trade_notrade`,`trade_nosell`,`trade_nocart`,`trade_nostorage`,`trade_noguildstorage`,`trade_nomail`,`trade_noauction`,`script`) VALUES (30003,'Starter_Blue_Potion','Starter Blue Potion','Healing',0,'Blue_Potion',true,true,true,true,true,true,true,true,'itemheal 0,rand(40,60);');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`) VALUES (1750,'Arrow','Arrow','Ammo','Arrow',1,1,25,true,true,true,true,true,true,true,1);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1751,'Silver_Arrow','Silver Arrow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Holy;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1752,'Fire_Arrow','Fire Arrow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Fire;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`) VALUES (1753,'Steel_Arrow','Steel Arrow','Ammo','Arrow',4,1,40,true,true,true,true,true,true,true,1);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1754,'Crystal_Arrow','Crystal Arrow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Water;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1755,'Arrow_Of_Wind','Arrow of Wind','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Wind;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1756,'Stone_Arrow','Stone Arrow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Earth;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1757,'Immatrial_Arrow','Immaterial Arrow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Ghost;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1758,'Stun_Arrow','Stun Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus2 bAddEff,Eff_Stun,1000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1759,'Freezing_Arrow','Frozen Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Water;\nbonus2 bAddEff,Eff_Freeze,1000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1760,'Flash_Arrow','Flash Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus2 bAddEff,Eff_Blind,1000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1761,'Curse_Arrow','Cursed Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus2 bAddEff,Eff_Curse,1000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1762,'Rusty_Arrow','Rusty Arrow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Poison;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1763,'Poison_Arrow','Poison Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Poison;\nbonus2 bAddEff,Eff_Poison,2000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1764,'Incisive_Arrow','Sharp Arrow','Ammo','Arrow',20,1,10,true,true,true,true,true,true,true,1,'bonus bCriticalLong,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`) VALUES (1765,'Oridecon_Arrow','Oridecon Arrow','Ammo','Arrow',30,1,50,true,true,true,true,true,true,true,1);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1766,'Arrow_Of_Counter_Evil','Arrow of Counter Evil','Ammo','Arrow',40,1,50,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Holy;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1767,'Arrow_Of_Shadow','Arrow of Shadow','Ammo','Arrow',3,1,30,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Dark;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1768,'Sleep_Arrow','Sleep Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus2 bAddEff,Eff_Sleep,2000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1769,'Silence_Arrow','Mute Arrow','Ammo','Arrow',10,1,1,true,true,true,true,true,true,true,1,'bonus2 bAddEff,Eff_Silence,1000;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`) VALUES (1770,'Iron_Arrow','Iron Arrow','Ammo','Arrow',2,1,30,true,true,true,true,true,true,true,1);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_archer`,`job_assassin`,`job_barddancer`,`job_hunter`,`job_rogue`,`job_thief`,`location_ammo`,`equip_level_min`,`script`) VALUES (1772,'Holy_Arrow','Holy Arrow','Ammo','Arrow',3,1,50,true,true,true,true,true,true,true,1,'bonus bAtkEle,Ele_Holy;\nbonus2 bAddRace,RC_Demon,5;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`) VALUES (13200,'Bullet','Bullet','Ammo','Bullet',1,1,10,true,true,1);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13201,'Silver_Bullet','Silver Bullet','Ammo','Bullet',15,1,15,true,true,1,'bonus bAtkEle,Ele_Holy;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13202,'Shell_Of_Blood','Bloody Shell','Ammo','Bullet',30,1,30,true,true,1,'bonus2 bAddEff,Eff_Bleeding,100;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13203,'Flare_Sphere','Flare Sphere','Ammo','Grenade',80,2,50,true,true,1,'bonus bAtkEle,Ele_Fire;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13204,'Lighting_Sphere','Lightning Sphere','Ammo','Grenade',80,2,50,true,true,1,'bonus bAtkEle,Ele_Wind;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13205,'Poison_Sphere','Poison Sphere','Ammo','Grenade',80,2,50,true,true,1,'bonus bAtkEle,Ele_Poison;\nbonus2 bAddEff,Eff_Poison,500;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13206,'Blind_Sphere','Blind Sphere','Ammo','Grenade',80,2,50,true,true,1,'bonus bAtkEle,Ele_Dark;\nbonus2 bAddEff,Eff_Blind,500;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_gunslinger`,`location_ammo`,`equip_level_min`,`script`) VALUES (13207,'Freezing_Sphere','Freezing Sphere','Ammo','Grenade',80,2,50,true,true,1,'bonus bAtkEle,Ele_Water;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_alchemist`,`job_blacksmith`,`location_ammo`,`equip_level_min`) VALUES (18000,'Cannon_Ball','Cannon Ball','Ammo','Cannonball',100,5,100,true,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_alchemist`,`job_blacksmith`,`location_ammo`,`equip_level_min`,`script`) VALUES (18001,'Holy_Cannon_Ball','Holy Cannon Ball','Ammo','Cannonball',200,5,120,true,true,true,99,'bonus bAtkEle,Ele_Holy;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_alchemist`,`job_blacksmith`,`location_ammo`,`equip_level_min`,`script`) VALUES (18002,'Dark_Cannon_Ball','Dark Cannon Ball','Ammo','Cannonball',200,5,120,true,true,true,99,'bonus bAtkEle,Ele_Dark;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_alchemist`,`job_blacksmith`,`location_ammo`,`equip_level_min`,`script`) VALUES (18003,'Soul_Cannon_Ball','Soul Cannon Ball','Ammo','Cannonball',200,5,120,true,true,true,99,'bonus bAtkEle,Ele_Ghost;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_alchemist`,`job_blacksmith`,`location_ammo`,`equip_level_min`) VALUES (18004,'Iron_Cannon_Ball','Iron Cannon Ball','Ammo','Cannonball',500,5,250,true,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`,`script`) VALUES (13255,'Kunai_Of_Icicle','Icicle Kunai','Ammo','Kunai',10,10,30,true,true,1,'bonus bAtkEle,Ele_Water;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`,`script`) VALUES (13256,'Kunai_Of_Black_Soil','Black Earth Kunai','Ammo','Kunai',10,10,30,true,true,1,'bonus bAtkEle,Ele_Earth;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`,`script`) VALUES (13257,'Kunai_Of_Furious_Wind','High Wind Kunai','Ammo','Kunai',10,10,30,true,true,1,'bonus bAtkEle,Ele_Wind;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`,`script`) VALUES (13258,'Kunai_Of_Fierce_Flame','Heat Wave Kunai','Ammo','Kunai',10,10,30,true,true,1,'bonus bAtkEle,Ele_Fire;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`,`script`) VALUES (13259,'Kunai_Of_Deadly_Poison','Fell Poison Kunai','Ammo','Kunai',10,10,30,true,true,1,'bonus bAtkEle,Ele_Poison;\nbonus2 bAddEff,Eff_Poison,500;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`class_normal`,`class_upper`,`class_baby`,`location_ammo`,`equip_level_min`,`script`) VALUES (13294,'Explosive_Kunai','Explosive Kunai','Ammo','Kunai',100,15,50,true,true,true,true,true,100,'bonus bAtkEle,Ele_Neutral;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`) VALUES (13250,'Shuriken','Shuriken','Ammo','Shuriken',4,2,10,true,true,1);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`) VALUES (13251,'Nimbus_Shuriken','Nimbus Shuriken','Ammo','Shuriken',10,2,30,true,true,20);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`) VALUES (13252,'Flash_Shuriken','Flash Shuriken','Ammo','Shuriken',20,2,45,true,true,40);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`) VALUES (13253,'Sharp_Leaf_Shuriken','Sharp Leaf Shuriken','Ammo','Shuriken',40,2,70,true,true,60);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_ninja`,`location_ammo`,`equip_level_min`) VALUES (13254,'Thorn_Needle_Shuriken','Thorn Needle Shuriken','Ammo','Shuriken',100,2,100,true,true,80);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13260,'Apple_Bomb','Apple Bomb','Ammo','Throwweapon',100,1,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13261,'Coconut_Bomb','Coconut Bomb','Ammo','Throwweapon',100,1,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13262,'Melon_Bomb','Melon Bomb','Ammo','Throwweapon',100,1,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13263,'Pineapple_Bomb','Pineapple Bomb','Ammo','Throwweapon',100,1,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13264,'Banana_Bomb','Banana Bomb','Ammo','Throwweapon',100,1,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13265,'Black_Lump','Black Lump','Ammo','Throwweapon',100,25,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13266,'Black_Hard_Lump','Hard Black Lump','Ammo','Throwweapon',100,25,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`) VALUES (13267,'Very_Hard_Lump','Extremely Hard Black Lump','Ammo','Throwweapon',100,25,true,true,99);
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13268,'Mysterious_Powder','Mysterious Powder','Ammo','Throwweapon',100,5,true,true,99,'sc_start SC_MYSTERIOUS_POWDER,10000,2;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13269,'Boost500_To_Throw','Throwing Boost 500','Ammo','Throwweapon',100,5,true,true,99,'sc_start SC_BOOST500,500000,10;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13270,'Full_SwingK_To_Throw','Throwing Full Swing K','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_FULL_SWING_K,500000,50;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13271,'Mana_Plus_To_Throw','Throwing Mana Plus','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_MANA_PLUS,500000,50;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13272,'Cure_Free_To_Throw','Throwing Cure Free','Ammo','Throwweapon',100,25,true,true,99,'sc_end SC_BLEEDING;\nsc_end SC_CURSE;\nsc_end SC_SILENCE;\nsc_end SC_POISON;\nsc_end SC_ORCISH;\nsc_end SC_CHANGEUNDEAD;\nsc_end SC_BLIND;\nsc_end SC_CONFUSION;\nsc_end SC_DPOISON;\nitemheal 500,0;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13273,'Stamina_Up_M_To_Throw','Throwing Muramura M','Ammo','Throwweapon',100,5,true,true,99,'sc_start SC_MUSTLE_M,500000,5;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13274,'Digestive_F_To_Throw','Throwing Falmons F','Ammo','Throwweapon',100,5,true,true,99,'sc_start SC_LIFE_FORCE_F,500000,5;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13275,'HP_Inc_PotS_To_Throw','Throwing Increase HP Potion (Small)','Ammo','Throwweapon',100,10,true,true,99,'/* Item bonus in source because of BaseLevel check */');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13276,'HP_Inc_PotM_To_Throw','Throwing Increase HP Potion (Medium)','Ammo','Throwweapon',100,20,true,true,99,'/* Item bonus in source because of BaseLevel check */');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13277,'HP_Inc_PotL_To_Throw','Throwing Increase HP Potion (Large)','Ammo','Throwweapon',100,40,true,true,99,'/* Item bonus in source because of BaseLevel check */');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13278,'SP_Inc_PotS_To_Throw','Throwing Increase SP Potion (Small)','Ammo','Throwweapon',100,10,true,true,99,'/* Item bonus in source because of BaseLevel check */');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13279,'SP_Inc_PotM_To_Throw','Throwing Increase SP Potion (Medium)','Ammo','Throwweapon',100,20,true,true,99,'/* Item bonus in source because of BaseLevel check */');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13280,'SP_Inc_PotL_To_Throw','Throwing Increase SP Potion (Large)','Ammo','Throwweapon',100,40,true,true,99,'/* Item bonus in source because of BaseLevel check */');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13281,'En_White_PotZ_To_Throw','Throwing Concentrated White Potion Z','Ammo','Throwweapon',100,35,true,true,99,'sc_start SC_EXTRACT_WHITE_POTION_Z,500000,20;\nitemheal 1000,0;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13282,'Vitata500_To_Throw','Throwing Vitata 500','Ammo','Throwweapon',100,25,true,true,99,'sc_start2 SC_VITATA_500,500000,20,5;\nitemheal 0,200;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13283,'En_Cel_Juice_To_Throw','Throwing Ceromain Soup','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_EXTRACT_SALAMINE_JUICE,500000,10;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13284,'Savage_BBQ_To_Throw','Throwing Savage Full Roast','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_SAVAGE_STEAK,300000,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13285,'Wug_Cocktail_To_Throw','Throwing Cocktail Warg Blood','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_COCKTAIL_WARG_BLOOD,300000,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13286,'M_Brisket_To_Throw','Throwing Minor Stew','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_MINOR_BBQ,300000,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13287,'Siroma_Icetea_To_Throw','Throwing Siroma Iced Tea','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_SIROMA_ICE_TEA,300000,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13288,'Drocera_Stew_To_Throw','Throwing Drosera Herb Salad','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_DROCERA_HERB_STEAMED,300000,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13289,'Petti_Noodle_To_Throw','Throwing Petite Tail Soup','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_PUTTI_TAILS_NOODLES,300000,20;');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`job_alchemist`,`location_ammo`,`equip_level_min`,`script`) VALUES (13290,'Black_Thing_To_Throw','Throwing Black Mass','Ammo','Throwweapon',100,25,true,true,99,'sc_start SC_STOMACHACHE,60000,rand(5,10);');
REPLACE INTO `item_db2` (`id`,`name_aegis`,`name_english`,`type`,`subtype`,`price_buy`,`weight`,`attack`,`job_assassin`,`location_ammo`,`equip_level_min`) VALUES (1771,'Venom_Knife','Venom Knife','Ammo','Dagger',50,2,30,true,true,1);
