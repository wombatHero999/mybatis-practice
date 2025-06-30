-- 관리자 계정--
CREATE USER C##PRACTICE IDENTIFIED BY C##PRACTICE;
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO C##PRACTICE;
-------------------------------------------------

-- C##PRACTICE 계정으로 접속 -- 
--------------------------------------------------
------------------  DROP  -------------------
--------------------------------------------------

DROP TABLE REPLY;
DROP TABLE BOARD;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_RNO;

--------------------------------------------------
------------------  MEMBER 관련 -------------------
--------------------------------------------------

CREATE TABLE MEMBER (
  USER_NO NUMBER PRIMARY KEY,               
  USER_ID VARCHAR2(30) NOT NULL UNIQUE,   
  USER_PWD VARCHAR2(100) NOT NULL,  
  USER_NAME VARCHAR2(15) NOT NULL,    
  EMAIL VARCHAR2(100),  
  ENROLL_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_UNO NOCACHE;

INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', 'admin@kh.or.kr', DEFAULT);

INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'user01', 'pass01', '홍길동', 'user01@kh.or.kr', DEFAULT);
INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'user02', 'pass02', '고길동', 'user02@kh.or.kr', DEFAULT);
INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'user03', 'pass03', '김길동', 'user03@kh.or.kr', DEFAULT);
INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'user04', 'pass04', '심은성', 'user04@kh.or.kr', DEFAULT);
INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'user05', 'pass05', '안정현', 'user05@kh.or.kr', DEFAULT);

----------------------------------------------------
-------------------- BOARD 관련  --------------------
----------------------------------------------------

CREATE TABLE BOARD(
  BOARD_NO NUMBER PRIMARY KEY,
  BOARD_TITLE VARCHAR2(100) NOT NULL,
  BOARD_CONTENT VARCHAR2(4000) NOT NULL,
  USER_NO NUMBER,
  CREATE_DATE DATE DEFAULT SYSDATE,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
  FOREIGN KEY (USER_NO) REFERENCES MEMBER
);

CREATE SEQUENCE SEQ_BNO NOCACHE;

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '첫번째 게시판 서비스를 시작하겠습니다.', '안녕하세요. 첫 게시판입니다.', 1, '20191219', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '두번째 게시판 서비스를 시작하겠습니다.', '안녕하세요. 2 게시판입니다.', 2, '20200320', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '하이 에브리원 게시판 서비스를 시작하겠습니다.', '안녕하세요. 3 게시판입니다.', 1, '20200321', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '안녕.. 마이바티스는 처음이지?', '안녕하세요. 첫 게시판입니다.', 2, '20200322', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '샘플데이터', '샘플데이터를 넣읍시다.', 1, '20200323', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '페이징처리때문에 샘플데이터 많이 넣어놓는다..', '중요하겠죠?', 2, '20200324', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '어서오세요ㅎㅎ', '반갑습니다.', 1, '20200325', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '모두들 화이팅!!', '화이팅 합시다~', 2, '20200326', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '게시판 서비스', '안녕하세요. 게시판입니다.', 1, '20200327', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '안녕하십니까', '맛점하십시오', 2, '20200328', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '힘냅시다!', '종강까지 얼마 안남았네요!', 1, '20200329', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '테스트 게시글 입니다.', '잘 보이시나요?', 2, '20200330', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '드디어 프레임워크..', '아기다리 고기다렸 읍니다..', 2, '20200402', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '어 예쁘다', '컹핑항장할래용', 1, '20200403', DEFAULT);

----------------------------------------------------
-------------------- REPLY 관련 ---------------------	
----------------------------------------------------

CREATE TABLE REPLY(
  REPLY_NO NUMBER PRIMARY KEY,
  REPLY_CONTENT VARCHAR2(400),
  BOARD_NO NUMBER,
  USER_NO NUMBER,
  CREATE_DATE DATE DEFAULT SYSDATE,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  FOREIGN KEY (BOARD_NO) REFERENCES BOARD,
  FOREIGN KEY (USER_NO) REFERENCES MEMBER
);

CREATE SEQUENCE SEQ_RNO NOCACHE;

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '첫번째 댓글입니다.', 1, 2, '20191225', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '첫번째 댓글입니다.', 13, 2, '20200412', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '두번째 댓글입니다.', 13, 2, '20200413', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '마지막 댓글입니다.', 13, 2, '20200414', DEFAULT);

COMMIT;


