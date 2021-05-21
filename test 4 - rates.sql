create table rates as
select 1 as curr_id, to_date('01.01.2010','dd.mm.yyyy') as date_rate, 30 as rate from dual union all
select 2 as curr_id, to_date('01.01.2010','dd.mm.yyyy') as date_rate, 40 as rate from dual union all
select 1 as curr_id, to_date('02.01.2010','dd.mm.yyyy') as date_rate, 32 as rate from dual union all
select 1 as curr_id, to_date('05.01.2010','dd.mm.yyyy') as date_rate, 33 as rate from dual union all
select 2 as curr_id, to_date('10.01.2010','dd.mm.yyyy') as date_rate, 41 as rate from dual union all
select 2 as curr_id, to_date('15.01.2010','dd.mm.yyyy') as date_rate, 42 as rate from dual
;
--- 4:
select rate
  from rates
 where date_rate =
       (select max(date_rate) as curr_date
          from rates
         where 
           --curr_id = 1
           --and date_rate <= to_date('03.01.2010', 'dd.mm.yyyy')
             curr_id = 2
             and date_rate <= to_date('10.01.2010', 'dd.mm.yyyy')           
           );
