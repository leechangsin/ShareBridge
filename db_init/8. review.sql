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

-- 테이블 sharebridge.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '후기 번호',
  `product_id` int(11) NOT NULL COMMENT '대여한 상품 번호',
  `renter_id` int(11) NOT NULL COMMENT '대여한 상품을 등록한 렌터 회원 번호',
  `rentee_id` int(11) NOT NULL COMMENT '대여한 렌티 번호',
  `content` varchar(2000) NOT NULL COMMENT '내용',
  `rating` tinyint(4) NOT NULL DEFAULT 0 COMMENT '별점',
  `photo` varchar(50) DEFAULT NULL COMMENT '이미지 파일',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록 날짜',
  PRIMARY KEY (`review_id`),
  KEY `review_FK1` (`product_id`),
  KEY `review_FK2` (`renter_id`),
  KEY `review_FK3` (`rentee_id`),
  CONSTRAINT `review_FK1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `review_FK2` FOREIGN KEY (`renter_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `review_FK3` FOREIGN KEY (`rentee_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='리뷰 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
