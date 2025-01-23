-- programmers : SQL 고득점 Kit
-- SUM, MAX, MIN
-- 연도별 대장균 크기의 편차 구하기 (Level 3)


-- 문제
-- 물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력하는 SQL 문을 작성해주세요.
-- 물고기의 ID 컬럼명은 ID, 이름 컬럼명은 FISH_NAME, 길이 컬럼명은 LENGTH로 해주세요.
-- 결과는 물고기의 ID에 대해 오름차순 정렬해주세요.
--단, 물고기 종류별 가장 큰 물고기는 1마리만 있으며 10cm 이하의 물고기가 가장 큰 경우는 없습니다.


select fish.ID, name.fish_name, fish.length
from fish_info as fish
join fish_name_info as name on fish.fish_type = name.fish_type
where fish.length is not null
and fish.length = (
    select max(sub.length)
    from fish_info as sub
    where sub.fish_type = fish.fish_type 
    -- 서브쿼리가 fish_type별로 최대 길이를 가진 행만 반환 
    -- 특정 fish_type에 대해 데이터를 "묶는" 역할을 암묵적으로 수행
    
    -- EX) 현재 행의 FISH_TPE = 0 이라면,
    -- sub.FISH_TYPE = fish.FISH_TYPE 조건에 따라 FISH_TYPE = 0인 데이터만 서브쿼리에 들어갑니다
    -- ID: 1, 2, 3 (LENGTH: 30, 50, 60)
    -- 이 중 MAX(sub.LENGTH)는 60이 됩니다.
    -- (ID = 3)의 fish.LENGTH가 60과 같으므로, 이 행이 최종 결과에 포함됩니다.
)

order by fish.id asc;