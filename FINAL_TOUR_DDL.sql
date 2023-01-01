SET DEFINE OFF;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER (
   UNO NUMBER   PRIMARY KEY,
   U_NAME VARCHAR2(100) NOT NULL,
   U_EMAIL VARCHAR2(200) UNIQUE,
   U_PASSWORD VARCHAR2(1000),
   U_PHONE   VARCHAR2(200) NOT NULL,
   U_ADDRESS VARCHAR2(400),
   U_AVATAR   VARCHAR2(200) DEFAULT 'https://cdn.pixabay.com/photo/2016/09/28/02/14/user-1699635_960_720.png' ,
   U_STATUS   VARCHAR2(10) DEFAULT 'Y' CHECK(U_STATUS IN('Y', 'N')),
   MANAGER_STATUS VARCHAR2(10) DEFAULT 'N' CHECK(MANAGER_STATUS IN('Y', 'N'))
);
DROP SEQUENCE SEQ_MEMBER_UNO;
CREATE SEQUENCE SEQ_MEMBER_UNO;

---------USER 가라데이터----------
INSERT INTO MEMBER VALUES (41, '김길동', 'kim@kim.kr', '$2a$10$rmoiboMvAa50Dcap4MsGauYqhycfQ9a1gN2Nn//aMrCO74iteXVoq', '010-1111-1111', '서울시 강남구 역삼동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '김나임', 'kim1@gmail.com', '1234', '010-1234-1234', '서울시 강남구 역삼동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '김태은', 'kim2@gmail.com', '5678', '010-5678-5678', '서울시 강남구 양재동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '박혜연', 'park1@gmail.com', '9101', '010-9101-9101', '서울시 강남구 도곡동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '선형채', 'sun1@gmail.com', '1112', '010-1112-1112', '서울시 강남구 대치동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '윤하영', 'yoon1@gmail.com', '1314', '010-1314-1314', '서울시 강남구 청담동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '정수아', 'jung1@gmail.com', '1516', '010-1516-1516', '서울시 강남구 삼성동', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (SEQ_MEMBER_UNO.NEXTVAL, '정원일', 'jung2@gmail.com', '1718', '010-1718-1718', '서울시 강남구 논현동', DEFAULT, DEFAULT, DEFAULT);

---------관광찜 테이블--------
DROP TABLE TOUR_LIKE CASCADE CONSTRAINTS;
CREATE TABLE TOUR_LIKE (
	LIKE_NO NUMBER PRIMARY KEY,
	UNO NUMBER NOT NULL,
	CONTENTID NUMBER NOT NULL
);

DROP SEQUENCE SEQ_LIKE_NO;
CREATE SEQUENCE SEQ_LIKE_NO;



-------리뷰 테이블-------

DROP TABLE REVIEW_TOTAL CASCADE CONSTRAINTS;
CREATE TABLE REVIEW_TOTAL (
	REVIEW_NO NUMBER PRIMARY KEY,
	CONTENTID NUMBER NOT NULL,
	UNO NUMBER NOT NULL,
	STAR NUMBER,
	CONTENT VARCHAR2(2000)
);

DROP SEQUENCE SEQ_REVIEW_NO;
CREATE SEQUENCE SEQ_REVIEW_NO;


--------------------------------------------------------------------------------
--------------------------- 상세 리뷰 작성 조회 KNI ------------------------------
--------------------------------------------------------------------------------
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, '2002485', '1', '4', '매우 좋아요');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, '2002485', '2', '3', '별로입니다');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, '2002485', '3', '5', '행복해요');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, '2002485', '4', '1', '슬퍼요');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, '140736', '5', '1', '신나요');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, '140736', '2', '4', '노잼이요');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, 2661435, 1, 4, '아 정말 재밌었습니다');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, 2661435, 2, 5, '오 이렇게 좋은 곳이');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, 1583188, 2, 5, '괜찮습니다');
INSERT INTO REVIEW_TOTAL VALUES (SEQ_REVIEW_NO.NEXTVAL, 2661435, 3, 2, '전 별로');


--------------------------------------------------------------------------------
-------------------------------USER, 찜, 리뷰 DDL 끝 KTE-------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-------------------------------TOUR INFO DDL 시작 JSA, KNI-----------------------
--------------------------------------------------------------------------------


-- 관광 공통정보 DDL     
DROP TABLE BASIC_TOUR_INFO CASCADE CONSTRAINTS;
CREATE TABLE BASIC_TOUR_INFO (

    CONTENTID        NUMBER           PRIMARY KEY,
    CONTENTTYPEID    NUMBER              NOT NULL,
    TITLE            VARCHAR2(600)       NOT NULL,
    TEL              VARCHAR2(600)           NULL,
    TELNAME          VARCHAR2(1000)          NULL,
    HOMEPAGE         VARCHAR2(4000)          NULL,
    BOOKTOUR         NUMBER                  NULL,
    FIRSTIMAGE       VARCHAR2(100)           NULL,
    FIRSTIMAGE2      VARCHAR2(100)           NULL,
    AREACODE         NUMBER                  NULL,
    SIGUNGUCODE      NUMBER                  NULL,
    CAT1             VARCHAR2(12)            NULL,
    CAT2             VARCHAR2(12)            NULL,        
    CAT3             VARCHAR2(12)            NULL,
    ADDR1            VARCHAR2(400)           NULL,
    ADDR2            VARCHAR2(400)           NULL,       
    ZIPCODE          NUMBER                  NULL,
    MAPX             VARCHAR2(30)            NULL,
    MAPY             VARCHAR2(30)            NULL,
    MLEVEL           VARCHAR2(10)            NULL,
    OVERVIEW         CLOB                    NULL     
);


-- 관광지 소개정보 DDL     
DROP TABLE DETAIL_TOURIST CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_TOURIST (

    CONTENTID        NUMBER           PRIMARY KEY,
    CONTENTTYPEID    NUMBER              NOT NULL,
    HERITAGE1        NUMBER                  NULL,
    HERITAGE2        NUMBER                  NULL,
    HERITAGE3        NUMBER                  NULL,
    INFOCENTER       VARCHAR2(4000)          NULL,
    OPENDATE         VARCHAR2(300)           NULL,
    RESTDATE         VARCHAR2(1500)          NULL,
    EXPGUIDE         CLOB                    NULL,
    EXPAGERANGE      VARCHAR2(500)           NULL,
    ACCOMCOUNT       VARCHAR2(1500)          NULL,
    USESEASON        VARCHAR2(500)           NULL,
    USETIME          CLOB                    NULL,
    PARKING          CLOB                    NULL,     
    CHKBABYCARRIAGE  VARCHAR2(200)           NULL,
    CHKCREDITCARD    VARCHAR2(100)           NULL,
    CHKPET           VARCHAR2(200)           NULL 
    
);
-- SELECT * FROM INFO_DETAIL_TOURIST;


-- 문화시설 소개정보 DDL     
-- SCALE이 sql문법으로 인식 되어서 CUL_SCALE로 임시변경했습니다
DROP TABLE DETAIL_CULTURAL CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_CULTURAL (

    CONTENTID               NUMBER           PRIMARY KEY,
    CONTENTTYPEID           NUMBER              NOT NULL,
    CUL_SCALE               VARCHAR2(4000)          NULL,     
    USEFEE                  CLOB                    NULL,
    DISCOUNTINFO            VARCHAR2(4000)          NULL,
    SPENDTIME               VARCHAR2(2000)          NULL,
    PARKINGFEE              CLOB                    NULL,
    INFOCENTERCULTURE       VARCHAR2(4000)          NULL,
    ACCOMCOUNTCULTURE       VARCHAR2(1500)          NULL,
    USETIMECULTURE          CLOB                    NULL,
    RESTDATECULTURE         VARCHAR2(1500)          NULL,
    PARKINGCULTURE          CLOB                    NULL,
    CHKBABYCARRIAGECULTURE  VARCHAR2(200)           NULL,
    CHKPETCULTURE           VARCHAR2(200)           NULL,
    CHKCREDITCARDCULTURE    VARCHAR2(100)           NULL
);
-- SELECT * FROM INFO_DETAIL_CULTURAL;


-- 행사축제 소개정보 DDL     
-- PROGRAM이 sql문법으로 인식되어 EV_PROGRAM 으로 변경하였습니다 
DROP TABLE DETAIL_EVENT CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_EVENT (

    CONTENTID               NUMBER           PRIMARY KEY,
    CONTENTTYPEID           NUMBER              NOT NULL,
    SPONSOR1                VARCHAR2(800)           NULL,
    SPONSOR1TEL             VARCHAR2(300)           NULL,
    SPONSOR2                VARCHAR2(300)           NULL,
    SPONSOR2TEL             VARCHAR2(300)           NULL,
    EVENTENDDATE            NUMBER                  NULL,
    PLAYTIME                CLOB                    NULL,
    EVENTPLACE              VARCHAR2(500)           NULL,
    EVENTHOMEPAGE           VARCHAR2(1000)          NULL,
    AGELIMIT                VARCHAR2(2000)          NULL,
    BOOKINGPLACE            CLOB                    NULL,
    PLACEINFO               CLOB                    NULL,
    SUBEVENT                CLOB                    NULL,
    EV_PROGRAM              CLOB                    NULL,
    EVENTSTARTDATE          NUMBER                  NULL,
    USETIMEFESTIVAL         CLOB                    NULL,
    DISCOUNTINFOFESTIVAL    CLOB                    NULL,
    SPENDTIMEFESTIVAL       CLOB                    NULL,
    FESTIVALGRADE           VARCHAR2(100)           NULL
);
-- SELECT * FROM INFO_DETAIL_EVENT;

---------DETAIL_SPORTS 테이블----------
DROP TABLE DETAIL_SPORTS CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_SPORTS (
	CONTENTID			NUMBER	NOT NULL PRIMARY KEY,
	CONTENTTYPEID			NUMBER	NOT NULL,
	ACCOMCOUNTLEPORTS		VARCHAR2(4000)	NULL,
	CHKBABYCARRIAGELEPORTS		VARCHAR2(200)	NULL,
	CHKCREDITCARDLEPORTS		VARCHAR2(100)	NULL,
	CHKPETLEPORTS			VARCHAR2(200)	NULL,
	EXPAGERANGELEPORTS		VARCHAR2(500)	NULL,
	INFOCENTERLEPORTS		VARCHAR2(4000)	NULL,
	OPENPERIOD			VARCHAR2(300)	NULL,
	PARKINGFEELEPORTS		CLOB	NULL,
	PARKINGLEPORTS			CLOB	NULL,
	RESERVATION			VARCHAR2(4000)	NULL,
	RESTDATELEPORTS			VARCHAR2(1500)	NULL,
	SCALELEPORTS			VARCHAR2(4000)	NULL,
	USEFEELEPORTS			CLOB	NULL,
	USETIMELEPORTS			CLOB	NULL
);

-- SELECT * FROM DETAIL_SPORTS;

---------DETAIL_SHOPPING 테이블------
DROP TABLE DETAIL_SHOPPING CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_SHOPPING (
	CONTENTID		NUMBER	NOT NULL PRIMARY KEY,
	CONTENTTYPEID		NUMBER	NOT NULL,
	CHKBABYCARRIAGE	VARCHAR2(200)	NULL,
	CHKCREDITCARD		VARCHAR2(100)	NULL,
	CHKPETSHOPPING 		VARCHAR2(200)	NULL,
	CULTURECENTER		VARCHAR2(1000)	NULL,
	FAIRDAY			VARCHAR2(100)	NULL,
	INFOCENTERSHOPPING	VARCHAR2(4000)	NULL,
	OPENDATESHOPPING	VARCHAR2(300)	NULL,
	OPENTIME		VARCHAR2(4000)	NULL,
	PARKINGSHOPPING	CLOB	NULL,
	RESTDATESHOPPING	VARCHAR2(1500)	NULL,
	RESTROOM		VARCHAR2(2000)	NULL,
	SALEITEM		VARCHAR2(1000)	NULL,
	SALEITEMCOST		CLOB	NULL,
	SCALESHOPPING		VARCHAR2(4000)	NULL,
	SHOPGUIDE		CLOB	NULL
);

-- SELECT * FROM DETAIL_SHOPPING;


---------DETAIL_RESTAURANT  테이블-----
DROP TABLE DETAIL_RESTAURANT CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_RESTAURANT (
	CONTENTID		NUMBER	NOT NULL PRIMARY KEY,
	CONTENTTYPEID		NUMBER	NOT NULL,
	CHKCREDITCARDFOOD	VARCHAR2(100)     NULL,
	DISCOUNTINFOFOOD	CLOB	NULL,
	FIRSTMENU		CLOB	NULL,
	INFOCENTERFOOD		VARCHAR2(4000)	NULL,
	KIDSFACILITY		VARCHAR2(1)	NULL,
	OPENDATEFOOD		VARCHAR2(300)	NULL,
	OPENTIMEFOOD		VARCHAR2(300)	NULL,
	PACKING			VARCHAR2(1000)	NULL,
	PARKINGFOOD		CLOB	NULL,
	RESERVATIONFOOD	VARCHAR2(4000)	NULL,
	RESTDATEFOOD		VARCHAR2(300)	NULL,
	SCALEFOOD		VARCHAR2(4000)	NULL,
	SEAT			VARCHAR2(200)	NULL,
	SMOKING		VARCHAR2(200)	NULL,
	TREATMENU		CLOB	NULL,
	LCNSNO			VARCHAR2(100)	NULL
);
-- SELECT * FROM DETAIL_RESTAURANT;

---------DETAIL_COURSE  테이블----------
DROP TABLE DETAIL_COURSE CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_COURSE (
	CONTENTID	NUMBER	NOT NULL PRIMARY KEY,
	CONTENTTYPEID	NUMBER	NOT NULL,
	DISTANCE	VARCHAR2(100)	NULL,
	INFOCENTERTOURCOURSE	VARCHAR2(4000)	NULL,
	SCHEDULE	VARCHAR2(20)	NULL,
	TAKETIME	 	 VARCHAR2(100)	NULL,
	THEME		VARCHAR2(40)	NULL
);
-- SELECT * FROM DETAIL_COURSE;

