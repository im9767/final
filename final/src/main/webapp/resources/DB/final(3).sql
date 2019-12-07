DROP TABLE administrator CASCADE CONSTRAINTS;
DROP TABLE houseintro CASCADE CONSTRAINTS;
DROP TABLE amenities CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE Booking_TABLE CASCADE CONSTRAINTS;
DROP TABLE house_img CASCADE CONSTRAINTS;
DROP TABLE reiew_img CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE rooms_img CASCADE CONSTRAINTS;
DROP TABLE rooms CASCADE CONSTRAINTS;
DROP TABLE wishlist CASCADE CONSTRAINTS;
DROP TABLE house CASCADE CONSTRAINTS;
DROP TABLE b_event CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE eventimages CASCADE CONSTRAINTS;
DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE faq CASCADE CONSTRAINTS;
DROP TABLE faqcategory CASCADE CONSTRAINTS;
DROP TABLE qnaboard CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE qna_category CASCADE CONSTRAINTS;
DROP TABLE stay CASCADE CONSTRAINTS;

/* Create Tables */

-- 관리자정보 테이블
CREATE TABLE administrator
(
	-- 관리자식별키
	anum number(10) NOT NULL,
	-- 관리자아이디
	aid varchar2(30) NOT NULL UNIQUE,
	-- 관리자비밀번호
	apwd varchar2(30) NOT NULL,
	PRIMARY KEY (anum)
);


-- 편의시설목록
CREATE TABLE amenities
(
	-- 편의시설식별키
	amenities_num number(10) NOT NULL,
	-- 편의시설명
	amenities_name varchar2(100) NOT NULL UNIQUE,
	-- 편의시설소개
	amenities_content varchar2(2000) NOT NULL,
	-- 원본파일명
	orgfilename varchar2(300) NOT NULL,
	-- 저장파일명
	savefilename varchar2(300) NOT NULL,
	PRIMARY KEY (amenities_num)
);


-- 예약테이블
CREATE TABLE Booking_TABLE
(
	-- 예약번호
	booking_num number(5) NOT NULL,
	-- 방식별번호
	room_num number(10) NOT NULL,
	-- 회원아이디
	mid varchar2(15) NOT NULL,
	-- 결제금액
	pay_money number(10) NOT NULL,
	-- 예약신청날짜
	books_date date NOT NULL,
	-- 숙박시작일
	start_date date NOT NULL,
	-- 숙박종료일
	end_date date NOT NULL,
	-- 예약상태
	book_status varchar2(100) NOT NULL,
	PRIMARY KEY (booking_num)
);


-- 종목(종류)
CREATE TABLE b_event
(
	-- 종목식별키
	bnum number(10) NOT NULL,
	-- 업태식별키
	snum number(10) NOT NULL,
	-- 종목명
	btype varchar2(50) NOT NULL UNIQUE,
	PRIMARY KEY (bnum)
);


-- 쿠폰
CREATE TABLE coupon
(
	-- 쿠폰번호
	coupon_num number(10) NOT NULL,
	-- 회원아이디
	mid varchar2(15) NOT NULL,
	-- 쿠폰명
	coupon_name varchar2(100) NOT NULL,
	-- 쿠폰유형
	coupon_type varchar2(100) NOT NULL,
	-- 쿠폰사용여부
	coupon_status varchar2(100) NOT NULL,
	-- 발행일
	making_date date NOT NULL,
	PRIMARY KEY (coupon_num)
);


-- 이벤트 테이블
CREATE TABLE event
(
	-- 이벤트식별키
	event_num number(10) NOT NULL,
	-- 이벤트제목
	etitle varchar2(100) NOT NULL,
	-- 이벤트등록일
	eregdate date NOT NULL,
	-- 이벤트조회수
	ehit number(10) NOT NULL,
	-- 이벤트 시작일
	estartdate date NOT NULL,
	-- 이벤트종료일
	eenddate date NOT NULL,
	PRIMARY KEY (event_num)
);


-- 이벤트 이미지 테이블
CREATE TABLE eventimages
(
	-- 이미지식별키
	eimgnum number(10) NOT NULL,
	-- 원본파일명
	orgfilename varchar2(300) NOT NULL,
	-- 저장파일명
	savefilename varchar2(300) NOT NULL,
	-- 이벤트식별키
	event_num number(10) NOT NULL,
	PRIMARY KEY (eimgnum)
);


-- 자주묻는질문 테이블
CREATE TABLE faq
(
	-- 문의번호
	fnum number(10) NOT NULL,
	-- 자주묻는질문
	ftitle varchar2(100) NOT NULL,
	-- 답변
	fcontent varchar2(2000) NOT NULL,
	-- 카테고리식별키
	fcnum number(10) NOT NULL,
	PRIMARY KEY (fnum)
);


-- 질문카테고리
CREATE TABLE faqcategory
(
	-- 카테고리식별키
	fcnum number(10) NOT NULL,
	-- 카테고리명
	fctype varchar2(30) NOT NULL UNIQUE,
	PRIMARY KEY (fcnum)
);


