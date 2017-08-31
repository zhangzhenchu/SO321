if exists (select 1 from sysobjects where name='zhrs_v_Customer')
drop table zhrs_v_Customer
go
create view [zhrs_v_Customer]as
select ptype='客户',District='',cDCName='',cInvCCode='',c.cPersonName,b.ccusname,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12 
  into zhrs_v_Customer
from (select m.ccuscode,sum(Sales2015) as 'Sales2015',sum(Sales01) as 'Sales01',sum(Sales02) as 'Sales02',sum(Sales03) as 'Sales03',sum(Sales04) as 'Sales04',sum(Sales05) as 'Sales05',sum(Sales06) as 'Sales06',sum(Sales07) as 'Sales07',sum(Sales08) as 'Sales08',sum(Sales09) as 'Sales09',sum(Sales10) as 'Sales10',sum(Sales11) as 'Sales11',sum(Sales12) as 'Sales12',sum(Sales2015-Costs2015)as 'GrossMargin2015',sum(Sales01-Costs01) as 'GrossMargin01',sum(Sales02-Costs02) as 'GrossMargin02',sum(Sales03-Costs03) as 'GrossMargin03',sum(Sales04-Costs04) as 'GrossMargin04',sum(Sales05-Costs05) as 'GrossMargin05',sum(Sales06-Costs06) as 'GrossMargin06',sum(Sales07-Costs07) as 'GrossMargin07',sum(Sales08-Costs08) as 'GrossMargin08',sum(Sales09-Costs09) as 'GrossMargin09',sum(Sales10-Costs10) as 'GrossMargin10',sum(Sales11-Costs11) as 'GrossMargin11',sum(Sales12-Costs12) as 'GrossMargin12' from(select ccuscode,case when Yr = '2016' then Sales else 0 end as 'Sales2015',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',case when Yr = '2016'then Costs else 0 end as 'Costs2015',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode ) a 
 left join  Customer b on a.ccuscode=b.ccuscode left join Person c on b.ccuspperson=c.cPersonCode 

--客户
select * from  zhrs_v_Customer

go

declare @LastYr varchar(4),@CurrentYr varchar(4)

set @LastYr

select ptype='客户+套餐',District='',
cDCName='',a.cInvCCode,c.cPersonName,b.ccusname,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_Customerpackage from (
select m.ccuscode,cInvCCode=left(m.cInvCCode,2),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select ccuscode,cInvCCode,
case when Yr = @LastYr then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode,left(m.cInvCCode,2) ) a  
left join  Customer b on a.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode



go
select ptype='客户+套餐+类型',District='',
cDCName='',a.cInvCCode,c.cPersonName,b.ccusname,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
 into zhrs_v_Customerpackagetype  from (
select m.ccuscode,cInvCCode=left(m.cInvCCode,4),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select ccuscode,cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode,left(m.cInvCCode,4) ) a  
left join  Customer b on a.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode

--客户+套餐+类型
select * from  zhrs_v_Customerpackagetype  

go

select ptype='客户+套餐+类型+系列',District='',
cDCName='',a.cInvCCode,c.cPersonName,b.ccusname,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_Customerpackagetypeseries  from (
select m.ccuscode,cInvCCode=left(m.cInvCCode,6),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select ccuscode,cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode,left(m.cInvCCode,6) ) a  
left join  Customer b on a.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode

---客户+套餐+类型+系列
select * from zhrs_v_Customerpackagetypeseries 


go
select ptype='客户+套餐+类型+系列+路数',District='',
cDCName='',a.cInvCCode,c.cPersonName,b.ccusname,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
 into zhrs_v_Customerpackagetypeseriesnumber  from (
select m.ccuscode,m.cInvCCode,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select ccuscode,cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode,m.cInvCCode ) a  
left join  Customer b on a.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode
--客户+套餐+类型+系列+路数
select * from zhrs_v_Customerpackagetypeseriesnumber

go
if object_id('zhrs_v_Package')is not null
drop table zhrs_v_Package
go
create view zhrs_v_Package as

select ptype='套餐',District='',
cDCName='',a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_Package from (
select cInvCCode=left(m.cInvCCode,2),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  left(m.cInvCCode,2) ) a 
--套餐
select * from zhrs_v_Package
go
select ptype='套餐+类型',District='',
cDCName='',a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
  into zhrs_v_Combotype  from (
select cInvCCode=left(m.cInvCCode,4),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by left(m.cInvCCode,4) ) a  
---套餐+类型
 select * from zhrs_v_Combotype

go

select ptype='套餐+类型+系列',District='',
cDCName='',a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_CombotypeSeries  from (
select cInvCCode=left(m.cInvCCode,6),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  left(m.cInvCCode,6) ) a 

-- 套餐+类型+系列
select * from  zhrs_v_CombotypeSeries  

go

select ptype='套餐+类型+系列+路数',District='',
cDCName='',a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12 
into zhrs_v_Packagetypenumberseries   from (
select m.cInvCCode,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.cInvCCode ) a 
---套餐+类型+系列+路数
select * from zhrs_v_Packagetypenumberseries
go
select ptype='业务员',District='',
cDCName='',cInvCCode='',a.cPersonName,ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_Salesman from (
select m.cPersonName,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,c.cPersonName,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode ) m  group by  m.cPersonName ) a

--业务员
select * from zhrs_v_Salesman

go
select ptype='地区+国家/城市+客户',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode='',cPersonName='',ccusname=a.cCusName,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_RegioncountryCitycustomer  from (
select m.district,m.cDCCode,m.cCusName,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,b.cCusName,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join districtclass c on b.cDCCode=c.cDCCode ) m  group by  m.district,m.cDCCode,m.cCusName ) a  
left join districtclass d on a.cDCCode=d.cDCCode
left join districtclass e on a.district=e.cDCCode

