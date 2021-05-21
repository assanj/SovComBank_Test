--drop table t; 
create table t as 
select 1 as id, null as pid, 'Корень' as nam from dual
union all
select 2, 1, 'Узел2' from dual
union all
select 3, 1, 'Узел3' from dual
union all
select 4, 2, 'Узел4' from dual
union all
select 5, 4, 'Узел5' from dual
union all
select 6, 5, 'Узел6' from dual
union all
select 7, 4, 'Узел7' from dual
;

-- select * from t
--- 3:
SELECT id, pid, LEVEL, nam, prior nam
  FROM t
CONNECT BY Nocycle PRIOR id = pid
       And id <> 5
 START WITH pid is null
 ORDER SIBLINGS BY id;