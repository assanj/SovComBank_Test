--- 7:
SELECT begin_date  + level - 1
FROM   (SELECT TO_DATE('10.01.2013', 'dd.mm.yyyy') begin_date,
               TO_DATE('10.02.2013', 'dd.mm.yyyy') end_date
        FROM   dual)
CONNECT BY LEVEL <= end_date - begin_date + 1