---------DETAIL_HOTEL 테이블--------------
DROP TABLE DETAIL_HOTEL CASCADE CONSTRAINTS;
CREATE TABLE DETAIL_HOTEL (
	CONTENTID	NUMBER	NOT NULL PRIMARY KEY,
	CONTENTTYPEID	NUMBER	NOT NULL,
	ACCOMCOUNTLODGING	VARCHAR2(1500)	NULL,
	BENIKIA	VARCHAR2(1)	NULL,
	CHECKINTIME	VARCHAR2(1000)	NULL,
	CHECKOUTTIME	VARCHAR2(1000)	NULL,
	CHKCOOKING	VARCHAR2(1000)	NULL,
	FOODPLACE	CLOB	NULL,
	GOODSTAY	VARCHAR2(1)	NULL,
	HANOK		VARCHAR2(1)	NULL,
	INFOCENTERLODGING	VARCHAR2(4000)	NULL,
	PARKINGLODGING 	CLOB	NULL,
	PICKUP		VARCHAR2(500)	NULL,
	ROOMCOUNT	VARCHAR2(1000)	NULL,
	RESERVATIONLODGING	VARCHAR2(4000)	NULL,
	RESERVATIONURL	VARCHAR2(1000)	NULL,
	ROOMTYPE	CLOB	NULL,
	SCALELODGING	VARCHAR2(4000)	NULL,
	SUBFACILITY	CLOB	NULL,
	BARBECUE	VARCHAR2(1)	NULL,
	BEAUTY		VARCHAR2(1)	NULL,
	BEVERAGE	VARCHAR2(1)	NULL,
	BICYCLE		VARCHAR2(1)	NULL,
	CAMPFIRE	VARCHAR2(1)	NULL,
	FITNESS		VARCHAR2(1)	NULL,
	KARAOKE		VARCHAR2(1)	NULL,
	PUBLICBATH	VARCHAR2(1)	NULL,
	PUBLICPC		VARCHAR2(1)	NULL,
	SAUNA		VARCHAR2(1)	NULL,
	SEMINAR		VARCHAR2(1)	NULL,
	SPORTS		VARCHAR2(1)	NULL,
	REFUNDREGULATION	VARCHAR2(2000)	NULL
);

--SELECT * FROM DETAIL_HOTEL;


---------REPEAT_INFO 테이블----------------
DROP TABLE REPEAT_INFO CASCADE CONSTRAINTS;
CREATE TABLE REPEAT_INFO (
	RE_SEQ		NUMBER	NOT NULL PRIMARY KEY,
	CONTENTID	NUMBER	NOT NULL,
	CONTENTTYPEID   NUMBER NULL,
	SERIALNUM	NUMBER	NULL,
	FLDGUBUN	NUMBER	NULL,
	INFONAME	VARCHAR2(600)	NULL,
	INFOTEXT 	CLOB	NULL
);

DROP SEQUENCE SEQ_RE;
CREATE SEQUENCE SEQ_RE;
--SELECT * FROM REPEAT_INFO;


---------REPEAT_COURSE 테이블------------
DROP TABLE REPEAT_COURSE CASCADE CONSTRAINTS;
CREATE TABLE REPEAT_COURSE (
	COURSE_DETAIL_NO	NUMBER	NOT NULL PRIMARY KEY,
	CONTENTID		NUMBER NOT NULL,
	CONTENTTYPEID		NUMBER	NULL,
	SUBNUM			NUMBER	NULL,
	SUBCONTENTID		NUMBER	NULL,
	SUBNAME		VARCHAR2(200)	NULL,
	SUBDETAILOVERVIEW	CLOB	NULL,
	SUBDETAILIMG		VARCHAR2(500)	NULL,
	SUBDETAILALT		VARCHAR2(1000)	NULL,
    FOREIGN KEY (CONTENTID) REFERENCES BASIC_TOUR_INFO(CONTENTID)
);

DROP SEQUENCE SEQ_REPEAT_COURSE;
CREATE SEQUENCE SEQ_REPEAT_COURSE;
--SELECT * FROM  REPEAT_COURSE;


---------REPEAT_HOTEL 테이블-------------
DROP TABLE REPEAT_HOTEL CASCADE CONSTRAINTS;
CREATE TABLE REPEAT_HOTEL (
    ACCOMMO_DETAIL_NO   NUMBER NOT NULL PRIMARY KEY,
    CONTENTID    		NUMBER NOT NULL,
    CONTENTTYPEID    	NUMBER    NULL,
    ROOMCODE    		NUMBER    NULL,
    ROOMTITLE    		VARCHAR2(200)    NULL,
    ROOMSIZE1    		NUMBER    NULL,
    ROOMCOUNT    	NUMBER    NULL,
    ROOMBASECOUNT    	NUMBER    NULL,
    ROOMMAXCOUNT    	NUMBER    NULL,
    ROOMOFFSEASONMINFEE1    NUMBER    NULL,
    ROOMOFFSEASONMINFEE2    NUMBER    NULL,
    ROOMPEAKSEASONMINFEE1    NUMBER    NULL,
    ROOMPEAKSEASONMINFEE2    NUMBER    NULL,
    ROOMINTRO    		VARCHAR2(1000)    NULL,
    ROOMBATHFACILITY    	VARCHAR2(10)    NULL,
    ROOMBATH    		VARCHAR2(10)    NULL,
    ROOMHOMETHEATER    	VARCHAR2(10)    NULL,
    ROOMAIRCONDITION    	VARCHAR2(10)    NULL,
    ROOMTV    		VARCHAR2(10)    NULL,
    ROOMPC    		VARCHAR2(10)    NULL,
    ROOMCABLE    		VARCHAR2(10)    NULL,
    ROOMINTERNET    	VARCHAR2(10)    NULL,
    ROOMREFRIGERATOR    	VARCHAR2(10)    NULL,
    ROOMTOILETRIES    	VARCHAR2(10)    NULL,
    ROOMSOFA    		VARCHAR2(10)    NULL,
    ROOMCOOK    		VARCHAR2(10)    NULL,
    ROOMTABLE    		VARCHAR2(10)    NULL,
    ROOMHAIRDRYER    	VARCHAR2(10)    NULL,
    ROOMSIZE2    		LONG    NULL,
    ROOMIMG1    		VARCHAR2(500)    NULL,
    ROOMIMG1ALT   	VARCHAR2(1000)    NULL,
    ROOMIMG2    		VARCHAR2(500)    NULL,
    ROOMIMG2ALT    	VARCHAR2(1000)    NULL,
    ROOMIMG3    		VARCHAR2(500)    NULL,
    ROOMIMG3ALT    	VARCHAR2(1000)    NULL,
    ROOMIMG4    		VARCHAR2(500)    NULL,
    ROOMIMG4ALT    	VARCHAR2(1000)    NULL,
    ROOMIMG5    		VARCHAR2(500)    NULL,
    ROOMIMG5ALT    	VARCHAR2(1000)    NULL
--    FOREIGN KEY (CONTENTID) REFERENCES BASIC_TOUR_INFO(CONTENTID)
);

DROP SEQUENCE SEQ_REPEAT_INFO;
CREATE SEQUENCE SEQ_REPEAT_INFO;

--SELECT * FROM REPEAT_INFO;

-- 이미지 정보 조회
DROP TABLE TOUR_IMAGE CASCADE CONSTRAINTS;
CREATE TABLE TOUR_IMAGE (
	IMAGE_DETAIL_NO       NUMBER	        PRIMARY KEY,
	CONTENTID             NUMBER, 
	ORIGINIMGURL          VARCHAR2(500)     UNIQUE,     
	SMALLIMAGEURL	      VARCHAR2(500),     
    FOREIGN KEY (CONTENTID) REFERENCES BASIC_TOUR_INFO (CONTENTID)
);

DROP SEQUENCE SEQ_IMAGE_DETAIL_NO;
CREATE SEQUENCE SEQ_IMAGE_DETAIL_NO;

-- 무장애 여행
DROP TABLE TOUR_FREE CASCADE CONSTRAINTS;
CREATE TABLE TOUR_FREE (
	CONTENTID           NUMBER	        PRIMARY KEY,
	PARKING             VARCHAR2(1000), 
	ROUTE               VARCHAR2(1000),    
	PUBLICTRANSPORT     VARCHAR2(1000),    
	TICKETOFFICE	    VARCHAR2(1000),     
	PROMOTION           VARCHAR2(1000),
    WHEELCHAIR          VARCHAR2(1000),
    EXIT                VARCHAR2(1000),
    ELEVATOR            VARCHAR2(1000),
    RESTROOM            VARCHAR2(1000),
    AUDITORIUM          VARCHAR2(1000),
    ROOM                VARCHAR2(1000),
    HANDICAPETC         VARCHAR2(1000),
    BRAILEBLOCK         VARCHAR2(1000),
    HELPDOG             VARCHAR2(1000),
    GUIDEHUMAN          VARCHAR2(1000),
    AUDIOGUIDE          VARCHAR2(1000),
    BIGPRINT            VARCHAR2(1000),
    BRAILEPROMOTION     VARCHAR2(1000),
    GUIDESYSTEM         VARCHAR2(1000),
    BLINDHANDICAPETC    VARCHAR2(1000),
    SIGNGUIDE           VARCHAR2(1000),
    VIDEOGUIDE          VARCHAR2(1000),
    HEARINGROOM         VARCHAR2(1000),
    HEARINGHANDICAPETC  VARCHAR2(1000),
    STROLLER            VARCHAR2(1000),
    LACTATIONROOM       VARCHAR2(1000),
    BABYSPARECHAIR      VARCHAR2(1000),
    INFANTSFAMILYETC    VARCHAR2(1000)
);



--------------------------------------------------------------------------------
------------------------------나만의 코스 DDL 시작 JWI ----------------------------
--------------------------------------------------------------------------------

-- 나만의 코스
DROP TABLE MYCOURSE CASCADE CONSTRAINTS;
CREATE TABLE MYCOURSE (
	MYCOURSE_NO             NUMBER	        PRIMARY KEY,
	UNO                     NUMBER          NOT NULL, 
	MYCOURSE_TITLE          VARCHAR2(200)   NOT NULL,
	MYCOURSE_THEMA          VARCHAR2(50) DEFAULT '테마',
	MYCOURSE_SCHEDULE	    VARCHAR2(50) DEFAULT '일정',
	MYCOURSE_CONTENT        VARCHAR2(2000) DEFAULT '내용을 입력하세요',
	MYCOURSE_MAINIMAGE	    VARCHAR2(500) DEFAULT 'https://img.hankyung.com/photo/202203/99.10834645.1-1200x.jpg',
	MYCOURSE_STATUS	        VARCHAR2(10) DEFAULT 'N' CHECK(MYCOURSE_STATUS IN('Y', 'N')),
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

DROP SEQUENCE SEQ_MYCOURSE_NO;
CREATE SEQUENCE SEQ_MYCOURSE_NO;


-- 나만의 코스 상세
DROP TABLE MYCOURSE_DETAIL CASCADE CONSTRAINTS;
CREATE TABLE MYCOURSE_DETAIL (
	MYCOURSE_DETAIL_NO      NUMBER	        PRIMARY KEY,
	MYCOURSE_NO             NUMBER,
	CONTENTID               NUMBER,
	MYCOURSE_SN             NUMBER,   
    FOREIGN KEY (MYCOURSE_NO) REFERENCES MYCOURSE (MYCOURSE_NO),
    FOREIGN KEY (CONTENTID) REFERENCES BASIC_TOUR_INFO (CONTENTID)
);

DROP SEQUENCE SEQ_MYCOURSE_DETAIL_NO;
CREATE SEQUENCE SEQ_MYCOURSE_DETAIL_NO;

-- 나만의 코스 리뷰
DROP TABLE MYCOURSE_REV CASCADE CONSTRAINTS;
CREATE TABLE MYCOURSE_REV (
	MYCOURSE_REV_NO         NUMBER	        PRIMARY KEY,
	UNO                     NUMBER,
    MYCOURSE_NO             NUMBER,
	MYCOURSE_REV_CONTENT    VARCHAR2(2000),
	MYCOURSE_REV_STAR       NUMBER,   
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO),
    FOREIGN KEY (MYCOURSE_NO) REFERENCES MYCOURSE (MYCOURSE_NO)
);

DROP SEQUENCE SEQ_MYCOURSE_REV_NO;
CREATE SEQUENCE SEQ_MYCOURSE_REV_NO;

--------------------------------------------------------------------------------
------------------------------나만의 코스 DDL 끝 JWI ----------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
------------------------커뮤니티 자유,동행, 여행후기 DDL 시작 PHY--------------------
--------------------------------------------------------------------------------

--자유게시판
DROP TABLE COMM_FREEBOARD CASCADE CONSTRAINTS;
DROP TABLE FREEBOARD_COMMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_FREENO; 
DROP SEQUENCE SEQ_FREE_COMMENT_NO; 

CREATE SEQUENCE SEQ_FREENO; 
CREATE SEQUENCE SEQ_FREE_COMMENT_NO; 

