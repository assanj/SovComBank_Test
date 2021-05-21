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
select 3 as a, 3 as b from dual
union all
select 3 as a, 3 as b from dual
;

--- 2:
delete from t1
 where rowid in (select row_id
                   from (select rowid row_id, --a,b,
                                row_number() over(partition by a, b order by a, b) as rn
                           from t1)
                  where rn > 1);
commit;

select * From t1;
