/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     15/05/2018 23.42.58                          */
/*==============================================================*/
USE FP_MBD;

DROP TABLE IF EXISTS TRANSAKSI;

DROP TABLE IF EXISTS BOOKINGS;

DROP TABLE IF EXISTS KAMAR;

DROP TABLE IF EXISTS KAMAR_KOSONG;

DROP TABLE IF EXISTS PEGAWAI;

DROP TABLE IF EXISTS PELANGGAN;

DROP TABLE IF EXISTS TYPE_KAMAR;

DROP TABLE IF EXISTS HOTELS;

/*==============================================================*/
/* Table: HOTELS                                                */
/*==============================================================*/
CREATE TABLE HOTELS
(
   ID_HOTEL             CHAR(4) NOT NULL,
   RATING_HOTEL         VARCHAR(50),
   NAMA_HOTEL           VARCHAR(50),
   EMAIL_HOTEL          VARCHAR(50),
   ALAMAT_HOTEL         VARCHAR(100),
   URL_HOTEL            VARCHAR(50),
   PRIMARY KEY (ID_HOTEL)
);

/*==============================================================*/
/* Table: TYPE_KAMAR                                            */
/*==============================================================*/
CREATE TABLE TYPE_KAMAR
(
   ID_TYPE_KAMAR        CHAR(4) NOT NULL,
   DESKRIPSI_TYPE_KAMAR VARCHAR(50),
   HARGA_TYPE_KAMAR	INT,
   PRIMARY KEY (ID_TYPE_KAMAR)
);

/*==============================================================*/
/* Table: PEGAWAI                                               */
/*==============================================================*/
CREATE TABLE PEGAWAI
(
   ID_PEGAWAI           CHAR(4) NOT NULL,
   ID_HOTEL             CHAR(4) NOT NULL,
   NAMA_PEGAWAI         VARCHAR(50),
   ALAMAT_PEGAWAI       VARCHAR(100),
   TLP_PEGAWAI          VARCHAR(12),
   PRIMARY KEY (ID_PEGAWAI),
   FOREIGN KEY (ID_HOTEL) REFERENCES HOTELS (ID_HOTEL) ON DELETE CASCADE
);

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
CREATE TABLE PELANGGAN
(
   NO_PELANGGAN		INT,   
   ID_PELANGGAN         CHAR(4) NOT NULL,
   USERNAME_PELANGGAN	VARCHAR(50),
   PASSWORD_PELANGGAN	VARCHAR(50),
   NAMA_PELANGGAN       VARCHAR(50),
   ALAMAT_PELANGGAN     VARCHAR(100),
   TLP_PELANGGAN        VARCHAR(12),
   TGL_LAHIR            DATE,
   PRIMARY KEY (ID_PELANGGAN)
);

/*==============================================================*/
/* Table: KAMAR                                                 */
/*==============================================================*/
CREATE TABLE KAMAR
(
   NO_KAMAR             VARCHAR(4) NOT NULL,
   ID_TYPE_KAMAR        CHAR(4) NOT NULL,
   ID_HOTEL             CHAR(4) NOT NULL,
   RATING_KAMAR         VARCHAR(50),
   PRIMARY KEY (NO_KAMAR),
   FOREIGN KEY (ID_TYPE_KAMAR) REFERENCES TYPE_KAMAR(ID_TYPE_KAMAR) ON DELETE CASCADE,
   FOREIGN KEY (ID_HOTEL) REFERENCES HOTELS(ID_HOTEL) ON DELETE CASCADE
);

/*==============================================================*/
/* Table: BOOKINGS                                              */
/*==============================================================*/
CREATE TABLE BOOKINGS
(
   NO_BOOKING		INT,
   ID_BOOKING           CHAR(4) NOT NULL,
   NO_KAMAR             VARCHAR(4) NOT NULL,
   ID_PEGAWAI           CHAR(4) NOT NULL,
   ID_PELANGGAN         CHAR(4) NOT NULL,
   TGL_CHECKIN          DATE,
   TGL_CHECKOUT         DATE,
   STATUS_BOOKING       VARCHAR(50),
   PRIMARY KEY (ID_BOOKING),
   FOREIGN KEY (NO_KAMAR) REFERENCES KAMAR(NO_KAMAR) ON DELETE CASCADE,
   FOREIGN KEY (ID_PEGAWAI) REFERENCES PEGAWAI(ID_PEGAWAI) ON DELETE CASCADE,
   FOREIGN KEY (ID_PELANGGAN) REFERENCES PELANGGAN(ID_PELANGGAN) ON DELETE CASCADE
);

