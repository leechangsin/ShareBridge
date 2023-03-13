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

-- 테이블 sharebridge.request 구조 내보내기
CREATE TABLE IF NOT EXISTS `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '대여 신청서 번호',
  `product_id` int(11) NOT NULL COMMENT '대여할 상품 번호',
  `member_id` int(11) NOT NULL COMMENT '렌티 회원 번호',
  `name` varchar(50) NOT NULL COMMENT '신청자 이름',
  `email` varchar(50) NOT NULL COMMENT '신청자 이메일',
  `phone_number` char(13) NOT NULL COMMENT '신청자 연락처',
  `sdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 시작 날짜',
  `edate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 종료 날짜',
  `receiver` varchar(50) NOT NULL COMMENT '배송 받는 사람 이름',
  `receiver_phone` char(13) NOT NULL COMMENT '배송 받는 사람 연락처',
  `address` varchar(1000) NOT NULL COMMENT '배송 받는 사람 주소',
  `payment` varchar(50) NOT NULL COMMENT '결제 방법',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 신청 날짜',
  `del` bit(1) DEFAULT NULL COMMENT '삭제 여부',
  PRIMARY KEY (`request_id`),
  KEY `request_FK1` (`product_id`),
  KEY `request_FK2` (`member_id`),
  CONSTRAINT `request_FK1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `request_FK2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='대여 신청서 테이블(렌티가 작성한 대여 신청서)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
