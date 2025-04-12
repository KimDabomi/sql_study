-- 1. 기본 조회
select * from member;
select mem_name from member;
select addr, debut_date, mem_name from member;

-- 열 이름에 별칭 지정 가능
select addr 주소, debut_date "데뷔 일자", mem_name from member;


-- 2. 특정 조건만 조회하기
select * from member where mem_name = '블랙핑크';
select * from member where mem_number = 4;
select mem_id, mem_name from member where height <= 162;

-- 논리 연산자 and, or 사용
select mem_name, height, mem_number from member where height >= 165 and mem_number > 6;
select mem_name, height, mem_number from member where height >= 165 or mem_number > 6;

-- 범위 내를 찾는 between ~ and 
select mem_name, height from member where height between 163 and 165;

-- 포함되어 있는지 찾는 in()
select mem_name, addr from member where addr in('경기', '전남', '경남');

-- 문자열의 일부 글자 검색 like
-- 제일 앞글자가 '우'로 시작하는 데이터
select * from member where mem_name like '우%';
-- 뒤에 두 글자가 핑크로 끝나는 데이터
select * from member where mem_name like '__핑크';


-- 3. 서브 쿼리 - select 안에 또 다른 select가 들어갈 수 있음
-- 에이핑크의 평균 키보다 큰 데이터 조회
select mem_name, height from member where height > (select height from member where mem_name = '에이핑크');


-- 4. 결과가 출력되는 순서를 조절하는 order by
select mem_id, mem_name, debut_date from member order by debut_date; -- 오름차순 asc (기본)
select mem_id, mem_name, debut_date from member order by debut_date desc; -- 내림차순 desc

-- order by 절은 where 절 다음에 나와야 함
select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc;

-- 평균 키가 큰 순서대로 정렬하되, 평균 키가 동일하면 데뷔 일자가 빠른 순서로 정렬
select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc, debut_date asc;


-- 5. 출력의 개수를 제한하는 limit 시작, 개수
select * from member limit 3;
select mem_name, height from member order by height desc limit 3, 2;


-- 6. 중복된 결과를 제거하는 distinct
select distinct addr from member;


-- 7. 그룹으로 묶어주는 역할인 group by
-- 회원별로 구매한 개수를 합쳐서 조회
select mem_id, sum(amount) from buy group by mem_id;
select mem_id "회원 아이디", sum(amount) "총 구매 개수" from buy group by mem_id;

-- 회원이 구매한 금액의 총합
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액" from buy group by mem_id;

-- 전체 회원이 구매한 물품 개수의 평균
select avg(amount) "평균 구매 개수" from buy;

-- 각 회원이 한 번 구매 시 평균 몇 개를 구매했는지 조회
select mem_id, avg(amount) "평균 구매 개수" from buy group by mem_id;

-- 연락처가 있는 회원의 수
select count(phone1) "연락처가 있는 회원" from member;


-- 8. 집계 함수에 조건을 정해주는 having
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액" from buy group by mem_id having sum(price * amount) > 1000;