CREATE TABLE COMM_FREEBOARD(
	FREEBOARD_NO	NUMBER	 NOT NULL PRIMARY KEY,
	UNO	NUMBER	 NOT NULL,
	TITLE	VARCHAR2(500)	NULL,
	CONTENT VARCHAR2(4000)	NULL,
	FILE_ORIGINAL	VARCHAR2(1000)	NULL,
	FILE_RENAMED	VARCHAR2(1000)	NULL,
	COUNT NUMBER NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y',
	BOARD_TYPE VARCHAR(100) DEFAULT 'FB',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

CREATE TABLE FREEBOARD_COMMENT(
	COMMENT_NO	NUMBER	 NOT NULL PRIMARY KEY,
	FREEBOARD_NO	NUMBER	 NOT NULL,
	UNO	NUMBER	NOT NULL,
	CONTENT	VARCHAR2(4000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS VARCHAR2(100)	DEFAULT 'Y',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO),
    FOREIGN KEY (FREEBOARD_NO) REFERENCES COMM_FREEBOARD (FREEBOARD_NO)
);

--동행구하기

DROP TABLE COMM_COMPANION CASCADE CONSTRAINTS;
DROP TABLE COMPANION_COMMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_COMP_NO; 
DROP SEQUENCE SEQ_COMP_SC_NO; 

CREATE SEQUENCE SEQ_COMP_NO; 
CREATE SEQUENCE SEQ_COMP_SC_NO; 

CREATE TABLE COMM_COMPANION (
	COMPANION_NO  NUMBER	NOT NULL PRIMARY KEY,
	UNO	NUMBER	NOT NULL,
	DEPATURE_DATE DATE NULL,
	CLOSE_DATE	DATE	NULL,
	CONTENT	VARCHAR2(1000)	NULL,
    AREA VARCHAR2(300) DEFAULT '전국',
	POST_DATE	DATE	NULL,
	BOARD_TYPE	 VARCHAR2(100) DEFAULT 'CB',
	STATUS	VARCHAR2(100) DEFAULT 'Y',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

CREATE TABLE COMPANION_COMMENT (
	COMMENT_NO	NUMBER	NOT NULL,
	COMPANION_NO	NUMBER	NOT NULL,
	SENDER_NO	NUMBER	NULL,
	MSG_SEND	VARCHAR2(1000)	NULL,
	RECEIVER_NO NUMBER NULL,
	MSG_REC VARCHAR2(1000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y'
);

--블로그

DROP TABLE COMM_JOURNEY CASCADE CONSTRAINTS;
DROP TABLE JOURNEY_COMMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_JOURNEY_NO; 
DROP SEQUENCE SEQ_JOURNEY_COMMENT_NO; 

CREATE SEQUENCE  SEQ_JOURNEY_NO; 
CREATE SEQUENCE SEQ_JOURNEY_COMMENT_NO; 

CREATE TABLE COMM_JOURNEY  (
	JOURNEY_NO	NUMBER	NOT NULL PRIMARY KEY,
	UNO	NUMBER	NOT NULL,
	TITLE	VARCHAR2(500)	NULL,
	SUB_TITLE	VARCHAR2(500)	NULL,
	HASH_TAG	VARCHAR2(1000)	NULL,
	CONTENT	VARCHAR2(4000)	NULL,
	IMG_ORIGINAL	VARCHAR2(1000)	NULL,
	IMG_RENAMED	VARCHAR2(1000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y',
	COUNT	NUMBER	NULL,
	BOARD_TYPE	 VARCHAR2(100) DEFAULT 'JB',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

CREATE TABLE JOURNEY_COMMENT  (
	COMMENT_NO	NUMBER	NOT NULL,
	JOURNEY_NO NUMBER	NOT NULL,
	UNO	NUMBER	NOT NULL,
	CONTENT VARCHAR2(4000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO),
    FOREIGN KEY (JOURNEY_NO) REFERENCES COMM_JOURNEY (JOURNEY_NO)
);


-- 좋아요 커뮤
DROP TABLE COMM_LIKE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_COMM_LIKE; 
CREATE SEQUENCE  SEQ_COMM_LIKE; 

CREATE TABLE COMM_LIKE (
	LIKE_NO	NUMBER	NOT NULL PRIMARY KEY, 
	UNO	NUMBER	NOT NULL,
	BOARD_TYPE	 VARCHAR2(100)	NULL,
	BOARD_NO	NUMBER	NULL,
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

--------------------------------------------------------------------------------
-----------------------커뮤니티 자유,동행, 여행후기 DDL 끝 PHY-----------------------
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
--------------------------커뮤니티 갤러리 시작 DDL 시작 YHY ------------------------
--------------------------------------------------------------------------------
DROP TABLE GALLERY CASCADE CONSTRAINTS;
CREATE TABLE GALLERY (
	BOARD_NO	    NUMBER		PRIMARY KEY,
	UNO	            NUMBER		    NOT NULL,
	TITLE	        VARCHAR2(100)		NULL,
	POST_DATE   DATE DEFAULT SYSDATE,
    ORIGINAL_IMAGE	VARCHAR2(500)		NULL,
	RENAMED_IMAGE	VARCHAR2(500)		NULL,
	GAL_TAG	        VARCHAR2(1000)		NULL,
	STATUS	        VARCHAR2(10)	    DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	BOARD_TYPE	    VARCHAR2(10)		DEFAULT 'GAL'
);
DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO;

Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,1000,'KH정보교육원',to_date('22/10/19','RR/MM/DD'),'khImg.jpg','khImg.jpg','서울, 강남, 역삼, KH정보교육원, JAVA, 국비, 취업','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,2000,'서울시청',to_date('22/10/19','RR/MM/DD'),'https://upload.wikimedia.org/wikipedia/commons/9/90/Seoul_City_Hall_20190608_001.jpg','Seoul_City_Hall_20190608_001.jpg','서울, 시청, 중구, 오세훈, 행정기관, 서울광장','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,3000,'전주 한옥마을',to_date('22/10/19','RR/MM/DD'),'https://uyjoqvxyzgvv9714092.cdn.ntruss.com/data2/content/image/2020/01/08/.cache/512/20200108283123.jpg','20200108283123.jpg','전라도, 전라북도, 전주, 한옥, 전통','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,3000,'익산 미륵사지',to_date('22/10/19','RR/MM/DD'),'https://www.heritage.go.kr/unisearch/images/national_treasure/thumb/2021030208283100.jpg?time=1666188001410','2021030208283100.jpg','전라도, 전라북도, 미륵사지, 석탑, 문화재, 역사, 유물','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,3000,'광명동굴',to_date('22/10/19','RR/MM/DD'),'https://www.gm.go.kr/webcontent/ckeditor/2016/8/23/25b47d03-3a78-444a-b9e6-57efa54b8bc6.jpg','25b47d03-3a78-444a-b9e6-57efa54b8bc6.jpg','경기도, 광명시, 동굴, 역사, 명소, 관광','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'하이커 그라운드',to_date('22/09/28','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/52/2861852.JPG','2861852.JPG','하이커 그라운드, 서울특별시 중구, 청계천, 한국관광안내, 한국관광홍보관, 한국관광공사 서울센터, 3층, 하이커 아트리움, 기획 전시관','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'금능해수욕장',to_date('22/09/26','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/07/2859707.jpg','2859707.jpg','금능해수욕장, 제주특별자치도 제주시, 금능해변, 제주도 바다, 제주 바다, 금능으뜸원해변, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'산양관광일주도로',to_date('22/09/07','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/48/2851748.jpg','2851748.jpg','산양관광일주도로, 경상남도 통영시, 산양관광도로, 드라이브 코스, 드론촬영, 드론사진, 항공촬영, 파노라마','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'제승당',to_date('22/09/05','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/69/2849069.jpg','2849069.jpg','제승당, 경상남도 통영시, 사당, 통영 한산도 이충무공 유적, 사적 제113호, 한려해상국립공원(통영), 제승당 앞바다','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'담양 메타세쿼이아길',to_date('22/08/11','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/03/2835803.jpg','2835803.jpg','담양 메타세쿼이아길, 전라남도 담양군, 담양 메타세콰이어길, 담양 10경, 담양십경, 가로수길, 산책로, 산책길, 걷기여행','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'담양 메타프로방스',to_date('22/08/11','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/64/2835864.jpg','2835864.jpg','담양 메타프로방스, 전라남도 담양군, 유럽마을, 관광단지, 체험마을','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'한국궁중꽃박물관',to_date('22/08/09','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/30/2834430.jpg','2834430.jpg','한국궁중꽃박물관, 경상남도 양산시, 양산 매곡동 마애여래좌상, 석상','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'철원 한탄강 주상절리길',to_date('22/08/02','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/24/2831424.jpg','2831424.jpg','철원 한탄강 주상절리길, 강원도 철원군, 잔도길, 걷기여행, 산책로, 산책길, 트레킹, 트래킹, DMZ 관광, DMZ 투어, 안보관광지','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'주문진 해양박물관',to_date('22/07/22','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/99/2828699.jpg','2828699.jpg','주문진 해양박물관, 강원도 강릉시, 전시관','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'강릉 청간사',to_date('22/07/19','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/43/2828243.jpg','2828243.jpg','강릉 청간사, 강원도 강릉시, 사당, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'지미봉',to_date('22/05/18','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/77/2820577.jpg','2820577.jpg','지미봉, 제주특별자치도 제주시, 제주도, 지미오름, 제주오름, 드론촬영, 드론사진, 항공촬영, 파노라마','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'쌀밥정식',to_date('22/06/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/96/2824796.jpg','2824796.jpg','쌀밥정식, 경기도 이천시, 이천 향토음식, 한국음식, 한식, 한정식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'막창순대',to_date('22/06/16','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/81/2824081.jpg','2824081.jpg','막창순대, 전라남도 담양군, 담양 향토음식, 한국음식, 한식, 대통순대','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'망고빙수',to_date('22/05/24','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/02/2821302.jpg','2821302.jpg','망고빙수, 대한민국(한국), 과일빙수, 간식, 후식, 한국음식, 한식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'계란빵',to_date('22/05/23','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/23/2821223.jpg','2821223.jpg','계란빵, 대한민국(한국), 길거리 음식, 간식, 한국음식, 한식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'울산 철새홍보관',to_date('22/03/28','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/30/2814130.jpg','2814130.jpg','울산 철새홍보관, 울산광역시 남구, 전시관','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'군산항',to_date('22/03/23','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/34/2812034.jpg','2812034.jpg','군산항, 전라북도 군산시, 항구, 군산 내항 뜬다리 부두(부잔교), 국가등록문화재 제719-1호, 군산 근대시간여행 코스','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'부산 중앙공원',to_date('22/07/07','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/07/2826907.jpg','2826907.jpg','부산 중앙공원, 부산광역시 동구, 대청공원, 테마공원, 충혼탑, 부산 전경, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'팥빙수',to_date('22/07/05','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/88/2826488.jpg','2826488.jpg','팥빙수, 전라북도 전주시, 전주 외할머니솜씨, 간식, 후식, 한국음식, 한식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'안동구시장',to_date('22/06/30','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/69/2825869.jpg','2825869.jpg','안동구시장, 경상북도 안동시, 안동시장, 전통시장, 안동찜닭골목','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'감자옹심이',to_date('22/06/29','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/17/2825617.jpg','2825617.jpg','감자옹심이, 강원도 강릉시, 감자옹심이칼국수, 한국음식, 한식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'정남진전망대',to_date('22/05/17','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/91/2820291.jpg','2820291.jpg','정남진전망대, 전라남도 장흥군, 장흥 전망대, 드론촬영, 드론사진, 항공촬영, 파노라마','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'광양 구봉산 전망대',to_date('22/05/13','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/80/2819780.jpg','2819780.jpg','광양 구봉산 전망대 야경, 전라남도 광양시, 광양 전망대','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'청옥산 육백마지기',to_date('22/05/03','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/67/2818567.jpg','2818567.jpg','청옥산 육백마지기, 강원도 평창군, 평창 전망대, 풍력발전기, 일출, 드론촬영, 드론사진, 항공촬영, 파노라마','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'동명동 카페거리',to_date('22/03/15','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/47/2810847.jpg','2810847.jpg','동명동 카페거리, 광주광역시 동구, 이색거리, 광주 카페, 광주 커피숍','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'경천섬공원',to_date('22/03/14','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/71/2810671.jpg','2810671.jpg','경천섬공원, 경상북도 상주시, 근린공원, 생태공원, 낙동강, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'서상돈 고택',to_date('21/12/30','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/11/2804411.jpg','2804411.jpg','서상돈 고택, 대구광역시 중구, 전통한옥, 대구 근대골목투어, 대구 중구 근대로의 여행, 근대문화골목','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'황우지해안',to_date('21/12/02','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/99/2785599.jpg','2785599.jpg','황우지해안, 제주특별자치도 서귀포시, 황우지해변, 제주 바다, 제주도 바다, 문섬, 새섬, 새연교, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'단양강 잔도',to_date('21/11/01','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/71/2765571.jpg','2765571.jpg','단양강 잔도길, 충청북도 단양군, 걷기여행, 트레킹, 트래킹, 산책로, 산책길, 남한강 암벽, 만천하스카이워크, 단양 전망대, 유람선, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'송도용궁구름다리',to_date('21/08/07','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/75/2731775.jpg','2731775.jpg','송도용궁구름다리, 부산광역시 서구, 대교, 부산 전망대, 부산 바다, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'해남 대흥사',to_date('21/07/29','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/32/2728832.jpg','2728832.jpg','해남 대흥사, 전라남도 해남군, 절, 사찰, 불교, 종교, 사적 제508호, 유네스코 세계문화유산, 유네스코 세계유산, 산사, 한국의 산지 승원, 대둔사, 연등','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'오수의견관광지',to_date('21/07/26','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/99/2727399.jpg','2727399.jpg','오수의견관광지, 전라북도 임실군, 산책길, 산책로, 눈치보지마시개 길, 반려견과 함께하는 여행, 캠핑, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'공주 금성동 유적',to_date('21/07/08','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/95/2724895.jpg','2724895.jpg','공주 금성동 유적, 충청남도 공주시','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'김제 금산사',to_date('21/06/03','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/05/2719605.jpg','2719605.jpg','금제 금산사, 전라북도 김제시, 절, 사찰, 종교, 불교, 모악산, 국보 제62호, 김제 금산사 미륵전','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'위양못',to_date('21/06/03','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/03/2719603.jpg','2719603.jpg','위양못, 경상남도 밀양시, 위양지, 양양지, 저수지, 위양못 이팝나무, 밀양팔경, 밀양8경, 드론촬영, 드론사진, 항공촬영, 밀양 완재정','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'삼척 궁촌리 음나무',to_date('21/05/11','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/20/2716120.jpg','2716120.jpg','삼척 궁촌리 음나무, 강원도 삼척시, 천연기념물 제363호, 보호수, 고목, 파노라마','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'선성수상길',to_date('21/04/22','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/25/2714325.jpg','2714325.jpg','선성수상길, 경상북도 안동시, 부교, 안동호, 안동 선비순례길 1코스','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'대둔산 상고대',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/51/2762151.jpg','2762151.jpg','2021 대한민국 관광공모전(스마트폰-겨울), 대둔산 상고대, 충청남도 논산시, 등산, 눈꽃, 철계단, 바위, 설경','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'설송길',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/45/2762045.jpg','2762045.jpg','2021 대한민국 관광공모전(스마트폰-겨울), 설송길, 충청북도 보은군, 임한리 솔밭공원, 솔숲, 소나무 숲, 송림, 산책로, 산책길, 눈, 설경','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'전통메주방',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/34/2762034.jpg','2762034.jpg','2021 대한민국 관광공모전(스마트폰-겨울), 전통메주방, 경상북도 안동시, 사람','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'화순국화축제',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/39/2761939.jpg','2761939.jpg','2021 대한민국 관광공모전(스마트폰-가을), 화순국화축제, 전라남도 화순군, 화순 남산공원, 화순국화동산, 꽃밭','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'주왕산의 단풍',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/95/2761895.jpg','2761895.jpg','2021 대한민국 관광공모전(스마트폰-가을), 주왕산의 단풍, 경상북도 청송군, 주왕산국립공원, 추경, 바위','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'가을 회룡포',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/42/2761842.jpg','2761842.jpg','2021 대한민국 관광공모전(스마트폰-가을), 가을 회룡포, 경상북도 예천군, 산, 물돌이마을, 하천, 자연, 전망대, 회룡대','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'강주마을 해바라기',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/50/2761750.jpg','2761750.jpg','2021 대한민국 관광공모전(스마트폰-여름), 강주마을 해바라기, 경상남도 함안군, 강주마을, 정자, 꽃밭, 하늘, 공원','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'윗세오름의 봄',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/12/2761712.jpg','2761712.jpg','2021 대한민국 관광공모전(스마트폰-여름), 윗세오름의 봄, 제주특별자치도 제주시, 한라산국립공원, 유네스코세계자연유산, 제주도 국가 지질공원, 화산섬, 오름, 꽃 밭, 꽃, 자연','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'상쾌한 발걸음',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/96/2761696.jpg','2761696.jpg','2021 대한민국 관광공모전(스마트폰-여름), 상쾌한 발걸음, 경상남도 함안군, 악양생태공원, 꽃밭, 저수지, 산책, 나무','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'황매산철쭉',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/90/2761590.jpg','2761590.jpg','2021 대한민국 관광공모전(스마트폰-봄), 황매산철쭉, 경상남도 합천군, 황매산 군립공원, 일출, 꽃 나무','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'마이산의 봄 반영',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/35/2761535.jpg','2761535.jpg','2021 대한민국 관광공모전(스마트폰-봄), 마이산의 봄 반영, 전라북도 진안군, 마이산, 반영, 벚꽃, 벚나무, 산책로, 호수, 산','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'반곡지의 봄',to_date('21/10/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/79/2761479.jpg','2761479.jpg','2021 대한민국 관광공모전(스마트폰-봄), 반곡지의 봄, 경상북도 경산시, 호수, 저수지, 왕버들나무, 반영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'동궁과월지의 봄',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/06/2761006.jpg','2761006.jpg','?2021 대한민국 관광공모전(사진), 동궁과월지의 봄, 경상북도 경주시, 사적 제18호, 경주역사유적지구, 유네스코 세계문화유산, 유네스코 세계유산, 임해전지, 안압지, 연못, 야간 관광, 야경 명소','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'상림공원의 가을',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/96/2760996.jpg','2760996.jpg','?2021 대한민국 관광공모전(사진), 상림공원의 가을, 경상남도 함양군, 꽃무릇, 추경, 반영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'백아산의 구름다리',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/81/2760981.jpg','2760981.jpg','?2021 대한민국 관광공모전(사진), 백아산의 구름다리, 전라남도 화순군, 백아산 하늘다리, 화순팔경, 화순8경, 출렁다리, 대교, 교량, 눈, 설경, 겨울','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'산에는 눈꽃 강에는 안개꽃',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/62/2760962.jpg','2760962.jpg','?2021 대한민국 관광공모전(사진), 산에는 눈꽃 강에는 안개꽃, 충청북도 충주시, 충주호, 호수, 눈, 설경, 겨울, 물안개','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'보현사 아침',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/58/2760758.jpg','2760758.jpg','?2021 대한민국 관광공모전(사진), 보현사 아침, 경상남도 고성군, 고성 보현사, 절, 사찰, 불교, 종교, 약사여래불상, 부처상, 일출, 운무','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'초암산 철쭉',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/37/2760737.jpg','2760737.jpg','?2021 대한민국 관광공모전(사진), 초암산 철쭉, 전라남도 보성군, 일출, 해돋이, 봄, 꽃','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'가을과겨울의 비밀의정원',to_date('21/10/21','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/15/2760715.jpg','2760715.jpg','?2021 대한민국 관광공모전(사진), 가을과겨울의 비밀의정원, 강원도 인제군, 추경, 단풍','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'배추전',to_date('21/02/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/96/2707196.jpg','2707196.jpg','배추전, 전류, 한식, 한국음식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'만둣국',to_date('21/02/23','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/36/2706936.jpg','2706936.jpg','고기만둣국, 한식, 한국음식, 국물 요리, 만두국, 분식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'떡볶이',to_date('21/02/23','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/36/2706836.jpg','2706836.jpg','떡볶이, 한식, 한국음식, 분식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'나박김치',to_date('21/02/22','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/63/2706763.jpg','2706763.jpg','나박김치, 한식, 한국음식','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'울진 왕피천 케이블카',to_date('21/01/06','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/10/2702810.jpg','2702810.jpg','울진 왕피천 케이블카, 경상북도 울진군, 울진 케이블카','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'죽서루',to_date('21/12/17','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/94/2801494.jpeg','2801494.jpeg','죽서루, 강원도 삼척시, 보물 제213호, 누각, 단청, 서까래','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'삼포해수욕장',to_date('21/11/15','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/12/2774412.jpg','2774412.jpg','삼포해수욕장, 강원도 고성군, 삼포해변, 바다, 바닷가, 소나무','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'죽녹원',to_date('21/02/03','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/23/2705323.jpg','2705323.jpg','죽녹원 야경, 전라남도 담양군, 대나무숲, 대숲, 대나무 정원, 죽림욕장, 휴양림, 슬로시티','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'보롬왓',to_date('21/01/15','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/99/2703999.jpg','2703999.jpg','보롬왓, 제주특별자치도 서귀포시, 제주도 카페, 제주 카페, 제주도 커피숍, 제주 커피숍, 드론촬영, 드론사진, 항공촬영, 파노라마','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'치악산국립공원',to_date('21/12/22','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/85/2802385.jpeg','2802385.jpeg','치악산국립공원, 강원도 원주시, 단풍, 추경, 가을','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'상도문 돌담마을',to_date('21/12/17','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/36/2801636.jpeg','2801636.jpeg','상도문 돌담마을, 강원도 속초시, 체험마을','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'원대리 자작나무 숲(속삭이는 자작나무 숲)',to_date('21/11/25','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/31/2779531.jpg','2779531.jpg','원대리 자작나무 숲(속삭이는 자작나무 숲), 강원도 인제군, 자작나무 숲길, 가을, 추경, 단풍, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'대관령 삼양목장',to_date('21/11/24','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/04/2778504.jpg','2778504.jpg','대관령 삼양목장, 강원도 평창군, 초원, 가을, 추경, 풍력발전기, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'덕풍계곡',to_date('21/11/22','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/88/2777588.jpg','2777588.jpg','덕풍계곡, 강원도 삼척시, 국가산림문화자산, 생태탐방로, 가을, 단풍, 추경, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'외옹치 바다향기로',to_date('21/11/15','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/32/2774632.jpg','2774632.jpg','외옹치 바다향기로, 강원도 속초시, 속초 바다향기로, 해안 산책길, 해안 산책로, 트래킹, 트레킹, 걷기여행, 동해바다, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'익산 미륵사지',to_date('21/02/03','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/39/2705239.jpg','2705239.jpg','익산 미륵사지 야경, 전라북도 익산시, 유네스코 세계문화유산, 유네스코 세계유산, 백제역사유적지구, 익산 미륵사지 석탑, 국보 제11호, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'천호성지',to_date('20/12/30','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/21/2702521.jpg','2702521.jpg','천호성지, 전라북도 완주군, 종교, 천주교, 가톨릭, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'대둔산',to_date('20/12/18','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/81/2699681.jpg','2699681.jpg','대둔산, 전라북도 완주군, 대둔산도립공원, 가을, 추경, 대둔산 케이블카, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'남원 만인의총',to_date('20/12/10','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/70/2696070.jpg','2696070.jpg','남원 만인의총 전경, 전라북도 남원시, 사적 제272호, 무덤, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'대관령 주주파크',to_date('21/12/23','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/20/2802720.jpeg','2802720.jpeg','대관령 주주파크, 강원도 평창군, 테마파크, 체험관광지, 목장','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'삼척 해상케이블카',to_date('21/12/17','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/15/2801515.jpeg','2801515.jpeg','삼척 해상케이블카, 강원도 삼척시','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'새마을운동테마공원',to_date('20/11/27','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/44/2688144.jpg','2688144.jpg','새마을운동테마공원, 경상북도 구미시, 전시관, 드론촬영, 드론사진, 항공촬영','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'담양국수거리',to_date('20/10/28','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/46/2679246.jpg','2679246.jpg','담양국수거리, 전라남도 담양군, 담양 음식테마거리, 음식거리, 이색거리','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'별마로천문대',to_date('21/12/20','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/25/2802025.jpeg','2802025.jpeg','별마로천문대, 강원도 영월군, 봉래산','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'약과',to_date('20/09/04','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/56/2670956.jpg','2670956.jpg','약과, 한과, 전통과자, 정월 대보름','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'생선찜',to_date('20/09/04','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/23/2670923.jpg','2670923.jpg','생선찜, 한식, 한국음식, 찜 요리','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'절편',to_date('20/09/03','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/50/2670650.jpg','2670650.jpg','절편, 한식, 한국음식, 떡','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'묵호항 선어판매센터',to_date('21/12/16','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/07/2801007.jpeg','2801007.jpeg','묵호항 선어판매센터, 강원도 동해시, 수산시장, 어시장','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'바다향기수목원',to_date('20/07/17','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/74/2663974.jpg','2663974.jpg','대부도 바다향기수목원, 경기도 안산시, 식물원, 상상전망돼','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'한밭수목원',to_date('20/06/01','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/06/2658206.jpg','2658206.jpg','한밭수목원, 대전광역시 서구, 식물원, 인공 수목원, 천연기념물센터','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'홍천 벚꽃',to_date('21/06/15','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/72/2721372.jpg','2721372.jpg','홍천 벚꽃, 강원도 홍천군, 비발디파크, 벚꽃길, 벚나무, 봄, 드라이브 코스','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'아홉산숲',to_date('20/08/27','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/29/2669629.jpg','2669629.jpg','아홉산숲, 부산광역시 기장군, 자연생태관광지, 대나무숲, 대숲, 대나무 정원, 죽림욕장','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'덕유산 국립공원',to_date('20/04/09','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/97/2652097.jpg','2652097.jpg','덕유산 국립공원, 전라북도 무주군, 겨울, 설경, 눈','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'뇌룡정',to_date('20/03/16','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/52/2649852.jpg','2649852.jpg','뇌룡정, 경상남도 합천군, 누정, 누각, 정자','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'포항운하',to_date('20/03/11','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/90/2649490.jpg','2649490.jpg','포항운하, 경상북도 포항시, 관광단지','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'엑스포 다리',to_date('21/03/02','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/80/2707480.jpg','2707480.jpg','2020년 대전관광사진 전국공모전, 엑스포 다리, 대전광역시 유성구, 대전 엑스포다리 야경','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'군산 명신슈퍼',to_date('20/03/09','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/15/2649215.jpg','2649215.jpg','군산 명신슈퍼, 전라북도 군산시','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'영덕 해맞이공원',to_date('20/02/26','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/25/2648725.jpg','2648725.jpg','영덕 해맞이공원, 경상북도 영덕군, 테마공원, 테마파크, 영덕 블루로드','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'묵호항',to_date('20/01/23','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/21/2645421.jpg','2645421.jpg','묵호항, 강원도 동해시, 항구, 오징어','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'서울 한양도성길',to_date('20/02/11','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/87/2647387.jpg','2647387.jpg','서울 한양도성길, 서울특별시 종로구, 2019 하반기 기획사진, 서울성곽길, 한양도성길 2코스, 낙산성곽길, 산책로, 낙산공원 야경','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'구룡포 근대문화역사거리',to_date('20/01/17','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/22/2644122.jpg','2644122.jpg','구룡포 근대문화역사거리, 경상북도 포항시, 구룡포 일본인 가옥거리, 동백꽃 필 무렵 촬영지, 드라마 촬영지, 한류','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'금백조로',to_date('20/01/09','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/24/2643224.jpg','2643224.jpg','금백조로, 제주특별자치도 서귀포시, 제주도, 드라이브 코스, 자동차 도로, 성산일출봉','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,5,'오전약수탕',to_date('20/01/07','RR/MM/DD'),'http://tong.visitkorea.or.kr/cms2/website/07/2643007.jpg','2643007.jpg','오전약수탕, 경상북도 봉화군, 약수터, 탄산약수','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,10,'테스트',to_date('22/10/22','RR/MM/DD'),'화면 캡처 2022-10-17 152651.png','20221022_164555228.png','테스트 test','Y','GAL');
Insert into GALLERY (BOARD_NO,UNO,TITLE,POST_DATE,ORIGINAL_IMAGE,RENAMED_IMAGE,GAL_TAG,STATUS,BOARD_TYPE) values (SEQ_BOARD_NO.NEXTVAL,10,'테스트2',to_date('22/10/22','RR/MM/DD'),'대머리루피.png','20221022_173001027.png','tag, test','Y','GAL');


--------------------------------------------------------------------------------
----------------------------커뮤니티 갤러리 DDL 끝 YHY-------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-------------------------------관리자 DDL 시작 SHC-------------------------
--------------------------------------------------------------------------------

DROP TABLE REPORT_NO CASCADE CONSTRAINTS;
CREATE TABLE REPORT_NO (
    REPORT_NO NUMBER NOT NULL PRIMARY KEY,
    BOARD_TYPE VARCHAR(10) NOT NULL,
    BOARD_NO NUMBER NOT NULL,
    BOARD_NAME VARCHAR2(300) NOT NULL,
    UNO NUMBER NOT NULL,
    CATEGORY VARCHAR2(20) NOT NULL,
    REASONS    VARCHAR2(300),
    STATUS    VARCHAR2(100) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);
    DROP SEQUENCE SEQ_REPORT_NO;
    CREATE SEQUENCE SEQ_REPORT_NO;

--------------------------------------------------------------------------------
------------------------커뮤니티 자유,동행, 여행후기 DDL 시작 PHY--------------------
--------------------------------------------------------------------------------

--자유게시판
DROP TABLE COMM_FREEBOARD CASCADE CONSTRAINTS;
DROP TABLE FREEBOARD_COMMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_FREENO; 
DROP SEQUENCE SEQ_FREE_COMMENT_NO; 

CREATE SEQUENCE SEQ_FREENO; 
CREATE SEQUENCE SEQ_FREE_COMMENT_NO; 

CREATE TABLE COMM_FREEBOARD(
	FREEBOARD_NO	NUMBER	 NOT NULL PRIMARY KEY,
	UNO	NUMBER	 NOT NULL,
	TITLE	VARCHAR2(500)	NULL,
	CONTENT VARCHAR2(4000)	NULL,
	FILE_ORIGINAL	VARCHAR2(1000)	NULL,
	FILE_RENAMED	VARCHAR2(1000)	NULL,
	COUNT NUMBER NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y',
	BOARD_TYPE VARCHAR(100) DEFAULT 'FB',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

CREATE TABLE FREEBOARD_COMMENT(
	COMMENT_NO	NUMBER	 NOT NULL PRIMARY KEY,
	FREEBOARD_NO	NUMBER	 NOT NULL,
	UNO	NUMBER	NOT NULL,
	CONTENT	VARCHAR2(4000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS VARCHAR2(100)	DEFAULT 'Y',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO),
    FOREIGN KEY (FREEBOARD_NO) REFERENCES COMM_FREEBOARD (FREEBOARD_NO)
);

--동행구하기

DROP TABLE COMM_COMPANION CASCADE CONSTRAINTS;
DROP TABLE COMPANION_COMMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_COMP_NO; 
DROP SEQUENCE SEQ_COMP_SC_NO; 

CREATE SEQUENCE SEQ_COMP_NO; 
CREATE SEQUENCE SEQ_COMP_SC_NO; 

CREATE TABLE COMM_COMPANION (
	COMPANION_NO  NUMBER	NOT NULL PRIMARY KEY,
	UNO	NUMBER	NOT NULL,
	DEPATURE_DATE DATE NULL,
	CLOSE_DATE	DATE	NULL,
	CONTENT	VARCHAR2(1000)	NULL,
    AREA VARCHAR2(300) DEFAULT '전국',
	POST_DATE	DATE	NULL,
	BOARD_TYPE	 VARCHAR2(100) DEFAULT 'CB',
	STATUS	VARCHAR2(100) DEFAULT 'Y',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);

CREATE TABLE COMPANION_COMMENT (
	COMMENT_NO	NUMBER	NOT NULL,
	COMPANION_NO	NUMBER	NOT NULL,
	SENDER_NO	NUMBER	NULL,
	MSG_SEND	VARCHAR2(1000)	NULL,
	RECEIVER_NO NUMBER NULL,
	MSG_REC VARCHAR2(1000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y'
);

--블로그

DROP TABLE COMM_JOURNEY CASCADE CONSTRAINTS;
DROP TABLE JOURNEY_COMMENT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_JOURNEY_NO; 
DROP SEQUENCE SEQ_JOURNEY_COMMENT_NO; 

CREATE SEQUENCE  SEQ_JOURNEY_NO; 
CREATE SEQUENCE SEQ_JOURNEY_COMMENT_NO; 

CREATE TABLE COMM_JOURNEY  (
	JOURNEY_NO	NUMBER	NOT NULL PRIMARY KEY,
	UNO	NUMBER	NOT NULL,
	TITLE	VARCHAR2(500)	NULL,
	SUB_TITLE	VARCHAR2(500)	NULL,
	HASH_TAG	VARCHAR2(1000)	NULL,
	CONTENT	VARCHAR2(4000)	NULL,
	IMG_ORIGINAL	VARCHAR2(1000)	NULL,
	IMG_RENAMED	VARCHAR2(1000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y',
	COUNT	NUMBER	NULL,
	BOARD_TYPE	 VARCHAR2(100) DEFAULT 'JB',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)

);

CREATE TABLE JOURNEY_COMMENT  (
	COMMENT_NO	NUMBER	NOT NULL,
	JOURNEY_NO NUMBER	NOT NULL,
	UNO	NUMBER	NOT NULL,
	CONTENT VARCHAR2(4000)	NULL,
	POST_DATE	DATE	NULL,
	STATUS	VARCHAR2(100) DEFAULT 'Y',
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO),
    FOREIGN KEY (JOURNEY_NO) REFERENCES COMM_JOURNEY (JOURNEY_NO)
);


-- 좋아요 커뮤
DROP TABLE COMM_LIKE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_COMM_LIKE; 
CREATE SEQUENCE  SEQ_COMM_LIKE; 

CREATE TABLE COMM_LIKE (
	LIKE_NO	NUMBER	NOT NULL PRIMARY KEY, 
	UNO	NUMBER	NOT NULL,
	BOARD_TYPE	 VARCHAR2(100)	NULL,
	BOARD_NO	NUMBER	NULL,
    FOREIGN KEY (UNO) REFERENCES MEMBER (UNO)
);
-- FREE DUMMY:   프로시저 : 페이징 테스트용 / 나머지 INSERT 화면용

BEGIN
    FOR N IN 1..60
    LOOP
        INSERT INTO comm_freeboard VALUES(SEQ_FREENO.NEXTVAL, 1, '가입인사올립니다. ' , '게시글 테스트입니다.', null, null, 3, SYSDATE,DEFAULT,DEFAULT);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,1,'드디어 당당벌꿀치즈시즈닝치킨을 먹어보았습니다',
'일부러 기대를 크게 하지 않았는데, 생각보다 너무너무너무너무 킹갓제너럴핵짱 맛있었습니다.
특히 양념과 튀김이 정말 예술이더군요. 투게더님들도 꼭 맛봤으면 하는 바람이 간절합니다.
오픈런 추천드리고 저는 세시간 기다려서 샀습니다. 세시간 기다림이 아깝지 않은 맛입니다.
믿고 튜라이 튜라이 해보십시오. 헤븐여행 가능합니다. 이것은 바이럴 글이 아니면 얌플러스에서
1원 한장 받지 않고 작성하는 글입니다. 진심입니다. 믿어주세요.',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 61,3,'이야 부럽습니다. 저는 매번 실패해요. 당당벌꿀치즈시즈닝 치킨 실존하긴 하나요..?',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,2,'내일부터 일주일간 황남빵 불국사 에디션 한정판매한대요.',
'황남빵 매니아 분들 주목하세요. 황남빵 불국사 에디션 내일부터 일주일간 한정판매예정이랍니다.
맛은 그대론데 빵 모양이 불국사라고 하네요. 대체 어떤 모양일지 너무너무 궁금합니다.
이번 주 여행지는 경주 어떠세요. 불국사 버전 황남빵 절대 놓치지 않기를 바랍니다. 
광고 아닙니다. 신고하지 마세요.',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 62,5,'광고죠?',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,3,'대전 성심당 순례 드디어 떠나게 되었습니다',
'먹킷리스트 작성중인데 성심당에서는 어떤 빵이 제일 맛있나요?  너무너무 너무너무 너무너무 너무너무 너무너무 너무너무 너무너무 너무너무 기대 중입니다. 튀김소보루는 당연히 픽스했습니다. 
많은 추천 부탁드립니다. 먹보의 행복을 응원해주세요.',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 63,1,'성심당은 뭘 집어도 헤븐입니다',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 63,2,'대전 현거주자입니다. 정말 뭘 집어도 맛있는 건 사실이고요. 빵이름에 튀 들어가는건 보이는 족족 집으세요. 진정한 먹보라면...',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 63,3,'보문산 메아리 명란 어쩌구 존맛탱',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,4,'관광온 외국인 친구가 지낼 한옥 숙박 업체 추천해주세요',
'일단 서울-경주 데려갈 예정입니다. 외국인 친구가 한옥 체험을 꼭꼭 해보고 싶다네요. 겉만 한옥이고 속은 모텔같은 그런 곳 말고 진짜 한국의 얼이 곳곳에 배인 그런 한옥숙박 없을까요??
교통편이 나쁘지 않았으면 좋겠어요. 면허가 없어서 대중교통 이용 예정이라서요. 근처에 맛집도 많았으면 좋겠네요. 광고는 사절입니다. 진정한 투게더 여행자분들만 댓글 달아주세요. 부.탁.입.니.다. ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 64,5,'경주 서당 이란 업체 추천드려요. 진짜 한옥이고 현대 문물 찾아보기 힘들어요. 난방도 찐 온돌이고요. 이불도 질식할것 같이 두꺼워요. 식사 옵션 체크하면 가마솥에 한 쌀밥에 깍두기만 줍니다. 단촐하지만 아주 맛있어요.',SYSDATE,DEFAULT
);
INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 64,6,'이런건 저기 여행지 코너 가서 검색 해보면 다 나와요 거기에 진실된 리뷰도 잔뜩 있으니 참고하시길.',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,5,'날이 많이 추워졌네요',
'여름이 지나고 벌써 바깥 공기가 쌀쌀합니다. 여름 극혐종자인 저는 너무 행복합니다. 근데 지난 가을엔 대체 뭘입고 다녔던 건지? 입을 옷이 없어서 난감하네요.
옷은 사도사도 끝이없네여ㅜㅜ 투게더분들 환절기 감기 조심하십시오',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,6,'이번주 심야괴담회 찐 레전드',
'개무서워요.. 흉가 체험 에피 장난 아니네요.. 잠 못잘것 같아요. 투게더분들 다른 여행은 다 가도 흉가 체험 목적의 여행은 절대 하지 마세요. 너무 무서우니까요.',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 66,7,'그거 다 구라입니다...',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 66,3,'장난아니죠 ㄷㄷㄷㄷㄷㄷㄷ진짜 잠은 다잤어요. 저는 한 때 흉가 체험 모임에 가입할 정도로 강심장인 편인데도 소름이 쫘악 끼치던데요',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,7,' 곧 스키의 계절입니다. 투게더님들 준비 되셨나요?',
'스키의 계절입니다. 스키 매니아인 저는 벌써부터 마음이 콩닥콩닥하네요. 작년에 산 스키 장비들을 꺼내서 다시 점검 중입니다. 
투게더 여러분들을 위해 저렴하게 스키장 이용할 수 있는 꿀팁을 대방출 해볼까 하는데요 원하는 분 계신가요? 간절히 바라는 댓글 100개가 채워지면 한번 제대로 글 써볼 생각입니다.',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 67,1,'준비됐습니다 솨리질러!!!!!!!!!!!!',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 67,2,'꿀팁 궁금하네요 ㅎㅎ 저는 아주 옛날에 스키장 한번 가본게 다인데 요즘 부쩍 스키에 관심이 가서요',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,8,'제주도 여행 숙박 어디서 할지 골라주세요.',
'친구들끼리 제주도 가기로 했습니다. 쾌적한 여행을 위해서는 무조건 호텔이 최고지만 제주도에는 이미 호텔 못지 않은 컨디션에 요금은 저렴한 좋은 숙박업체들이 많다고 들었어요. 
조금 색다른 체험을 해보고 싶기도 하고요. 혹시 괜찮은 곳 있으면 추천 부탁드려요. ',NULL,NULL,30,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 68,5,'알아보지 마시고 그냥 렌터카만 빌려서 그때그떄 가능한 객실 찾아서 이용하세요. ',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,3,'통영왔는데 너무 좋네요. ',
'왜 진작 오지 와보지 않았을까 하는 후회가 밀려올 정도입니다. 우리나라에 이렇게 이쁜 바다가가 있을거라고는 상상도 못했어요. 앞으로 최애 여행지가 될 것 같습니다.
사진도 잔뜩 찍었는데 모두 너무너무 아름답네요. 여행에서 돌아오면 정리해서 갤러리에 공유할 예정입니다. 기대해주세요^^ 호호호',NULL,NULL,20,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 69,7,'통영 좋죠~ 회랑 꿀빵도 잊지마시고 드셔보세요. ',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 69,4,'통영ㅜㅜ 저도 너무 사랑하는 여행지입니다. 사진도 빨리 보고 싶네요. 기대하고 기다리고 있겠습니다 ㅎㅎ ',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,2,'겨울 여행의 단점은 옷이 너무 무겁다는 점.. ',
'여름엔 옷이 가벼워서 이것저것 챙겨갈 수 있고, 사진도 다양하게 남길 수 있는데 겨울은.. 아무리 신경써서 입어봤자
사진에선 다 우충중한 검은롱패딩 차림 ㅠㅠ 겨울 다 좋은데 그게 좀 아쉬워유 ',NULL,NULL,50,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 70,4,'공감공감.. 너무 예쁜 바다 앞에 서있는 검은 짐승 한마리... ',SYSDATE,DEFAULT
);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,1,'진짜 행복한 여행 하고 왔습니다. 단언컨대, 에버랜드는 사랑이라고 확신합니다',
'애들이나 가는 곳이라고 생각했는데 역시  막상가니까 환상의 나라 꿈의 나라 행복의 나라더군요. 정말 너무너무 좋았고 행복했습니다. 앞으로도 동행구하기 게시판을 적극 활용해서 이렇게 좋은 곳
많이 많이 다녀야겠어요. 에버랜드 가시면 사자 구경하시는거 꼭 잊지 마시고, 에버랜드 바이킹 맛집입니다 트루리얼킹!!!!!!! 모두 행복하세요.',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);


INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,2,'하입 보이 커버 하신분 계신가요?? 저 틱톡에 올렸는데 봐주실분?ㅋㅋ하아아입보이~~',
'절대 관심 이런거 구걸하는 것 아니고요.. 그냥 남들 따라 커버해봤는데 아무도 안봐줘서 슬퍼서 투게더님들이라도 보라고 이렇게 링크 올립니다. 여러분들도 커버해보세요. 춤이 너무 씬납니다. ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,3,'투게더가 최고에요 엉엉 술마시고 쓰는 글 아닙니다. 투게더 분들 너무 좋고...',
'투게더 이즈 러브 올유 니드 이즈 투게더입니다. 이런 뻘글을 쓰게 된 이윤 얼마전 동행에서 만났던 분들이랑 너무 즐겁게 여행했던 추억이 불쑥 떠올랐기 때문입니다. 항상 사랑하고 사랑합니다 투게더 함께 가요 희망으로!!!!!! ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);


INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,4,'진짜 재밌는 영화 추천해주실 수 있나요 ?? 장르는 안가리는데',
'씸씸하네요. 제발 재밌는 영화 추천해주세요. 오랜만에 보고 싶어요!!!!!!!!!',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,5,'와 투게더 진짜 정보 개많네요 ㄷㄷㄷ 이제 여행 준비 걱정 없겠습니다.',
'네이버 보다 더 알짜배기 정보만 있는 느낌 게다가 투게더 분들 진짜 다 너무 좋은것 같아요. 이렇ㄱ ㅔ따스한 힐링 공간은 정말 처음입니다 앞으로 자주 이용하게 될것 같아요. 잘 부탁드립니다. ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,6,'맛집 하나 소개해도 좋을까요?? 바로 제주 땅콩돼지바다구이 집입니다.',
'가슴에 손올리고 이거 광고가 아니므니다. 땅콩 돼지 바다구이는 돼지에 땅콩 버터를 발라 숯불에 구운다음 바다 소금에 찍어 먹는 음식입니다.  괴식같아 보이지만 진짜 맛있습니다. 저만 알고 있는게 너무 안타까워서
투게더 분들에게만 공유하는 겁니다. 광고 아니니까 신고좀 하지 마시고요. ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,7,'통영 거제 여행 계획중인데, 뭘해야될지를 잘 모르겠습니다 도와주실분?.',
'친구들이랑 통영거제 여행갈곤디.. 멀해야될지 감이 잘 안잡혀요 일단 회는 꼭 먹을거고 동피랑 마을? 여기도 갈려고용. 혹시 추천해줄만한 여행 코스 게시글 있으면 좀 추천 부탁드립니다!!  ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,3,'해가 너무 짧아져서 슬퍼요... 겨울 다좋은데 이게 아쉽네요..',
'여름보다는 겨울 선호하는 편인데. 막상 해 짧아지니까 아쉽고 우울해요. 이래서 여행은 여름에 하는게 좋은것 같아요. 지금 여기는 제주입니다.. 센치한 제주네요. ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);

INSERT INTO COMM_FREEBOARD VALUES(SEQ_FREENO.NEXTVAL,4,'제로 콜라 중독입니다. 하지만 제로 콜라 없이는 살 수가 없어요...',
'저처럼 제로 콜라 좋아하시는 분 계씨나요? 저는 너무 좋아해요 진짜 ㅠㅠㅠ 중독 같습니다. 그래도 너무 맛있는 걸요.. 오리지날보다 더 맛있어요. 그 심심한 탄산의 맛...사랑입니다.... ',NULL,NULL,100,SYSDATE,DEFAULT,DEFAULT);
--select * from comm_freeboard ORDER BY FREEBOARD_NO;
--select * from freeboard_comment;

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 79,3,'저도 제로콜라 너무 좋아해요. 제로콜라 만세 ',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 79,2,'제로콜라 맛있죠.. 크으 ',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 76,4,'오호 너무 궁금하네요. 어떤 맛일까요??',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 75,4,'환영합니다! 저도 투게더 정보 덕분에 좋은 여행 많이 했어요 ㅋㅋㅋ ',SYSDATE,DEFAULT
);

INSERT INTO FREEBOARD_COMMENT VALUES(
SEQ_FREE_COMMENT_NO.NEXTVAL, 72,1,'헐',SYSDATE,DEFAULT
);
-- COMP DUMMY

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 1,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '에버랜드 단체 할인 받아서 하루종일 놀이기구 타실 동행 구합니다.ㄱㄱ',DEFAULT, SYSDATE, 'CB','Y'
);
INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 2,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'),
'제주도 귤농장 체험 투어 가실 동행 구합니다. 현재 5인 모였어요.',DEFAULT, SYSDATE, 'CB','Y'
);
INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 3,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), 
'전주 먹투어 동행 구합니다. 식당은 모이면 논의 예정입니다~ 댓주세요',DEFAULT, SYSDATE, 'CB','Y'
);
INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 4,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '부산 밀면 축제 같이 가실 분 계신가요? 진짜 재밌대요..댓 주세요.', DEFAULT,SYSDATE, 'CB','Y'
);
INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 5,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '경주 수학여행 가실 분? 현재 버스 자리 20개 중 7개 남았습니다ㅋㅋ',DEFAULT, SYSDATE, 'CB','Y'
);