/*==============================================================*/
/* Table: KAMAR_KOSONG                                          */
/*==============================================================*/
CREATE TABLE KAMAR_KOSONG
(
   ID_HOTEL             CHAR(4) NOT NULL,
   ID_TYPE_KAMAR        CHAR(4) NOT NULL,
   JUMLAH_KAMAR_KOSONG  INT,
   FOREIGN KEY (ID_HOTEL) REFERENCES HOTELS(ID_HOTEL) ON DELETE CASCADE,
   FOREIGN KEY (ID_TYPE_KAMAR) REFERENCES TYPE_KAMAR(ID_TYPE_KAMAR) ON DELETE CASCADE
);

/*==============================================================*/
/* Table: TRANSAKSI                                          */
/*==============================================================*/
CREATE TABLE TRANSAKSI
(
   NO_TRANSAKSI		INT,   
   ID_TRANSAKSI         CHAR(4) NOT NULL,
   ID_BOOKING        	CHAR(4) NOT NULL,
   ID_PEGAWAI		CHAR(4) NOT NULL,
   CARA_PEMBAYARAN	VARCHAR(50),
   TOTAL_HARGA  	INT,
   TGL_TRANSAKSI	DATE,
   PRIMARY KEY (ID_TRANSAKSI),
   FOREIGN KEY (ID_BOOKING) REFERENCES BOOKINGS(ID_BOOKING) ON DELETE CASCADE,
   FOREIGN KEY (ID_PEGAWAI) REFERENCES PEGAWAI(ID_PEGAWAI) ON DELETE CASCADE
);

/*==============================================================*/
/* Data Table: HOTELS                                                */
/*==============================================================*/
INSERT INTO HOTELS VALUES
('H001','Bagus','Hotel Tidur Nyaman','hotel1@gmail.com','Mulyosari','www.tidurnyaman.com'),
('H002','Medium','Hotel Tedjo','tedjo@gmail.com','Jl Kwitang Raya 8 Ged Senatama Lt 3,Kwitang','www.tedjo.com'),
('H003','Bagus','Comfort Hotel','comfort@gmail.com','Jl Brigjen Katamso 29424','www.comfort.com'),
('H004','Bagus','Cosmos Hotel','cosmos@gmail.com','Jl. Komplek Gn Rahayu II No : 5','www.cosmos.com'),
('H005','Jelek','Pacific Tide Resort','pasific@gmail.com','Jl. Pondok Maritim II no 3','www.pasifictide.com'),
('H006','Jelek','Primal Temple Hotel','primal@gmail.com','Jl. Dinoyo Sekolahan gg 1','www.primaltemple.com'),
('H007','Medium','Noble Crown Hotel','noble@gmail.com','Jl. Keputih Perintis 5','www.noble.com'),
('H008','Bagus','Voyage Hotel','voyage@gmail.com','Jl. Keputih Perintis 4','www.voyage.com'),
('H009','Bagus','Ruby Mantle Resort','ruby@gmail.com','Jl. Raya Mulyosari 24','www.rubymantle.com'),
('H010','Medium','Riverside Gulf Resort','riverside@gmail.com','Jl. Ciputra 219','www.riverside.com'),
('H011','Medium','Olive Fjord Hotel','fjord@gmail.com','Jl. Manyar Selatan 21b','www.olivefjord.com'),
('H012','Medium','Sweet Dreams Hotel & Spa','sweetdream@gmail.com','Jl Jembatan Merah 15','www.sweetdreams.com'),
('H013','Bagus','Fantasy Resort','fantasy@gmail.com','Jl Tambak Langon 7','www.fantasy.com'),
('H014','Bagus','Triple Comfort Resort','tricomfort@gmail.com','Jl Dukuh Menanggal 124-126','www.triplecomfort.com'),
('H015','Bagus','Antique River Hotel','antiqriver@gmail.com','Jl Ketintang Baru 2 27','www.antiqueriver.com'),
('H016','Bagus','Tranquil Gulf Resort','tranquil@gmail.com','Jl Rajawali 26','www.tranquill.com'),
('H017','Bagus','Radiance Resort','radiance@gmail.com','Jl Raya Dukuh Kupang 139','www.radiance.com'),
('H018','Bagus','Seacoast Resort','seacoast@gmail.com','Jl Jend Basuki Rachmad 8-12','www.seacoast.com'),
('H019','Bagus','Jade Resort & Spa','jaderesort@gmail.com','Jl Gayung Kebonsari 56','www.jaderesort.com'),
('H020','Jelek','White Petal Resort','whitepetal@gmail.com','Jl Luntas 31','www.whitepetal.com'),
('H021','Jelek','Ebony Majesty Resort','ebonymajesty@gmail.com','Jl Undaan Kulon 45','www.ebonymajesty.com'),
('H022','Medium','Sunrise House Hotel','housesunrise@gmail.com','Jl Darmo Permai Tmr IV/18','www.sunrise.com'),
('H023','Jelek','Grand Pastures Hotel','pastures@gmail.com','Jl Indrapura 5','www.pastures.com'),
('H024','Jelek','Historic Pool Hotel','historicpool@gmail.com','Jl Kebalen Tmr','www.historicpool.com'),
('H025','Bagus','Sanctuary Hotel','sanctuary@gmail.com','Jl Kemayoran Baru 1','www.sanctuary.com'),
('H026','Bagus','Azure Meadows Resort','azure@gmail.com','Kompl Permata Juanda B/83-85','www.azure.com'),
('H027','Medium','Winter Paradise Resort','winterparadise@gmail.com','Jl Kedungdoro B-11/74','www.winterparadise.com'),
('H028','Bagus','Spare Time Hotel','sparetime@gmail.com','Jl Kedungdoro B-11/74','www.sparetime.com'),
('H029','Bagus','Autumn Tide Hotel & Spa','autumntide@gmail.com','Jl Kapasan','www.autumntide.com'),
('H030','Jelek','Cozy Hotel','cozy@gmail.com','Keputih','www.cozy.com');

