-- programmers : SQL 고득점 Kit
-- SUM, MAX, MIN
-- 연도별 대장균 크기의 편차 구하기 (Level 2)


-- 문제
-- 분화된 연도(YEAR), 분화된 연도별 대장균 크기의 편차(YEAR_DEV), 대장균 개체의 ID(ID) 를 출력하는 SQL 문을 작성해주세요. 
-- 분화된 연도별 대장균 크기의 편차는 분화된 연도별 가장 큰 대장균의 크기 - 각 대장균의 크기로 구하며 
-- 결과는 연도에 대해 오름차순으로 정렬하고 같은 연도에 대해서는 대장균 크기의 편차에 대해 오름차순으로 정렬해주세요.

select extract(year from differentiation_date) as year,
 ( max(size_of_colony) over (partition by extract(year from differentiation_date)) - size_of_colony) as year_dev,
    -- OVER 절:
        -- PARTITION BY를 사용하여 데이터를 그룹화한 뒤, 각 그룹에서 연산을 수행합니다.
        -- 그룹별 계산 결과를 원래 데이터의 각 행에 "윈도우"처럼 씌워서 반환합니다.
 id
from  ecoli_data
order by year asc, year_dev asc;
