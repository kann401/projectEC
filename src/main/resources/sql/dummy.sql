rollback;
-- 중복되는 이름의 테이블 삭제 (참조키포함해서 지우기)
drop table member CASCADE CONSTRAINTS;
drop table reservation CASCADE CONSTRAINTS;
drop table RESULT CASCADE CONSTRAINTS;
drop sequence reservation_seq;
select * from member;
-- 회원 정보 테이블
CREATE TABLE MEMBER (
   custid        varchar2(50) primary key,      -- 아이디
   password      varchar2(20) not null,         -- 비밀번호
   custname      varchar2(100) not null,        -- 소유자 이름
   name          varchar2(100) not null,        -- 가게 이름
   custtel       varchar2(30) not null,         -- 가입자 전화번호
   tel           varchar2(30) not null,         -- 업체 전화번호
   postcode      varchar2(100) not null,        -- 우편번호
   road          varchar2(100) not null,        -- 도로명 주소
   jibun         varchar2(100) not null,        -- 지번 주소
   idno          varchar2(100) unique,          -- 사업자 번호
   division      varchar2(20) not null,         -- 구분 : cafe(카페), business(수거업체)
   lat           varchar2(40) not null,         -- 주소의 위도
   lng           varchar2(40) not null,         -- 주소의 경도
   qrcode        varchar2(2000) unique          -- QR코드이미지명
);

-- 예약 테이블
CREATE TABLE RESERVATION (
   resernum        number          primary key,                                                             -- 예약 번호
   cafeid          varchar2(50)    not null        CONSTRAINT member_id_fk1 references member(custid),      -- 카페 아이디
   cafename        varchar2(100)   not null,                                                                -- 카페 이름
   cafetel         varchar2(30)    not null,                                                                -- 카페 전화번호
   businessid      varchar2(50)                   CONSTRAINT member_id_fk2 references member(custid),       -- 수거업체아이디
   businessname    varchar2(100)   not null,                                                                -- 수거업체이름
   businesstel     varchar2(30)    not null,                                                                -- 수거업체 전화번호
   reserDate       varchar2(30)    not null,                                                                -- 예약 날짜
   reserTime       varchar2(30)    not null,                                                                -- 예약 시간
   msg             varchar2(2)     default 'd',                                                             -- 메세지
   msgcheck        varchar2(2)     default '0',                                                             -- 메시지 확인 여부
   success         varchar2(2)     default '0'                                                              -- 성공여부
);

-- 예약 테이블 시퀀스
CREATE SEQUENCE reservation_seq start with 145;