-- 회원등급테이블
CREATE TABLE grade
(
	-- 등급식별키
	gnum number(10) NOT NULL,
	-- 등급명
	gname varchar2(30) NOT NULL UNIQUE,
	PRIMARY KEY (gnum)
);


-- 업소테이블
CREATE TABLE house
(
	-- 업체식별키
	house_num number(10) NOT NULL,
	-- 종목식별키
	bnum number(10) NOT NULL,
	-- 업소소개
	intro varchar2(2000) NOT NULL,
	-- 입실시간
	checkintime date NOT NULL,
	-- 퇴실시간
	checkouttime date NOT NULL,
	-- 업체명
	conpany varchar2(300) NOT NULL,
	-- 사업자등록번호
	license varchar2(100) NOT NULL,
	-- 대표자명
	ceo varchar2(30) NOT NULL,
	-- 본점소재지
	orgaddr varchar2(300) NOT NULL,
	-- 사업장소재지
	workplace varchar2(300) NOT NULL,
	-- 사업장전화번호
	com_tel varchar2(100) NOT NULL,
	-- 승인여부
	approval varchar2(100) NOT NULL,
	PRIMARY KEY (house_num)
);


-- 업소편의시설
CREATE TABLE houseintro
(
	-- 업소편의시설식별키
	house_intro_num number(10) NOT NULL,
	-- 업체식별키
	house_num number(10) NOT NULL,
	-- 편의시설식별키
	amenities_num number(10) NOT NULL,
	PRIMARY KEY (house_intro_num)
);


-- 업소이미지
CREATE TABLE house_img
(
	-- 기본식별키
	house_img_num number(4) NOT NULL,
	-- 업체식별키
	house_num number(10) NOT NULL,
	-- 업소이미지원본명
	house_org_name varchar2(100) NOT NULL,
	-- 업소이미지저장명
	house_save_name varchar2(100) NOT NULL,
	PRIMARY KEY (house_img_num)
);


-- 회원테이블
CREATE TABLE members
(
	-- 회원아이디
	mid varchar2(15) NOT NULL,
	-- 등급식별키
	gnum number(10) NOT NULL,
	-- 비밀번호
	mpwd varchar2(15) NOT NULL,
	-- 이름
	mname varchar2(15) NOT NULL,
	-- 전화번호
	mphone varchar2(20) NOT NULL,
	-- 이메일
	memail varchar2(30) NOT NULL,
	-- 주소
	maddr varchar2(40) NOT NULL,
	-- 가입일
	mregdate date NOT NULL,
	-- 포인트
	mpoint number(4,0) NOT NULL,
	PRIMARY KEY (mid)
);


-- 공지사항 테이블
CREATE TABLE notice
(
	-- 공지사항번호
	nnum number(10) NOT NULL,
	-- 공지글제목
	ntitle varchar2(100) NOT NULL,
	-- 공지내용
	ncontent varchar2(2000) NOT NULL,
	-- 공지날짜
	nregdate date NOT NULL,
	PRIMARY KEY (nnum)
);


-- 결제테이블
CREATE TABLE payment
(
	-- 결제번호
	pay_num number(5) NOT NULL,
	-- 예약번호
	booking_num number(5) NOT NULL,
	-- 쿠폰번호
	coupon_num number(10),
	-- 최종결제금액
	pay number(10) NOT NULL,
	-- 결제날짜
	pay_day date NOT NULL,
	-- 결제수단
	payment_type varchar2(100) NOT NULL,
	PRIMARY KEY (pay_num)
);


-- Q&A게시판
CREATE TABLE qnaboard
(
	-- 문의번호
	qna_num number(10) NOT NULL,
	-- 회원아이디
	mid varchar2(15) NOT NULL,
	-- qna카테고리식별키
	qna_category_num number(10) NOT NULL,
	-- 문의제목
	qna_title varchar2(300) NOT NULL,
	-- 문의내용
	qna_content varchar2(2000) NOT NULL,
	-- 답변
	anwser varchar2(2000),
	-- 문의작성일
	qna_date date NOT NULL,
	-- 답변작성일
	anwser_date date,
	PRIMARY KEY (qna_num)
);


-- Q&A카테고리
CREATE TABLE qna_category
(
	-- qna카테고리식별키
	qna_category_num number(10) NOT NULL,
	-- qna카테고리명
	qna_category_name varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (qna_category_num)
);


-- 리뷰이미지
CREATE TABLE reiew_img
(
	-- 리뷰이미지식별번호
	review_img_num number(10) NOT NULL,
	-- 후기식별키
	review_num number(10) NOT NULL,
	-- 리뷰이미지원본명
	review_org_name varchar2(300) NOT NULL,
	-- 리뷰이미지저장명
	review_save_name varchar2(300) NOT NULL,
	PRIMARY KEY (review_img_num)
);


