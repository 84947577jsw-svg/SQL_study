# 테이블에 값을 넣기
# 이전까지 작업... : DB -> Table -> Schema -> Modify / Change
# Data를 넣는 작업을 하지 못함. 이 파일에서 진행

CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
	id 	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    age INT UNSIGNED,
    grade VARCHAR(10)
);

# 데이터 삽입
INSERT INTO students VALUES(1, "David", 15, "2학년");

# 열을 선택하여 데이터를 삽입할 때
INSERT INTO students (name, age, grade)
VALUES("Dave", 16, "3학년");

# 여러개의 값을 삽입하는 법
INSERT INTO students (name, age, grade)
VALUES
	("Jane", 14, "1학년"),
	("Juliet", 15, "2학년"),
	("Romeo", 16, "3학년");

SELECT * FROM students;

# UPDATE 활용 값 업데이트

UPDATE students
SET grade = "2학년", age = 15
WHERE id = 3;

# 조건문이 없어서 되지 않음
UPDATE students
SET grade = "3학년", age = 16;

# SET SQL_SAFE_UPDATES = 0; 세이프모드 OFF. 정말 주의해서 사용해야함
# SET SQL_SAFE_UPDATES = 1; 세이프 모드 ON

# PK가 없어서 변겅이 되지 않음 / 조건의 컬럼들에 PK가 없어서 발생. 세이프모드를 끄면 가능하나 가능한 사용하지 않는 것이 좋음
UPDATE students
SET grade = "1학년", age = 14
WHERE grade = "2학년" AND age = 15;


-------------
# Change - Insert - Update - Select 

SELECT * FROM students; # * = ALL
SELECT * FROM students
WHERE age >= 15; # WHERE = 조건절
# 조건절 : 비교연산자 & 논리연산자
# 비교연산자 : = >= <= < > != <>
# 번외 SQL 문법 아님, '같다' 문법 ==, === / == 는 1 =="1" 허용, ===는 1==="1" 허용X

SELECT * FROM students WHERE NOT age = 16;
# NOT -> 연산자 X, 예약어 > 논리 부정 키워드
# 단순 부정연산을 위한 목적보다, NULL의 연산처리를 위한 목적
# IS NOT NULL 통으로 쓰이는 문법 아님 NOT은 따로 사용 가능

SELECT * FROM students WHERE age IS NOT NULL;
SELECT * FROM students WHERE age <> NULL; # 실행은 되지만 사용하면 값이 안나옴. 비교연산자로 NULL을 비교 불가

SELECT * FROM students
WHERE (age > 15 AND grade = "3학년") OR grade = "1학년";
# AND : 좌항 AND 우항 -> 좌항도 True / 우항도 True

# LIKE :    약~ 같은 문법. '#', '%', '_' 사용 / '#, %' : 0개 이상, '_' 1개 
SELECT * FROM students
WHERE name LIKE "%D%"; 