-- 결과 테이블
CREATE TABLE RESULT(
   resernum           number              not null   CONSTRAINT reservation_num_fk references reservation(resernum),    -- 예약 번호
   cafeid             varchar2(50)        not null,                                                                     -- 카페 아이디
   cafename           varchar2(100)       not null,                                                                     -- 카페 이름
   cafepostcode       varchar2(100),                                                         							-- 카페 우편번호
   caferoad           varchar2(100),                                                        							-- 카페 도로명 주소
   businessid         varchar2(50)                    CONSTRAINT member_id_fk4 references member(custid),               -- 수거업체 아이디
   businessname       varchar2(100)       not null,                                                                     -- 수거업체 이름
   businesspostcode   varchar2(100),                                                         							-- 수거업체 우편번호
   businessroad       varchar2(100),                                                        							-- 수거업체 도로명 주소
   amount             number              not null,                                                                     -- 양
   realdate           date                default sysdate,                                                              -- 실제 날짜
   sign               varchar2(100)        not null unique                                                               -- 사인 전송
);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('cafeMamas', 'aaa', '카페마마스 코엑스점', '카페마마스 코엑스점', '02-6002-3240', '02-6002-3240', 6164.0, '서울 강남구 영동대로 513 (삼성동) 코엑스몰 p105호', '서울 강남구 삼성동 159 코엑스몰 p105호', '02-6002-3240', 'cafe', 37.5118232810781, 127.059159721989);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('sopresso', 'aaa', '소프레소 코엑스몰점', '소프레소 코엑스몰점', '02-551-8030', '02-551-8030', 6164.0, '서울 강남구 봉은사로 524 (삼성동) 코엑스몰 B1 Q105', '서울 강남구 삼성동 159 코엑스몰 B1 Q105', '02-551-8030', 'cafe', 37.5125226294782, 127.058820948489);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('ronepelt', 'aaa', ' 로네펠트티하우스 코엑스점', ' 로네펠트티하우스 코엑스점', '02-551-1823', '02-551-1823', 6164.0, '서울 강남구 봉은사로 524 (삼성동) 코엑스전시홀 1층 E001', '서울 강남구 삼성동 159 코엑스전시홀 1층 E001', '02-551-1823', 'cafe', 37.5125226294782, 127.058820948489);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('eskimo_co', 'aaa', '에스키모 코엑스몰점', '에스키모 코엑스몰점', '02-562-9244', '02-562-9244', 6164.0, '서울 강남구 봉은사로 524 (삼성동) 코엑스몰 B1 I105', '서울 강남구 삼성동 159 코엑스몰 B1 I105', '02-562-9244', 'cafe', 37.5125226294782, 127.058820948489);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('tosome_pos', 'aaa', '투썸플레이스 포스코사거리점', '투썸플레이스 포스코사거리점', '02-568-2377', '02-568-2377', 6178.0, '서울 강남구 테헤란로 508 (대치동) 해성2빌딩 1층', '서울 강남구 대치동 942-10 해성2빌딩 1층', '02-568-2377', 'cafe', 37.5067097353902, 127.058038261172);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('citybakery', 'aaa', '씨티베이커리', '씨티베이커리', '02-563-9966', '02-563-9966', 6165.0, '서울 강남구 봉은사로86길 28 (삼성동)', '서울 강남구 삼성동 148-9', '02-563-9966', 'cafe', 37.5116730041283, 127.056938177658);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('cafeRumi', 'aaa', '카페루미', '카페루미', '02-556-9317', '02-556-9317', 6128.0, '서울 강남구 강남대로102길 30 (역삼동)', '서울 강남구 역삼동 618-16', '02-556-9317', 'cafe', 37.5028247730304, 127.027807523384);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('newkoficoffee', 'aaa', '뉴코피커피', '뉴코피커피', '02-552-8522', '02-552-8522', 6123.0, '서울 강남구 강남대로102길 13-5 (역삼동)', '서울 강남구 역삼동 813-15', '02-552-8522', 'cafe', 37.5022988332513, 127.026735205882);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('corsocomo', 'aaa', '10 꼬르소 꼬모 카페', '10 꼬르소 꼬모 카페', '02-547-3010', '02-547-3010', 6015.0, '서울 강남구 압구정로 416 (청담동)', '서울 강남구 청담동 79', '02-547-3010 ', 'cafe', 37.5269276919481, 127.042405745389);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('sulbingEun', 'aaa', '설빙 서울연신내점', '설빙 서울연신내점', '070-4259-8277', '070-4259-8277', 3330.0, '서울 은평구 통일로 855-8 (갈현동)', '서울 은평구 갈현동 396-12', '070-4259-8277', 'cafe', 37.6190693218367, 126.920239996314);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('havana', 'aaa', '하바나', '하바나', '070-8928-8105', '070-8928-8105', 3331.0, '서울 은평구 연서로27길 16-9 (갈현동)', '서울 은평구 갈현동 453-9', '070-8928-8105', 'cafe', 37.6185127388332, 126.917943498551);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('cafemate', 'aaa', '카페메이트', '카페메이트', '02-356-7972', '02-356-7972', 3404.0, '서울 은평구 진흥로 85 (역촌동)', '서울 은평구 역촌동 27-10', '02-356-7972', 'cafe', 37.6045066267124, 126.921564689908);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('B_ROAD', 'aaa', 'B ROAD ', 'B ROAD ', '070-7379-5976', '070-7379-5976', 3449.0, '서울 은평구 증산로23길 12 (신사동)', '서울 은평구 신사동 22-25', '070-7379-5976', 'cafe', 37.597697105954, 126.914039293952);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('gosenInco', 'aaa', '고센인코퍼레이티드 청담점', '고센인코퍼레이티드 청담점', '02-515-1863', '02-515-1863', 6014.0, '서울 강남구 선릉로158길 18 (청담동)', '서울 강남구 청담동 88-23', '02-515-1863', 'cafe', 37.5252089256423, 127.041431874652);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('heavenRi29', 'aaa', '헤븐리29', '헤븐리29', '02-565-0029', '02-565-0029', 6194.0, '서울 강남구 삼성로85길 26 (대치동) 지하 1층', '서울 강남구 대치동 891-46 지하 1층', '02-565-0029', 'cafe', 37.5050677635093, 127.054983364275);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('able', 'aaa', '에이블', '에이블', '02-3445-7335', '02-3445-7335', 6029.0, '서울 강남구 압구정로14길 12 (신사동)', '서울 강남구 신사동 547-6', '02-3445-7335', 'cafe', 37.5235128519267, 127.023045845779);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('hanyeong', 'aaa', '한경자원', '한경자원', '010-1111-2223', '010-1111-2223', 4793.0, '서울특별시 성동구 아차산로5길 26 골든모터스', '서울특별시 성동구 성수동2가 289-290', '010-1111-2223', 'business', 37.547815552518145, 127.05356627689994);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('seongdong', 'aaa', '성동재활용센터', '성동재활용센터', '010-11111-2222', '010-11111-2222', 4766.0, '서울특별시 성동구 왕십리로 131 태용철강(주)', '서울특별시 성동구 성수동1가 656-854', '010-11111-2222', 'business', 37.5490159978485, 127.044088550831);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('jawon21', 'aaa', '자원21', '자원21', '070-8113-0741', '070-8113-0741', 6075.0, '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', '070-8113-0741', 'business', 37.5241542369028, 127.055816401249);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('deahan', 'aaa', '대한자원', '대한자원', '02-483-9745', '02-483-9745', 4780.0, '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', '02-483-9745', 'business', 37.540685129879, 127.049229753903);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('yoori', 'aaa', '우리자원', '우리자원', '02-465-7909', '02-465-7909', 4784.0, '서울특별시 성동구 뚝섬로13길 19 장안타운', '서울특별시 성동구 뚝섬로13길 19 장안타운', '02-465-7909', 'business', 37.5395676782072, 127.057660908091);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG) 
VALUES ('goldjawon', 'aaa', '황금자원', '황금자원', '010-1111-2224', '010-1111-2224', 4774.0, '서울특별시 성동구 성덕정9길 15', '서울특별시 성동구 성수동1가 34-7', '010-1111-2224', 'business', 37.5395964296765, 127.049926038334);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('scheng', 'aaa', '스타벅스 청담스타점', '스타벅스 청담스타점', '02-514-3364', '02-514-3364', '06016', '서울 강남구 도산대로57길 24 (청담동)', '서울 강남구 청담동 89-4', '000', 'cafe', 37.52525923818516, 127.04183916231236);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('schin', 'aaa', '스타벅스 신촌점', '스타벅스 신촌점', '02-758-8035', '02-758-8035', '03779', '서울 서대문구 연세로 10-1 (창천동)', '서울 서대문구 창천동 18-55 즐거운빌딩', '001', 'cafe', 37.55648937535412, 126.93712453647768);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('cbdae', 'aaa', '커피빈 대학로마로니에점', '커피빈 대학로마로니에점', '02-742-3318', '02-742-3318', '03086', '서울 종로구 대학로12길 62 (동숭동)', '서울 종로구 동숭동 1-95', '002', 'cafe', 37.58140236817008, 127.00370884595003);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('cbnowon', 'aaa', '커피빈 노원역점', '커피빈 노원역점', '02-952-9577', '02-952-9577', '01751', '서울 노원구 노해로 490 (상계동)', '서울 노원구 상계동 724-1', '003', 'cafe', 37.654409200093276, 127.06240945215843);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('twoposco', 'aaa', '투썸플레이스 포스코사거리점', '투썸플레이스 포스코사거리점', '02-568-2377', '02-568-2377', '06178', '서울 강남구 테헤란로 508 (대치동)', '서울 강남구 대치동 942-10', '004', 'cafe', 37.506817884826916, 127.0579795329566);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('twoseoul', 'aaa', '투썸플레이스 서울스퀘어점', '투썸플레이스 서울스퀘어점', '02-6456-8919', '02-6456-8919', '04637', '서울 중구 한강대로 416 (남대문로5가)', '서울 중구 남대문로5가 541', '005', 'cafe', 37.5555048939659, 126.97375281464888);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('japangi', 'aaa', '자판기', '자판기', '02-325-8185', '02-325-8185', '04014', '서울 마포구 월드컵로13길 79 (망원동, 해오름 주상복합)', '서울 마포구 망원동 400-2', '006', 'cafe', 37.55487564072113, 126.90588123777498);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('backan', 'aaa', '빽다방 안암역점', '빽다방 안암역점', '02-952-3246', '02-952-3246', '02842', '서울 성북구 인촌로27길 6 (안암동5가)', '서울 성북구 안암동5가 100-5', '007', 'cafe', 37.58665318872695, 127.03007138779193);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('backitae', 'aaa', '빽다방 이태원점', '빽다방 이태원점', '02-797-3122', '02-797-3122', '04391', '서울 용산구 보광로59길 37 (이태원동)', '서울 용산구 이태원동 66-8', '008', 'cafe', 37.53381146855898, 126.99187197523219);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('ediyano', 'aaa', '이디야커피 노들점', '이디야커피 노들점', '02-3665-4999', '02-3665-4999', '06913', '서울 동작구 노량진로 200 (노량진동)', '서울 동작구 노량진동 141', '009', 'cafe', 37.512904215724376, 126.94792005292635);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('ediyaye', 'aaa', '이디야커피 서여의도점', '이디야커피 서여의도점', '02-6747-3774', '02-6747-3774', '07237', '서울 영등포구 국회대로 780 (여의도동)', '서울 영등포구 여의도동 14-21', '011', 'cafe', 37.52983056041182, 126.91926712542124);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('tomga', 'aaa', '탐앤탐스 가로수길점', '탐앤탐스 가로수길점', '02-545-5789', '02-545-5789', '06035', '서울 강남구 강남대로156길 48 (신사동)', '서울 강남구 신사동 536-19', '012', 'cafe', 37.51902591063804, 127.02277298177991);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('tomgun', 'aaa', '탐앤탐스 군자역점', '탐앤탐스 군자역점', '02-3437-0279', '02-3437-0279', '04985', '서울 광진구 능동로 296 (능동)', '서울 광진구 능동 279-3 천해타워', '013', 'cafe', 37.55595687849077, 127.07934411213634);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('hollysbal', 'aaa', '할리스커피 발산역점', '할리스커피 발산역점', '02-2063-3534', '02-2063-3534', '07646', '서울 강서구 공항대로 284 (내발산동)', '서울 강서구 내발산동 646', '014', 'cafe', 37.558184064692966, 126.83910239669937);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('hollysgwa', 'aaa', '할리스커피 광나루역점', '할리스커피 광나루역점', '02-444-0542', '02-444-0542', '04983', '서울 광진구 천호대로 808 (광장동, 광장12차 현대홈타운)', '서울 광진구 광장동 580 광장12차 현대홈타운 1202동 상가 1층', '015', 'cafe', 37.545072804022126, 127.1027381007133);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('angelseok', 'aaa', '엔제리너스 석촌호수DI점', '엔제리너스 석촌호수DI점', '02-3431-7590', '02-3431-7590', '05610', '서울 송파구 석촌호수로 224 (석촌동)', '서울 송파구 석촌동 158-4', '016', 'cafe', 37.50713054104611, 127.10190342579162);

