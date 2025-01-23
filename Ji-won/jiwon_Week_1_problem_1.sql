-- 프로그래머스, 서울에 위치한 식당 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131118

SELECT REST_INFO.REST_ID, REST_INFO.REST_NAME, REST_INFO.FOOD_TYPE, REST_INFO.FAVORITES, REST_INFO.ADDRESS, ROUND(AVG(REST_REVIEW.REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO JOIN REST_REVIEW
ON REST_INFO.REST_ID = REST_REVIEW.REST_ID
WHERE REST_INFO.ADDRESS LIKE '서울%'
GROUP BY REST_INFO.REST_ID
ORDER BY SCORE DESC, FAVORITES DESC;