-- 후기게시판
CREATE TABLE review
(
	-- 후기식별키
	review_num number(10) NOT NULL,
	-- 방식별번호
	room_num number(10) NOT NULL,
	-- 회원아이디
	mid varchar2(15) NOT NULL,
	-- 리뷰제목
	review_title varchar2(300) NOT NULL,
	-- 리뷰내용
	review_content varchar2(2000) NOT NULL,
	-- 후기작성일
	review_date date NOT NULL,
	-- 친절도
	kindness number(10) NOT NULL,
	-- 청결도
	clean number(10) NOT NULL,
	-- 편의성
	convenience number(10) NOT NULL,
	PRIMARY KEY (review_num)
);


-- 객실정보
CREATE TABLE rooms
(
	-- 방식별번호
	room_num number(10) NOT NULL,
	-- 업체식별키
	house_num number(10) NOT NULL,
	-- 객실명
	roomname varchar2(100) NOT NULL,
	-- 객실가격
	room_prise number(10) NOT NULL,
	-- 객실정보
	room_info varchar2(2000) NOT NULL,
	-- 룸체크인
	room_check number(3),
	-- 최대인원
	max_Personnel number(10) NOT NULL,
	PRIMARY KEY (room_num)
);


-- 객실이미지
CREATE TABLE rooms_img
(
	-- 객실이미지식별키
	rooms_img_num number(10) NOT NULL,
	-- 방식별번호
	room_num number(10) NOT NULL,
	-- 객실이미지원본명
	room_org_name varchar2(100) NOT NULL,
	-- 객실이미지저장명
	room_save_name varchar2(100) NOT NULL,
	PRIMARY KEY (rooms_img_num)
);


-- 업태
CREATE TABLE stay
(
	-- 업태식별키
	snum number(10) NOT NULL,
	-- 업태명
	sname varchar2(50) NOT NULL UNIQUE,
	PRIMARY KEY (snum)
);


-- 찜목록
CREATE TABLE wishlist
(
	-- 찜목록식별키
	wish_num number(10) NOT NULL,
	-- 회원아이디
	mid varchar2(15) NOT NULL,
	-- 업체식별키
	house_num number(10) NOT NULL,
	PRIMARY KEY (wish_num)
);



/* Create Foreign Keys */

ALTER TABLE houseintro
	ADD FOREIGN KEY (amenities_num)
	REFERENCES amenities (amenities_num)
;


ALTER TABLE payment
	ADD FOREIGN KEY (booking_num)
	REFERENCES Booking_TABLE (booking_num)
;


ALTER TABLE house
	ADD FOREIGN KEY (bnum)
	REFERENCES b_event (bnum)
;


ALTER TABLE payment
	ADD FOREIGN KEY (coupon_num)
	REFERENCES coupon (coupon_num)
;


ALTER TABLE eventimages
	ADD FOREIGN KEY (event_num)
	REFERENCES event (event_num)
;


ALTER TABLE faq
	ADD FOREIGN KEY (fcnum)
	REFERENCES faqcategory (fcnum)
;


ALTER TABLE members
	ADD FOREIGN KEY (gnum)
	REFERENCES grade (gnum)
;


ALTER TABLE houseintro
	ADD FOREIGN KEY (house_num)
	REFERENCES house (house_num)
;


ALTER TABLE house_img
	ADD FOREIGN KEY (house_num)
	REFERENCES house (house_num)
;


ALTER TABLE rooms
	ADD FOREIGN KEY (house_num)
	REFERENCES house (house_num)
;


ALTER TABLE wishlist
	ADD FOREIGN KEY (house_num)
	REFERENCES house (house_num)
;


ALTER TABLE Booking_TABLE
	ADD FOREIGN KEY (mid)
	REFERENCES members (mid)
;


ALTER TABLE coupon
	ADD FOREIGN KEY (mid)
	REFERENCES members (mid)
;


ALTER TABLE qnaboard
	ADD FOREIGN KEY (mid)
	REFERENCES members (mid)
;


ALTER TABLE review
	ADD FOREIGN KEY (mid)
	REFERENCES members (mid)
;


ALTER TABLE wishlist
	ADD FOREIGN KEY (mid)
	REFERENCES members (mid)
;


ALTER TABLE qnaboard
	ADD FOREIGN KEY (qna_category_num)
	REFERENCES qna_category (qna_category_num)
;


ALTER TABLE reiew_img
	ADD FOREIGN KEY (review_num)
	REFERENCES review (review_num)
;


ALTER TABLE Booking_TABLE
	ADD FOREIGN KEY (room_num)
	REFERENCES rooms (room_num)
;


ALTER TABLE review
	ADD FOREIGN KEY (room_num)
	REFERENCES rooms (room_num)
;


ALTER TABLE rooms_img
	ADD FOREIGN KEY (room_num)
	REFERENCES rooms (room_num)
;


ALTER TABLE b_event
	ADD FOREIGN KEY (snum)
	REFERENCES stay (snum)
;