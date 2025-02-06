SELECT 

MAX(IF (Occupation ="Doctor", NAME, NULL))  AS Doctor,
MAX(IF (Occupation ="Professor", NAME, NULL)) AS Professor,
MAX(IF (Occupation="Singer", NAME, NULL)) AS Singer,
MAX(IF (Occupation ="Actor", NAME, NULL)) AS Actor

FROM
(SELECT *, ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) as RN
FROM OCCUPATIONS) t
GROUP BY RN;