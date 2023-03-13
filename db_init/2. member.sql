-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 sharebridge.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 번호',
  `email` varchar(50) NOT NULL COMMENT '이메일',
  `pwd` varchar(20) NOT NULL COMMENT '비밀번호',
  `nickname` varchar(50) NOT NULL COMMENT '닉네임',
  `name` varchar(50) NOT NULL COMMENT '이름',
  `phone_number` char(13) NOT NULL COMMENT '연락처',
  `profile` varchar(50) DEFAULT NULL COMMENT '프로필 이미지 파일',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '가입일',
  `auth` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0 COMMENT '별점(렌터에게 부여되는 것)',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='회원 정보 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
