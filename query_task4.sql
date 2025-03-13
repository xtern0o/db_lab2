WITH names_50_ktu AS (
    SELECT Н_ЛЮДИ.ИМЯ as name FROM Н_УЧЕНИКИ
    JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
    JOIN Н_ГРУППЫ_ПЛАНОВ ON Н_УЧЕНИКИ.ГРУППА = Н_ГРУППЫ_ПЛАНОВ.ГРУППА
    JOIN Н_ПЛАНЫ ON Н_ГРУППЫ_ПЛАНОВ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
    JOIN Н_ОТДЕЛЫ ON Н_ПЛАНЫ.ОТД_ИД = Н_ОТДЕЛЫ.ИД
    WHERE Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ = 'КТиУ' AND ИМЯ <> '.' AND ИМЯ <> ' '
    GROUP BY name
    HAVING COUNT(DISTINCT Н_ЛЮДИ.ИД) > 50
)

SELECT Н_ЛЮДИ.ИМЯ, COUNT(*) AS total_count FROM Н_УЧЕНИКИ
JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
WHERE Н_ЛЮДИ.ИМЯ IN (SELECT name FROM names_50_ktu)
GROUP BY Н_ЛЮДИ.ИМЯ
ORDER BY total_count DESC;

