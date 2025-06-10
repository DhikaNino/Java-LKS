-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_lks
CREATE DATABASE IF NOT EXISTS `db_lks` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_lks`;

-- Dumping structure for table db_lks.tbl_barang
CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `jumlah_barang` bigint(20) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `harga_satuan` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_lks.tbl_barang: ~3 rows (approximately)
INSERT INTO `tbl_barang` (`id_barang`, `kode_barang`, `nama_barang`, `expired_date`, `jumlah_barang`, `satuan`, `harga_satuan`) VALUES
	(2, '22', '22', '2025-04-12', 22, 'gatau', 22),
	(4, '22', 'Test', '2025-04-11', 222, '22', 22),
	(6, '22', '22', '2025-04-11', 22, 'gatau', 22);

-- Dumping structure for table db_lks.tbl_log
CREATE TABLE IF NOT EXISTS `tbl_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `waktu` timestamp NULL DEFAULT current_timestamp(),
  `aktivitas` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `FK_tbl_log_tbl_user` (`id_user`),
  CONSTRAINT `FK_tbl_log_tbl_user` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_lks.tbl_log: ~2 rows (approximately)
INSERT INTO `tbl_log` (`id_log`, `waktu`, `aktivitas`, `id_user`) VALUES
	(1, '2025-04-29 01:16:55', 'tes', 1),
	(2, '2025-04-29 07:22:42', 'Melakukan Login', 2),
	(3, '2025-04-29 08:00:28', 'Melakukan Login', 2),
	(4, '2025-04-29 08:00:47', 'Melakukan logout', 2),
	(5, '2025-04-29 08:00:52', 'Melakukan Login', 1);

-- Dumping structure for table db_lks.tbl_pelanggan
CREATE TABLE IF NOT EXISTS `tbl_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_lks.tbl_pelanggan: ~7 rows (approximately)
INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `nama`, `telepon`) VALUES
	(1, 'Udin', '8232'),
	(2, 'Udeng', '823'),
	(3, '32', '32'),
	(4, '323', '323'),
	(5, '22', '22'),
	(6, '33', '33'),
	(7, '2222', '2222'),
	(8, '434', '434');

-- Dumping structure for table db_lks.tbl_transaksi
CREATE TABLE IF NOT EXISTS `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `no_transaksi` varchar(50) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT current_timestamp(),
  `total_bayar` bigint(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `FK_tbl_transaksi_tbl_user` (`id_user`),
  KEY `FK_tbl_transaksi_tbl_barang` (`id_barang`),
  CONSTRAINT `FK_tbl_transaksi_tbl_barang` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_transaksi_tbl_user` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_lks.tbl_transaksi: ~0 rows (approximately)
INSERT INTO `tbl_transaksi` (`id_transaksi`, `no_transaksi`, `tgl_transaksi`, `total_bayar`, `id_user`, `id_barang`, `nama`) VALUES
	(9, 'BYR434', '2025-04-29', 434, 2, 2, '434');

-- Dumping structure for table db_lks.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `tipe_user` enum('Admin','Gudang','Kasir') DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_lks.tbl_user: ~3 rows (approximately)
INSERT INTO `tbl_user` (`id_user`, `tipe_user`, `nama`, `alamat`, `username`, `telepon`, `password`) VALUES
	(1, 'Admin', 'Rikio', 'Tenjo', 'admin', '081213', '123'),
	(2, 'Kasir', 'Andhika', 'Tenjo', 'kasir', '081213', '123'),
	(7, 'Gudang', 'Nino', 'Udin', 'gudang', '081213', '123');

-- Dumping structure for view db_lks.vw_chart
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_chart` (
	`total` DECIMAL(41,0) NULL,
	`tanggal` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_lks.vw_log
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_log` (
	`id_log` INT(11) NOT NULL,
	`waktu` TIMESTAMP NULL,
	`aktivitas` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nama` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view db_lks.vw_penjualan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_penjualan` (
	`no_transaksi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`tgl_transaksi` DATE NULL,
	`total_bayar` BIGINT(20) NULL,
	`nama_k` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nama_p` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_chart`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_chart` AS SELECT SUM(total_bayar) AS total, tgl_transaksi AS tanggal FROM tbl_transaksi GROUP BY tgl_transaksi ;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_log`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_log` AS SELECT tl.id_log, tl.waktu, tl.aktivitas, tu.nama FROM tbl_log AS tl
JOIN tbl_user AS tu ON tl.id_user = tu.id_user ;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_penjualan`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_penjualan` AS SELECT tt.no_transaksi, tt.tgl_transaksi, tt.total_bayar, tu.nama AS nama_k, tt.nama AS nama_p FROM tbl_transaksi as tt 
JOIN tbl_user AS tu ON tt.id_user = tu.id_user ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