/*==============================================================*/
/* Data Table: TYPE_KAMAR                                       */
/*==============================================================*/
INSERT INTO type_kamar VALUES
('T001','Ini kamar dengan fasilitas bintang 5',5000000),
('T002','Ini kamar dengan fasilitas bintang 4',3500000),
('T003','Ini kamar dengan fasilitas bintang 3',2000000),
('T004','Ini kamar dengan fasilitas bintang 2',1000000),
('T005','Ini kamar dengan fasilitas bintang 1',500000);

/*==============================================================*/
/* Data Table: KAMAR                                            */
/*==============================================================*/
INSERT INTO KAMAR VALUES 
('K001','T001','H001','5'),
('K002','T002','H022','4'),
('K003','T003','H004','2'),
('K004','T004','H005','3'),
('K005','T005','H007','1'),
('K006','T001','H012','5'),
('K007','T002','H006','5'),
('K008','T003','H009','4'),
('K009','T004','H004','4'),
('K010','T005','H009','4'),
('K011','T001','H016','4'),
('K012','T002','H024','3'),
('K013','T003','H030','3'),
('K014','T004','H027','2'),
('K015','T005','H029','1'),
('K016','T001','H026','4'),
('K017','T002','H028','5'),
('K018','T003','H019','3'),
('K019','T004','H017','3'),
('K020','T005','H016','3'),
('K021','T001','H021','1'),
('K022','T002','H020','3'),
('K023','T003','H010','3'),
('K024','T004','H001','1'),
('K025','T005','H008','1'),
('K026','T001','H002','3'),
('K027','T002','H008','2'),
('K028','T003','H003','3'),
('K029','T004','H006','4'),
('K030','T005','H003','5');


/*==============================================================*/
/* Data Table: KAMAR_KOSONG                                     */
/*==============================================================*/
INSERT INTO KAMAR_KOSONG VALUES 
('H001','T001','0'),
('H002','T002','2'),
('H003','T005','5'),
('H004','T005','1'),
('H005','T002','7'),
('H006','T003','7'),
('H007','T005','3'),
('H008','T004','9'),
('H009','T004','11'),
('H010','T004','1'),
('H011','T001','4'),
('H012','T001','8'),
('H013','T002','8'),
('H014','T004','2'),
('H015','T005','3'),
('H016','T002','5'),
('H017','T004','8'),
('H018','T003','4'),
('H019','T002','7'),
('H020','T001','4'),
('H021','T001','7'),
('H022','T001','0'),
('H023','T003','11'),
('H024','T002','12'),
('H025','T002','8'),
('H026','T003','9'),
('H027','T002','2'),
('H028','T003','4'),
('H029','T004','6'),
('H030','T001','8');


