--drop table t1;
create table t1 as
select 1 as a, 1 as b from dual
union all
select 2 as a, 2 as b from dual
union all
select 2 as a, 2 as b from dual
union all
select 3 as a, 3 as b from dual
union all
select 4 as a, 4 as b from dual
;
create table t2 as
select 1 as a, 1 as b from dual
union all
select 2 as a, 2 as b from dual
union all
select 3 as a, 3 as b from dual
union all
select 3 as a, 3 as b from dual
union all
select 4 as a, 4 as b from dual
;


--- 1:
select sum(a + b) from t1
union all
select sum(a + b) from t2