--신고 테스트용
INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 6,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '켜피한잔할뤠요? 어? 이쁘다... 강릉 카페 투어 가실 분 비댓 ㄱㄱ ', DEFAULT,SYSDATE, 'CB','Y'
);

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 7,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '한라산 등정 하실분 있나요? 체력 후진분은 사절이고요. 일정 미정이요',DEFAULT, SYSDATE, 'CB','Y'
);

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 1,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '우리의 소원은 통일!! 통일전망대 초행길이라 무서운데 같이 가실부운~~',DEFAULT, SYSDATE, 'CB','Y'
);

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL, 2,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '경복궁 야간 개장 한복 축제 같이 가서 서로 찍사해줄 분 구해요!!',DEFAULT, SYSDATE, 'CB','Y'
);

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL,3,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '거제로 놀러 가실 분 계시나요? 정말 재밌는 볼거리 즐길 거리가 많다네요?? 비댓주세요!!', DEFAULT,SYSDATE, 'CB','Y'
);

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL,3,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '롯데월드로 오랜만에 추억 여행을 떠나고 싶은데 놀이기구 잘 타시는 분 동행 구해요. ', DEFAULT,SYSDATE, 'CB','Y'
);

INSERT INTO comm_companion VALUES (
SEQ_COMP_NO.NEXTVAL,3,TO_DATE('20221212', 'YYYY-MM-DD'), TO_DATE('20221212', 'YYYY-MM-DD'), '나주 배농장 체험 가실분? 10분 이상이어야 버스 대절 가능하대요 .현대 5인 모였습니다.ㄴ', DEFAULT,SYSDATE, 'CB','Y'
);

INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL, 10, 1 ,'먹투어 신청합니다. ',3,NULL,SYSDATE,'Y'
);
INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL,10, 5 ,'돼집니다. 먹투어 가고 싶습니다. 아는 음식점도 많아요. 식당은 가재는 게편 여기 꼭 갔으면 합니다..',3,NULL,SYSDATE,'Y'
);

INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL,10, 1 ,NULL,3,'넹 조만간 오픈카톡 주소 보내드릴게요',SYSDATE,'Y'
);

INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL, 10, 5 ,NULL,3,'넹 조만간 오픈카톡 주소 보내드릴게요',SYSDATE,'Y'
);


INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL, 12, 1 ,'딴 배는 가지는 건가요? 일단 신청할래요 ',3,NULL,SYSDATE,'Y'
);
INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL, 12, 7 ,'이미 다 찼을까요?? 자리가 있다면 저요',3,NULL,SYSDATE,'Y'
);

INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL,12, 1 ,NULL,3,'넹 조만간 오픈카톡 주소 보내드릴게요',SYSDATE,'Y'
);

INSERT INTO companion_comment VALUES(
SEQ_COMP_SC_NO.NEXTVAL, 12, 7 ,NULL,3,'넹 조만간 오픈카톡 주소 보내드릴게요',SYSDATE,'Y'
);

