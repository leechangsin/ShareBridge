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

-- 테이블 sharebridge.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL COMMENT '상품 번호',
  `category_id` int(11) NOT NULL COMMENT '카테고리 번호',
  `member_id` int(11) NOT NULL COMMENT '렌터 회원 번호',
  `title` varchar(200) NOT NULL COMMENT '제목',
  `content` varchar(2000) NOT NULL COMMENT '내용',
  `sdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 시작 날짜',
  `edate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 종료 날짜',
  `price` int(11) NOT NULL COMMENT '일일 대여 가격',
  `photo` varchar(50) NOT NULL COMMENT '이미지 파일',
  `wdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록 날짜',
  `state` bit(1) DEFAULT NULL COMMENT '대여 상태',
  `del` bit(1) DEFAULT NULL COMMENT '삭제 여부',
  PRIMARY KEY (`product_id`),
  KEY `product_FK1` (`member_id`),
  KEY `product_FK2` (`category_id`),
  CONSTRAINT `product_FK1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_FK2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='상품 정보 테이블( 렌터가 대여 할 상품 정보 )';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
