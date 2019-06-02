-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.14 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for resepmasakan
CREATE DATABASE IF NOT EXISTS `resepmasakan` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `resepmasakan`;


-- Dumping structure for table resepmasakan.jenis_resep
CREATE TABLE IF NOT EXISTS `jenis_resep` (
  `kode_jenis_resep` varchar(3) NOT NULL DEFAULT '',
  `jenis_resep` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_jenis_resep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table resepmasakan.jenis_resep: ~6 rows (approximately)
DELETE FROM `jenis_resep`;
/*!40000 ALTER TABLE `jenis_resep` DISABLE KEYS */;
INSERT INTO `jenis_resep` (`kode_jenis_resep`, `jenis_resep`) VALUES
	('j1', 'Sambal'),
	('j2', 'Sayur'),
	('j3', 'Nasi'),
	('j4', 'Tumis'),
	('j5', 'Tahu'),
	('j6', 'Tempe'),
	('j7', 'Lainnya');
/*!40000 ALTER TABLE `jenis_resep` ENABLE KEYS */;


-- Dumping structure for table resepmasakan.resep
CREATE TABLE IF NOT EXISTS `resep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_resep` varchar(4) NOT NULL DEFAULT '',
  `nama_resep` varchar(100) DEFAULT NULL,
  `kode_jenis_resep` varchar(3) DEFAULT NULL,
  `alat_resep` text,
  `bahan_resep` text,
  `cara_olah_resep` text,
  `foto_resep` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_resep`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- Dumping data for table resepmasakan.resep: ~34 rows (approximately)
DELETE FROM `resep`;
/*!40000 ALTER TABLE `resep` DISABLE KEYS */;
INSERT INTO `resep` (`id`, `kode_resep`, `nama_resep`, `kode_jenis_resep`, `alat_resep`, `bahan_resep`, `cara_olah_resep`, `foto_resep`) VALUES
	(1, 'r1', 'Sambal Terasi', 'j1', 'Layah|Uleg|Wajan', 'Cabe secukupnya|Tomat beberapa butir|Terasi secukupnya|Bawang Merah|Bawang Putih|Minyak Goreng', 'Pertama bersihkan semua bahan, kemudian iris menjadi kecil-kecil semua bahan kecuali cabe. Setelah itu panaskan wajan dan beri sedikit minyak goreng.\r\nMasukkan terasi ke dalam wajan, tunggu sebentar kemudian masukkan semua bahan ke dalam wajan. Goreng hingga semua bahan kelihatan agak kecoklatan dan kemudian tiriskan dan masukkan ke dalam layah.\r\nSetelah itu tinggal haluskan semua bahan.', NULL),
	(20, 'r10', 'Sambal Cibiuk', 'j1', 'Wajan|\r\nUleg', '5 buah cabe rawit merah|\r\n1 cm kencur|\r\n1 siung bawang putih uk. kecil|\r\n1 buah tomat merah|\r\nGula merah sesuai selera|\r\nGaram secukupnya|\r\nDaun Kemangi|\r\n1 sdt asam Jawa', 'Uleg semua bahan hinhgga halus lalu tambahkan daun kemangi dan air asam Jawa. Penyet-penyer dan aduk rata, sajikan.', 'sambal-cibiuk.jpg'),
	(21, 'r11', 'Sambal Penyet', 'j1', 'Uleg|\r\nWajan|\r\nLayah', '10 buah cabe rawit|\r\n3 buah cabe merah besar|\r\n1 buat tomat|\r\n2 siung bawang putih|\r\n1 sdt teh gula merah|\r\n1/2 sendok teh garam|\r\nMinyak goreng', 'Cabe merah, cabe rawit, tomat dan bawang putih digoreng dalam minyak panas hingga layu dan matang.\r\n\r\nAngkat lalu ulek hingga halus, beri garam dan gula merah lalu aduk rata.', 'sambal-penyet.jpg'),
	(23, 'r12', 'Sambal Penyet Terasi', 'j1', 'Wajan|\r\nUleg|\r\nLayah|', '10 buah cabe merah keriting, goreng|\r\n3 butir bawang putih, goreng|\r\n1 buah tomat ukuran besar, goreng|\r\n1 sdm terasi matang|\r\n1 sdm gula merah|\r\n1/2 sdt garam', 'Masukkan semua bahan sambal dalam cobek lalu uleg hingga halus.\r\n\r\nLetakkan ayam goreng atau tempe goreng di atas sambal lalu dipenyet-penyet.', 'sambal-penyet-terasi.jpg'),
	(24, 'r13', 'Sambal Penyet Tumis Mentega', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '10 buah cabe merah besar, potong-potong besar|\r\n10 buah cabe rawit merah|\r\n2 buah tomat, belah empat|\r\n3 butir bawang merah|\r\n1 siung bawang putih|\r\n1 sdt air asam jawa|\r\n1 sdt air asam jawa|\r\n1 sdm gula merah|\r\ngaram secukupnya|\r\nmentega atau margarin untuk menumis', 'Panaskan margarin, tumis sambal penyet dengan margarin hingga matang.\r\n\r\nAngkat dan tiriskan kemudian ulek sampai lembut.', 'sambal-penyet-enak-tumis-mentega.jpg'),
	(26, 'r14', 'Sambal Penyet Mangga', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '200 gram mangga mengkal, iris korek api halus|\r\n1 sendok teh air jeruk nipis|\r\nHaluskan : |\r\n5 buah cabe rawit merah, goreng|\r\n5 buah cabe rawit hijau, goreng|\r\n8 buah cabe merah keriting, goreng|\r\n3 buah bawang merah, goreng|\r\n1 sendok teh terasi, goreng|\r\n1/4 sendok teh garam|\r\n1/8 sendok teh gula pasir', 'Ulek cabe rawit, cabe merah keriting, bawang merah, terasi, garam dan gula pasir.\r\n\r\nTambahkan mangga dan air jeruk nipis. Aduk rata.', 'sambal-penyet-mangga.jpg'),
	(27, 'r15', 'Sabal Rebus Cabe Rawit', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '1 buah tomat merah besar|\r\n10 buah cabai rawit|\r\n1 siung bawang putih|\r\n2 butir bawang merah|\r\n1/4 sdt garam|\r\n1/4 sdt penyedap rasa (ajinomoto)|\r\n1/2 sdt gula putih|\r\n200 ml air untuk merebus', 'Rebus semua bahan hingga matang kecuali garam, gula dan penyedap. Angkat dan tiriskan.\r\n\r\nUlek sampai lembut, beri garam, gula dan penyedap, aduk rata dan siap disajikan.', 'sambal-rebus-cabe-rawit.jpg'),
	(28, 'r16', 'Sambal Oncom', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '200 gram oncom, remas-remas agar hancur|\r\n1 batang serai|\r\n3 lembar daun jeruk|\r\n1 sdt garam|\r\n1/2 sdt merica|\r\n1 sdt gula pasir|\r\n1 ikat daun kemangi, siangi|\r\n4 sdm minyak untuk menumis|\r\npetai jika suka|\r\nBumbu Iris : |\r\n3 siung bawang putih|\r\n2 buah cabe merah besar|\r\n10 buah cabe rawit', 'Panaskan minyak, tumis bumbu yang diiris, daun jeruk, serai dan petai hingga harum. Masukkan oncom, garam, gula dan merica lalu aduk rata.\r\n\r\nMasak hingga bumbu meresap, kemudian tambahkan daun kemangi, angkat dan sajikan.', 'sambal-oncom.jpg'),
	(29, 'r17', 'Sambal Care Rawit Rebus', 'j1', 'Panci|\r\nUleg|\r\nLayah', '10 butir cabe rawit merah|\r\n2 buah tomat merah ukuran sedang|\r\n2 butir bawang merah|\r\n1 siung bawang putih|\r\n1 sdt gula merah|\r\ngaram secukupnya|\r\n200 ml air|\r\n2 sdm minyak goreng', 'Rebus semua bahan dan masukkan minyaknya, masak hingga air hampir habis.\r\n\r\nAngkat dan ulek, beri garam dan gula secukupnya lalu aduk rata dan siap untuk dihidangkan.', ''),
	(30, 'r18', 'Sambal Petai', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '2 papan petai, buka kulit, belah dua|\r\n6 butir cabai merah besar|\r\n2 siung bawang putih|\r\n4 butir cabai rawit merah|\r\n2 butir kemiri|\r\n1 sdt gula merah|\r\n50 ml air|\r\n1/2 sdt garam|\r\nminyak untuk menumis', 'Haluskan atau ulek semua bumbu hingga benar-benar halus.\r\n\r\nPanaskan minyak, tumis bumbu halus hingga harum lalu masukkan petai. Aduk rata dan masak hingga petai agak layu.\r\n\r\nTuang sedikit air, beri garam secukupnya lalu aduk rata dan masak hingga sambal mengental, angkat dan siap sajikan.', 'sambal-pete.jpg'),
	(31, 'r19', 'Sambal Terasi 2', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '10 buah cabai rawit hijau dan merah|\r\n10 buah cabai keriting merah|\r\n1 sdm terasi|\r\n3 butir bawang merah|\r\n2 siung bawang putih|\r\n1 sdm gula merah|\r\n1/2 sdt garam|\r\n100 ml air|\r\n1 cm lengkuas, memarkan|\r\n1 lembar daun salam|\r\n1 buah tomat, iris tipis|\r\n1 sdm minyak goreng', 'Semua bahan kecuali daun salam, lengkuas dan tomat diulek dan tidak terlalu halus.\r\n\r\nPanaskan minyak, tumis bahan yang dihaluskan beserta daun salam, lengkuas dan irisan tomat hingga harum lalu beri air. Aduk rata dan masak hingga mendidih dan kuah sambalnya mengental.', 'sambal-terasi.jpg'),
	(2, 'r2', 'Sambal Terong Balado Ikan Teri dan Petai', 'j1', 'Layah|Uleg|Wajan', '500 gram terung ungu, belah dua, potong-potong|50 gram ikan teri, cuci bersih|2 papan petai, kupas, belah dua|3 butir bawang merah, iris tipis|3 siung bawang putih, iris tipis|2 buah tomat ukuran sedang, iris-iris|gula dan penyedap rasa secukupnya (sasa, masako atau ajinomoto) sesuai selera|sedikit air masak|minyak untuk menumis dan menggoreng|Haluskan - 6 buah cabai merah keriting - 4 buah cabai rawit merah - garam secukupnya', 'Panaskan minyak, goreng terong hingga kering kecoklatan. Angkat dan tiriskan, sisihkan.\r\n\r\nPanaskan sedikit minyak (2-3 sdm), tumis bawang merah dan bawang putih hingga wangi. Masukkan berurutan, ikan teri lalu aduk sebentar, masukkan petai, aduk lalu masukkan bumbu halus dan irisan tomat, aduk rata.\r\n\r\nTuang sedikit air, beri gula dan penyedap jika suka, aduk rata. Masukkan terong, aduk kembali hingga rata lalu angkat dan sajikan.', 'sambal_terong_balado_ikan_teri_dan_petai.jpg'),
	(32, 'r20', 'Sambal Tomat Jawa', 'j1', 'Uleg|\r\nLayah', '10 buah cabe merah|\r\n3 butir bawang merah|\r\n3 siung bawang Putih|\r\n1 buah tomat|\r\n1 sdt terasi|\r\n1/2 sdt garam|\r\n1/2 sdt gula|\r\n1 sdm gula merah|\r\n1 buah jeruk limau', 'Goreng semua bahan kecuali garam, gula, gula merah dan jeruk limau sampai layu. Haluskan dengan ulekan, setelah halus, beri garam, gula, gula merah, aduk. Setelah semuanya tercampur, beri perasan air jeruk limau.', 'sambel-tomat-jawa.jpg'),
	(33, 'r21', 'Sambal Bajak', 'j1', 'Uleg|\r\nLayah|\r\nWajan', '10 buah cabe merah|\r\n1 buah tomat, buang bagian tengahnya, potong kecil-kecil|\r\n2 sdt terasi, sangrai|\r\n3 butir bawang merah|\r\n2 siung bawang putih|\r\n1 cm lengkuas|\r\n2 lembar daun salam|\r\n1 batang serai, ambil bagian pangkal, memarkan|\r\n2 sdm asam jawa, larutkan dalam 3 sdm air, remas-remas lalu ambil airnya|\r\n2 sdm gula merah|\r\ngaram secukupnya|\r\nminyak goreng untuk menumis', 'Cabe merah, bawang merah, dan bawang putih, serai, terasi, daun salam dan lengkuas ditumis hingga layu.\r\n\r\nTaruh semua bahan di cobek, lalu dihaluskan. Air asam diberikan sedikit-sedikit.', 'sambal-bajak.jpg'),
	(34, 'r22', 'Sambal Bawang Jawa', 'j1', 'Wajan|\r\nUleg|\r\nLayah', '15 buah cabe rawit|\r\n5 butir bawang merah|\r\n1 sdm garam|\r\n1 sdt merica|\r\n1 sdt gula pasir|\r\n5 sdm minyak goreng', 'Ulek kasar semua bahan. Tumis dengan minyak hingga wangi. Angkat.', 'sambal-bawang-jawa.jpg'),
	(35, 'r23', 'Sambal Jenggot', 'j1', 'Parutan|\r\nPanci untuk mengukus|\r\nUleg|\r\nLayah', '200 gr kelapa yang masih muda|\r\nBumbu Halus : |\r\n2 siung bawang putih|\r\n1/2 ruas kencur|\r\n2 bh cabai merah|\r\nGaram|\r\nGula merah', 'Kelapa diparut memanjang.\r\n\r\nCampur parutan kelapa muda dengan bumbu halus, kemudian kukus sampai matang.\r\n\r\nHaluskan.', 'sambal-jenggot.jpg'),
	(36, 'r24', 'Sambal Kecap', 'j1', 'Layah|\r\nUleg', '10 buah cabe rawit, iris|\r\n3 butir bawang merah, cincang kasar|\r\ngaram dan penyedap rasa secukupnya|\r\nkecap manis|\r\njeruk limau bisa diganti cuka|\r\n1 buah Tomat, potong kotak-kotak', 'Dalam mangkuk campur jadi satu semua bahan kecuali jeruk limau,aduk sampai tercampur rata.\r\n\r\nTambahkan perasan air jeruk limau,aduk rata.', 'sambal-kecap.jpg'),
	(37, 'r25', 'Nasi Goreng Sosis Pedas', 'j3', 'Wajan|\r\nPiring|\r\nSendok\r\n', '1 pirng nasi putih|\r\n2 batang sosis|\r\nkecap manis|\r\nkecap asin|\r\ngaram|\r\nRoyco rasa ayam|\r\n1 sachet sambal|\r\n1 sdm bawang merah goreng|\r\nmentega|\r\n1 siung bawang putih|\r\n1 butir telur|\r\n8 buah cabe rawit', 'geprek bawang putih lalu potong kecil-kecil, pirik cabe rawit dan potong sosis setebal 1cm. panaskan mentega hingga cair lalu masukkan telur, cabe rawit, bawang putih dan sosis. tumis sebentar lalu masukkan nasi putih. tuang kecap manis dan kecap asin secukupnya lalu goreng lagi kemudian beri sedikit garam, sambal dan sesendok makan royco ayam.\r\n icipi sedikit, jika kurang rasa bisa ditambah sedikit garam lagi atau jika kurang pedas bisa tambah cabe rawit sesukanya. jika dirasa sudah pas, tuang nasi ke piring dan beri bawang goreng, sajikan selagi hangat', 'nasi-goreng-sosis-pedasn.jpg'),
	(38, 'r26', 'Sayur Pepaya untuk Lontong', 'j2', 'Wajan|\r\nPanci', 'Pepaya muda ukuran kecil, parut kasar|\r\n1 buah kentang, potong dadu kecil|\r\n10 batang kacang panjang, iris kecil|\r\nsantan dari 1 butir kelapa|\r\nBumbu Halus : |\r\n4 siung bawang putih|\r\n6 buah bawang merah|\r\n3 butir kemiri|\r\n1/2 cm kunyit|\r\n6 buat cabe merah besar|\r\nudang kering secukupnya|\r\n1 ruas lengkuas, keprek|\r\n1 batang serai, keprek|\r\njahe, keprek|\r\ndaun salam|\r\ngula - garam secukupnya|', 'Tumis bumbu halus sampai matang. masukkan bumbu keprek, tumis sebentar. Masukkan bumbu ke dalam santan encer, aduk sebentar, masukan sayuran.\r\nRebus sampai matang, tambahkan gula garam. cicipi hingga mendapat rasa yang dikehendaki.\r\nTerakhir masukkan santan kental dan aduk hingga mendidih, jangan sampai pecah santannya. NB : kalau tidak pepaya muda bisa pakai labu siam.', 'sayur-pepaya-untuk-lontong-sayur.jpg'),
	(39, 'r27', 'Nasi Goreng Jagung Khas Nganjuk', 'j3', 'Wajan|\r\nPiring|\r\nSendok', '1 buah jagung|\r\n1 piring nasi|\r\n1 buah mentimun|\r\n1 butir telur|\r\n1 siung bawang putih|\r\n3 siung bawang merah|\r\n3 buah cabe rawit|\r\nTerasi udang secukupnya|\r\nGula dan garam secukupnya|\r\nMinyak sayur secukupnya', 'Haluskan bumbu (Bawang Merah,Bawang Putih,Cabe Rawit,Trasi,garam,gula Tumis bumbu halus dengan Minyak sayur yang telah di panaskan. Masukkan jagung muda yang telah di sisir, masukkan 1 piring nasi (Aduk hingga Rata) tunggu sampai matang. Sambil Nunggu nasi matang kita bisa mempersiapkan Telor Ceplok. Nasi Goreng jagung khas Kota Nganjuk siap untuk di Sajikan, agar hiasan cantik bisa di kasih sledri & mentimun\r\n', 'nasi-goreng-jagung-khasnganjuk.jpg'),
	(40, 'r28', 'Sayur untuk Ketupat', 'j2', 'Panci|\r\nWajan', 'Pepaya 500 gram, potong korek api|\r\nKacang panjang 10 batang, poting sesuai selera|\r\nSantan 1500 ml (kurang lebih 2 kelapa)|\r\nLengkuas kurang lebih 3 cm, memarkan|\r\nKaldu ayam instan bubuk kurang lebih 1 sdm|\r\nEbi kering 2 sdm|\r\nSerai ukurang sedang 2 batang, ambil bagian putihnya saja dan memarkan|\r\nDaun salam secukupnya|\r\nBawang putih 4 siung, haluskan|\r\nCabe merah besar 7 buah, haluskan|\r\nBawang merah 8 siung, haluskan|\r\nTerasi yang sudah digoreng 1 sdm|\r\nMerica halus atau bubuk 1/2 sendok kecil|\r\nGaram 1 sdt|\r\nMinyak goreng secukupnya untuk menumis bumbu halus|', 'Langkah pertama yang harus dilakukan adalah menumis bumbunya. Haluskan bawang merah, bawang putih, cabai goreng dan terasi nya. Siapkan penggorengan dengan api sedang kecil dan beri minyak goreng secukupnya. Masukkan bumbu bumbu di atas yang sudah dihaluskan dan aduk aduk sebentar sampai tercium bau harum dari bumbu tumisnya. Masukkan lengkuas dan batang serai yang sudah dimemarkan. Aduk aduk supaya tercampur rata. Masukkan ebi kering dan santan yang sudah dipersiapkan diatas. Aduk aduk lagi supaya semua bahan tercampur rata. Aduk aduk terus sampai santanya mendidih dan tidak pecah. Masukkan kaldu ayamnya. Aduk aduk lagi supaya semua bahan resep ketupat sayurnya tercampur rata. Masukkan kacang panjang dan garam dapurnya. Aduk aduk dan cicipi dulu dan tambahkan garam kalau diperlukan. Aduk kuah sayur sesekali sampai matang kemudian angkat dan sajikan ke mangkuk atau tempat sajian lain.', 'ketupat-sayur.jpg'),
	(41, 'r29', 'Nasi Goreng Spesial', 'j3', 'Wajan|\r\nPiring|\r\nSendok', '2 piring nasi putih|\r\n2 sendok makan minyak goreng|\r\n2 buah cabai rawit potong serong|\r\n1 butir telur|\r\ngaram|\r\n2 siung bawang putih|\r\nsaos tomat secukupnya|\r\ndaung bawang 1 batang|\r\nmerica secukupnya|\r\n3 siung bawang merah|\r\npelengkap : ayam, udang, tomat, acar, potongan cabe, kerupuk', 'Panaskan minyak goreng, masukkan wijen, cabe, bawang merah, bawang putih yang sudah dihaluskan hingga berbau harum;\r\n Masukkan bahan campuran seperti ayam, sosis, udang, dll, aduk hingga merata dan matang;\r\n Masukkan telur, kemudian orak arik telurnya, masukkan nasi putih dan aduk hingga tercampur dengan semua bahan tadi. Tambahkan saus tomat, merica dan garam sambi aduk rata. Sajikan', 'NasiGorengSpecial.jpg'),
	(3, 'r3', 'Sambal Kentang Iris', 'j1', 'Wajan', '¼ kg kentang kecil, bersihkan, belah dua|½ gelas air|4 butir bawang merah|3 siung bawang putih|4 buah cabe merah besar|1 buah tomat|garam dan gula secukupnya|minyak untuk menggoreng dan menumis', 'Panaskan wajan, tuangkan minyak secukupnya. Setelah cukup panas, goreng kentang hingga kecoklatan, tiriskan.\r\n\r\nSemua bumbu dihaluskan lalu tumis hingga harum, beri air secukupnya, aduk rata. Tambahkan penyedap jika suka. Masukkan kentang goreng, aduk rata lalu angkat setelah matang. Sajikan.', 'sambal_kentang.jpg'),
	(42, 'r30', 'Sayur Lompong', 'j2', 'Wajan|\r\nUleg|\r\nLayah', '1 ikat batang talas, kupas kulit ari lompong dengan cara gurat bagian atas, lalu tarik kulitnya kebawah sampai terkelupas, potong-potong dan taburi garam sedikit kemudian peras sampai kandungan airnya habis|\r\n6 siung bawang merah, iris tipis|\r\n4 siung bawang putih, iris tipis|\r\n1 lembar daun salam|\r\n1 cm lengkuas, memarkan|\r\n1 sdm rese (udang kecil yang sudah kering)|\r\npete jika suka secukupnya|\r\n50 gr tempe semangit, potong kecil|\r\n5 buah cabe merah besar, potong serong|\r\n2 buah cabe rawit, uleg kasar + 1/2 sdt terasi|\r\n1 sachet kecil bumbu kaldu sapi dan garam secukupnya|\r\n1/2 sendok makan gula merah|\r\n1000 ml santan encer dari 1/2 butir kelapa', 'Tumis bawang merah dan bawang putih sampai harum. Masukkan rese, cabe merah besar dan cabe uleg, daun salam dan lengkuas, tumis hingga harum;\r\nTuang santan dan masukkan lompong beserta bumbu-bumbu yg lain, masak sampai lunak dan bumbu meresap;\r\nTIPS : setelah semua bahan masuk, tutup panci dan masak sampai sayur matang dan bumbu meresap. JIka suka santan yang lebih kental, bisa ditambahkan terakhir, waktu mau dicicipi dan akan diangkat, tambahkan santan, lalu masak sebentar lagi sampai meresap.', 'Sayurlompong.jpg'),
	(43, 'r31', 'Nasi Goreng Teri Medan', 'j3', 'Wajan|\r\nPiring|\r\nSendok', '3 sdm teri Medan kering|\r\n1 piring nasi putih|\r\n1 buah tomat|\r\n1 sdm bawang bombay iris|\r\n1 siung bawang putih iris|\r\nDaun bawang seledri secukupnya|\r\n3 sdm keju prochiz parut|\r\n1 sdm mentega untuk menumis|\r\nMerica secukupnya', 'Tumis teri medan dengan mentega sampai kekuningan, lalu tambahkan bawang bombay dan bawang putih, tumis sampai harum dan kecoklatan.\r\n Tambahkan irisan tomat merah, aduk-aduk sebentar, lalu masukkan nasi putih.\r\n Aduk sampai rata dan bubuhi merica serta irisan daun bawang dan seledri.\r\n Terakir masukkan keju parut, dan sajikan hangat-hangat.', 'nasi-teresi-medan.jpg'),
	(44, 'r32', 'Nasi Goreng Sederhana', 'j3', 'Wajan|\r\nPiring|\r\nSendok', '2 porsi nasi putih|\r\n2 butir telur ayam, dikocok|\r\nMinyak goreng untuk menumis|\r\nBUMBU NASI GORENG (dihaluskan) : |\r\n5 buah cabe merah|\r\n3 siung bawang merah|\r\n4 siung bawang putih|\r\nBUMBU dan PENYEDAP : |\r\nGaram secukupnya|\r\nPenyedap rasa secukupnya.|\r\nKecap manis secukupnya.|\r\nBawang merah goreng, taburan|\r\nBAHAN PELENGKAP :|\r\nKerupuk|\r\nIrisan Timun / Acar|\r\nIrisan Tomat|\r\nSambal terasi', 'Panaskan wajan, masukkan telur yang sudah dikocok, tunggu setengah matang selanjutnya masukkan bumbu yang telah dihaluskan. Aduk hingga keluar aromanya. Masukkan nasi putih, garam, penyedap dan kecap secukupnya. Aduk hingga semua tercampur dan merata. Angkat dan sajikan di piring. Bila perlu tambahkan lagi telur ceplok atau telur dadar. Untuk penyajiannya jangan lupa kerupuk dan irisan timun/acar biar lebih enak.', 'nasi-goreng-bawang-putih.jpg'),
	(45, 'r33', 'Nasi Goreng Pedas', 'j3', 'Wajan|\r\nPiring|\r\nSendok', '750 gram nasi putih yang dingin|\r\n3 sendok makan minyak goreng|\r\n2 sendok makan kecap manis|\r\n1 batang daun bawang, iris-iris|\r\ngaram secukupnya|\r\nminyak goreng secukupnya|\r\nHALUSKAN : |\r\n7 buah cabe merah|\r\n3 buah cabe rawit merah|\r\n5 butir bawang merah|\r\n4 siung bawang putih|\r\n2 sendok teh terasi|\r\n2 butir kemiri sangrai|\r\nBAHAN UNTUK SARAN PENYAJIAN : |\r\n2 butir telur dadar, iris-iris|\r\n1 buah mentimun, potong bulat|\r\n1 buah tomat merah, potong bulat|\r\n1 batang seledri, iris tipis|\r\nbawang goreng untuk taburan', 'Panaskan minyak, tumis bumbu yang dihaluskan dan irisan daun bawang sambil diaduk hingga harum dan matang. Masukkan nasi, aduk dan beri kecap manis, aduk rata. Tambahkan garam secukupnya, aduk dan masak hingga bumbu meresap. Angkat dan sajikan hangat bersama pelengkapnya.', 'nasi-goreng-special-enak.jpg'),
	(46, 'r34', 'Nasi Goreng Telur', 'j3', 'Wajan|\r\nPiring|\r\nSendok', 'Nasi putih (2 piring)|\r\nTelur (3 butir / sesuai selera)|\r\nGaram (secukupnya)|\r\nBawang merah (3 siung)|\r\nBawang putih (2 siung)|\r\nDaun bawang (1 batang)|\r\nCabai rawit (sesuai selera)|\r\nMerica (sesuai selera)|\r\nMinyak goreng (secukupnya)|\r\nSaus tomat (secukupnya)|\r\nPelengkap (daging ayam, sosis, bakso, udang / sesuai selera)\r\n', 'Siapkan wajan dan tuangkan minyak goreng secukupnya, lalu panaskan api dengan api sedang. Setelah minyak panas masukan bawang merah, bawang putih dan cabai hingga matang dan menimbulkan bau harum. Masukan bahan pelengkap sesuai selera anda, aduk hingga merata dan matang. Masukan telur dan orak-arik hingga matang. Masukan nasi putih dan aduk hingga tercampur dengan semua bahan. Tambah saus tomat, garam, merica hingga semua tercampur rata. Jika telah tercium bau harum dan sudah matang, angkat nasi dan sajikan di atas piring.;\r\n Agar nasi goreng telur spesial terlihat menarik sebaiknya hias dengan irisan tomat atau yang lainnya sesuai dengan selera Anda. Nasi gorengpun siap untuk dihidangkan.', 'nasi-goreng-telur.jpg'),
	(47, 'r35', 'Nasi Goreng Sayuran', 'j3', 'Wajan|\r\nPiring|\r\nSendok', '400 gr nasi putih yang dingin|\r\n2 butir telur|\r\n1/2 buah tomat yang dibuang bijinya lalu dipotong menjadi dadu kecil|\r\n5 buah buncis yang dipotong sebesar 1 cm|\r\n1 sdm jagung manis yang sudah matang|\r\n1 tangkai daun bawang|\r\n1/2 buah wortel yang dipotong sebesar dadu kecil|\r\n1 bungkus bumbu penyedap|\r\n2 sdm minyak goreng|\r\n1 sdt margarin', 'Panaskan minyak goreng yang dicampur dengan margarin lalu masukkan wortel, buncis, dan daun bawang lalu tumis hingga matang. Kemudian, masukkan jagung manis dan tomat lalu tumis hingga sayuran menjadi sedikit layu. Setelah itu masukkan telur, masak hingga matang lalu masukkan nasi dan bumbu. Aduk-aduk hingga bumbu menyatu dengan baik.;\r\nNasi goreng sayuran telah siap. Sajikan dengan bentuk yang lucu agar si kecil semakin semangat memakan makanannya. Bisa juga ditambahkan bahan pelengkap lainnya seperti kerupuk, bawang goreng, atau acar. Mari hidup sehat.', 'nasi-goreng-sayuran.jpeg'),
	(48, 'r36', 'Cah Kangkung Terasi', 'j4', 'Wajan', '1 ikat kangkung|\r\n1 cabe merah besar|\r\nCabe rawit sesuai selera|\r\n2 siung bawang putih|\r\n5 siung bawang merah|\r\nLengkuas 1/3 ruas, memarkan|\r\nGaram secukupnya|\r\nGula pasir|\r\nTerasi|\r\nTomat|\r\nMinyak goreng|\r\nSaus tiram', 'Petik daun kangkung yang telah dibersihkan. Iris tipis bawang merah dan bawang putih,tomat dan cabai. Panaskan minyak goreng,tumis bawang merah dan bawang putih hingga terasa harum. Masukan terasi,cabai,dan lengkuas segera masukan saus tiram dipinggir bumbu yang sedang ditumis. Masukan kangkung yang telah dibersihkan,jangan ditambahi air,karena air akan keluar sendiri dari kangkung yang dicuci. Setelah hampir matang masukan garam dan gula secukupnya, masukan tomat dan cah kangkung siap dihidangkan.', 'cahkangkungterasi_002.png'),
	(49, 'r37', 'Tumis Kangkung Terasi', 'j4', 'Wajan', '1 kg kangkung|\r\n1/2 sdm garam|\r\n1 sdm air asam|\r\n1 sdm kecap asin|\r\n50 gr ebi, siram air panas, diamkan sesaat kemudian cincang kasar|\r\n1 sdm minyak|\r\nBUMBU HALUS :\r\n6 buah bawang merah, cincang halus|\r\n3 siung bawang putih, memarkan, cincang halus|\r\n1 sdm tauco|\r\n1/2 sdt terasi udang, panggang|\r\n5 buah cabai merah', 'Tumiskanlah semua bumbu halus sampai berbau harum. Kemudian masukkanlah ebi cincang, aduk sampai menjadi rata. Kemudian Masukkanlah kangkung, garam dan juga air asam.     Selanjutnya, Masakkanlah dengan menggunakan api besar seraya diaduk-aduk pelan-pelan hingga rata dan matang. Angkat. Sajikan hangat. ', 'RESEP-CAH-KANGKUNG-TERASI-ENAK.jpg'),
	(50, 'r38', 'Tumis Cah Kangkung Belacan Telur Puyuh', 'j4', 'Wajan', '1 buah tomat|\r\n1 sdt garam|\r\n1/2 sdt gula pasir|\r\n3 ikat kangkung|\r\n4 buah cabe merah besar, iris sesuai selera|\r\n50 ml air biasa (seperempat gelas)|\r\n1/4 sdt merica/lada bubuk|\r\n10 butir telur puyuh rebus|\r\n2 sdm minyak|\r\nHALUSKAN : |\r\n3 cabe merah keriting|\r\n1 sdt terasi goreng|\r\n7 butir bawang merah|\r\n3 siung bawang putih', 'Tumis semua bumbu halus sampai harum, kemudian tambahkan cabe merah dan tomat, aduk. Masukkan kangkung dan telur puyuh. Lalu tambahkan garam, lada / merica bubuk, gula pasir kemudian aduk rata. Tambahkan air lalu masak sampai matang dan semua bumbunya meresap. Sajikan', 'Resep-masakan-Tumis-Kangkung-Belacan-D-cost-Spesial-Telur-Pu.jpg'),
	(51, 'r39', 'Soup Sawi Putih Jagung Manis', 'j2', 'Wajan', '250 gr sawi putih|\r\n1 buah jagung manis|\r\n1 sdm ebi|\r\n1/2 bagian bawang bomba ukuran sedang|\r\n2 siung bawang putih|\r\n2 buah cabe merah|\r\n1 sdt garam|\r\n1 sdt kaldu bubuk|\r\n1/2 gula pasir|\r\n3 sdm minyak goreng|\r\n500 ml air', 'Potong-potong sawi, pipil jagung manis. Iris bawang bombay, bawang putih, dan cabe merah. Siapkan wajan, minyak goreng 3sd, tumis bawang sampai harum, masukan ebi, cabe me, tuang air, masukan jagung manis. tunggu sampai air mendidih dan jagung empuk, masukan sawi, garam, kaldu bubuk, gula. masak smp sawi setengah layu, Angkat lalu hidangkan.', 'sawi-putih-soup.jpg'),
	(4, 'r4', 'Sambal Merah', 'j1', 'Wajan', '15 buah cabe merah keriting|3 buah cabe rawit merah|7 butir bawang merah|2 siung bawang putih|1 buah tomat merah|2 lembar daun jeruk|garam, merica dan gula pasir secukupnya|1/2 sdt kaldu bubuk instan (royco ayam) atau sesuai selara|50 ml air|Minyak untuk menumis', 'Ulek kasar cabe merah keriting, cabe rawit, bawang merah, bawang putih dan tomat.\r\n\r\nTumis bahan yang sudah diulek bersama dengan daun jeruk hingga wangi. Tuang air lalu beri merica, garam, kaldu bubuk dan gula secukupnya.\r\n\r\nAduk rata dan masak sampai air meresap dan menjadi agak mengental, angkat dan sajikan.', NULL),
	(52, 'r40', 'Kering Tempe', 'j6', 'Wajan', '300 gr tempe, iris kecil, goreng hingga kering|\r\n4 buah cabe merah, buang bijinya, iris halus kemudian goreng|\r\n2 sdm bawang goreng|\r\n2 siung bawang putih|\r\n1 cm lengkuas, memarkan|\r\n1 lembar daun salam|\r\n75 gr gula merah|\r\n50 cc air|\r\n1 sdt air asam jawa|\r\nGaram secukupnya', 'Haluskan putih, tumis hingga harum. Tambahkan lengkuas dan salam kemudian aduk. Masukkan gula merah yang telah diiris/diserut, garam dan air. Aduk hingga gula larut, masukkan irisan tempe dan aduk sampai rata. Terakhir masukkan bawang goreng, cabai iris dan air asam kemudian aduk rata.', 'resep-kering-tempe.jpg'),
	(53, 'r41', 'Tempe Buncis Pedas', 'j6', 'Wajan', '2 sdm minyak goreng|\r\n150 gr udang, buang kulit dan sisakan ekornya|\r\n250 gr tempe, potong dadu|\r\n150 gr buncis, potong 3 cm|\r\n5 lembar daun jeruk|\r\n1 batang serai, memarkan|\r\n2 cm jahe, memarkan|\r\n2 cm lengkuas, memarkan|\r\n250 ml santan dari 1/2 butir kelapa|\r\n25 lembar daun kemangi|\r\nHALUSKAN : |\r\n5 butir bawang merah|\r\n3 siung bawang putih|\r\n3 butir kemiri, sangrai|\r\n2 buah cabe merah besar|\r\n10 buah cabe rawit merah|\r\n1 sdt terasi matang|\r\n1 sdt garam|\r\n1 sdt merica bubuk|\r\n1 sdm gula pasir', 'Panaskan minyak goreng, tumis bumbu halus bersama daun jeruk, serai, jahe, dan lengkuas hingga harum. Masukkan udang, masak hingga berubah warna. Masukkan tempe dan santan, masak hingga santan mengental. Masukkan buncis masak sebentar, tambahkan kemangi, aduk, Sajikan', 'resep-tempe-buncis-pedas.jpg'),
	(54, 'r42', 'Perkedel Tempe', 'j6', 'Wajan', '300 gr tempe|\r\n2 sdm tepung sagu|\r\n1 putih telur|\r\n3 lembar daun jeruk, iris halus|\r\nMinyak secukupnya|\r\nHALUSKAN :|\r\n3 buah cabe merah|\r\n7 buah cabe rawit merah|\r\n5 butir bawang merah|\r\n2 siung bawang putih|\r\n2 cm kencur|\r\n1 sdt terasi matang|\r\n1/2 sdt garam|\r\n1/4 sdt merica bubuk|\r\n1 sdt gula pasir', 'Haluskan tempe dengan tepung sagu, putih telur, irisan daun jeruk, dan bumbu yang dihaluskan, aduk rata. Ambil sesendok makan, bentuk bulat lonjong. Panaskan minyak, goreng hingga matang dan berwarna kecokelatan. Angkat dan tiriskan.', 'resep-perkedel-tempe.jpg'),
	(55, 'r43', 'Tempe Tumis Kecap', 'j6', 'Wajan', '1 bungkus tempe, potong dadu|\r\n5 siung bawang merah, iris halus|\r\n2 siung bawang putih, iris halus|\r\n3 buah cabe hijau, potong sepanjang 1 cm|\r\n1 batang daun bawang|\r\nGaram secukupnya|\r\n4 sdm kecap manis|\r\nPenyedap rasa secukupnya|\r\nMinyak goreng', 'Siapkan bumbu tumis (bawang merah, bawang putih, cabe hijau, daun salam dan lengkuas), tumis hingga harum, kemudian masukkan cabe hijau dan daun bawang. Masukkan potongan tempe, tumis hingga kecoklatan, tuangkan kecap manis. Bubuhkan garam dan penyedap rasa. Tunggu hingga matang.', 'resep-tempe-tumis-kecap.jpg'),
	(5, 'r5', 'Sambal Goreng Ikan Teri', 'j1', 'Wajan', '250 gram ikan teri, cuci, goreng kering.|3 helai daun jeruk purut|30 gram asam jawa, beri sedikit air|1 gelas santan kental|4 cm lengkuas, memarkan|garam, lada dan gula pasir secukupnya|terasi secukupnya|minyak untuk menumis|Haluskan - 5 buah cabai merah - 3 butir bawang merah - 2 siung bawang putih - 2 butir kemiri', 'Panaskan minyak, tumis bumbu halus bersama lengkuas dan daun jeruk hingga harum. Masukkan larutan asam kemudian ikan teri goreng, aduk rata.\r\n\r\nTambahkan garam, lada, gula pasir dan terasi, aduk rata. Tuang santan kental, masak hingga agak kering, angkat dan sajikan.', 'sambal-goreng-ikan-teri.jpg'),
	(6, 'r6', 'Sambal Ikan Asin Gabus', 'j1', 'Wajan', '1 ons ikan gabus asin|50 ml air|¼ sdt garam atau secukupnya|½ sdt penyedap rasa atau sesuai selera|1 sdt gula putih|minyak goreng secukupnya|Ulek kasar : - 3 butir bawang merah - 2 siung bawang putih - 1 cm kencur - 1 buah tomat besar - 10 buah cabai rawit - 2 buah cabai merah besar', 'Cuci asin gabus lalu goreng sampai kering, tiriskan.\r\n\r\nPanaskan minyak, tumis bumbu ulek hingga harum. Masukkan air lalu beri garam, penyedap, gula dan aduk rata.\r\n\r\nSetelah mendidih, masukkan asin gabus lalu aduk rata. Angkat dan isap dihidangkan.', 'sambal-ikan-asin-gabus.jpg'),
	(7, 'r7', 'Sambal Goreng Kentang', 'j1', 'Wajan', '½ kg kentang, kupas kulitnya lalu potong-potong dadu, cuci dan tiriskan|1 papan petai, buang kulit dan belah dua|2 cm lengkuas, digeprek|2 lembar daun jeruk|1 lembar daun salam|1 batang serai, digeprek|2 sdm air asam jawa|1 sdm gula merah|200 ml santan|minyak goreng secukupnya untuk menggoreng dan menumis|Haluskan : - 7 buah cabe merah - 6 butir bawang merah - 3 siung bawang putih - 1 buah tomat - 1 cm jahe - 4 butir kemiri - ½ sdt garam atau secukupnya - ½ sdt kaldu bubuk rasa ayam atau sesuai selera', 'Panaskan minyak lalu goreng kentang sampai kuning kecokelatan, angkat dan tiriskan.\r\n\r\nTumis bumbu halus, serai, daun jeruk, lengkuas, daun salam dan petai hingga harum. Masukkan santan lalu tambahkan gula merah dan air asam jawa, aduk rata.\r\n\r\nApabila santan sudah menyusut, masukkan kentang goreng lalu aduk-aduk terus hingga rata dan kuahnya kering.', 'sambal-goreng-kentang.jpg'),
	(8, 'r8', 'Sambal Goreng Baby Kentang', 'j1', 'Wajan', '800 gram baby kentang|\r\n65 ml santan kara|\r\n185 ml air|\r\nminyak goreng|\r\n1 sdm air asam jawa|\r\n1 sdm gula pasir|\r\n2 lembar daun jeruk|\r\n1 batang serai, digeprek|\r\n3 cmd lengkuas, digeprek|\r\n1/2 sdt garam|\r\npenyedap secukupnya|\r\nHaluskan : - 8 buah cabai merah besar - 4 butir bawang merah - 3 butir bawang putih - 2 cm jahe - 1 buah tomat', 'Cuci bersih kentang, belah dua lalu goreng sampai matang kecoklatan. Tiriskan.\r\n\r\nTumis bumbu halus, daun jeruk, serai dan lengkuas hingga harum lalu masukkan santan dan air. Aduk rata.\r\n\r\nTambahkan garam, gula dan larutan air asam jawa sambil diaduk. Masak hingga kuah agak mengering, masukkan kentang lalu aduk rata. Angkat dan sajikan.', 'sambal-goreng-baby-kentang.jpg'),
	(19, 'r9', 'Sambal Kemiri', 'j1', 'Wajan', '15 butir cabe rawit hijau atau merah|\r\n3 buah cabe keriting merah|\r\n1 buah tomat|\r\n5 butir kemiri|\r\n1 siung bawang putih|\r\n3 butir bawang merah|\r\n2 sendok makan minyak goreng|\r\ngaram secukupnya|\r\n1 sendok teh gula merah', 'Tahap pertama adalah menggoreng terlebih dahulu semua bahan kecuali 3 bahan terakhir hingga matang, angkat dan tiriskan. Kemudian ulek semua bahan termasuk gula merah dan garam, aduk rata dan siap untuk disajikan.', 'sambal-kemiri.jpg');
/*!40000 ALTER TABLE `resep` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