/*==============================================================*/
/* Data Table: PEGAWAI                                               */
/*==============================================================*/
INSERT INTO PEGAWAI VALUES 
('P001','H001','Rudy','Keputih gang 3c','085735096658'),
('P002','H002','Alex','Keputih gang 3c','081655478265'),
('P003','H003','Denny','Keputih perintis gang 3','087544266395'),
('P004','H004','Denden','Keputih perintih gang 4','085963321478'),
('P005','H005','Rengga','Bumi marina mas','085174123369'),
('P006','H006','Jere','Mulyosari','085789456123'),
('P007','H007','Manurung','Jl Indrapura 5','058162359482'),
('P008','H008','Harrizon','Jl Rajawali 26','085236147258'),
('P009','H009','Johnny','Jl Waspada 39 B Kav 20','081259263258'),
('P010','H010','Khawari','Jl Gadung 1','087456123025'),
('P011','H011','Purnomo','Jl Luntas 31','085677895203'),
('P012','H012','Fariz','Jl Rajawali 26','084265269263'),
('P013','H013','Deddy','Jl Songoyudan 77','089655955355'),
('P014','H014','Dendy','Jl Songoyudan 77','089744155255'),
('P015','H015','Sena','Jl Embong Malang 77 C','087444111333'),
('P016','H016','Dito','Keputih gang 3c','888555222666'),
('P017','H017','Magda','Jl Embong Malang 77 C','111222333444'),
('P018','H018','Dilla','Keputih gang 3c','159263487102'),
('P019','H019','Lala','Jl Embong Malang 77 C','085755366955'),
('P020','H020','Kusuma','Jl Raya Rungkut 5 Bl I/27','089369258147'),
('P021','H021','Darke','Jl Raya Rungkut 5 Bl I/27','055755622550'),
('P022','H022','Ariiq','Jl Rajawali 3','888999777444'),
('P023','H023','Fasma','Jl Kemayoran Baru 1','014258369147'),
('P024','H024','Michael','Jl Kemayoran Baru 1','159263487025'),
('P025','H025','Rizky','Jl Mayjen Sungkono 236','058269369147'),
('P026','H026','Febian','Jl Jend Basuki Rachmad 8-12','087551482365'),
('P027','H027','Awsi','Jl Songoyudan 77','088555666222'),
('P028','H028','Patrick','Jl Embong Malang 77 C','089147025036'),
('P029','H029','Samuel','Jl Manyar Kertoarjo 48','099666333222'),
('P030','H030','Taufiq','Jl Kalianak Tmr 179','777888555444');

