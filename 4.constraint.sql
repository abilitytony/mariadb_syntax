-- not null 제약 조건 추가
alter table author modify column name varchar(255) not null;
-- not null 제약 조건 제거
alter table author modify column name varchar(255);
-- not null, unique 동시 추가
alter table author modify column email varchar(255) not null unique;

-- pk,fk 추가/ 제거 
-- pk 제약조건 삭제
alter table post drop primary key;
-- fk 제약조건 삭제
alter table post drop foreign key post_fk;
-- pk 제약조건 추가
alter table post add constraint post_pk primary key(id);
-- fk 제약조건 추가
alter table post add constraint post_fk foreign key(author_id) references author(id);

-- on delete/on update 제약조건 변경 테스트
alter table post add constraint post_fk foreign key(author_id) references author(id) on delete set null on update cascade;
-- ex) author 테이블 id 1 삭제 시 post 테이블 author_id null로 바뀜.
-- ex) author 테이블 id 1 > 10 변경 시 post 테이블 author_id 도 10으로 변경됨.