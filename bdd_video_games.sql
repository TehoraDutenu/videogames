DROP TABLE IF EXISTS `console`;

CREATE TABLE
    IF NOT EXISTS `console` (
        `id` int(10) NOT NULL AUTO_INCREMENT,
        `label` varchar(150) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;

-- Listage des données de la table video-games.console : ~7 rows (environ)

/*!40000 ALTER TABLE `console` DISABLE KEYS */

;

DROP TABLE IF EXISTS `note`;

CREATE TABLE
    IF NOT EXISTS `note` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `note_media` int(11) NOT NULL,
        `note_utilisateur` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8;

INSERT INTO
    `note` (
        `id`,
        `note_media`,
        `note_utilisateur`
    )
VALUES (1, 18, 17), (2, 17, 16), (3, 12, 15), (4, 16, 16), (5, 17, 18), (6, 18, 16), (7, 17, 18), (8, 20, 19), (9, 18, 19), (10, 17, 16), (11, 18, 17), (12, 16, 19), (13, 18, 18), (14, 20, 20);

DROP TABLE IF EXISTS `restriction_age`;

CREATE TABLE
    IF NOT EXISTS `restriction_age` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `label` int(5) NOT NULL,
        `image_path` varchar(150) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8;

INSERT INTO
    `restriction_age` (`id`, `label`, `image_path`)
VALUES (1, 3, 'pegi3.png'), (2, 7, 'pegi7.png'), (3, 12, 'pegi12.png'), (4, 16, 'pegi16.png'), (5, 18, 'pegi18.png');

INSERT INTO
    `console` (`id`, `label`)
VALUES (1, 'PS4'), (2, 'PS5'), (3, '360'), (4, 'Xbox Series'), (5, 'ONE'), (6, 'Switch'), (7, 'PC');

DROP TABLE IF EXISTS `jeu`;

CREATE TABLE
    IF NOT EXISTS `jeu` (
        `id` int(10) NOT NULL AUTO_INCREMENT,
        `titre` varchar(150) NOT NULL,
        `description` text NOT NULL,
        `prix` int(11) NOT NULL,
        `date_sortie` datetime NOT NULL,
        `image_path` varchar(150) DEFAULT 'default.png',
        `note_id` int(11) NOT NULL,
        `age_id` int(11) NOT NULL,
        PRIMARY KEY (`id`),
        KEY `note_id` (`note_id`),
        KEY `age_id` (`age_id`),
        CONSTRAINT `FK1_note_jeu` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`),
        CONSTRAINT `FK2_age_jeu` FOREIGN KEY (`age_id`) REFERENCES `restriction_age` (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8;

INSERT INTO
    `jeu` (
        `id`,
        `titre`,
        `description`,
        `prix`,
        `date_sortie`,
        `image_path`,
        `note_id`,
        `age_id`
    )
VALUES (
        1,
        'Animal Crossing : New Horizons',
        'Animal Crossing : New Horizons vous emmène de nouveau dans le monde mignon d\'Animal Crossing, sur Nintendo Switch. Cultivez votre potager, pêchez, et faites votre vie avec vos compagnons en temps réel grâce à l\'horloge de la console.',
        4490,
        '2020-03-20 00:00:00',
        'animal-crossing.jpg',
        1,
        2
    ), (
        2,
        'Call of Duty : Modern Warfare 2',
        'Il s\'agit d\'une version reboot de l\'emblématique jeu de tir à la première personne Call of Duty Modern Warfare 2, sorti en 2009. Le jeu bénéficie de nouveaux graphismes et d\'une refonte complète. Le jeu devrait etre le début d\'une nouvelle ère pour la licence.',
        5999,
        '2022-10-28 00:00:00',
        'call-of-duty.jpg',
        2,
        5
    ), (
        3,
        'Fall Guys : Ultimate Knockout',
        'Fall Guys : Ultimate Knockout réunit 60 participants en ligne dans une course chaotique et effrénée qui ne couronnera qu’un seul gagnant. Les obstacles étranges, le manque de discipline des concurrents et les lois inflexibles de la physique se dressent sur la route du succès de cet intervilles moderne .',
        0,
        '2020-08-04 00:00:00',
        'fall-guys.jpg',
        3,
        1
    ), (
        4,
        'FIFA 23',
        'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.',
        5699,
        '2022-09-30 00:00:00',
        'fifa-23.jpg',
        4,
        1
    ), (
        5,
        'Grand Theft Auto V',
        'Jeu d\'action-aventure en monde ouvert, Grand Theft Auto (GTA) V vous place dans la peau de trois personnages inédits : Michael, Trevor et Franklin. Ces derniers ont élu domicile à Los Santos, ville de la région de San Andreas. Braquages et missions font partie du quotidien du joueur qui pourra également cohabiter avec 15 autres utilisateurs dans cet univers persistant s\'il joue sur PS3/Xbox 360 ou 29 s\'il joue sur PS4/Xbox One/PC.',
        2999,
        '2013-09-17 00:00:00',
        'gta-v.jpg',
        5,
        5
    ), (
        6,
        'Human Fall Flat',
        'Human : Fall Flat est un jeu d\'aventure puzzle qui propose au joueur de prendre possession de Bob, un personnage désarticulé qui doit se dépatouiller dans 8 niveaux remplis d\'énigmes. Ces dernières sont basées sur la physique et notre héros devra gérer au mieux ses bras pour soulever, s\'agripper, et actionner divers mécanismes.',
        2499,
        '2016-06-22 00:00:00',
        'Human-Fall-Flat.jpg',
        6,
        2
    ), (
        7,
        'Mario Kart 8 Deluxe',
        'Mario Kart 8 sur Switch est un jeu de course coloré et délirant qui reprend les personnages phares des grandes licences Nintendo. Le joueur peut y affronter ses amis dans différents modes et types de coupes et a accès à 32 circuits aux environnements variés. Il est possible de jouer jusqu\' à 12 simultanément en ligne et 4 en local.',
        4999,
        '2017-04-28 00:00:00',
        'mario-kart-8.jpg',
        7,
        1
    ), (
        8,
        'Super Mario Odyssey',
        'Super Mario Odyssey est un jeu de plate-forme sur Switch où la princesse Peach a été enlevée par Bowser.Pour la sauver, Mario quitte le royaume Champignon à bord de l\'Odyssey. Accompagné de Cappy, son chapeau vivant, il doit parcourir différents royaumes et faire tout pour vaincre, une nouvelle fois, le terrible Bowser.',
        4499,
        '2017-10-27 00:00:00',
        'mario-odyssey.jpg',
        8,
        1
    ), (
        9,
        'Minecraft',
        'Jeu bac à sable indépendant et pixelisé dont le monde infini est généré aléatoirement, Minecraft permet au joueur de récolter divers matériaux, d\'élever des animaux et de modifier le terrain selon ses choix, en solo ou en multi (via des serveurs). Il doit également survivre en se procurant de la nourriture et en se protégeant des monstres qui apparaissent la nuit et dans des donjons. Il peut également monter de niveau afin d\'acheter des enchantements.',
        2249,
        '2011-11-18 00:00:00',
        'minecraft.jpg',
        9,
        2
    ), (
        10,
        'Légendes Pokémon: Arceus',
        'Légendes Pokémon : Arceus tranche avec les précédents opus Pokémon puisqu\'il prend place dans un monde ouvert. Le titre se déroule dans la région de Sinnoh, bien avant sa colonisation par les êtres humains. Le joueur incarnera toujours un dresseur de Pokémon, cette fois-ci chargé de créer le premier Pokédex de Sinnoh.',
        4499,
        '2022-01-28 00:00:00',
        'pokemon.jpg',
        10,
        2
    ), (
        11,
        'PlayerUnknown\'s Battlegrounds',
        'PlayerUnknown\'s Battlegrounds est un jeu multijoueur de type Battle Royale. En partant de rien, il vous faut trouver des armes et des ressources afin d\'être le dernier survivant. Vous vous retrouvez sur une île de 8x8 km, avec pour but ultime de ne pas vous faire tuer.',
        995,
        '2017-03-23 00:00:00',
        'PUBG-Battlegrounds.jpg',
        11,
        4
    ), (
        12,
        'Red Dead Redemption II',
        'Suite du précédent volet multi récompensé, Red Dead Redemption II nous permet de nous replonger sur PS4 dans une ambiance western synonyme de vastes espaces sauvages et de villes malfamées. L\'histoire se déroule en 1899,	avant le premier Red Dead Redemption, au moment où Arthur Morgan doit fuir avec sa bande à la suite d\'un braquage raté.',
        1399,
        '2018-10-26 00:00:00',
        'red-dead-redemption.jpg',
        12,
        5
    ), (
        13,
        'The Elder Scrolls V : Skyrim',
        'The Elder Scrolls V: Skyrim est le cinquième épisode de la saga de jeux de rôle du même nom. Le scénario se passe 200 ans après l\'histoire du quatrième opus, quand Alduin fait son retour au milieu d\'une guerre civile. Seul le Dovahkiin, incarné par le joueur, peut mettre un terme à cette sombre affaire... Un monde gigantesque empli de quêtes est à explorer et auquel se sont rajoutées des extensions débloquant plus de quêtes.',
        1990,
        '2011-11-11 00:00:00',
        'The-Elder-Scrolls-Skyrim.jpg',
        13,
        5
    ), (
        14,
        'The Legend of Zelda : Breath of the Wild',
        'The Legend of Zelda: Breath of the Wild est un jeu d\'action/aventure. Link se réveille d\'un sommeil de 100 ans dans un royaume d\'Hyrule dévasté.Il lui faudra percer les mystères du passé et vaincre Ganon, le fléau. L\'aventure prend place dans un gigantesque monde ouvert et accorde ainsi une part importante à l\'exploration. Le titre a été pensé pour que le joueur puisse aller où il veut dès le début, s\'éloignant de la linéarité habituelle de la série.',
        5199,
        '2017-03-03 00:00:00',
        'zelda.jpg',
        14,
        3
    );

DROP TABLE IF EXISTS `game_console`;

CREATE TABLE
    IF NOT EXISTS `game_console` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `console_id` int(11) NOT NULL,
        `jeu_id` int(11) NOT NULL,
        PRIMARY KEY (`id`),
        KEY `console_id` (`console_id`),
        KEY `jeu_id` (`jeu_id`),
        CONSTRAINT `FK1_console` FOREIGN KEY (`console_id`) REFERENCES `console` (`id`),
        CONSTRAINT `FK2_jeu` FOREIGN KEY (`jeu_id`) REFERENCES `jeu` (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 50 DEFAULT CHARSET = utf8;

INSERT INTO
    `game_console` (`id`, `console_id`, `jeu_id`)
VALUES (1, 6, 1), (2, 1, 2), (3, 2, 2), (4, 4, 2), (5, 5, 2), (6, 7, 2), (7, 1, 3), (8, 2, 3), (9, 4, 3), (10, 5, 3), (11, 7, 3), (12, 1, 4), (13, 2, 4), (14, 4, 4), (15, 5, 4), (16, 7, 4), (17, 1, 5), (18, 2, 5), (19, 3, 5), (20, 4, 5), (21, 5, 5), (22, 7, 5), (23, 1, 6), (24, 2, 6), (25, 4, 6), (26, 5, 6), (27, 7, 6), (28, 6, 7), (29, 6, 8), (30, 1, 9), (31, 2, 9), (32, 3, 9), (33, 4, 9), (34, 5, 9), (35, 7, 9), (36, 6, 10), (37, 1, 11), (38, 5, 11), (39, 7, 11), (40, 1, 12), (41, 5, 12), (42, 7, 12), (43, 1, 13), (44, 2, 13), (45, 3, 13), (46, 4, 13), (47, 5, 13), (48, 7, 13), (49, 6, 14);