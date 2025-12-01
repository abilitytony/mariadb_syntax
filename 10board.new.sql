-- 회원 테이블 생성
-- id(pk), email(unique,not null), name(not null), password(not null)
create table author(id bigint auto_increment primary key, name varchar(255) not null, email varchar(255) not null unique, password varchar(255) not null);

-- 주소 테이블
-- id(pk), country(not null), city(not null), street(not null), author_id(fk, not null)
create table address(id bigint auto_increment primary key, country varchar(255) not null, city varchar(255) not null, street varchar(255) not null unique, author_id bigint not null, foreign key(author_id) references author(id));

--post테이블
--id, title(not null), contents
create table post(id bigint auto_increment primary key, title varchar(255) not null, contents varchar(3000));

--연결(junction) 테이블
create table author_post_list(id bigint auto_increment primary key, author_id bigint not null, post_id bigint not null, foreign key(author_id) references author(id), foreign key(post_id) references post(id));

-- 복합키를 이용한 연결테이블 생성
create table author_post_list(author_id bigint not null, post_id bigint not null, primary key(author_id, post_id), foreign key(author_id) references author(id), foreign key(post_id) references post(id));

-- 회원가입 및 주소 생성
insert into author(name, email,password) values ('홍길동', '홍길동@naver.com', 'abc1234');
insert into address(country, city, street, author_id) values('korea', 'seoul', 'sindaebang1', 2);

-- 글쓰기
-- 최초 생성자
insert into post(title, contents) values ('hello', 'hello world is ...');
insert into author_post_list (author_id, post_id)  values(1,2)
insert into author_post_list values(2,2)
-- 글 전체 목록 조회하기 : 제목, 내용, 글쓴이 이름이 조회가 되도록 select 쿼리 생성
select * from post p inner join author_post_list ap inner join author;



-- 실습
--테이블 생성
create table user(id bigint auto_increment primary key, name VARCHAR(255) not null, email VARCHAR(255) not null unique, password VARCHAR(255) not null, role VARCHAR(255) not null);
create table ordersystem(id bigint auto_increment primary key, order_DATETIME DATETIME not null, user_id bigint, foreign key (user_id) references user(id));
create table product(id bigint auto_increment primary key, name VARCHAR(255) not null, price bigint not null, stock bigint not null, seller VARCHAR(255) not null, seller_id bigint, foreign key(seller_id) references user(id));
create table particular(id bigint auto_increment primary key, product_count bigint not null, product_id bigint, ordersystem_id bigint, foreign key(product_id) references product(id), foreign key(ordersystem_id) references ordersystem(id));

-- 유저 테이블 데이터 삽입
-- insert into 테이블명(컬럼1, 컬럼2, 컬럼3) values(데이터1, 데이터2, 데이터3);
insert into user(name, email, password, role) values('박해민', 'hongildong1@naver.com',1234, 'seller');
insert into user(name, email, password) values('hongildong2', 'hongildong2@naver.com',1234);
insert into user(name, email, password, role) values('문현빈', 'hongildong3@naver.com',1234, 'seller');
insert into user(name, email, password, role) values('hongildong4', 'hongildong4@naver.com',1234);
insert into user(name, email, password) values('강백호', 'hongildong5@naver.com',1234, 'seller');
-- 상품 테이블 데이터 삽입
insert into product(name, price, stock, seller) values('lg', 10000, 100, '박해민');
insert into product(name, price, stock, seller) values('hanhwa', 10000, 100, '문현빈');
insert into product(name, price, stock, seller) values('ssg', 10000, 100, '강백호');
insert into product(name, price, stock, seller) values('samsung', 10000, 100, '박해민');
insert into product(name, price, stock, seller) values('nc', 10000, 100, '강백호');
-- order 테이블 데이터 삽입
alter table post modify column order_DATETIME datetime default current_timestamp();
insert into order(user_id) values (1);
insert into order(user_id) values (1);
insert into order(user_id) values (2);
insert into order(user_id) values (2);
insert into order(user_id) values (3);
--particular 테이블 데이터 삽입
insert into particular(product_count, product_id, order_id) values (3, 1, 1 );
insert into particular(product_count, product_id, order_id) values (2, 2, 2 );
insert into particular(product_count, product_id, order_id) values (5, 3, 3 );
insert into particular(product_count, product_id, order_id) values (7, 4, 4 );
insert into particular(product_count, product_id, order_id) values (8, 5, 5 );

-- 재고 업데이트
-- update author set name='홍길동', email='hong100@naver.com' where id=3;
update product set stock=97 where id=1;
update product set stock=98 where id=1;
update product set stock=95 where id=2;
update product set stock=93 where id=3;
update product set stock=92 where id=4;


-- 상품정보 조회 박해민 판매자의 모든 상품
-- select * from product where  in(select id from author where name='홍길동');
select * from product where seller='박해민';











-- enum 데이터 조건 추가 사용자 구분
alter table user add column role enum('user', 'seller') not null default 'user';
--order_datetime 현재 시간으로 구매
alter table post modify column order_DATETIME datetime default current_timestamp();
-- 





-- 사용자, 판매자 enum 조건 추가
alter table author add column role enum('admin', 'user') not null default 'user';
