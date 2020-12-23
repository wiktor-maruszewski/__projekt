		#TABELA DZIAL

-- Table structure for table `dzial`

CREATE TABLE `dzial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `dzial`

INSERT INTO `dzial` VALUES (1,'mechanika'),(2,'elektromechanika'),(3,'lakiernictwo_blacharnictwo'),(4,'gazownictwo');


		#TABELA KLIENT

-- Table structure for table `klient`

CREATE TABLE `klient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  `czy_firma` tinyint NOT NULL,
  `nip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `klient`

INSERT INTO `klient` VALUES (1,'Patrycja Cieślak',0,NULL),(2,'Żaneta Mazur',0,NULL),(3,'Jolanta Szymańska',0,NULL),(4,'Fabian Jakubowski',0,NULL),(5,'Gustaw Kamiński',0,NULL),(6,'Dominik Kalinowski',0,NULL),(7,'KALDEN',1,'5973165485'),(8,'ZEITER',1,'9823545674'),(9,'Jan Brzechwa',0,NULL);


		#TABELA PRACOWNIK

-- Table structure for table `pracownik`

CREATE TABLE `pracownik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `data_zatrudnienia` date NOT NULL,
  `pensja` decimal(7,2) DEFAULT NULL,
  `dzial_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pracownik_dzial_idx` (`dzial_id`),
  CONSTRAINT `fk_pracownik_dzial` FOREIGN KEY (`dzial_id`) REFERENCES `dzial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `pracownik`

INSERT INTO `pracownik` VALUES (1,'Jan','Kowlaski','1995-08-07','2019-05-16',3029.40,1),(2,'Maciej','Mickiewicz','1987-12-21','2011-02-18',3400.00,2),(3,'Andrzej','Nowak','1992-05-16','2018-06-27',3100.00,1),(4,'Mariusz','Sowa','1989-03-31','2016-10-22',3300.00,4),(5,'Mateusz','Kownacki','1998-09-24','2018-12-09',3100.00,3);


		#TABELA RODZAJ_USLUGI


-- Table structure for table `rodzaj_uslugi`


CREATE TABLE `rodzaj_uslugi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) NOT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `rodzaj_uslugi`

INSERT INTO `rodzaj_uslugi` VALUES (1,'analiza spalin',40.00),(2,'wymiana akumulatora',20.00),(3,'test hamulców na płytach rolkowych\r\n',50.00),(4,'wymiana klockow hamulcowych 2szt.',60.00),(5,'wymiana tarcz hamulcowych 2szt.',110.00),(6,'wymiana linki hamulca recznego',90.00),(7,'wymiana plynu hamulcowego',50.00),(8,'wymiana cewki zaplonowej',50.00),(9,'wymiana swiec zaplonowych',60.00),(10,'wymiana oleju z filtrem',30.00),(11,'wymiana rozrzadu',250.00),(12,'regulacja instalacji gazowej',45.00),(13,'lakierowanie',2000.00),(14,'naprawa wgniecenia',300.00),(15,'naprawa maski',2000.00);


		#TABELA STATUS_ZLECENIA


-- Table structure for table `status_zlecenia`

CREATE TABLE `status_zlecenia` (
  `id_statusu_zlecenia` int NOT NULL AUTO_INCREMENT,
  `nazwa_statusu_zlecenia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_statusu_zlecenia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `status_zlecenia`

INSERT INTO `status_zlecenia` VALUES (1,'zrealizowane'),(2,'w realizacji'),(3,'anulowane');


		#TABELA ZLECENIE
        

-- Table structure for table `zlecenie`

CREATE TABLE `zlecenie` (
  `id_zlecenia` int NOT NULL AUTO_INCREMENT,
  `pracownik_id` int NOT NULL,
  `klient_id` int NOT NULL,
  `data_przyjecia` date DEFAULT NULL,
  `data_zakonczenia` date DEFAULT NULL,
  `status_zlecenia` int NOT NULL,
  `rodzaj_uslugi_id` int NOT NULL,
  PRIMARY KEY (`id_zlecenia`),
  KEY `fk_pracownik_has_klient_klient1_idx` (`klient_id`),
  KEY `fk_pracownik_has_klient_pracownik1_idx` (`pracownik_id`),
  KEY `fk_zlecenie_2_status_zlecenia1_idx` (`status_zlecenia`),
  KEY `fk_zlecenie_2_rodzaj_uslugi1_idx` (`rodzaj_uslugi_id`),
  CONSTRAINT `fk_pracownik_has_klient_klient1` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`id`),
  CONSTRAINT `fk_pracownik_has_klient_pracownik1` FOREIGN KEY (`pracownik_id`) REFERENCES `pracownik` (`id`),
  CONSTRAINT `fk_zlecenie_2_rodzaj_uslugi1` FOREIGN KEY (`rodzaj_uslugi_id`) REFERENCES `rodzaj_uslugi` (`id`),
  CONSTRAINT `fk_zlecenie_2_status_zlecenia1` FOREIGN KEY (`status_zlecenia`) REFERENCES `status_zlecenia` (`id_statusu_zlecenia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `zlecenie`

INSERT INTO `zlecenie` VALUES (1,1,6,'2020-09-15','2020-09-28',1,10),(2,3,4,'2020-02-17','2020-02-26',1,11),(4,5,5,'2019-09-18','2019-10-03',1,14),(5,2,3,'2019-04-18','2019-04-29',1,8),(6,4,7,'2020-02-03','2020-02-17',1,12),(7,3,1,'2019-09-26','2019-10-12',1,7),(8,2,8,'2020-07-01','2020-07-06',3,2),(9,4,2,'2020-03-18','2020-03-24',1,12),(10,1,3,'2020-12-18',NULL,2,7),(14,5,1,'2020-12-23',NULL,2,13),(15,3,2,'2014-06-11','2014-06-23',1,6),(16,2,3,'2017-02-09',NULL,3,8);


		#WYZWALACZE

#1
DELIMITER //
CREATE TRIGGER zlecenie_before_insert
BEFORE INSERT ON zlecenie
FOR EACH ROW
BEGIN
  IF DATEDIFF(NEW.data_zakonczenia, NEW.data_przyjecia) < 0
  THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data zakonczenia nie moze byc wczesniejsza niz data przyjecia!';
  END IF;
END
//
DELIMITER ;

#2
DELIMITER //
CREATE TRIGGER rodzaj_uslugi_before_insert
BEFORE INSERT ON rodzaj_uslugi
FOR EACH ROW
BEGIN
  IF NEW.cena < 0
  THEN
     SET NEW.cena=0;
  END IF;
END
//
DELIMITER ;


		#PROCEDURA

DELIMITER $$
CREATE PROCEDURE podwyzka(IN id_pracownika INT, IN procent INT)
BEGIN
UPDATE pracownik SET pensja = (1+procent/100) * pensja WHERE id=id_pracownika;
END
$$
DELIMITER ;


		#FUNKCJA

DELIMITER //
CREATE FUNCTION ile_w_realizacji()
    RETURNS INTEGER
BEGIN
    DECLARE ile INT;
    SELECT COUNT(id_zlecenia) INTO @ile FROM zlecenie WHERE status_zlecenia=2;
    RETURN @ile;
END //