--SELECT * FROM comm_companion;
--SELECT * FROM COMPANION_COMMENT;

--JOURNEY DUMMY

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 4, '밀면과 나','밀면과 얽힌 추억','#밀면, #부산','냉면과 다른점은 메밀가루 대신 밀가루와 감자 또는 고구마 녹말을 섞어 면을 만든다는 점이다. 또한, 다소 밋밋한 맛이 나는 평양냉면과는 달리 자극적인 음식을 좋아하는 부산지역의 입맛에 맞춰 양념이 많이 들어가 새콤달콤한 맛이 난다. 밀가루와 녹말가루로 면을 만들어 가격이 4천원에서 6천원 사이로 냉면에 비해 저렴한 편이다.','밀면jpg','https://cdn.pixabay.com/photo/2018/09/17/05/14/water-noodle-3683050_960_720.jpg',SYSDATE,DEFAULT,10, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 6, '거창한 여행','거창한 여행','#거창, #가을','거창군(居昌郡)은 대한민국 경상남도 서북부에 있는 군이다. 경상북도, 전라북도와 마주하고, 김천시, 장수군, 무주군, 성주군, 합천군, 산청군, 함양군 등 총 7개 시, 군과 경계를 이룬다. 지리산, 덕유산, 가야산 등 3대 국립 공원의 가운데 자리잡아 자연 경관이 수려하다. 기온의 일교차와 연교차가 크기 때문에 농특산물로 사과가 유명하다. 교육기관으로는 거창고등학교, 거창대성고등학교, 거창여자고등학교 등 7개 고등학교와 한국승강기대학, 경남도립거창대학 등 2년제 대학이 있다. 1989년부터 시작된 거창국제연극제는 국내최고 연극제로 평가받고 있다. 군청 소재지는 거창읍이고, 1읍 11면을 관할한다.','거창.jpg','http://tong.visitkorea.or.kr/cms2/website/64/2842664.jpg',SYSDATE,DEFAULT,10, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 7, '쌀밥이 필요해','밥심','#밥심, #돼지','쌀밥은 쌀로 지은 밥이다. 열량은 1인분 기준으로 300킬로칼로리(356 킬로줄)이다.[1] 멥쌀로 지은 멥쌀밥 (또는 입쌀밥, 이밥)과 찹쌀로 지은 찹쌀밥이 있다.','rice.jpg','http://tong.visitkorea.or.kr/cms2/website/96/2824796.jpg',SYSDATE,DEFAULT,10, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 2, '자전거 좋아요','밥심','#자전거, #자유','너에게 난 해질녘 노을처럼
한 편의 아름다운 추억이 되고
소중했던 우리 푸르던 날을 기억하며
후회없이 그림처럼 남아주기를
나에게 넌 내 외롭던 지난 시간을
환하게 비춰주던 햇살이 되고
조그맣던 너의 하얀 손 위에
빛나는 보석처럼 영원의 약속이 되어
너에게 난 해질 녘 노을처럼
한편의 아름다운 추억이 되고
소중했던 우리 푸르던 날을 기억하며
후회없이 그림처럼 남아주기를
나에게 넌 초록의 슬픈 노래로
내 작은 가슴속에 이렇게 남아
반짝이던 너의 예쁜 눈망울에
수많은 별이 되어 영원토록 빛나고 싶어
너에게 난 해질 녘 노을처럼
한편의 아름다운 추억이 되고
소중했던 우리 푸르던 날을 기억하며
후회없이 그림처럼 남아주기를
너에게 난 해질 녘 노을처럼
한편의 아름다운 추억이 되고
소중했던 우리 푸르던 날을 기억하며
후회없이 그림처럼 남아주기를
그림처럼 남아주기를','어제.jpg','https://cdn.pixabay.com/photo/2015/03/21/14/34/silhouette-683751_960_720.jpg',SYSDATE,DEFAULT,10, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 1, '바다야 사랑해','바다','#통영, #바다','다시 돌아온 바닷가
왠지 그녀도 왔을까
여기 저기 둘러 보아도
부서지는 파도소리만
뚱보 아이스크림 아저씨
혹시 그녈 보셨나요
쭉쭉빵빵 날씬한 다리
그녈 찾아주세요
새까만 선글라스에
하늘색 물들인 머리
널 따라 내 머리도 노랑 브릿지
이름도 성도 몰라요
용기로 훔친 첫 키스
수줍었던 그녀 얼굴 떠오르네요
혹시 그녀가 왔을까
고래고래 불러봤지만
빤짝 대머리 아저씨
자길 불렀냐고 되묻고
세겹 배살접힌 아줌마
여긴 목욕탕이 아녜요
제발 때좀 밀지 마세요
그녀가 달아나요
새까만 선글라스에
하늘색 물들인 머리
널 따라 내 머리도 노랑 브릿지
이여름 그녀 없으면
물없는 사막이에요
앵두같은 그녀 입술
보고싶어요 나는야 바다에 왕자
당신은 해변에 여자
하지만 너 없이 난 해변의 환자
기적이 일어난거죠
그녀가 찾아왔어요
만세삼창 올 여름은 감동에 바다','바다다.jpg','https://cdn.pixabay.com/photo/2017/06/08/17/15/tongyeong-2384215_960_720.jpg',SYSDATE,DEFAULT,10, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 6, '공룡이 살던 나라','공룡','#공룡아, #사랑해',
'꼬불꼬불 꼬불꼬불[8] 맛좋은 라면 (허이!)
라면이 있기에 세상 살맛나 (후루룹챱챱)
하루에 10개라도 먹을 수 있어 (호이!)
후루룩 짭짭 후루룩 짭짭 맛좋은 라면
(가루가루 고춧가루 후후루후후 후후후)
맛좋은 라면은 어디다 끓여
구공탄에 끓여야 제맛이 나네 (호이요)
꼬불꼬불 꼬불꼬불 맛좋은 라면
후루룩 짭짭 후루룩 짭짭 맛좋은 라면
(심사위원 1: 라면 회사 광고하나?)
라면~ (가루가루 고춧가루)
(고길동: 여보, 여기 고무줄이 다 어디갔어?)
라면~ (고춧가루 고춧가루)
만두의 친구가 찐빵이듯이
라면의 친구는 구공탄이네
(심사위원 1: 이거 순 CM송 아니야?)
그래도 라면은 맛좋은 라면은
구멍 뚫린 구공탄에 끓여야 제맛
(고길동: 요즘 바빠서 일요일도 없다니깐! 내 신발 어디 갔어, 근데?)
구멍 뚫린 구공탄에 끓여야 제맛
가루가루 고춧가루',
'둘리.jpg','https://cdn.pixabay.com/photo/2022/09/18/11/26/jungle-7462781_960_720.jpg',SYSDATE,DEFAULT,10, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 4, '제주도 푸른 밤에 취해','힐링은 제주에서 하기로 한다','#제주도, #행복, #에버랜드, #가을 ,#푸른밤',
'떠나요 둘이서 모든 것 훌훌 버리고
제주도 푸른 밤 그 별 아래
이제는 더 이상 얽매이긴 우리 싫어요
신문에 티비에 월급봉투에
아파트 담벼락보다는 바달 볼 수 있는
창문이 좋아요 낑깡밭 일구고 감귤도
우리 둘이 가꿔봐요 정말로 그대가
외롭다고 느껴진다면 떠나요
제주도 푸른 밤 하늘 아래로
떠나요 둘이서 힘들게 별로 없어요
제주도 푸른 밤 그 별 아래
그 동안 우리는 오랫 동안 지쳤잖아요
술집에 카페에 많은 사람에
도시의 침묵 보다는 바다의 속삭임이 좋아요
신혼 부부 밀려와 똑 같은 사진 찍기 구경하며
정말로 그대가 재미없다 느껴진다면 떠나요
제주도 푸르메가 살고 있는 곳 
','푸르메가사는.jpg','https://cdn.pixabay.com/photo/2021/12/23/10/41/jeju-island-6889156_960_720.jpg',SYSDATE,DEFAULT,100, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 1, '강릉을 걷다','뚜벅이의 강릉 여행기','#강릉, #뚜벅이','이번 여름, 친구와 함께 강릉 뚜벅이 여행을 다녀왔다!
생각보다 성공적이었던 뚜벅이 여행!
완전 성수기 때라서 호텔이 생각보다 비쌌지만 그래도 뚜벅이라 택시 탄 것 치고는 예상보다 저렴하게(?) 다녀왔당
​지난번에 인천여행 다녀온 것 기록했더니 굉장히 추억이더라...
일단 친구와 나는 성남 버스터미널에서 7:00 강릉 차를 예매했다
고속버스 2만원 정도!
(어이없게도 ㅋ 경강선 시간을 잘못 봐서 늦을 뻔했다.급하게 아빠찬스 써서 야탑역까지 쓩,,, 날아갔다. ㅋ 정말 어이없음)
하여간 진짜 아찔하게 늦을 뻔했던 버스시간 휴,,,
시외버스 탄 건 정말 오랜만...인데 짱 편하고 쭉 자면서 갔다
(근데 왜 시외버스에는 와이파이도 안 되고 충전하는 곳도 없지?...경기버스가 최고임을 느낌.)
그렇게 버스 터미널에 도착해서! 바로 픽업투유에 짐을 맡기러 갔다!
이거 진짜 좋다고 생각한 거!!! 왕추천
강릉 여행할 뚜벅이라면 무조건 하길.
진짜. 진심... 지금까지 뚜벅이라 얼마나 서러웠는지...
픽업투유는 강릉 주요 장소에서 숙소까지, 숙소에서 숙소까지 등 짐을 원하는 시간에 옮겨주는 서비스이다!
그렇게 짐을 맡기고 역을 나오니 배고파진 우리...
원래 계획엔 없었던(사실 계획을 촘촘히 짜고가지 못했음. 나 J 맞는데...) 아점을 먹기로 함
그래도 역시 J라 혹시 아침을 먹게 되면 어디서 먹을까...하고 삼계탕 집을 찾아뒀었다!
왜냐면 여행날이 중복이었기 때문.
(선조들이 닭을 먹은 건 이유가 분명 있을 터이니. 따르겠다.)
그래서 강릉시외터미널 맛집인 제일강산으로 향했다!되게 배고팠는데 금방 나왔고, 굉장히 맛있었다!!! 맛있었다!!! 맛있었다고@@@누룽지도 맛있었당!
그리고 바다 포토이즘으로 이동! 갱장히 바다바다했던 포토이즘!
아니 이렇게 깔꼼한 파우더룸은 처음이었다
고데기, 헤어롤, 빗 등등 준비할 물품이 굉장히 깨끗하게 있었당 기분 좋았음,,,
그리고 테라스에 나가서 사진도 찍을 수 있었당
누가사진 찍어주면 어떻게 포즈 잡을지 아직도 몰라...
그리고 바로 회를 먹으러 갔고 우리는 즐겁게 이야기 하다가 숙소로 돌아와서 잠을잤다
정말 좋은 여행이었다!','강릉으로.jpg','https://cdn.pixabay.com/photo/2022/04/04/12/10/gangneung-7111058_960_720.jpg',SYSDATE,DEFAULT,50, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 5, '행복의 나라로 갈테야','이색 테마 여행, 맥도날드 전국 일주 ','#맥도날드, #시작, #행복','어렸을 때 나는 맥세권에 살았다. 집 앞 오분 거리에 맥도날드가 있었던 것이다. 
맥도날드 매장 분위기는 특별하다. 전 연령, 다양한 구성의 사람들이 찾아온다. 
그 어수선함 속 자유로운 분위기에 우리 가족도 즐겁게 녹아들었던 것 같다. 
가끔 무더운 여름밤이면 우리 가족은 늦은 밤 슬리퍼를 꿰어신고 나와 맥도날드로 피서를 갔다. 
아이스크림 콘을 하나씩 입에 물고 시간을 보냈다. 아이스크림만 사먹었는데도 가끔 행사상품에 끼워 나가는 장난감을
그냥 주기도 했다. 어릴 때는 내가 너무 착한 어린이라서 그런 선물들을 받는 것이라 생각하고 뿌듯해했다.
매장에 방문한 어린이에게 재고 장난감을 선물하는 것이 글로벌 기업의 마케팅 방침이었음을 알게 된 건 꽤 오랜 시간이 지난후였다. 

