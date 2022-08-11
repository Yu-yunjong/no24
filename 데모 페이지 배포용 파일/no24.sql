-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 22-08-12 06:25
-- 서버 버전: 10.5.9-MariaDB-1:10.5.9+maria~focal
-- PHP 버전: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `no24`
--
CREATE DATABASE IF NOT EXISTS `no24` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `no24`;

-- --------------------------------------------------------

--
-- 테이블 구조 `basket`
--

DROP TABLE IF EXISTS `basket`;
CREATE TABLE `basket` (
  `bno` varchar(10) NOT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `pno` varchar(10) DEFAULT NULL,
  `bdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `bamount` int(11) DEFAULT NULL,
  `bprice` int(11) DEFAULT NULL,
  `btotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `basket`
--

INSERT INTO `basket` (`bno`, `uid`, `pno`, `bdate`, `bamount`, `bprice`, `btotal`) VALUES
('b1', 'da1', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b10', 'da2', 'p2', '2015-05-20 15:00:00', 1, 7000, 7000),
('b11', '02a', 'p3', '2017-03-10 15:00:00', 3, 80000, 24000),
('b12', '02a', 'p5', '2017-03-10 15:00:00', 3, 80000, 24000),
('b13', '02a', 'p1', '2017-03-10 15:00:00', 3, 80000, 24000),
('b14', '23a', 'p9', '2017-03-10 15:00:00', 3, 80000, 24000),
('b15', '18a', 'p1', '2017-03-10 15:00:00', 3, 80000, 24000),
('b16', 'da1', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b17', '17a', 'p4', '2019-12-31 15:00:00', 1, 8000, 8000),
('b18', 'da1', 'p5', '2019-12-31 15:00:00', 1, 8000, 8000),
('b19', '22a', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b2', 'da2', 'p2', '2015-05-20 15:00:00', 1, 7000, 7000),
('b20', 'da1', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b21', 'gyj', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b22', '11a', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b23', '09a', 'p5', '2019-12-31 15:00:00', 1, 8000, 8000),
('b24', '15a', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b25', '07a', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b26', 'no11', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b27', '08a', 'p10', '2019-12-31 15:00:00', 1, 8000, 8000),
('b28', '05a', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b29', 'no11', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b3', 'da3', 'p3', '2019-12-31 15:00:00', 2, 8000, 16000),
('b30', 'da1', 'p1', '2019-12-31 15:00:00', 1, 8000, 8000),
('b4', 'da4', 'p4', '2019-11-20 15:00:00', 4, 6000, 24000),
('b5', 'da5', 'p5', '2017-03-10 15:00:00', 3, 8000, 24000),
('b6', '01a', 'p6', '2017-03-10 15:00:00', 3, 80000, 24000),
('b7', '01a', 'p6', '2017-03-10 15:00:00', 3, 80000, 24000),
('b8', '20a', 'p7', '2017-03-10 15:00:00', 3, 80000, 24000),
('b9', '02a', 'p7', '2017-03-10 15:00:00', 3, 80000, 24000);

-- --------------------------------------------------------

--
-- 테이블 구조 `cancel`
--

DROP TABLE IF EXISTS `cancel`;
CREATE TABLE `cancel` (
  `ono` varchar(15) NOT NULL,
  `pno` varchar(10) DEFAULT NULL,
  `bno` varchar(10) DEFAULT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `otime` datetime DEFAULT NULL,
  `oamount` int(11) DEFAULT 1,
  `price` int(11) NOT NULL,
  `omethod` varchar(10) NOT NULL,
  `opayment` varchar(20) DEFAULT NULL,
  `ostatus` varchar(20) DEFAULT '주문',
  `oaddress` varchar(200) NOT NULL,
  `sno` varchar(20) DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `reviewContent` varchar(500) DEFAULT NULL,
  `whycancel` varchar(200) DEFAULT NULL,
  `canceltime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `nextserial`
--

DROP TABLE IF EXISTS `nextserial`;
CREATE TABLE `nextserial` (
  `serialType` varchar(20) NOT NULL,
  `serial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `nextserial`
--

INSERT INTO `nextserial` (`serialType`, `serial`) VALUES
('bno', 31),
('ono', 7),
('pno', 28),
('reqno', 7),
('sno', 11111111);

-- --------------------------------------------------------

--
-- 테이블 구조 `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ono` varchar(15) NOT NULL,
  `pno` varchar(10) DEFAULT NULL,
  `bno` varchar(10) NOT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `otime` timestamp NOT NULL DEFAULT current_timestamp(),
  `oamount` int(11) DEFAULT 1,
  `price` int(11) NOT NULL,
  `omethod` varchar(10) NOT NULL,
  `opayment` varchar(20) DEFAULT NULL,
  `ostatus` varchar(20) DEFAULT '주문',
  `oaddress` varchar(200) NOT NULL,
  `sno` varchar(20) DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `reviewContent` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `orders`
--

INSERT INTO `orders` (`ono`, `pno`, `bno`, `uid`, `otime`, `oamount`, `price`, `omethod`, `opayment`, `ostatus`, `oaddress`, `sno`, `memo`, `score`, `reviewContent`) VALUES
('o1', 'p1', 'b1', 'da1', '2020-01-02 15:00:00', 1, 8000, '카드', '1234-5678-1234-5678', '배송완료', '경기 수원시 팔달구 팔달산로 318', 's1', NULL, 5, '아주좋앙'),
('o2', 'p2', 'b2', 'no11', '2021-04-08 03:34:56', 2, 14000, '카드', '1212-3434-5656-7878', '배송완료', '서울 용산구 보광로 34', 's2', '빠른배송 부탁합니다.', 5, '굳굳'),
('o3', 'p3', 'b3', 'da3', '2021-01-02 15:00:00', 3, 21000, '무통장 입금', '123-234152-213', '배송완료', '서울 용산구 장문로45나길 18-1', 's3', '경비실에 맡겨주세요.', 4, '배송이 조금 아쉽네요 ㅠ'),
('o4', 'p4', 'b4', 'da4', '2021-04-03 13:33:38', 2, 14000, '카드', '1231-2341-2341-2341', '배송완료', '서울 서초구 반포동 미래아파트 12동 103호', 's4', '믿고 주문합니다.', 5, '잘 쓰고 있어요~'),
('o5', 'p5', 'b5', 'da5', '2021-05-31 13:35:41', 2, 14000, '카드', '1111-2222-3333-4444', '준비중', '경기 성남시 분당구 서판교로44번길 3-15', 's5', NULL, NULL, NULL),
('o6', 'p5', 'b6', 'da5', '2021-05-31 13:35:50', 2, 11000, '카드', '1324-1324-5511-2222', '준비중', '경기 성남시 분당구 대왕판교로 477', 's5', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pno` varchar(10) NOT NULL,
  `pgroup` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `amount` int(11) DEFAULT 1,
  `price` int(11) NOT NULL,
  `reldate` date NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `product`
--

INSERT INTO `product` (`pno`, `pgroup`, `category`, `pname`, `author`, `amount`, `price`, `reldate`, `image`) VALUES
('p1', '음반', '가요', 'GUESS WHOGUESS WHO', '있지 (ITZY)', 50, 13400, '2021-05-28', 'img/guess who.jpg'),
('p10', '도서', '어린이', '코딩하기 전 코딩책', 'among us', 15, 12000, '2021-05-12', 'img/코딩하기전 코딩책.jpg'),
('p11', '음반', '가요', '두근두근(fromis9)', 'fromis9', 1, 12000, '2016-11-09', 'img/DKDK.jpg'),
('p12', '도서', '어린이', '내가만든똥', '고길동', 1, 7000, '2020-05-14', 'img/내가만든똥.jpg'),
('p13', '도서', '역사', '우리나라고조선', '단군', 1, 8000, '2018-05-10', 'img/우리나라고조선.jpg'),
('p14', '도서', '경제', '공유경제', '공유', 3, 10000, '2021-05-06', 'img/공유경제.jpg'),
('p15', '음반', '재즈', 'feelgood', '박재즈', 1, 8000, '2017-05-10', 'img/jazz1.jpg'),
('p16', '음반', '가요', 'sorrysorry', '슈퍼주니어', 2, 10000, '2011-05-04', 'img/sorrysorry.jpg'),
('p17', '도서', '자기계발', '신경끄기기술', '김준서', 2, 8000, '2016-05-09', 'img/신경끄기기술.jpg'),
('p18', '도서', '소설', '라플라스의마녀', '게이고', 4, 10000, '2018-09-13', 'img/라플라스의마녀.jpg'),
('p19', '도서', '대학교재', '운영체제', 'Dyno', 1, 15000, '2018-02-15', 'img/OSC.jpg'),
('p2', '음반', '클래식', '베토벤: 교향곡 1, 3번 - 푸르트벵글러', 'Ludwig van Beethoven', 5, 45800, '2021-04-26', 'img/베토벤.jpg'),
('p20', 'eBook', '만화', '신의탑', 'SIU', 3, 4000, '2021-09-03', 'img/신의탑.jpg'),
('p21', '음반', '가요', '내 사랑아', '이종현', 50, 8900, '2021-05-28', 'img/이종현 내 사랑아.jpg'),
('p22', '음반', '가요', 'SG워버니,옥주현- 페이지원', '옥주현', 50, 13400, '2021-05-28', 'img/sg워너비 옥주현 페이지원.jpg'),
('p23', '음반', '가요', '거미 -그대라서', '거미', 50, 13400, '2021-05-28', 'img/거미 그대라서.jpg'),
('p24', '음반', '가요', '에디킴 - 이쁘다니까', '에디킴', 50, 8000, '2021-05-28', 'img/에디킴 - 이쁘다니까.jpg'),
('p25', '음반', '가요', '노을 - 살기위해서', '노을', 50, 8000, '2021-05-28', 'img/노을 살기위해서.jpg'),
('p26', '음반', '가요', '백지영 - Because Of You', '백지영', 50, 8000, '2021-05-28', 'img/백지영 - Because Of You.jpg'),
('p27', '음반', '가요', '씨야 - 가슴이 뭉클', '씨야', 50, 8000, '2021-05-28', 'img/씨야 가슴이 뭉클.jpg'),
('p3', '도서', '소설', '해리포터와 마법사의 돌 1[개정판]', 'J.K. 롤링', 20, 9000, '2019-11-19', 'img/해리포터와 마법사의돌1.jpg'),
('p4', '도서', '여행', '식객 허영만의 백반기행', '허영만', 3, 17000, '2020-05-14', 'img/식객 허영만의 백반기행.jpg'),
('p5', '도서', '라이트노벨', '소드 아트 온라인 SWORD ART ONLINE 24', '카와하라 레키', 22, 8000, '2020-11-24', 'img/소아온24.jpg'),
('p6', '중고도서', '대학교재', '맨큐의 경제학', 'N. Gregory Mankiw', 13, 45000, '2021-02-10', 'img/맨큐의 경제학.jpg'),
('p7', '중고도서', '어린이', '누가 내 머리에 똥쌌어?', '베르너 홀츠바르트', 14, 9500, '2002-01-05', 'img/누가 내 머리에 똥쌌어.jpg'),
('p8', 'eBook', '소설', '아이 엠 셜록 01권', '이오 나오미치', 13, 3500, '2021-05-20', 'img/아이 엠 셜록1.jpg'),
('p9', '도서', '소설', '달러구트 꿈 백화점', '이미예', 11, 13800, '2020-07-08', 'img/달러구트 꿈 백화점.jpg');

-- --------------------------------------------------------

--
-- 테이블 구조 `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `reqno` varchar(10) NOT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `rgroup` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `rname` varchar(30) DEFAULT NULL,
  `author` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `price` int(11) DEFAULT NULL,
  `reldate` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `rtime` timestamp NOT NULL DEFAULT current_timestamp(),
  `rstate` varchar(10) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `request`
--

INSERT INTO `request` (`reqno`, `uid`, `rgroup`, `category`, `rname`, `author`, `amount`, `price`, `reldate`, `image`, `rtime`, `rstate`, `reason`) VALUES
('r1', 'da1', '중고도서', '대학교재', '데이터 과학 기반의 파이썬 빅데이터 분석', '이지영', 1, 28000, '2020-12-30', 'img/데이터 과학 기반의 파이썬 빅데이터 분석.jpg', '2021-02-01 15:00:00', '등록요청', NULL),
('r2', 'da2', '중고도서', '건강/취미', '동물 대백과사전', 'DK 『동물』 편집 위원회', 1, 45000, '2019-04-01', 'img/동물대백과사전.jpg', '2021-02-01 15:00:00', '등록요청', NULL),
('r3', 'da3', '중고도서', '소설', '불편한 편의점', '김호연', 1, 12600, '2020-05-11', 'img/불편한편의점.jpg', '2021-02-07 15:00:00', '반려됨', '책 정보가 잘못되었습니다.'),
('r4', 'da4', '중고도서', '만화', '귀멸의 칼날 23 한정판', '고토게 코요하루', 1, 12000, '2021-04-23', 'img/귀멸의 칼날 23 한정판.jpg', '2021-05-07 15:00:00', '반려됨', '한정판 구성품이 누락되었습니다.'),
('r5', 'da5', '중고도서', '대학교재', '파이썬으로 배우는 컴퓨팅 사고', '김완섭', 1, 17000, '2020-02-12', 'img/파이썬으로 배우는 컴퓨팅 사고.jpg', '2021-02-10 15:00:00', '등록', NULL),
('r6', 'da1', '중고도서', '웹툰', '신의탑', 'SIU', 1, 15000, '2020-12-30', 'img/신의탑.jpg', '2021-02-01 15:00:00', '등록요청', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(20) NOT NULL,
  `uname` varchar(10) NOT NULL,
  `pw` varchar(30) NOT NULL,
  `ugroup` int(11) DEFAULT 1,
  `phone` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`id`, `uname`, `pw`, `ugroup`, `phone`, `birthday`, `email`, `address`, `regdate`, `lastlogin`) VALUES
('00a', '가수영', '47713', 1, '010-3113-1000', '1991-10-03', 'fafsf@naver.com', '경상남도 거제시 연초면 명동5길 13-1', '2021-03-20 04:31:13', NULL),
('01a', '가도윤', '47744', 1, '010-3113-1884', '1991-10-16', 'fafssssf@naver.com', '경상남도 거제시 연초면 명동5길 15', '2021-03-20 04:31:13', NULL),
('02a', '가서연', '47775', 1, '010-3113-1000', '1991-10-05', 'asdzzzzf@naver.com', '경상남도 거제시 연초면 명동5길 17', '2021-03-20 04:31:13', NULL),
('03a', '지우', '47806', 1, '010-3813-8842', '1991-10-21', 'fazvvvfsf@naver.com', '경상남도 거제시 연초면 명동5길 17-1', '2021-03-20 04:31:13', NULL),
('04a', '나서현', '47837', 1, '010-3113-1000', '1991-10-29', 'asdzzzf@gmail.com', '경상남도 거제시 연초면 명동5길 53', '2021-03-31 04:31:13', NULL),
('05a', '영민서', '47868', 1, '010-3113-9945', '1991-10-06', 'ffffzafsf@naver.com', '경상남도 거제시 연초면 명동5길 57', '2021-03-20 04:31:13', NULL),
('06a', '가수영', '47899', 1, '010-3953-8846', '1991-10-03', 'fafsf@naver.com', '경상남도 거제시 연초면 명동5길 59', '2021-03-24 04:31:13', NULL),
('07a', '명하은', '47930', 1, '010-3113-1010', '1984-10-04', 'fafsf@naver.com', '경상남도 거제시 연초면 명동5길 13-1', '2021-03-01 04:31:13', NULL),
('08a', '명하윤', '47961', 1, '010-3113-8842', '1991-10-02', 'qpppqf@naver.com', '경상남도 거제시 연초면 명동5길 59-1', '2021-03-01 04:31:13', NULL),
('09a', '한윤서', '47992', 1, '010-3113-3235', '1991-10-03', 'asdzf@naver.com', '경상남도 거제시 연초면 명동5길 59-2', '2021-03-01 04:31:13', NULL),
('10a', '김지유', '48674', 1, '010-1544-9950', '1991-10-23', 'asdzfasda@naver.com', '경상남도 거제시 연초면 거제북로 1', '2021-03-01 04:31:13', NULL),
('11a', '유지민', '48705', 1, '010-1544-9922', '1991-10-27', 'wwfa@naver.com', '경상남도 거제시 연초면 거제북로 7', '2021-03-31 04:31:13', NULL),
('12a', '김채원', '48736', 1, '010-1544-7745', '1991-10-10', 'adddzvvv@naver.com', '경상남도 거제시 연초면 거제북로 15', '2021-03-31 04:31:13', NULL),
('13a', '윤지윤', '48767', 1, '010-1544-7777', '1984-10-11', 'jadv@naver.com', '경상남도 거제시 연초면 거제북로 17', '2021-03-31 04:31:13', NULL),
('14a', '윤은서', '48798', 1, '010-1544-7877', '1984-10-11', 'jadzvvbv@naver.com', '경상남도 거제시 연초면 거제북로 24-33', '2021-03-31 04:31:13', NULL),
('15a', '이수아', '48829', 1, '010-1944-7877', '1984-10-11', 'jadzvvbv@naver.com', '경상남도 거제시 연초면 거제북로 24-37', '2021-03-31 04:31:13', NULL),
('16a', '김다은', '48860', 1, '010-1994-7817', '1984-10-06', 'jadzvvbv@naver.com', '충청북도 청주시 흥덕구 청주역로 105(석소동)', '2021-03-29 04:31:13', NULL),
('17a', '이다은', '48891', 1, '010-1994-7997', '1984-10-03', 'asdfzvzvxv@naver.com', '경상북도 고령군 대가야읍 내상2길 25-71', '2021-03-29 04:31:13', NULL),
('18a', '김현준', '48922', 1, '010-1994-7774', '1984-10-18', 'asdfzvzvxv@naver.com', '경기도 고양시 일산동구 공릉천로175번길 158', '2021-03-29 04:31:13', NULL),
('19a', '강현지', '48953', 1, '010-6634-7774', '1984-10-27', 'avkavxv@naver.com', '[도로명]서울특별시 강남구 개포로109길 21', '2021-03-29 04:31:13', NULL),
('20a', '강현지', '49635', 1, '010-6634-7421', '1984-10-11', 'aqqqv@naver.com', '[도로명]서울특별시 강남구 개포로109길 5', '2021-03-29 04:31:13', NULL),
('21a', '강지', '49666', 1, '010-6634-7994', '1977-10-19', 'aqqxxqv@naver.com', '[도로명]서울특별시 강남구 개포로 615', '2021-03-29 04:31:13', NULL),
('22a', '현지', '49697', 1, '010-6944-7773', '1977-10-25', 'aqqxxzxccccqv@naver.com', '[도로명]서울특별시 강남구 개포로 615', '2021-03-29 04:31:13', NULL),
('23a', '강현', '49728', 1, '010-6944-7112', '1977-10-25', 'aqqzxcacqv@naver.com', '[도로명]서울특별시 강남구 선릉로 26', '2021-03-29 04:31:13', NULL),
('da1', '나수영', '99156', 1, '010-3113-4112', '1996-10-20', 'adsa@naver.com', '경기도 수원시 102-11', '2021-03-20 04:31:13', NULL),
('da2', '이찬수', '99157', 1, '010-2312-1311', '1996-10-21', 'da2@naver.com', '서울 중구 1-120', '2021-02-21 05:31:11', NULL),
('da3', '정기태', '99158', 1, '010-4222-1113', '1996-10-24', 'dada@hanmail.com', '서울 강남 123-1', '2021-03-13 14:31:13', NULL),
('da4', '송병길', '99159', 1, '010-2221-1313', '1996-10-22', 'd13s@naver.com', '강원도 강원읍 10-11', '2021-03-11 02:11:11', NULL),
('da5', '박종화', '99160', 1, '010-3423-1121', '1996-10-25', 'd11@google.com', '서울 구로구 133-3', '2021-02-22 03:31:13', NULL),
('daww', '예준', '3076125', 1, '010-3251-5501', '1989-10-04', 'adwdazxxc@naver.com', '경상남도 거제시 연초면 명동5길 11', '2021-03-25 04:31:13', NULL),
('gyj', '가예준', '102840', 1, '010-3113-8842', '1996-10-01', 'avavzzz@naver.com', '경상남도 거제시 연초면 명동5길 13', '2021-03-30 04:31:13', NULL),
('kim123', '김우현', '-1131382525', 1, '010-1234-4321', '1994-01-22', 'kim123@naver.com', '경기 오산시 가장산업동로 69-27', '2021-05-05 06:35:03', NULL),
('mj11', '민준', '3350653', 1, '010-1215-4174', '1996-04-25', 'asfwww@gmail.com', '서울특별시 중구 명동9길 16(명동1가)', '2021-05-08 11:19:55', NULL),
('mj55', '김민준', '3350781', 1, '010-0188-1545', '1996-10-21', 'afawf@naver.com', '서울특별시 중구 명동9길 16(명동1가)', '2021-03-20 04:31:13', NULL),
('no11', '구민성', '3385249', 1, '010-1122-3344', '1991-01-31', 'no11@naver.com', '서울 서대문구 통일로 165', '2021-03-22 03:34:56', NULL),
('root', '관리자', '3506402', 10, '010-0000-0000', '1999-01-01', 'admin@admin.com', NULL, '2021-05-14 06:33:22', NULL),
('sar11', '민준', '109205764', 1, '010-1215-4174', '1996-04-25', 'asfwww@gmail.com', '서울특별시 중구 명동9길 16(명동1가)', '2021-05-08 11:19:05', NULL),
('sj', '이서준', '3671', 1, '010-0099-4172', '1996-04-04', 'ffdgggz@gmail.com', '경상남도 거제시 연초면 명동5길 9', '2021-05-21 11:19:05', NULL),
('test', '테스트', 'test', 1, '010-0101-0101', '1999-01-01', 'test@test', NULL, '2021-05-15 10:30:50', NULL);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`bno`),
  ADD KEY `uid` (`uid`),
  ADD KEY `pno` (`pno`);

--
-- 테이블의 인덱스 `cancel`
--
ALTER TABLE `cancel`
  ADD PRIMARY KEY (`ono`),
  ADD KEY `pno` (`pno`),
  ADD KEY `uid` (`uid`);

--
-- 테이블의 인덱스 `nextserial`
--
ALTER TABLE `nextserial`
  ADD PRIMARY KEY (`serialType`);

--
-- 테이블의 인덱스 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ono`),
  ADD KEY `pno` (`pno`),
  ADD KEY `uid` (`uid`);

--
-- 테이블의 인덱스 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pno`);

--
-- 테이블의 인덱스 `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`reqno`),
  ADD KEY `uid` (`uid`);

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`);

--
-- 테이블의 제약사항 `cancel`
--
ALTER TABLE `cancel`
  ADD CONSTRAINT `cancel_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`),
  ADD CONSTRAINT `cancel_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- 테이블의 제약사항 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- 테이블의 제약사항 `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