/*==============================================================*/
/* Data Table: PELANGGAN                                        */
/*==============================================================*/
INSERT INTO PELANGGAN VALUES
(1,'G001','adam','1d7c2923c1684726dc23d2901c4d8157','Adam','Jl Perak Tmr 260','073299974840','1987/06/06'),
(2,'G002','warlock','3398cb46ef96da5aad6ff70e60b98787','Warlock','Jl Raya Dukuh Kupang 139','06207822109','1992/02/09'),
(3,'G003','raldo','5a8ad4f86c3244b1b60e0249edd619da','Raldo','Jl Ketintang Madya 92','030431447580','1987/03/10'),
(4,'G004','tamtam','b2a6b584ad9718b09de509c50d868412','Tamtam','Jl Tambaksari','044018175311','1993/02/24'),
(5,'G005','ibrahim','f1c083e61b32d3a9be76bc21266b0648','Ibrahim','Perum YKP PS Bl II-F/44','0210048833','1971/09/28'),
(6,'G006','alfian','64fc0802fbae681ee55a9a4b87f0aec7','Alfian','Jl Bukit Darmo Raya Diklat PU','02087970498','1987/12/19'),
(7,'G007','edo','d2d612f72e42577991f4a5936cecbcc0','Edo','Jl Tl Kumai Tmr 67','08238772514','1987/06/07'),
(8,'G008','frand','693688ccaefd99960eae1b6668b9cd58','Frand','Jl Kedungdoro B-11/74','07405843126','1998/02/09'),
(9,'G009','mala','7c42f80240d018223a59c64bde548d08','Mala','Jl Kembang Jepun 100','09676379219','1999/04/16'),
(10,'G010','ais','c870df65329c90310ca53a8391509feb','Ais','Jl Bunguran 45','0897641405','1989/06/11'),
(11,'G011','muhammad','a7777999e260290f68a1455cacdabf6c','Muhammad','Jl Rajawali 30','088703861960','1983/12/13'),
(12,'G012','via','14f1f9729a8142e82600dac241e82fe2','Via','Jl Gadung 1','02722888399','1991/07/19'),
(13,'G013','jessie','056f2914fd9a607d48f5491a53b4deb5','Jessie','Jl Jaksa Agung Suprapto 10','099661064477','1984/06/06'),
(14,'G014','katty','530680663c78187208c10de5f4013e6a','Katty','Jl Undaan Kulon 45','087045776100','1962/06/14'),
(15,'G015','rodjer','dba19a44b534431789cde55f92da881b','Rodjer','Jl Kalimas Baru 31 A','068545698478','2001/02/26'),
(16,'G016','teja','19edacd33ab84209efc96eb76f578f38','Teja','Jl Luntas 31','08730202020','2001/02/27'),
(17,'G017','raden','abfcb403ed9493372a4295b70410f1c0','Raden','Jl Raya Rungkut 5 Bl I/27','080507040938','1999/02/26'),
(18,'G018','tirta','0032df3d63d43dffea93a0d0fc1744cc','Tirta','Jl Undaan Kulon 45','06416197468','2000/02/26'),
(19,'G019','rasyid','bae46ce6405d58fec5eb87a145248a16','Rasyid','Jl Kalimas Baru 31 A','064346346990','2001/02/26'),
(20,'G020','dawin','498902b8c464960bc0970cc07630cc52','Dawin','Jl Tambaksari','09800452142','1997/02/26'),
(21,'G021','amer','8db1b09d6cb44d4150b68a5310688024','Amer','Jl Luntas 40','039421910556','1998/02/22'),
(22,'G022','kuro','53861aa015b53456915f6a6ccf8456f5','Kuro','Jl Jaksa Agung Suprapto 10','069211645271','1990/12/21'),
(23,'G023','maroun','07dec5b8ddc1b13a45dbba58b7fdbe99','Maroun','Jl Kedungdoro B-11/74','021513667597','1991/11/12'),
(24,'G024','artreus','3e9229a7eb9e5411de761e25cc3c2637','Artreus','Jl Kapas Krampung 49','07656569192','1995/03/25'),
(25,'G025','shanks','7341b5e7c789c1cb68870d50075f3294','Shanks','Jl Kupang Jaya 1','04018748063','1990/01/17'),
(26,'G026','vova','9804f858419594400647c354a1d8d235','Vova','Jl Songoyudan 70','070052138513','1991/08/19'),
(27,'G027','desta','b2e7247ec64e0f7840538698b5146ab8','Desta','Jl Songoyudan 77','02165646538','1990/09/12'),
(28,'G028','sulu','31bfcc2e7ad347cfd3295f6dba5f3f13','Sulu','Jl Gadung 10','028452768601','1987/05/19'),
(29,'G029','vincent','b15ab3f829f0f897fe507ef548741afb','Vincent','Jl Kupang Jaya 12','03682248743','1990/04/10'),
(30,'G030','diana','3a23bb515e06d0e944ff916e79a7775c','Diana','Jl Embong Malang 77 D','07480505618','1991/03/11');




/*==============================================================*/
/* Data Table: BOOKINGS                                              */
/*==============================================================*/
INSERT INTO BOOKINGS VALUES
(1,'B001','K001','P001','G001','2018/07/24','2018/07/30','ACC'),
(2,'B002','K001','P001','G002','2018/12/25','2018/12/30','ACC'),
(3,'B003','K001','P003','G004','2018/01/14','2018/01/20','ACC'),
(4,'B004','K001','P003','G006','2018/02/01','2018/02/02','ACC'),
(5,'B005','K001','P002','G007','2018/03/12','2018/03/15','CANCEL'),
(6,'B006','K001','P001','G008','2018/04/22','2018/04/23','ACC'),
(7,'B007','K001','P005','G009','2018/05/02','2018/05/05','ACC'),
(8,'B008','K002','P006','G010','2018/02/12','2018/02/16','CANCEL'),
(9,'B009','K002','P010','G003','2018/03/16','2018/03/17','CANCEL'),
(10,'B010','K002','P011','G005','2018/04/17','2018/04/19','CANCEL'),
(11,'B011','K002','P023','G011','2018/05/09','2018/05/11','ACC'),
(12,'B012','K002','P009','G012','2018/09/08','2018/09/10','ACC'),
(13,'B013','K002','P011','G013','2018/08/19','2018/08/21','ACC'),
(14,'B014','K002','P010','G014','2018/06/13','2018/06/17','ACC'),
(15,'B015','K003','P010','G015','2018/06/24','2018/06/25','ACC'),
(16,'B016','K003','P005','G016','2018/02/24','2018/02/27','ACC'),
(17,'B017','K003','P005','G017','2018/03/21','2018/03/22','CANCEL'),
(18,'B018','K003','P005','G018','2018/12/27','2018/12/29','CANCEL'),
(19,'B019','K003','P006','G019','2018/12/24','2018/12/30','CANCEL'),
(20,'B020','K003','P007','G020','2018/12/22','2018/12/30','ACC'),
(21,'B021','K003','P008','G021','2018/12/28','2018/12/30','ACC'),
(22,'B022','K004','P009','G022','2018/12/13','2018/12/30','ACC'),
(23,'B023','K004','P003','G023','2018/12/21','2018/12/30','ACC'),
(24,'B024','K004','P014','G024','2018/09/15','2018/09/22','ACC'),
(25,'B025','K004','P013','G025','2018/02/16','2018/02/19','ACC'),
(26,'B026','K004','P017','G026','2018/01/07','2018/01/12','ACC'),
(27,'B027','K004','P019','G027','2018/01/08','2018/01/10','ACC'),
(28,'B028','K005','P020','G028','2018/01/09','2018/01/10','ACC'),
(29,'B029','K005','P030','G029','2018/02/12','2018/02/15','ACC'),
(30,'B030','K005','P029','G030','2018/08/11','2018/08/15','CANCEL'),
(31,'B031','K005','P028','G001','2018/08/11','2018/08/15','CANCEL'),
(32,'B032','K005','P027','G002','2018/08/24','2018/08/29','ACC'),
(33,'B033','K005','P025','G003','2018/08/24','2018/08/29','ACC'),
(34,'B034','K005','P025','G004','2018/08/24','2018/08/29','ACC'),
(36,'B036','K005','P025','G004','2018/05/24','2018/05/26','ACC');