--地区+国家/城市+客户
select * from zhrs_v_RegioncountryCitycustomer  

go
select ptype='地区+国家/城市',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode='',cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_RegioncountryCity  from (
select m.district,m.cDCCode,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join districtclass c on b.cDCCode=c.cDCCode ) m  group by  m.district,m.cDCCode ) a  
left join districtclass d on a.cDCCode=d.cDCCode
left join districtclass e on a.district=e.cDCCode
--地区+国家/城市
select * from zhrs_v_RegioncountryCity  

go

select ptype='地区',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName='',
cInvCCode='',cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
 into zhrs_v_Region from (
select m.district,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join districtclass c on b.cDCCode=c.cDCCode ) m  group by  m.district ) a  
left join districtclass e on a.district=e.cDCCode

--地区
select * from zhrs_v_Region

go
select ptype='国家+类型',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_Countrytype  from (
select m.cDCCode,cInvCCode=left(m.cInvCCode,4),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join districtclass c on b.cDCCode=c.cDCCode ) m  group by  m.cDCCode,left(m.cInvCCode,4) ) a  
left join districtclass d on a.cDCCode=d.cDCCode
--国家+类型
select * from zhrs_v_Countrytype  
go


select ptype='国家+类型+系列',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_CountrytypeSeries   from (
select m.cDCCode,cInvCCode=left(m.cInvCCode,6),sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join districtclass c on b.cDCCode=c.cDCCode ) m  group by  m.cDCCode,left(m.cInvCCode,6) ) a  
left join districtclass d on a.cDCCode=d.cDCCode

--国家+类型+系列
select * from zhrs_v_CountrytypeSeries  
go

select ptype='国家+类型+系列+路数',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
a.cInvCCode,cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_v_Countrytypenumberseries  from (
select m.cDCCode,m.cInvCCode,sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,cInvCCode,
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 left join  Customer b on zhrs_v_saleTotal_2016.ccuscode=b.ccuscode 
left join districtclass c on b.cDCCode=c.cDCCode ) m  group by  m.cDCCode,m.cInvCCode ) a  
left join districtclass d on a.cDCCode=d.cDCCode

--国家+类型+系列+路数
select * from zhrs_v_Countrytypenumberseries  

go

select ptype='汇总',District='',
cDCName='',cInvCCode='',cPersonName='',ccusname='',a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,
a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12
into zhrs_t_Summary from (
select sum(Sales2015) as 'Sales2015',
sum(Sales01) as 'Sales01',
sum(Sales02) as 'Sales02',
sum(Sales03) as 'Sales03',
sum(Sales04) as 'Sales04',
sum(Sales05) as 'Sales05',
sum(Sales06) as 'Sales06',
sum(Sales07) as 'Sales07',
sum(Sales08) as 'Sales08',
sum(Sales09) as 'Sales09',
sum(Sales10) as 'Sales10',
sum(Sales11) as 'Sales11',
sum(Sales12) as 'Sales12',
sum(Sales2015-Costs2015)as 'GrossMargin2015',
sum(Sales01-Costs01) as 'GrossMargin01',
sum(Sales02-Costs02) as 'GrossMargin02',
sum(Sales03-Costs03) as 'GrossMargin03',
sum(Sales04-Costs04) as 'GrossMargin04',
sum(Sales05-Costs05) as 'GrossMargin05',
sum(Sales06-Costs06) as 'GrossMargin06',
sum(Sales07-Costs07) as 'GrossMargin07',
sum(Sales08-Costs08) as 'GrossMargin08',
sum(Sales09-Costs09) as 'GrossMargin09',
sum(Sales10-Costs10) as 'GrossMargin10',
sum(Sales11-Costs11) as 'GrossMargin11',
sum(Sales12-Costs12) as 'GrossMargin12' from(
select 
case when Yr = '2016' then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = '2016'then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016 ) m  ) a
--汇总
select * from zhrs_v_Summary



--客户
select * from  zhrs_t_Customer
---客户+套餐
select * from zhrs_t_Customerpackage
--客户+套餐+类型
select * from  zhrs_t_Customerpackagetype  
---客户+套餐+类型+系列
select * from zhrs_t_Customerpackagetypeseries 
--客户+套餐+类型+系列+路数
select * from zhrs_t_Customerpackagetypeseriesnumber
--套餐
select * from zhrs_t_Package
---套餐+类型
 select * from zhrs_t_Combotype
-- 套餐+类型+系列
select * from  zhrs_t_CombotypeSeries  
---套餐+类型+系列+路数
select * from zhrs_t_Packagetypenumberseries
--业务员
select * from zhrs_t_Salesman
--地区+国家/城市+客户
select * from zhrs_t_RegioncountryCitycustomer  
--地区+国家/城市
select * from zhrs_t_RegioncountryCity  
--地区
select * from zhrs_t_Region
--国家+类型
select * from zhrs_t_Countrytype  
--国家+类型+系列
select * from zhrs_t_CountrytypeSeries 
--国家+类型+系列+路数
select * from zhrs_t_Countrytypenumberseries  
--汇总
select * from zhrs_t_Summary








