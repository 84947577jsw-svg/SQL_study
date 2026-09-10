USE sakila;
SHOW TABLES;
# sakila. 탐색적 데이터 분석 관점에서... 
# 미국 DVD 렌탈 서비스 제공했던 실제 기업의 DB를 벤치마켕해서 만들어놓은 DB
# MySQL_Marketing - 260908.xlsx 파일과 관련됨.
# 1-2 SQL 파트와 연결됨

SELECT * FROM payment LIMIT 10;
SELECT 
	DATE_FORMAT(payment_date, "%y-%m") AS payment_month, 
    SUM(amount) 
FROM payment
GROUP BY 1
ORDER BY payment_month;

SELECT 
	customer_id,
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;
