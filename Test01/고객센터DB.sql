/*
 * 
 --일련번호 관리객체
create sequence seq_cs_idx


-- 시퀀스 삭제
DROP SEQUENCE seq_csboard_idx;

--조회용 뷰 삭제
drop view csborad_view

--테이블 삭제
drop table csboard

-- CSBOARD 테이블 생성
 * 
CREATE TABLE CSBOARD (
	cs_idx	number		NOT NULL,
	mem_idx	number		NOT NULL,
	mem_name varchar2(200) NOT NULL, 
	cs_title	varchar2(200)		NOT NULL,
	cs_content	varchar2(2000)		NOT NULL,
	cs_type	varchar2(200)		NOT NULL
);
 
-- pk키 부여
ALTER TABLE csboard
	ADD CONSTRAINT  pk_cs_idx PRIMARY KEY (cs_idx); 
 *
-- fk 추가
ALTER TABLE csboard
ADD CONSTRAINT fk_mem_idx 
FOREIGN KEY (mem_idx) 
REFERENCES member(mem_idx);*
 *
-- REFERENCES member(mem_idx);여기에 값이 있어야 
-- FOREIGN KEY (mem_idx)여기에 들어올 수 있다.   **
 *
-- sample data
insert into csboard values(seq_cs_idx.nextVal,1,'일길동','문의제목','문의내용','이용문의');


-- 테이블 조회
select * from csboard
SELECT * FROM csboard WHERE mem_idx = 1;

-- 뷰 조회
SELECT * FROM csboard_view;
 *
 */
*/