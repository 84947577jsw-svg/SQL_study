# 주석 : 문법관련 내용, 마케팅 관점

-- 단문 = 한줄 주석

/*
복문 주석
*/

# MySQL 프로그램 : RDBMS를 지원하기 위해서 만들어진 프로그램
## 구성요소 및 알아야할 개념
# DB : DataBase = 여러 Data들이 모여있는 그룹/집합 = 저장소
# Data : 관찰.측정.조사를 통해서 수집된 값, 사실, 기록
# Scheme : DB에서 데어터를 쉽게 찾기 위해서 한 약속/데이터별 특정 요소들을 어떤 제약조건 하에 기록,저장할 것인지
# Table : 공통 주제에 속해있는 데이터들을 별도로 관리하기 위해서 만들어놓은 저장단위(DB안에 복수로 존재)
# 구조 : DBMS > RDBMS(MySQL) DB > Table > Schema > Data

# MongoDB 프로그램 : NoSQL을 지원하기 위해서 만들어진 프로그램

# SQL 문법 종류 4가지 분야
# DDL(정의) : Data Definition Language : CREATE, DROP, ALTER
# DML(조작) : Data Manipulation Language : SELECT, INSERT, UPDATE, DELETE
# DCL(통제, 권한설정) : Data Control Language : GRANT, REVOKE
# TCL(트렌젝션 통제) : Transaction Control Language : COMMIT, ROLLBACK, SAVEPOINT / 실무에서는 잘 사용안함. 마스터 

# Table : 실제 Data가 저장되어 있는 공간
# 행.열 구성
# 1개의 행 = 레코드(Record) = Row = 튜플(Tuple)
# 1개의 열 = 속성 (attribute) = column > Field Name(필드명)