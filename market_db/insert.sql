-- 1. 기본 데이터 삽입
create table hongong1 (
    toy_id int,
    toy_name char(4),
    age int
);
insert into hongong1 values (1, '우디', 25);

-- 생략하면 null로 생성
insert into hongong1 (toy_id, toy_name) values (2, '버즈');

-- 열의 순서를 바꿔서 입력하고 싶을 때에는 앞에 열 이름과 순서를 맞춰서 기재
insert into hongong1 (toy_name, age, toy_id) value ('제시', 20, 3);


-- 2. 자동으로 증가하는 auto_increment
create table hongong2 (
    toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);
-- toy_id는 자동 증가이므로 null로 데이터 추가
insert into hongong2 values (null, '보핍', 25);
insert into hongong2 values (null, '슬링키', 22);
insert into hongong2 values (null, '렉스', 21);

-- auto_incremenet로 입력되는 다음 값을 100부터 시작하도록 변경
alter table hongong2 auto_increment = 100;
insert into hongong2 values (null, '재남', 35);

-- auto_increment는 1000부터로 지정하고, 3씩 증가하도록 설정
create table hongong3 (
    toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);
alter table hongong3 auto_increment = 1000;
set @@auto_increment_increment = 3;
insert into hongong3 values (null, '토마스', 20);
insert into hongong3 values (null, '제임스', 23);
insert into hongong3 values (null, '고든', 25);


-- 3. 다른 테이블의 데이터를 한번에 입력하는 insert into ~ select
create table city_popul (
    city_name char(35),
    population int    
);
insert into city_popul select name, population from world.city;