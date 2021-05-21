create table payments as
select 1 as id, 1 as pay_type, to_date('01.01.2012','dd.mm.yyyy') as pay_date, 100 as pay_sum from dual union all
select 2 as id, 1 as pay_type, to_date('02.01.2012','dd.mm.yyyy') as pay_date, 200 as pay_sum from dual union all
select 3 as id, 1 as pay_type, to_date('03.01.2012','dd.mm.yyyy') as pay_date, 300 as pay_sum from dual union all
select 4 as id, 1 as pay_type, to_date('01.02.2012','dd.mm.yyyy') as pay_date, 400 as pay_sum from dual union all
select 5 as id, 1 as pay_type, to_date('01.02.2012','dd.mm.yyyy') as pay_date, 500 as pay_sum from dual union all
select 6 as id, 2 as pay_type, to_date('01.01.2012','dd.mm.yyyy') as pay_date, 600 as pay_sum from dual union all
select 7 as id, 2 as pay_type, to_date('01.02.2012','dd.mm.yyyy') as pay_date, 700 as pay_sum from dual union all
select 8 as id, 2 as pay_type, to_date('01.04.2012','dd.mm.yyyy') as pay_date, 800 as pay_sum from dual union all
select 9 as id, 2 as pay_type, to_date('01.05.2012','dd.mm.yyyy') as pay_date, 900 as pay_sum from dual union all
select 10 as id, 2 as pay_type, to_date('01.06.2012','dd.mm.yyyy') as pay_date, 1000 as pay_sum from dual union all
select 11 as id, 3 as pay_type, to_date('10.01.2012','dd.mm.yyyy') as pay_date, 1100 as pay_sum from dual union all
select 12 as id, 3 as pay_type, to_date('01.03.2012','dd.mm.yyyy') as pay_date, 1200 as pay_sum from dual union all
select 13 as id, 3 as pay_type, to_date('01.05.2012','dd.mm.yyyy') as pay_date, 1300 as pay_sum from dual union all
select 14 as id, 3 as pay_type, to_date('05.05.2012','dd.mm.yyyy') as pay_date, 1400 as pay_sum from dual union all
select 15 as id, 3 as pay_type, to_date('01.06.2012','dd.mm.yyyy') as pay_date, 1500 as pay_sum from dual 
;
--- 5:
select id, pay_type, pay_date, pay_sum, sm
  from (select src.*,
               max(max_sum_by_type) over(partition by 1) as global_max
          from (select id, pay_type, pay_date, pay_sum,
                       SUM(pay_sum) over(partition by pay_type ORDER BY pay_date ROWS UNBOUNDED PRECEDING) as sm,
                       sum(pay_sum) over(partition by pay_type) as max_sum_by_type
                  from payments) src)
 where global_max = max_sum_by_type;
--- 6:
select *
  from (select pay_type, to_char(pay_date, 'MM.YYYY') as mon, sum(pay_sum) as SM
          from payments
         group by pay_type, to_char(pay_date, 'MM.YYYY')
        union all
        select pay_type, null as mon, sum(pay_sum) as SM
          from payments
         group by pay_type
        union all
        select null as pay_type, null as mon, sum(pay_sum) as SM
          from payments        
        )
 order by pay_type asc nulls last, mon asc nulls last; --default

 



