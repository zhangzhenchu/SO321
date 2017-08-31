select* from Customer where cCCCode like '%N3%'
select * from CustomerClass
select * from CustomerClass ccl left join Customer c on  c.cCCCode in(select cCCCode from CustomerClass group by cCCCode)

select cCCCode from Customer group by cCCCode



select * from Customer c join (select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=c.cCCCode 

where s.cCCName like '%亚洲%' or s.cCCName like '%欧洲%' or s.cCCName like '%美洲%'or s.cCCName like '国内'

select * from zhrs_t_RegioncountryCitycustomerGroupBy