이사를 하고 시간이 흘러 맥도날드는 내 어린시절과 함께 멀어져갔다. 
평범하게 대학을 나와 회사를 다니다가 사업을 시작했다. 여행 사업이었다. 사업자 등록을 하고 1년정도 지난 시점에서
코로나가 터졌다. 사업은 속수무책으로 곤두박질 쳤다. 회사를 정리했다. 갈피를 잃고 방황했다. 어디로든 도망치고 싶었다.
낡은 중고자동차를 헐값에 사서 무작정 대한민국 이곳저곳을 돌아다녔다.
식사는 무조건 맥도날드에서 했다. 그 것만이  사실상 이 여행의 규칙이자 목적이었다. 
모든 햄버거 메뉴를 다 먹어보고 그마저도 지겹게 느껴지면 과일맛 푸딩으로 입만 적시는 
날도 있었다. 하루 세번 맥도날드를 방문했는데도 불구하고 장난감을 공짜로 얻는 행운은 일어나지 않았다. 직원들은 피로함에 치여 불친절했다.
하지만 매장 특유의 자유로운 분위기만은 여전했다.. 점심에는 시간을 때우러 나온 노부부가 눈에 보였고
밤에는 학원을 마친 뒤 단체로 쏟아져 들어오는 학생들이 눈에 들어왔다. 그렇게 1년이 지났다.
드디어 마지막 세상의 끝 해남 맥도날드점에 도착했다.  고심 끝에 빅맥세트를 주문했다. 창가에 자리를 잡고 앉아
햄버거를 꼭꼭 씹어 먹었다. 감자 튀김도 남김없이 집어 먹었다. 다회용 컵에 든 콜라도 끝까지 마셨다. 
옆자리에 앉은 어린이는 행사 상품으로 받은 장난감이 자기가 원하는 게 아니었나보다. 내내 칭얼대며 떼를 쓰더니 기어이
장난감을 바닥에 버리고 가버렸다. 트레이를 정리하고 매장을 떠나려는데 바닥에 버려진 장난감이
자꾸 눈에 밟혔다. 나는 장난감을 주워서 차로 가지고 왔다. 비닐 포장을 뜯어 대시보드 위에 가지런히 진열했다.
대시보드에 앉은 조악한 장난감과 눈이 마주치는 순간 나는 이 도피여행이 드디어 끝났음을 깨달았다. 
이제 다시 새로운 여정을 시작할 수 있을 것 같았다.','맥도날드제주점.jpg','https://cdn.pixabay.com/photo/2016/04/20/00/41/mcdonalds-1340199_960_720.jpg',SYSDATE,DEFAULT,300, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 3, '보라섬의 비밀','전북 신안에는 보라섬이 있다. ','#보라섬, #동화','온통 보라색으로 물든 마을이 있다?
이 신비로운 마을을 체험하기 위해서 나는 기꺼이 연차를 쓰고 전북 신안으로 향했다. 
보라섬을 보기 위해서는 입장료 5000원이 필요하다. 야박하다고 생각말라, 보라섬이 보여주는 아름다움과 신비한 체험에 
비하면 터무니없이 저렴한 가격이다. 그래도 아깝다고 생각되면 보라보라인이 되면 된다. 보라색 아이템을 착용하면
입장료는 없다. 이미 당신 자체가 보라섬의 일부이니까. 나도 보라섬이 되기로 했다. 보라색 니트에 머리띠까지 
챙겨서 당당하게 보라섬에 입장했다. 보라섬은 온통 보라색이다. 인형의 마을에 들어온 것 처럼
이질적이면서도 아름답다. 보라섬은 박지도와 반월도를 이어 만든 섬으로 바다 위에 데크길을 만들어 놓아 한바퀴 
돌아볼수 있도록 인프라를 조성해 놓았다. 하늘과 바다와 보라 그 환상의 조합에 푹빠져 다리 아픈줄도 몰랐다. 
곳곳에 위치한 포토존에서 신나게 사진도 찍었다. 디저트 맛집들도 많아서 여행 내내 입이 달고 배가 불렀다. 
너무 마음에 들었다. 떠나고 싶지 않았다. 하지만 시간은 왜 우릴 허락하지 않는건지.. 
어쩔 수 없이 보라섬을 떠나면서 다음에는 꼭 소중한 사람과 함께 오리라 다짐했다. ','보라섬에서.jpg','http://tong.visitkorea.or.kr/cms2/website/99/2816599.jpg',SYSDATE,DEFAULT,200, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 4, '경복궁','찬란했던 왕조의 시간을 산책하다','#경복궁, #서울','용의 눈물, 정도전, 육룡이 나르샤, 태종 이방원
고조선부터 근현대까지 사극이라면 가리지 않는 내가 그 중에서도 가장
좋아하는 시기가 있다. 여말선초, 이성계가 고려 왕조를 무너뜨리고 조선이라는 나라를 창건하는 바로 그 시기이다. 
이성계의 역성혁명을 그린 드라마는 빠뜨리지않고 챙겨봤다고 자부할 수 있다. 그런 내가 이상하게도 경복궁을 가본 적이 없었다.
멀었던 것도 아니다. 서울에서 나고 자랐으며, 심지어 회사가 종로에 있어 출퇴근길 하루 두번 매일 스치는 곳이기도 하다.
그런데도 이상하게 멀게만 느껴졌다. 지난주에야 비로소 경복궁을 가봐야겠다는 생각을 했다. 
입장료는 3000원이었다. 한복을 입고 가면 무료라고 해서 근처 한복 대여점을 기웃거려 봤지만 번거롭게 느껴져서
그냥 3000원을 지불하고 경복궁에 들어갔다. 경복궁은 사극에서 본 것 처럼 웅장하면서도 은밀한 구중 궁궐이 아니었다.
모든 시민들이 밝은 얼굴로 한복을 입고 사진을 찍고 산책을 하는 광장같은 공간이었다. 친절하게 정리된 안내책자와 지도가
구비되어 있었고, 흥미로운 체험이나 행사도 많았다. 운 좋게 내가 간 시간대에 수문장 교대의식이 펼쳐지고 있었다.
경복궁 어디든 걷기 좋고 운치가 있었지만 가장 좋았던 건 역시 경회루였다. 사극에서 많이 봐서 큰 감흥이 없을것 
같았지만 직접 보니 역시 달랐다. 같이 간 친구도 감탄을 금치 못했다. 경회루의 여운을 떨치지 못해
경복궁을 모두 구경하고 난 후 우리는 근처에 있는 경회루라는 한정식집에 갔다. 맛도 나쁘지 않았다. 
집에 돌아와서 워크 어플을 확인해보니 2만보가 찍혀있었다. 하루종일 걸었는데도 이상하게 지치지 않았다. 
왕조의 흥망성쇠를 모두 버텨내고 도심 속 힐링 공간으로 변모한 경복궁, 부디 무사히 오래오래 버텨주기를 바라는 마음이다. ','왕과나.jpg','https://cdn.pixabay.com/photo/2016/03/15/04/11/towards-the-garden-1256872_960_720.jpg',SYSDATE,DEFAULT,200, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 4, '에버랜드, 영원한 환상의 나라','모두의 유년기를 빛냈던 에버랜드로','#가을, #소풍, #에버랜드, #행복',
'에버랜드! 우리나라 최고, 최대규모의 유원지이다.  에버랜드로 소풍 가기 전날 설렘에 잠못들었던 기억들은 누구나 가진 보편적인 추억이 아닐까? 
요즘은 에버랜드좌의 국힙 발라버리는 매너리즘 안내멘트 덕분에 새삼 화젯거리가 되기도 했다. 오랜만에 에버랜드에 가고 싶다는 생각이 들었는데
혼자는 좀 쓸쓸할것 같고, 친구들은 모두 바쁘다. 그래도 투게더의 동행에서 에버랜드동행을 구해보기로 했다. 글을 올리고 많은 분들이 신청해주셨다.
사람은 많을수록 즐거운 법이니까, 모두 받아들여 총 8명이 함께 에버랜드로 향했다. 무슨 학교 소풍 가는 기분도 들고 신이 났다.
평일이라 그래도 좀 한산하지 않을까 싶었는데 의외로 붐빈다. 붐비고 또 붐빈다. 1시간 기다려서 겨우 바이킹을 한번 탔다. 하지만 1시간이 길게 느껴진 것은 아니다.
함께 간 동행분들과 친해질 수 있는 시간이었다. 그 뒤로 후룸라이드도 타고 회전목마도 탔다. 각자 싸온 도시락도 까먹고 동물 구경도 하니 하루가 금방 갔다. 
마지막으로 기념품을 사고 기념사진을 찍고 에버랜드에서 나왔다. 너무 즐거운 시간이었다. 모두 에버랜드로 떠나보시길!! 
','에버랜드, 영원한 나라.jpg','https://cdn.pixabay.com/photo/2016/07/20/15/04/night-1530501_960_720.jpg',SYSDATE,DEFAULT,200, DEFAULT
);