INSERT INTO member (CUSTID, PASSWORD, CUSTNAME, NAME, CUSTTEL, TEL, POSTCODE, ROAD, JIBUN, IDNO, DIVISION, LAT, LNG)
VALUES ('angelshin', 'aaa', '엔제리너스 신림역점', '엔제리너스 신림역점', '02-889-9820', '02-889-9820', '08776', '서울 관악구 남부순환로 1612 (신림동)', '서울 관악구 신림동 1640-10', '017', 'cafe', 37.48386419594707, 126.92942916949674);

--QR 코드값이 있는 멤버
Insert into MEMBER (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('scitmaster','aaa','마스터','쵸또마떼커피','029876543','01098745632','06212','서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)','서울 강남구 역삼동 708-31','97846','cafe','37.50311729059877','127.04833651218424','QRCode_scitmaster_1506519973843.png');
Insert into MEMBER (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('kusuri','aaa','우종완','쿠스리카페','021234567','01012345678','06252','서울 강남구 강남대로 328 (역삼동)','서울 강남구 역삼동 832-3','98765','cafe','37.49242638484167','127.0309201030125','QRCode_kusuri_1506519753055.png');
Insert into MEMBER (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht9158','aaa','안현태','TERAROSA','01066411975','0103841975','06164','서울 강남구 영동대로 513 (삼성동)','서울 강남구 삼성동 159-1','910508','cafe','37.51182328107812','127.05915972198929','QRCode_aht9158_1506519893320.png');

Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1111','aaa','낙성대','이디야 낙성대점','01065478945','023987465','08793','서울 관악구 낙성대역3길 3 (봉천동)','서울 관악구 봉천동 1630-11','12457','cafe','37.47631424771791','126.96187369645854','QRCode_aht1111_1506576566264.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1112','aaa','내방역','스타벅스 내방역점','01054789354','024681357','06573','서울 서초구 서초대로 지하 103 (방배동)','서울 서초구 방배동 874-16','64823','cafe','37.487532357103085','126.99318861355258','QRCode_aht1112_1506576735352.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1113','aaa','충무로','빽다방 충무로점','01048763254','024985135','31174','충남 천안시 서북구 충무로 93 (쌍용동, 쌍용역푸르지오)','충남 천안시 서북구 쌍용동 2050','45683','cafe','36.79195507208656','127.11871788346201','QRCode_aht1113_1506576795174.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1114','aaa','영등포','엔젤리너스 영등포역점','01098711254','026936458','07305','서울 영등포구 경인로 지하 843 (영등포동3가)','서울 영등포구 영등포동4가 423-98','83523','cafe','37.516461205976995','126.90665796055335','QRCode_aht1114_1506576908150.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1115','aaa','구로역','안태커피 구로점','01066587465','024657984','08302','서울 구로구 가마산로 268 (구로동)','서울 구로구 구로동 98-4','45457','cafe','37.49561593300481','126.89031854415833','QRCode_aht1115_1506576957151.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1116','aaa','까치산','안태커피 까치산점','01065478945','023165785','07757','서울 강서구 강서로 지하 54 (화곡동)','서울 강서구 화곡동 662-5','56568','cafe','37.53195698666088','126.84661226903779','QRCode_aht1116_1506577020460.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('aht1117','aaa','오목교','헬로우커피','01089787889','025647897','08006','서울 양천구 오목로 지하 342 (목동)','서울 양천구 목동 406-30','32321','cafe','37.524451239657594','126.87535270115818','QRCode_aht1117_1506577090930.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('cafenomou','aaa','연춘자','Cafe Nomou ','010-5212-9785','02-335-5545','02704','서울 성북구 보국문로 215 (정릉동)','서울 성북구 정릉동 829','885213','cafe','37.61818084663695','126.99748997273866','QRCode_cafenomou_1506576797603.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('Monkeycafe','aaa','전대영','Monke yCafe','010-5212-9783','02-478-4625','01339','서울 도봉구 도당로 118 (방학동)','서울 도봉구 방학동 701-15','3312423','cafe','37.667025617157805','127.03953388620532','QRCode_Monkeycafe_1506576995152.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('Koffee','aaa','팽봉숙','Koffe shop','010-6221-3547','02-532-7988','01887','서울 노원구 광운로 95 (월계동)','서울 노원구 월계동 364-2','33142','cafe','37.62601143457995','127.05996603540497','QRCode_Koffee_1506577144235.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('BillyCafe','aaa','홍만룡','BillyCafe','010-2315-8474','02-6125-7754','03046','서울 종로구 자하문로36길 16-14 (청운동, 청운벽산빌리지)','서울 종로구 청운동 1','1223','cafe','37.59158291652401','126.96801533929137','QRCode_BillyCafe_1506577345871.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('jjajan','aaa','봉현경','jjajancafe','010-8956-1234','02-3215-8987','01143','서울 강북구 오현로 187-25 (번동)','서울 강북구 번동 317','123234','cafe','37.62942628504073','127.03799140524885','QRCode_jjajan_1506577491850.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('coffeezip','aaa','임춘례','Coffee Zip 강북점','010-6645-9987','02-470-4555','01369','서울 도봉구 삼양로144길 33 (쌍문동)','서울 도봉구 쌍문동 416-2','870707','cafe','37.64950880707469','127.01639455013195','QRCode_coffeezip_1506576611497.png');
Insert into member (CUSTID,PASSWORD,CUSTNAME,NAME,CUSTTEL,TEL,POSTCODE,ROAD,JIBUN,IDNO,DIVISION,LAT,LNG,QRCODE) values ('EveryCafe','aaa','손양숙','EveryCafe','010-6645-9442','02-422-3232','01897','서울 노원구 광운로 20 (월계동)','서울 노원구 월계동 403-24','423123','cafe','37.61931971719905','127.05833863277502','QRCode_EveryCafe_1506577225362.png');
commit;

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('1', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-08', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('2', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-11', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('3', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-14', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('4', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-17', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('5', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-20', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('6', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-23', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('7', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-26', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('8', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-04-29', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('9', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-01', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('10', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-04', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('11', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-07', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('12', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-10', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('13', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-13', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('14', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-16', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('15', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-19', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('16', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-22', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('17', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-25', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('18', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-05-28', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('19', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-01', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('20', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-04', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('21', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-07', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('22', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-10', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('23', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-13', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('24', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-16', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('25', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-19', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('26', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-22', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('27', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-25', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('28', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-28', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('29', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-06-31', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('30', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-03', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('31', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-06', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('32', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-09', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('33', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-12', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('34', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-15', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('35', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-18', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('36', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-21', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('37', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-24', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('38', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-27', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('39', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-07-30', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('40', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-02', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('41', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-05', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('42', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-08', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('43', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-11', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('44', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-14', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('45', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-17', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('46', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-20', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('47', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-23', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('48', 'aht9158', 'TERAROSA', '02-384-1975', 'jawon21', '자원21', '070-8113-0741', '2019-08-26', '09:00', 'e', '2', '1');

--결과테이블 더미


INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (1, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 1, '19/04/08', 'sign_1_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (2, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 2, '19/04/11', 'sign_2_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (3, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 2, '19/04/14', 'sign_3_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (4, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 4, '19/04/17', 'sign_4_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (5, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 4, '19/04/20', 'sign_5_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (6, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 3, '19/04/23', 'sign_6_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (7, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 4, '19/04/26', 'sign_7_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (8, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/04/29', 'sign_8_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (9, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/05/01', 'sign_9_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (10, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 3, '19/05/04', 'sign_10_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (11, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 4, '19/05/07', 'sign_11_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (12, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 4, '19/05/10', 'sign_12_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (13, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/05/13', 'sign_13_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (14, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/05/16', 'sign_14_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (15, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 4, '19/05/19', 'sign_15_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (16, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/05/22', 'sign_16_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (17, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/05/25', 'sign_17_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (18, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/05/28', 'sign_18_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (19, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/06/01', 'sign_19_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (20, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/06/04', 'sign_20_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (21, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/06/07', 'sign_21_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (22, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/06/10', 'sign_22_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (23, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/06/13', 'sign_23_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (24, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/06/16', 'sign_24_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (25, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/06/19', 'sign_25_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (26, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/06/22', 'sign_26_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (27, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/06/25', 'sign_27_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (28, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/06/28', 'sign_28_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (29, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/06/31', 'sign_29_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (30, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/07/03', 'sign_30_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (31, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/07/06', 'sign_31_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (32, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/07/09', 'sign_32_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (33, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/07/12', 'sign_33_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (34, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 5, '19/07/15', 'sign_34_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (35, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 6, '19/07/18', 'sign_35_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (36, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 7, '19/07/21', 'sign_36_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (37, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 8, '19/07/24', 'sign_37_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (38, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 9, '19/07/27', 'sign_38_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (39, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 9, '19/07/30', 'sign_39_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (40, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 8, '19/08/02', 'sign_40_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (41, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 9, '19/08/05', 'sign_41_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (42, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 10, '19/08/08', 'sign_42_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (43, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 10, '19/08/11', 'sign_43_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (44, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 9, '19/08/14', 'sign_44_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (45, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 9, '19/08/15', 'sign_45_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (46, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 10, '19/08/16', 'sign_46_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (47, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 10, '19/08/17', 'sign_47_aht9158_jawon21.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (48, 'aht9158', 'TERAROSA', '06164', '서울 강남구 영동대로 513 (삼성동)', 'jawon21', '자원21', '6075', '서울특별시 강남구 영동대로142길 7 뉴현대리버빌', 10, '19/08/18', 'sign_48_aht9158_jawon21.png');


INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('49', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-08', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('50', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-11', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('51', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-14', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('52', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-17', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('53', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-20', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('54', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-23', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('55', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-26', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('56', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-04-29', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('57', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-01', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('58', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-04', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('59', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-07', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('60', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-10', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('61', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-13', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('62', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-16', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('63', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-19', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('64', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-22', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('65', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-25', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('66', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-05-28', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('67', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-01', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('68', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-04', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('69', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-07', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('70', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-10', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('71', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-13', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('72', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-16', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('73', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-19', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('74', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-22', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('75', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-25', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('76', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-28', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('77', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-06-31', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('78', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-03', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('79', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-06', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('80', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-09', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('81', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-12', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('82', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-15', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('83', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-18', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('84', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-21', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('85', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-24', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('86', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-27', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('87', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-07-30', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('88', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-02', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('89', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-05', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('90', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-08', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('91', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-11', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('92', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-14', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('93', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-17', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('94', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-20', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('95', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-23', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('96', 'kusuri', '쿠스리카페', '02-123-4567', 'deahan', '대한자원', '02-483-9745', '2019-08-26', '09:00', 'e', '2', '1');

commit;
--결과테이블 더미


INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (49, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 1, '19/04/08', 'sign_49_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (50, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 1, '19/04/11', 'sign_50_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (51, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 2, '19/04/14', 'sign_51_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (52, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 2, '19/04/17', 'sign_52_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (53, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 1, '19/04/20', 'sign_53_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (54, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 2, '19/04/23', 'sign_54_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (55, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 1, '19/04/26', 'sign_55_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (56, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 4, '19/04/29', 'sign_56_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (57, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 3, '19/05/01', 'sign_57_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (58, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 2, '19/05/04', 'sign_58_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (59, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 3, '19/05/07', 'sign_59_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (60, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 4, '19/05/10', 'sign_60_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (61, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 3, '19/05/13', 'sign_61_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (62, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 2, '19/05/16', 'sign_62_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (63, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 3, '19/05/19', 'sign_63_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (64, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 4, '19/05/22', 'sign_64_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (65, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/05/25', 'sign_65_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (66, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 4, '19/05/28', 'sign_66_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (67, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/06/01', 'sign_67_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (68, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/06/04', 'sign_68_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (69, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 7, '19/06/07', 'sign_69_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (70, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/06/10', 'sign_70_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (71, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/06/13', 'sign_71_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (72, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 7, '19/06/16', 'sign_72_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (73, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/06/19', 'sign_73_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (74, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/06/22', 'sign_74_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (75, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/06/25', 'sign_75_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (76, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/06/28', 'sign_76_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (77, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 4, '19/06/31', 'sign_77_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (78, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 4, '19/07/03', 'sign_78_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (79, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 3, '19/07/06', 'sign_79_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (80, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/07/09', 'sign_80_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (81, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/07/12', 'sign_81_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (82, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/07/15', 'sign_82_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (83, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/07/18', 'sign_83_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (84, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/07/21', 'sign_84_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (85, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/07/24', 'sign_85_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (86, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/07/27', 'sign_86_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (87, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/07/30', 'sign_87_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (88, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/08/02', 'sign_88_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (89, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/08/05', 'sign_89_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (90, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/08/08', 'sign_90_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (91, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/08/11', 'sign_91_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (92, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 5, '19/08/14', 'sign_92_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (93, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/08/15', 'sign_93_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (94, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/08/16', 'sign_94_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (95, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 6, '19/08/17', 'sign_95_kusuri_deahan.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (96, 'kusuri', '쿠스리카페', '06252', '서울 강남구 강남대로 328(역삼동)', 'deahan', '대한자원', '4780.0', '서울특별시 성동구 뚝섬로 345 홈플러스 익스프레스', 8, '19/08/18', 'sign_96_kusuri_deahan.png');
commit;
--###########여기까지

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('97', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-08', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('98', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-11', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('99', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-14', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('100', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-17', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('101', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-20', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('102', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-23', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('103', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-26', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('104', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-04-29', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('105', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-01', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('106', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-04', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('107', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-07', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('108', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-10', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('109', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-13', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('110', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-16', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('111', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-19', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('112', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-22', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('113', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-25', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('114', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-05-28', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('115', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-01', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('116', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-04', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('117', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-07', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('118', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-10', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('119', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-13', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('120', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-16', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('121', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-19', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('122', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-22', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('123', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-25', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('124', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-28', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('125', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-06-31', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('126', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-03', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('127', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-06', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('128', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-09', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('129', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-12', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('130', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-15', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('131', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-18', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('132', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-21', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('133', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-24', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('134', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-27', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('135', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-07-30', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('136', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-02', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('137', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-05', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('138', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-08', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('139', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-11', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('140', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-14', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('141', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-17', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('142', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-20', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('143', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-23', '09:00', 'e', '2', '1');

INSERT INTO reservation (RESERNUM, CAFEID, CAFENAME, CAFETEL, BUSINESSID, BUSINESSNAME, BUSINESSTEL, RESERDATE, RESERTIME, MSG, MSGCHECK, SUCCESS) 
VALUES ('144', 'scitmaster', '쵸또마떼커피', '02-987-6543', 'seongdong', '성동재활용센터', '010-11111-2222', '2019-08-26', '09:00', 'e', '2', '1');

--결과테이블 더미
select * from member where custid = 'seongdong';

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (97, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 1, '19/04/08', 'sign_97_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (98, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 1, '19/04/11', 'sign_98_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (99, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 1, '19/04/14', 'sign_99_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (100, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 2, '19/04/17', 'sign_100_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (101, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 3, '19/04/20', 'sign_101_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (102, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 2, '19/04/23', 'sign_102_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (103, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 1, '19/04/26', 'sign_103_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (104, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 1, '19/04/29', 'sign_104_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (105, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/05/01', 'sign_105_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (106, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 3, '19/05/04', 'sign_106_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (107, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 3, '19/05/07', 'sign_107_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (108, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 2, '19/05/10', 'sign_108_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (109, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 2, '19/05/13', 'sign_109_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (110, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 2, '19/05/16', 'sign_110_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (111, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 2, '19/05/19', 'sign_111_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (112, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 3, '19/05/22', 'sign_112_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (113, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/05/25', 'sign_113_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (114, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 3, '19/05/28', 'sign_114_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (115, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/01', 'sign_115_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (116, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/06/04', 'sign_116_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (117, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/07', 'sign_117_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (118, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/10', 'sign_118_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (119, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/13', 'sign_119_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (120, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/16', 'sign_120_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (121, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/19', 'sign_121_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (122, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 6, '19/06/22', 'sign_122_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (123, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/25', 'sign_123_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (124, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 6, '19/06/28', 'sign_124_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (125, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/06/31', 'sign_125_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (126, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/07/03', 'sign_126_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (127, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 3, '19/07/06', 'sign_127_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (128, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/07/09', 'sign_128_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (129, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/07/12', 'sign_129_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (130, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/07/15', 'sign_130_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (131, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/07/18', 'sign_131_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (132, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/07/21', 'sign_132_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (133, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/07/24', 'sign_133_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (134, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/07/27', 'sign_134_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (135, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 6, '19/07/30', 'sign_135_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (136, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 4, '19/08/02', 'sign_136_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (137, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/08/05', 'sign_137_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (138, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/08/08', 'sign_138_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (139, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 7, '19/08/11', 'sign_139_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (140, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 5, '19/08/14', 'sign_140_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (141, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 8, '19/08/15', 'sign_141_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (142, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 9, '19/08/16', 'sign_142_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (143, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 8, '19/08/17', 'sign_143_scitmaster_seongdong.png');

INSERT INTO result (RESERNUM, CAFEID, CAFENAME, CAFEPOSTCODE, CAFEROAD, BUSINESSID, BUSINESSNAME, BUSINESSPOSTCODE, BUSINESSROAD, AMOUNT, REALDATE, SIGN) 
VALUES (144, 'scitmaster', '쵸또마떼커피', '06212', '서울 강남구 선릉로87길 14 (역삼동, 선릉역 우정에쉐르멤버스)', 'seongdong', '성동재활용센터', '4766', '서울특별시 성동구 왕십리로 131 태용철강(주)', 8, '19/08/18', 'sign_144_scitmaster_seongdong.png');

commit;

select * from member;

select * from result
order by amount asc;