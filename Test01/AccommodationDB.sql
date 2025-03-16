/*


------------------------------------------------ 숙소 예약 ---------------------------------------------------

--숙소 넘버링 시퀀스

create sequence seq_acom_idx;

create sequence seq_room_idx;

create sequence seq_rsv_idx;

create sequence seq_pay_idx;


--tb col 추가



update reservation set rsv_chk=1




alter table accommodation add (tel Varchar2(100) );
alter table accommodation add (areacode number);
alter table accommodation add (contentid number);
alter table accommodation add ();

--col 삭제

ALTER TABLE payment DROP COLUMN rsv_idx;


ALTER TABLE payment DROP COLUMN rsv_idx;

ALTER TABLE reservation DROP COLUMN rsv_cap;

ALTER TABLE room DROP COLUMN room_chk;


ALTER TABLE conn_room DROP COLUMN fldgubun;


--data 삭제

DELETE FROM RESERVATION


--검색
select * from member
select * from accommodation
select * from room where acom_idx = 41
select * from reservation where acom_idx = 41
select * from reservation where mem_idx = 1
select * from payment
select * from reservation where mem_idx = 21 order by rsv_idx desc

--예약 시간 확인

select r.*,
       to_char(rsv_date,'YYYY-MM-DD HH24:MI:SS')
from
  (select * from reservation) r




select * from payment

select * from room where acom_idx = 7 and room_type = 1


--숙소 검색용

SELECT SUM(rsv_chk) AS total_rsv_chk
FROM reservation
WHERE acom_idx = 7 
  AND room_idx = 4;

--방 타입별 총 예약객실 조회하기
create or replace view rsv_view
as
	SELECT r2.acom_idx,r2.room_idx,r2.room_type,r1.rsv_chk AS total_rsv_chk
	FROM reservation r1 inner join room r2 on r1.room_idx = r2.room_idx
	WHERE r1.rsv_chk = 1 and r1.room_idx = r2.room_idx
	GROUP BY r2.acom_idx,r2.room_idx,r2.room_type,r1.rsv_chk
	
	
	
CREATE OR REPLACE VIEW rsv_view AS
SELECT 
    r2.acom_idx,
    r2.room_idx,
    r2.room_type,
    SUM(r1.rsv_chk) AS total_rsv_chk -- 각 room_idx 별 rsv_chk 총합 계산
FROM reservation r1 
INNER JOIN room r2 ON r1.room_idx = r2.room_idx
WHERE r1.rsv_chk = 1
GROUP BY r2.acom_idx, r2.room_idx, r2.room_type;
	
	
	
	
create or replace view reservation_view
as
	SELECT r2.acom_idx,r2.room_type, count(*) AS total_rsv_chk
	FROM reservation r1 inner join room r2 on r1.room_idx = r2.room_idx
	WHERE r1.rsv_chk = 1 and r1.acom_idx = r2.acom_idx
	GROUP BY r2.acom_idx,r2.room_type	
	

select * from rsv_view

drop view rsv_view

select * from 
room r left outer join reservation_view rv on r.acom_idx=rv.acom_idx and r.room_type=rv.room_type
where r.acom_idx = 7 
order by r.room_idx 


select r.room_idx, r.acom_idx , r.room_type, r.room_cap , r.room_pettype, rv.total_rsv_chk
from room r left outer join reservation_view rv on r.acom_idx=rv.acom_idx
where r.acom_idx = 168 and r.room_idx = 171
GROUP BY r.room_idx, r.acom_idx , r.room_type, r.room_cap , r.room_pettype, rv.total_rsv_chk
order by r.room_idx




select r.room_idx, r.acom_idx, r.mem_idx, r.room_type, r.room_cap,r.room_price, r.roomintro, r.room_pettype, rv.total_rsv_chk from 
room r left outer join reservation_view rv on r.acom_idx=rv.acom_idx and r.room_type=rv.room_type
where r.acom_idx = 168 and r.room_idx = 171
order by r.room_idx 


		select room_idx,room_cap,room_price from room where
		
		acom_idx = 168

		group by room_idx,room_cap,room_price

		order by room_price asc 
		
		
		
		
		
		
		select r.room_idx, r.acom_idx
		, r.room_type, r.room_cap ,r.room_price, r.room_pettype,r.roomimg1,r.roomimg1alt,
		r.roomimg2,r.roomimg2alt,r.roomimg3,r.roomimg3alt,r.roomimg4,r.roomimg4alt,r.roomimg5,r.roomimg5alt,
		rv.total_rsv_chk
		from room r left outer join rsv_view rv on
		r.acom_idx=rv.acom_idx
		where r.acom_idx = 168 
		GROUP BY
		r.room_idx, r.acom_idx , r.room_type, r.room_cap ,r.room_price,
		r.room_pettype,r.roomimg1,r.roomimg1alt,
		r.roomimg2,r.roomimg2alt,r.roomimg3,r.roomimg3alt,r.roomimg4,r.roomimg4alt,r.roomimg5,r.roomimg5alt,
		rv.total_rsv_chk
		order by r.room_idx


		SELECT
		r.room_idx,
		r.acom_idx,
		r.room_type,
		r.room_cap,
		r.room_price,
		r.room_pettype,
		r.roomimg1, r.roomimg1alt,
		r.roomimg2, r.roomimg2alt,
		r.roomimg3, r.roomimg3alt,
		r.roomimg4, r.roomimg4alt,
		r.roomimg5, r.roomimg5alt,
		rv.total_rsv_chk AS total_rsv_chk
		FROM room r
		LEFT OUTER JOIN rsv_view rv ON r.room_idx = rv.room_idx
		WHERE r.acom_idx = 168
		ORDER BY r.room_idx;

select * from accommodation a

LEFT OUTER JOIN room r on a.acom_idx = r.acom_idx

where a.acom_img is not null

order by r.room_price asc


select * from room

select r.room_idx, r.acom_idx , r.room_type, r.room_cap , r.room_pettype,r.roomimg1,r.roomimg1alt,
r.roomimg2,r.roomimg2alt,r.roomimg3,r.roomimg3alt,r.roomimg4,r.roomimg4alt,r.roomimg5,r.roomimg5alt,
rv.total_rsv_chk
from room r left outer join reservation_view rv on r.acom_idx=rv.acom_idx
where r.acom_idx = 68
GROUP BY r.room_idx, r.acom_idx , r.room_type, r.room_cap , r.room_pettype,r.roomimg1,r.roomimg1alt,
r.roomimg2,r.roomimg2alt,r.roomimg3,r.roomimg3alt,r.roomimg4,r.roomimg4alt,r.roomimg5,r.roomimg5alt,
rv.total_rsv_chk
order by r.room_idx


select acom_idx,room_idx,roomimg1,roomimg1alt,roomimg2,roomimg2alt,roomimg3,roomimg3alt,roomimg4,roomimg4alt,roomimg5,roomimg5alt 
from room where acom_idx = 117



select * from room


--fk 추가
--acom

ALTER TABLE accommodation 
ADD CONSTRAINT fk_mem_idx 
FOREIGN KEY (mem_idx) 
REFERENCES member(mem_idx) ON DELETE CASCADE;

--room

ALTER TABLE room
ADD CONSTRAINT fk_mem_room_idx 
FOREIGN KEY (mem_idx) 
REFERENCES member(mem_idx) ON DELETE CASCADE;

ALTER TABLE room
ADD CONSTRAINT fk_acom_room_idx 
FOREIGN KEY (acom_idx) 
REFERENCES accommodation (acom_idx) ON DELETE CASCADE;

--rsv
ALTER TABLE reservation
ADD CONSTRAINT fk_mem_rsv_idx 
FOREIGN KEY (mem_idx) 
REFERENCES member(mem_idx) ON DELETE CASCADE;


ALTER TABLE reservation
ADD CONSTRAINT fk_acom_rsv_idx 
FOREIGN KEY (acom_idx) 
REFERENCES accommodation (acom_idx) ON DELETE CASCADE;

ALTER TABLE reservation
ADD CONSTRAINT fk_room_rsv_idx 
FOREIGN KEY (room_idx) 
REFERENCES room (room_idx) ON DELETE CASCADE;


ALTER TABLE reservation
ADD CONSTRAINT fk_pay_rsv_idx 
FOREIGN KEY (pay_idx) 
REFERENCES payment (pay_idx) ON DELETE CASCADE;


--payment

ALTER TABLE payment
ADD CONSTRAINT fk_mem_pay_idx 
FOREIGN KEY (mem_idx) 
REFERENCES MEMBER (mem_idx) ON DELETE CASCADE;


ALTER TABLE payment
ADD CONSTRAINT fk_acom_pay_idx 
FOREIGN KEY (acom_idx) 
REFERENCES accommodation (acom_idx) ON DELETE CASCADE;

ALTER TABLE payment
ADD CONSTRAINT fk_room_pay_idx 
FOREIGN KEY (room_idx) 
REFERENCES room (room_idx) ON DELETE CASCADE;


ALTER TABLE payment
ADD CONSTRAINT fk_room_pay_idx 
FOREIGN KEY (room_idx) 
REFERENCES room (room_idx) 
ON DELETE CASCADE;




--외래키 활성 / 비활성화
ALTER TABLE room DISABLE CONSTRAINT fk_mem_room_idx;
ALTER TABLE room DISABLE CONSTRAINT fk_acom_room_idx;

ALTER TABLE room enable CONSTRAINT fk_mem_room_idx;
ALTER TABLE room enable CONSTRAINT fk_acom_room_idx;


ALTER TABLE room drop CONSTRAINT fk_acom_room_idx;


ALTER TABLE reservation drop CONSTRAINT fk_acom_rsv_idx;
ALTER TABLE reservation drop CONSTRAINT fk_room_rsv_idx;
ALTER TABLE reservation drop CONSTRAINT fk_pay_rsv_idx;


ALTER TABLE payment drop CONSTRAINT fk_room_pay_idx;
ALTER TABLE payment drop CONSTRAINT fk_acom_pay_idx;
ALTER TABLE payment drop CONSTRAINT fk_mem_pay_idx;


ALTER TABLE payment drop CONSTRAINT pk_pay_idx;

drop table room




--pk 추가

ALTER TABLE accommodation
	ADD CONSTRAINT  pk_acom_idx PRIMARY KEY (acom_idx);
	
ALTER TABLE room
	ADD CONSTRAINT  pk_room_idx PRIMARY KEY (room_idx);
	
ALTER TABLE reservation
	ADD CONSTRAINT  pk_rsv_idx PRIMARY KEY (rsv_idx);
	
	
ALTER TABLE payment
	ADD CONSTRAINT  pk_pay_idx PRIMARY KEY (pay_idx);
	
	

--test data 추가 
--각 DB에서 idx가 다르게 설정되어있을 수 있으므로 mem , acom table 조회 후에 idx 맞춰서 집어넣을 것
--acom

insert into accommodation values(seq_acom_idx.nextVal,'21','숙소 테스트','숙소 설명','숙소 주소 서울시 어쩌구','우편번호?',sysdate,null);
insert into accommodation values(seq_acom_idx.nextVal,'21','숙소 테스트222','숙소 설명222','주소 경기도 어쩌구','우편번호?',sysdate,null);
insert into accommodation values(seq_acom_idx.nextVal,'21','숙소 3333333333 test','숙소 설명222','주소 경기도 어쩌구','우편번호?',sysdate,null);

--room


-- 싱글룸 (1인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 7, 21, 1, 50000, 5, 'TV, 에어컨, 무료 WiFi', '소형', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 더블룸 or 트윈룸 (2인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 7, 21, 2, 70000, 4, 'TV, 에어컨, 무료 WiFi, 냉장고', '중형,대형', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 디럭스룸 (3인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 7, 21, 3, 90000, 3, 'TV, 에어컨, 무료 WiFi, 냉장고, 전자레인지', '모두', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 스위트룸 (4인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 7, 21, 4, 120000, 2, 'TV, 에어컨, 무료 WiFi, 냉장고, 욕조', '모두', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 대형룸 (4인 이상)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 7, 21, 5, 150000, 1, 'TV, 에어컨, 무료 WiFi, 냉장고, 욕조, 거실', '모두', TO_DATE('2024-02-28', 'YYYY-MM-DD'));


-- 싱글룸 (1인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 8, 21, 1, 50000, 5, 'TV, 에어컨, 무료 WiFi', '소형', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 더블룸 or 트윈룸 (2인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 8, 21, 2, 70000, 4, 'TV, 에어컨, 무료 WiFi, 냉장고', '중형,대형', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 디럭스룸 (3인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 8, 21, 3, 90000, 3, 'TV, 에어컨, 무료 WiFi, 냉장고, 전자레인지', '모두', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 스위트룸 (4인)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 8, 21, 4, 120000, 2, 'TV, 에어컨, 무료 WiFi, 냉장고, 욕조', '모두', TO_DATE('2024-02-28', 'YYYY-MM-DD'));

-- 대형룸 (4인 이상)
INSERT INTO room (room_idx, acom_idx, mem_idx, room_type, room_price, room_cap, room_amen, room_petType, room_date)
VALUES (seq_room_idx.nextVal, 8, 21, 5, 150000, 1, 'TV, 에어컨, 무료 WiFi, 냉장고, 욕조, 거실', '모두', TO_DATE('2024-02-28', 'YYYY-MM-DD'));



--rsv

INSERT INTO RESERVATION (rsv_idx, room_idx, acom_idx, mem_idx, rsv_in, rsv_out, rsv_cap, rsv_pet, rsv_status, rsv_price, rsv_date, rsv_petinfo)
VALUES (1, 1, 7, 1, TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-15', 'YYYY-MM-DD'), 2, 0, '예약대기', 300000, SYSDATE, 'None');

INSERT INTO RESERVATION (rsv_idx, room_idx, acom_idx, mem_idx, rsv_in, rsv_out, rsv_cap, rsv_pet, rsv_status, rsv_price, rsv_date, rsv_petinfo)
VALUES (2, 2, 8, 1, TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'), 4, 1, '예약완료', 500000, SYSDATE, 'Small dog allowed');

INSERT INTO RESERVATION (rsv_idx, room_idx, acom_idx, mem_idx, rsv_in, rsv_out, rsv_cap, rsv_pet, rsv_status, rsv_price, rsv_date, rsv_petinfo)
VALUES (3, 3, 9, 1, TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-03-25', 'YYYY-MM-DD'), 3, 0, '취소', 0, SYSDATE, 'None');



--숙소 TB 삭제

DROP TABLE accommodation

DROP TABLE room

drop table reservation

drop table payment

--검색
select * from member
select * from accommodation
select * from room
select * from reservation
select * from payment

select * from room where acom_idx = 7 and room_type = 1

--예약 완료시 객실 감소 로직

update room

set room_cap = room_cap - 1

where acom_idx = 41 and room_idx = 2 and room_type = 1 and room_cap > 0 
 and room_idx IN(
 	select room_idx from reservation
where (rsv_in between #{ rsv_in } and #{ rsv_out })
 	or(rsv_out between #{ rsv_in } and #{ rsv_out })
 	or(rsv_in <= #{ rsv_in } and rsv_out >= #{ rsv_out })
 
 );
 
 
 --체크아웃 기간이 지나면 체크인 1 -> 0으로 update
 
 update reservation
 
 set rsv_chk = 0
 
 where rsv_chk = 1 and rsv_out < sysdate
 



select rsv_in, rsv_out from reservation

where rsv_in = 

select * from reservation

select * from room where room_idx = 171

select * from accommodation where acom_idx = 141

--숙소 정보

CREATE TABLE accommodation (
	acom_idx		number		NOT NULL, --pr
	mem_idx			number		NOT NULL, --fk
	acom_name		Varchar2(200)		NOT NULL,
	acom_desc		clob		NOT NULL,
	acom_addr		Varchar2(500)		NOT NULL,
	acom_zipcode	Varchar2(200)		NOT NULL,
	acom_date		DATE		NOT NULL,
	acom_img		Varchar2(1000),
	tel				Varchar2(200),
	areacode		number,
	contentid		number,
	mapx			Varchar2(200),
	mapy			Varchar2(200)

	
);

--방 정보
CREATE TABLE room (
	room_idx				number		NOT NULL, --pr
	acom_idx				number		NOT NULL, --fk
	mem_idx					number		NOT NULL, --fk
    room_type  				Varchar2(300),			   -- 객실 유형 명칭
    room_price 				number(10,2) DEFAULT 80000,-- 객실 가격 (소수점 2자리까지)
	room_cap				number		,			   --객실 수
	room_petType			Varchar2(200)		,
	room_date				DATE		,
	contentid				number,                    --콘텐츠ID   
	contenttypeid			number,                    --콘텐츠타입ID   
	roomintro				Varchar2(1000),            --객실소개        
	roombathfacility		Varchar2(100) DEFAULT 'N', --목욕시설 여부 
	roombath				Varchar2(100) DEFAULT 'N', --욕조 여부   
	roomhometheater         Varchar2(100) DEFAULT 'N', --홈시어터 여부 
	roomaircondition        Varchar2(100) DEFAULT 'N', --에어컨 여부  
	roomtv                  Varchar2(100) DEFAULT 'N', --TV 여부   
	roompc                  Varchar2(100) DEFAULT 'N', --PC 여부   
	roomcable               Varchar2(100) DEFAULT 'N', --케이블설치 여부
	roominternet            Varchar2(100) DEFAULT 'N', --인터넷 여부  
	roomrefrigerator        Varchar2(100) DEFAULT 'N', --냉장고 여부  
	roomtoiletries          Varchar2(100) DEFAULT 'N', --세면도구 여부 
	roomsofa                Varchar2(100) DEFAULT 'N', --소파 여부   
	roomcook                Varchar2(100) DEFAULT 'N', --취사용품 여부 
	roomtable               Varchar2(100) DEFAULT 'N', --테이블 여부  
	roomhairdryer           Varchar2(100) DEFAULT 'N', --드라이기 여부 
	roomimg1				Varchar2(1000),            --객실사진1   
	roomimg1alt             Varchar2(1000),            --객실사진1 설명
	roomimg2                Varchar2(1000),            --객실사진2   
	roomimg2alt             Varchar2(1000),            --객실사진2 설명
	roomimg3                Varchar2(1000),            --객실사진3   
	roomimg3alt             Varchar2(1000),            --객실사진3 설명
	roomimg4                Varchar2(1000),            --객실사진4   
    roomimg4alt             Varchar2(1000),            --객실사진4 설명
  	roomimg5                Varchar2(1000),            --객실사진5   
    roomimg5alt             Varchar2(1000)             --객실사진5 설명
);

select * from room

drop table room
--숙소 예약

CREATE TABLE RESERVATION (
	rsv_idx	number		NOT NULL,
	room_idx	number		NOT NULL,
	acom_idx	number		NOT NULL,
	mem_idx	number		NOT NULL,
	rsv_in	DATE		NOT NULL,
	rsv_out	DATE		NOT NULL,
	rsv_cap	number		NOT NULL,
	rsv_pet	number		NOT NULL,
	rsv_status	Varchar2(200)		NOT NULL,
	rsv_price	number		NOT NULL,
	rsv_date	DATE		NOT NULL,
	rsv_petinfo Varchar2(1000)		NOT NULL,
	pay_idx		number			NOT NULL,
	rsv_chk		number			NOT NULL
);


--숙소 결제
CREATE TABLE payment (
	pay_idx	number		NOT NULL, --pr
	mem_idx number		NOT NULL, --fk
	room_idx	number		NOT NULL, --fk
	acom_idx	number		NOT NULL, --fk
	pay_type	Varchar2(200)		NOT NULL,
	pay_status	Varchar2(200)		NOT NULL,
	pay_date	DATE		NOT NULL,
	imp_uid		Varchar2(500) NOT null,
	merchant_uid Varchar2(500) NOT null,
	amount	number		NOT NULL
);


CREATE TABLE conn_acom (

	addr1   	Varchar2(1000) ,
	addr2		Varchar2(1000),
	areacode 	number,
	contentid 	number,
	title		Varchar2(100),
	tel			Varchar2(100),
	firstimage	Varchar2(1000)

);

--data 마이그레이션

insert into accommodation 

select seq_acom_idx.nextVal, 23, title ,'설명', addr1 || addr2 , 1 , sysdate , firstimage , tel , areacode , contentid , mapx ,mapy

from conn_acom 

alter table accommodation MODIFY acom_desc clob null;


-- room data 마이그레이션

insert into room 

select seq_room_idx.nextVal, a.acom_idx , a.mem_idx, roomtitle , roompeakseasonminfee1 , roomcount , '모두' , sysdate ,
a.contentid , contenttypeid ,roomintro , roombathfacility , roombath , roomhometheater , roomaircondition,
roomtv, roompc, roomcable, roominternet, roomrefrigerator,roomtoiletries,roomsofa,roomcook,roomtable,
roomhairdryer,roomimg1,roomimg1alt,roomimg2,roomimg2alt,roomimg3,roomimg3alt,roomimg4,roomimg4alt,roomimg5,roomimg5alt      

from accommodation a,conn_room c

where a.contentid = c.contentid

select * from conn_acom
select * from conn_room

select * from room


select title, count(*) from conn_acom

group by title having count(*) > 1


update room

set room_cap = (select ROUND(DBMS_RANDOM.VALUE(1, 20)) from dual)

where room_cap = 0

alter table room MODIFY room_type Varchar2(300) ;

select *from room


select * from accommodation





-- 검색 페이지 방 가격순 정렬

		select room_idx,room_cap,room_price from room where
		
		acom_idx = #{ acom_idx }

		group by room_idx,room_cap,room_price

		order by room_price asc 

UPDATE room
SET room_price = ROUND(DBMS_RANDOM.VALUE(80000, 200000), -3);


select * from room


CREATE TABLE conn_room (



    contentid				number,                    --콘텐츠ID   
	contenttypeid			number,                    --콘텐츠타입ID 
	roomtitle				Varchar2(100),             --객실명칭    
	roompeakseasonminfee1	number,                    --성수기주중최소 
	roomintro				Varchar2(1000),            --객실소개    
	roomcount				number,                    --객실 수    
	roombathfacility		Varchar2(100) DEFAULT 'N', --목욕시설 여부 
	roombath				Varchar2(100) DEFAULT 'N', --욕조 여부   
	roomhometheater         Varchar2(100) DEFAULT 'N', --홈시어터 여부 
	roomaircondition        Varchar2(100) DEFAULT 'N', --에어컨 여부  
	roomtv                  Varchar2(100) DEFAULT 'N', --TV 여부   
	roompc                  Varchar2(100) DEFAULT 'N', --PC 여부   
	roomcable               Varchar2(100) DEFAULT 'N', --케이블설치 여부
	roominternet            Varchar2(100) DEFAULT 'N', --인터넷 여부  
	roomrefrigerator        Varchar2(100) DEFAULT 'N', --냉장고 여부  
	roomtoiletries          Varchar2(100) DEFAULT 'N', --세면도구 여부 
	roomsofa                Varchar2(100) DEFAULT 'N', --소파 여부   
	roomcook                Varchar2(100) DEFAULT 'N', --취사용품 여부 
	roomtable               Varchar2(100) DEFAULT 'N', --테이블 여부  
	roomhairdryer           Varchar2(100) DEFAULT 'N', --드라이기 여부 
	roomimg1				Varchar2(1000),            --객실사진1   
	roomimg1alt             Varchar2(1000),            --객실사진1 설명
	roomimg2                Varchar2(1000),            --객실사진2   
	roomimg2alt             Varchar2(1000),            --객실사진2 설명
	roomimg3                Varchar2(1000),            --객실사진3   
	roomimg3alt             Varchar2(1000),            --객실사진3 설명
	roomimg4                Varchar2(1000),            --객실사진4   
    roomimg4alt             Varchar2(1000),            --객실사진4 설명
  	roomimg5                Varchar2(1000),            --객실사진5   
    roomimg5alt             Varchar2(1000)             --객실사진5 설명
    
    
                            
   );     
   
delete from conn_room   
delete from room   

delete from conn_acom 
delete from accommodation 

    

select * from conn_room   

alter table room 
                                       
select * from room

drop table room

alter table conn_acom add (mapx Varchar2(200)); 
alter table conn_acom add (mapy Varchar2(200)); 

update 
 
select * from conn_acom

select count(*) from conn_acom 

select contentid from conn_acom where rownum <= 5

select contentid from conn_acom


select * from accommodation order by acom_img 

--2개이상 중복검색 data 검색

select max (title),min(title), contentid,count(*) from conn_acom

group by contentid having count(*) > 1 


--중복검색 2개이상 data 삭제

delete from conn_acom where contentid in 

(select contentid from conn_acom

group by contentid having count(*) > 1 )



--메인 숙소 검색용
SELECT * FROM accommodation 
ORDER BY acom_img ASC NULLS LAST, acom_idx DESC;

		select a.acom_idx,r.room_idx,a.acom_name,a.acom_addr,a.acom_img,r.room_price from accommodation a

		LEFT OUTER JOIN room r on a.acom_idx = r.acom_idx

		where a.acom_img is not null

		order by r.room_price asc


*/