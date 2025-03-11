WITH unique_fam_amount AS (
    SELECT COUNT(ФАМИЛИЯ) AS fcount FROM Н_ЛЮДИ
    GROUP BY ФАМИЛИЯ
    HAVING COUNT(ФАМИЛИЯ) = 1
), unique_name_amount AS (
    SELECT COUNT(ИМЯ) AS ncount FROM Н_ЛЮДИ
    GROUP BY ИМЯ
    HAVING COUNT(ИМЯ) = 1
)
SELECT 
    (SELECT COUNT(*) FROM unique_fam_amount) AS колво_уник_фамилий, 
    (SELECT COUNT(*) FROM unique_name_amount) AS колво_уник_имен;