INSERT INTO COMM_JOURNEY VALUES(
SEQ_JOURNEY_NO.NEXTVAL, 4, '땅끝 마을 해남, 그리고 해남','땅은 우리의 추억을 기억한다','#땅끝, #해남, #땅끝마을, #에버랜드, #행복, #가을',
'해남 땅끝마을이 한반도의 남쪽 땅끝이라는 사실은 몇몇 문헌에서 찾아볼 수 있다. 『신증동국여지승람(新增東國輿地勝覽)』 만국경위도에는 우리나라의 남쪽 기점을 땅끝 해남현으로, 북쪽 기점을 함경북도 온성부로 잡고 있다. 최남선의 『조선상식문답』에는 해남 땅끝에서 서울까지를 천 리,
서울에서 함경북도 온성까지를 2천 리로 잡아 우리나라를 3천리금수강산이라고 하였다. 해남군 송지면 송호리 땅끝마을은 우리나라 국토의 가장 마지막 지점이다.
마을을 굽어보는 땅끝전망대에서 동남쪽 아래로 500m쯤 내려가면, 이곳이 땅끝임을 가리키는 땅끝탑이 서 있다. 하늘을 향해 긴 세모꼴을 하고 있는 땅끝탑은 1987년 7월 18일 세운 것이다. 
땅끝마을에서 해발 156.2m에 이르는 사자봉 정상에는 횃불을 상징하는 38m 높이의 땅끝전망대가 있다. 땅끝전망대에 서면 인근 다도해가 발 아래 보이며, 맑은 날에는 제주도 한라산까지 볼 수 있다. 
사자봉이란 사자의 머리 형상을 하고, 정상의 서쪽에 있는 포구가 마치 포효하는 사자의 입 모양을 하고 있다고 하여 붙여진 이름이다. 
썰물이 되면 드러난 바위들이 마치 사자의 혀 모양을 하고 있어 성난 사자가 먹이를 겨냥하는 모습이 된다. 사자봉의 땅끝전망대 부근에는 진도, 완도, 제주도를 연결하는 갈두산봉수대가 있었다. 
임진왜란 당시 이순신 장군과 관련된 이야기도 전해 올 정도로 갈두산봉수대는 군사적으로 중요한 거점이었다.
이와 같은 역사적 사실과 사자라는 형상에 더하여, 사자봉 정상의 전망대에 불이 켜지는 것을 마을 사람들은 사자의 눈으로 간주한다. 사자가 눈을 크게 뜨고 먹이를 포획하려는 모습이라는 것이다. 
마을 사람들은 이를 두고 한반도 땅끝이 마침내 바다를 향하여 포효하면서 기지개를 켜고 대양으로 나아가는 형국이라고 설명한다. 
이런 풍수지리적인 해석은 마을 주민들이 땅끝이 과거의 ‘오갈 데 없는 갈두’에서 이제는 세계적인 관광지로 개발되기를 기대하고 있음을 나타낸다.
땅끝마을은 일출과 일몰을 동시에 볼 수 있는 곳이어서, 일출과 일몰을 보고자 하는 관광객들이 자주 찾는 곳이다. 
땅끝탑에서 서쪽은 바위로 된 해안과 사자포구를 거쳐 갈산마을을 지나면 해남 송호리 해송으로 유명한 땅끝송호해변으로 연결된다. 
작은 오지마을이었던 갈두는 1979년 ‘토말’이라 명명되고 1986년 국민관광지로 지정되었지만 관광객의 눈길을 받지 못한 곳이었다. 
그러다가 1994년도에 땅끝으로 개명되면서 관광객의 순례지 혹은 답사지가 된다. 땅끝은 아픈 마음의 상처를 달래기 위하여 찾는 곳으로 또는 암울했던 과거를 훌훌 털어 버리고 새롭게 시작하기 위하여 찾는 곳이기도 하다. 
땅끝을 찾는 사람들은 주로 대학생들과 땅끝의 상징과 의미를 찾는 탐방객들이다. 땅끝마을은 국토를 순례하는 사람들이 출발지이자 종착지가 되고 있다.
나도 가보니 좋았다. 님들도 꼭 가시길
','해남, 여행의 시작.jpg','https://cdn.pixabay.com/photo/2016/12/06/07/07/hainan-1885800_960_720.jpg',SYSDATE,DEFAULT,100, DEFAULT
);


INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,9, 1,'실환가요..? 저 지금 모니터 앞에서 울고 있어요.. 너무 감동입니다..', SYSDATE, DEFAULT);
INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,9, 2,'저도 맥도날드 아주 좋아해요~.', SYSDATE, DEFAULT);
INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,9, 3,'오열중....', SYSDATE, DEFAULT);

INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,10, 4,'저도 언제 한번 보라섬으로 가봐야 겠네요 ', SYSDATE, DEFAULT);
INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,10, 5,'누가 노랑노랑섬은 안만들어주나.', SYSDATE, DEFAULT);

INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,11, 6,'저는 이상하게 경복궁만 가면 눈물이 나요.. 누가 나를 애타게 기다렸던것만 같은 느낌에 심장이 아려요 ㅠㅠ ', SYSDATE, DEFAULT);
INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,11, 7,'저는 정몽주 후손이라 경복궁 별로 ㅎㅎ .', SYSDATE, DEFAULT);

INSERT INTO JOURNEY_COMMENT VALUES(SEQ_JOURNEY_COMMENT_NO.NEXTVAL,12, 4,'에버랜드 너무 좋아요 후기 잘봤습니다', SYSDATE, DEFAULT);


--SELECT * FROM COMM_JOURNEY;
--SELECT * FROM journey_comment;

--commlike 테스트용
insert into COMM_LIKE values(SEQ_COMM_LIKE.nextval,2,'JB',6);
insert into COMM_LIKE values(SEQ_COMM_LIKE.nextval,2,'JB',8);
insert into COMM_LIKE values(SEQ_COMM_LIKE.nextval,2,'JB',9);
insert into COMM_LIKE values(SEQ_COMM_LIKE.nextval,2,'JB',28);

--select* from freeboard_comment;

INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'CB',6,'켜피한잔할뤠요? 어? 이쁘다... 강릉 카페 투어 가실 분 비댓 ㄱㄱ ',1,'기타','최준 같아요. 기분 구립니다. 이 글 신고합니다.',DEFAULT);

INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'CB',7,'한라산 등정 하실분 있나요? 체력 후진분은 사절이고요. 일정 미정이요',2,'욕설','체력 후진 분은 사절이라는 매너 없는 표현이 너무 상처가 되네요. 이 글을 삭제해주세요.',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'CB',8,'우리의 소원은 통일!! 통일전망대 초행길이라 무서운데 같이 가실부운~~',5,'사기행위','글쓴분 전에도 사기행위로 말좀 나왔던 분 같아요. 피해자 나오기 전에 글삭요.',DEFAULT);

INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'CB',6,'켜피한잔할뤠요? 어? 이쁘다... 강릉 카페 투어 가실 분 비댓 ㄱㄱ ',6,'기타','이분 계속 이상한 글만 쓰세요. 글삭제는 물론이고 아예 이분을 영원히 강제 탈퇴 시켜주시길 강력하게 요청하는 바입니다..',DEFAULT);

INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'CB',8,'우리의 소원은 통일!! 통일전망대 초행길이라 무서운데 같이 가실부운~~',1,'기타','동행구하기 게시판에서 왜 노래를 부르는지 ㅎㅎ .',DEFAULT);
            
--
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',37,'가입인사올립니다. ',7,'광고/도배','가입인사로 왜 도배를 하는지 ㅎㅎ .',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',78,'해가 너무 짧아져서 슬퍼요... 겨울 다좋은데 이게 아쉽네요..',4,'욕설','글에 욕설이 다수 포함되어 있는 것 같아요. 겉으론 안보이지만 보여요.',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',79,'제로 콜라 중독입니다. 하지만 제로 콜라 없이는 살 수가 없어요...',3,'광고/도배','제로콜라 바이럴이 의심됩니다..',DEFAULT);

INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',79,'제로 콜라 중독입니다. 하지만 제로 콜라 없이는 살 수가 없어요...',7,'기타','유해한 콜라를 대놓고 좋다고 하다니 충격입니다.',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',72,'하입 보이 커버 하신분 계신가요?? 저 틱톡에 올렸는데 봐주실분?ㅋㅋ하아아입보이~~',1,'기타','본인 댄스 커버 영상 링크 올렸는데.. 이런 거 안좋아 보입니다..',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',75,'와 투게더 진짜 정보 개많네요 ㄷㄷㄷ 이제 여행 준비 걱정 없겠습니다.',5,'욕설','제목에 떡하니 욕설 쓰시네요. ',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'FB',75,'와 투게더 진짜 정보 개많네요 ㄷㄷㄷ 이제 여행 준비 걱정 없겠습니다.',7,'욕설','내용은 너무 감동적인데 욕설이 걸려요. 투게더 규칙에 어긋나요. ',DEFAULT);

--
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'JB',7,'제주도 푸른 밤에 취해',1,'기타','글이 수준 미달입니다. 투게더 수준에 맞지 않아요. 삭제해주시죠.',DEFAULT);

INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'JB',6,'공룡이 살던 나라',3,'사기행위','글에 거짓정보 포함되어 있습니다. 삭제 부탁드려요! ',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'JB',1,'밀면과 나',1,'광고/도배','비슷한 바이럴글 다른 사이트에서도 봤습니다. 바이럴이 분명합니다.',DEFAULT);
            
INSERT INTO REPORT_NO (
			REPORT_NO,BOARD_TYPE, BOARD_NO, BOARD_NAME,UNO,CATEGORY,REASONS, STATUS ) VALUES (
			SEQ_REPORT_NO.NEXTVAL,'JB',8,'강릉을 걷다',2,'욕설','게시글에 욕설 포함되어있네요. 삭제 부탁드려요.',DEFAULT);


---지역코드 테이블
DROP TABLE AREACODE CASCADE CONSTRAINTS;
CREATE TABLE AREACODE (
    AREACODE_SEQ	   NUMBER		PRIMARY KEY,
    AREACODE        NUMBER                   NOT NULL,
    AREANAME        VARCHAR2(50)           NULL,
    SIGUNGUCODE        NUMBER                  NULL,
    DETAILAREANAME        VARCHAR2(50)         NULL
);
DROP SEQUENCE AREACODE_SEQ;
CREATE SEQUENCE AREACODE_SEQ;

--SELECT * FROM AREACODE;

---카테고리코드 테이블
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
CREATE TABLE CATEGORY (
    CATEGORY_SEQ	   NUMBER		PRIMARY KEY,
    CAT1        VARCHAR2(50)                   NOT NULL,
    CAT1NAME        VARCHAR2(50)           NULL,
    CAT2    VARCHAR2(50)                  NULL,
    CAT2NAME        VARCHAR2(50)         NULL
);
DROP SEQUENCE CATEGORY_SEQ;
CREATE SEQUENCE CATEGORY_SEQ;

--SELECT * FROM CATEGORY;

--컨텐츠타입(지도꺼)
DROP TABLE CONTENTTYPELIST CASCADE CONSTRAINTS;
CREATE TABLE CONTENTTYPELIST (
	CONTENTTYPEID NUMBER NOT NULL ,
	CONTENTTYPENAME VARCHAR(50) NOT NULL
);
INSERT INTO CONTENTTYPELIST VALUES (12, '관광지');
INSERT INTO CONTENTTYPELIST VALUES (14, '문화시설');
INSERT INTO CONTENTTYPELIST VALUES (15, '공연/행사');
INSERT INTO CONTENTTYPELIST VALUES (25, '코스');
INSERT INTO CONTENTTYPELIST VALUES (28, '레포츠');
INSERT INTO CONTENTTYPELIST VALUES (32, '숙소');
INSERT INTO CONTENTTYPELIST VALUES (38, '쇼핑');
INSERT INTO CONTENTTYPELIST VALUES (39, '식당');
INSERT INTO CONTENTTYPELIST VALUES (50, '나의여행');
--SELECT * FROM CONTENTTYPELIST;

--------------------------------------------------------------------------------
------------------------------메인페이지 쿼리 시작 --------------------------------
--------------------------------------------------------------------------------
-- 관광지 좋아요 가라데이터
---------관광찜 테이블--------

--찜 insert
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 1, 125461);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 2, 2865258);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 3, 2437652);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 4, 2865258);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 5, 2383039);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 1, 2437652);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 2, 1939790);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 3, 1939790);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 4, 2865258);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 5, 2865258);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 3, 2865258);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 1, 2495232);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 2, 2865258);
INSERT INTO tour_like VALUES(SEQ_LIKE_NO.NEXTVAL, 3, 2728206);

-- 관광지 좋아요 가라데이터 (ONLY 관광지 + 음식점)
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 1, 2661435);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 2, 2737280);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 3, 1899635);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 4, 2732601);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 5, 126730);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 6, 126166);

INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 1, 2850704);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 2, 1390976);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 3, 2436209);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 4, 2738724);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 5, 1621045);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 6, 2721168);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 7, 126644);

INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 1, 2561776);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 2, 2561772);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 3, 2861966);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 4, 2862020);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 5, 2862047);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 6, 2861622);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 7, 2860823);

INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 1, 2861702);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 2, 2862209);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 3, 2867502);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 4, 134872);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 5, 2860811);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 6, 2865007);
INSERT INTO TOUR_LIKE VALUES (SEQ_LIKE_NO.NEXTVAL, 7, 2866307);

COMMIT;