/*==============================================================*/
/* Data Table: TRANSAKSI                                        */
/*==============================================================*/
INSERT INTO TRANSAKSI VALUES
(1,'T001','B001','P001','Transfer','20000000','2018/07/30'),
(2,'T002','B002','P002','Cash','10000000','2018/12/30'),
(3,'T003','B004','P003','Cash','5000000','2018/02/02'),
(4,'T004','B005','P003','Transfer','20000000','2018/03/15'),
(5,'T005','B007','P005','Cash','2500000','2018/05/05'),
(6,'T006','B001','P007','Cash','3000000','2018/07/30'),
(7,'T007','B003','P009','Cash','5000000','2018/01/20'),
(8,'T008','B019','P010','Transfer','4500000','2018/12/30'),
(9,'T009','B006','P011','Cash','1500000','2018/04/23'),
(10,'T010','B010','P021','Cash','2000000','2018/04/19'),
(11,'T011','B022','P015','Cash','6500000','2018/12/30'),
(12,'T012','B020','P014','Cash','3500000','2018/12/30'),
(13,'T013','B026','P006','Transfer','3000000','2018/01/12'),
(14,'T014','B029','P009','Cash','1000000','2018/02/15'),
(15,'T015','B013','P010','Cash','8000000','2018/08/21'),
(16,'T016','B009','P015','Transfer','5000000','2018/03/17'),
(17,'T017','B018','P012','Cash','2600000','2018/12/29'),
(18,'T018','B015','P012','Cash','1500000','2018/06/25'),
(19,'T019','B036','P012','Cash','1500000','2018/02/24');

-- Ariiq
-- 1
CREATE OR REPLACE VIEW pegawai_hotel AS
SELECT pegawai.`ID_PEGAWAI`, pegawai.`NAMA_PEGAWAI`, hotels.`ID_HOTEL`, hotels.`NAMA_HOTEL`
FROM pegawai JOIN hotels ON pegawai.`ID_HOTEL` = hotels.`ID_HOTEL`;
-- 2
DELIMITER $$
CREATE OR REPLACE PROCEDURE diskon_ultah(id_pel CHAR(4),id_trans CHAR(4))
BEGIN
    DECLARE tgl_ultah DATE;
    DECLARE bln_ultah DATE;
    SELECT DAY(pelanggan.`TGL_LAHIR`), MONTH(pelanggan.`TGL_LAHIR`)
    INTO tgl_ultah, bln_ultah
    FROM pelanggan
    WHERE pelanggan.`ID_PELANGGAN` = id_pel;
    UPDATE transaksi
    SET transaksi.`TOTAL_HARGA` = transaksi.`TOTAL_HARGA`*0.97
    WHERE transaksi.`ID_BOOKING` = id_trans AND DAY(transaksi.TGL_TRANSAKSI) = tgl_ultah AND MONTH(transaksi.TGL_TRANSAKSI) = bln_ultah;
END $$
DELIMITER$$

CALL diskon_ultah('G004','B036');

-- 3
CREATE TABLE BOOKINGS_LOG
(
   ID_BOOKING           VARCHAR(4) NOT NULL,
   NO_KAMAR             VARCHAR(4) NOT NULL,
   ID_PEGAWAI           VARCHAR(4) NOT NULL,
   ID_PELANGGAN         VARCHAR(4) NOT NULL,
   TGL_CHECKIN            DATE,
   TGL_CHECKOUT          DATE,
   STATUS_BOOKING       VARCHAR(50),
   STATUS_NEW		VARCHAR(50),
   TGL_UPDATE		DATE
);

DELIMITER$$
CREATE OR REPLACE TRIGGER booking_insert
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
  INSERT INTO bookings_log VALUES (new.ID_BOOKING , new.NO_KAMAR, new.ID_PEGAWAI , new.ID_PELANGGAN, new.TGL_CHECKIN, new.TGL_CHECKOUT  , new.STATUS_BOOKING, NULL , SYSDATE());
END$$
DELIMITER$$

DELIMITER$$
CREATE OR REPLACE TRIGGER booking_update
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
  INSERT INTO bookings_log VALUES (old.ID_BOOKING , old.NO_KAMAR, old.ID_PEGAWAI , old.ID_PELANGGAN, old.TGL_CHECKIN, old.TGL_CHECKOUT  , old.STATUS_BOOKING, new.STATUS_BOOKING , SYSDATE());
END$$
DELIMITER$$

-- 4
DELIMITER $$
CREATE OR REPLACE FUNCTION jumlah_booking_hotel(id_pelanggan CHAR(4), id_hotel CHAR(4))
    RETURNS INT
    DETERMINISTIC
    BEGIN
    DECLARE jml INT;
    SELECT COUNT(bookings.`ID_BOOKING`) AS Total_Booking INTO jml
    FROM pegawai JOIN bookings ON pegawai.`ID_PEGAWAI` = bookings.`ID_PEGAWAI` AND pegawai.`ID_HOTEL` = id_hotel AND bookings.`ID_PELANGGAN` = id_pelanggan;
    RETURN jml;
    END$$
DELIMITER$$

SELECT DISTINCT jumlah_booking_hotel('G001','H001') AS Jumlah_Kamar;

-- 5
CREATE OR REPLACE INDEX idx_hotel ON hotels(NAMA_HOTEL);

-- 6
SELECT hotels.`NAMA_HOTEL`, type_kamar.`DESKRIPSI_TYPE_KAMAR`, kamar_kosong.`JUMLAH_KAMAR_KOSONG`
FROM hotels JOIN kamar_kosong ON hotels.`ID_HOTEL` = kamar_kosong.`ID_HOTEL` AND kamar_kosong.`JUMLAH_KAMAR_KOSONG` > 0
JOIN type_kamar ON kamar_kosong.`ID_TYPE_KAMAR` = type_kamar.`ID_TYPE_KAMAR`;

-- 7
DELIMITER $$
CREATE OR REPLACE PROCEDURE denda(id_trans CHAR(4), tgl_out DATE)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id CHAR(4);
    DECLARE jml INT;
    DECLARE harga INT;
    DECLARE pel_denda CURSOR FOR SELECT transaksi.`ID_TRANSAKSI`, DATEDIFF(tgl_out,bookings.`TGL_CHECKOUT`), type_kamar.`HARGA_TYPE_KAMAR` 
    FROM transaksi JOIN bookings ON transaksi.`ID_BOOKING` = bookings.`ID_BOOKING` JOIN kamar ON bookings.`NO_KAMAR` = kamar.`NO_KAMAR` JOIN type_kamar ON kamar.`ID_TYPE_KAMAR` = type_kamar.`ID_TYPE_KAMAR` AND DATEDIFF(tgl_out,bookings.`TGL_CHECKOUT`) > 0 AND bookings.`ID_BOOKING` = id_trans;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN pel_denda;
    
    read_loop: LOOP
	
	FETCH pel_denda INTO id, jml, harga;
	
	IF done THEN
		LEAVE read_loop;
	END IF;
	
	UPDATE transaksi
	SET transaksi.`TOTAL_HARGA` = transaksi.`TOTAL_HARGA` + (harga * jml)
	WHERE transaksi.`ID_BOOKING` = id_trans;	
	
	END LOOP;
	
	CLOSE pel_denda;
END $$
DELIMITER$$

CALL denda('B036','2018-05-28');

-- Teja
-- 1
CREATE OR REPLACE VIEW pelanggan_booking AS
SELECT pelanggan.`ID_PELANGGAN`, pelanggan.`NAMA_PELANGGAN`, bookings.`ID_BOOKING`, bookings.`NO_KAMAR`, bookings.`TGL_CHECKIN`, bookings.`TGL_CHECKOUT`, bookings.`STATUS_BOOKING`
FROM pelanggan JOIN bookings ON pelanggan.`ID_PELANGGAN` = bookings.`ID_PELANGGAN`;
-- 2
DELIMITER $$
CREATE OR REPLACE PROCEDURE diskon_hari(id_book CHAR(4))
BEGIN
    DECLARE dm DATE;
    DECLARE dk DATE;
    SELECT bookings.`TGL_CHECKIN`, bookings.`TGL_CHECKOUT`
    INTO dm, dk
    FROM bookings
    WHERE bookings.`ID_BOOKING` = id_book;
    UPDATE transaksi
    SET transaksi.`TOTAL_HARGA` = transaksi.`TOTAL_HARGA`*0.95
    WHERE transaksi.`ID_BOOKING` = id_book AND DATEDIFF(dk,dm) >4;
END $$
DELIMITER$$

CALL diskon_hari('B001');

-- 3
CREATE TABLE PEGAWAI_LOG
(
   ID_PEGAWAI           VARCHAR(4) NOT NULL,
   ID_HOTEL             VARCHAR(4) NOT NULL,
   NAMA_PEGAWAI         VARCHAR(50),
   ALAMAT_PEGAWAI       VARCHAR(100),
   TLP_PEGAWAI          VARCHAR(12),
   TGL_DISCHARGE	DATE
);

DELIMITER$$
CREATE OR REPLACE TRIGGER pegawai_discharge
AFTER DELETE ON pegawai
FOR EACH ROW
BEGIN
  INSERT INTO pegawai_log VALUES (old.ID_PEGAWAI, old.ID_HOTEL, old.NAMA_PEGAWAI, old.ALAMAT_PEGAWAI, old.TLP_PEGAWAI, SYSDATE());
END$$
DELIMITER$$

DELETE FROM pegawai WHERE pegawai.id_pegawai='P001';

-- 4
DELIMITER $$
CREATE OR REPLACE FUNCTION jumlah_kamar(id_hotel CHAR(4))
    RETURNS INT
    DETERMINISTIC
    BEGIN
    DECLARE jml INT;
    SELECT COUNT(kamar.`NO_KAMAR`) AS Total_Kamar INTO jml
    FROM kamar JOIN hotels ON kamar.`ID_HOTEL` = hotels.`ID_HOTEL` AND hotels.`ID_HOTEL` = id_hotel;
    RETURN jml;
    END$$
DELIMITER$$

SELECT DISTINCT jumlah_kamar('H001') AS Jumlah_Kamar;

-- 5
CREATE OR REPLACE INDEX idx_pegawai ON pegawai(NAMA_PEGAWAI);

-- 6
SELECT pelanggan.`NAMA_PELANGGAN`, hotels.`NAMA_HOTEL`, hotels.`ALAMAT_HOTEL`
FROM pelanggan JOIN bookings ON pelanggan.`ID_PELANGGAN` = bookings.`ID_PELANGGAN` AND DAY(bookings.`TGL_CHECKIN`) = 25 AND MONTH(bookings.`TGL_CHECKIN`) = 12
JOIN pegawai ON bookings.`ID_PEGAWAI` = pegawai.`ID_PEGAWAI`
JOIN hotels ON pegawai.`ID_HOTEL` = hotels.`ID_HOTEL`;

-- 7
DELIMITER $$
CREATE OR REPLACE PROCEDURE T001_min()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id CHAR(4);
    DECLARE kamar_T001 CURSOR FOR SELECT type_kamar.`ID_TYPE_KAMAR` FROM type_kamar WHERE type_kamar.`ID_TYPE_KAMAR` = 'T001';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN kamar_T001;
    
    read_loop: LOOP
	
	FETCH kamar_T001 INTO id;
	
	IF done THEN
		LEAVE read_loop;
	END IF;
	
	UPDATE type_kamar
	SET type_kamar.`HARGA_TYPE_KAMAR` = type_kamar.`HARGA_TYPE_KAMAR` * 0.9
	WHERE type_kamar.`ID_TYPE_KAMAR` = id;	
	
	END LOOP;
	
	CLOSE kamar_T001;
END $$
DELIMITER$$

CALL T001_min();
