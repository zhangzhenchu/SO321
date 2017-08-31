use ufdata_559_2017
if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customer'))
drop table zhrs_t_Customer

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1             --去年
select ptype='客户',District='',
cDCName='',cInvCCode='',c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),a.GrossMargin03,
GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customer from (
select m.ccuscode,sum(Sales2015) as 'Sales2015',
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
select ccuscode,
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode ) a  
left join  Customer b on a.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackage'))
drop table zhrs_t_Customerpackage

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1             --去年
select ptype='客户+套餐',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,
c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),
Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),
GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),
GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),
a.GrossMargin03,
GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),
GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customerpackage from (         --
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
case when Yr = @lastyear then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackagetype'))
drop table zhrs_t_Customerpackagetype

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1  
select ptype='客户+套餐+类型',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customerpackagetype  from (--
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackagetypeseries'))
drop table zhrs_t_Customerpackagetypeseries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1  
select ptype='客户+套餐+类型+系列',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Customerpackagetypeseries  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackagetypeseriesnumber'))
drop table zhrs_t_Customerpackagetypeseriesnumber

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1  
select ptype='客户+套餐+类型+系列+路数',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customerpackagetypeseriesnumber  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
 
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Package'))
drop table zhrs_t_Package

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Package from (--
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Combotype'))
drop table zhrs_t_Combotype

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐+类型',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
  into zhrs_t_Combotype  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_CombotypeSeries'))
drop table zhrs_t_CombotypeSeries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐+类型+系列',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_CombotypeSeries  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
 
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Packagetypenumberseries'))
drop table zhrs_t_Packagetypenumberseries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐+类型+系列+路数',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end) 
into zhrs_t_Packagetypenumberseries   from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Salesman'))
drop table zhrs_t_Salesman

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='业务员',District='',
cDCName='',cInvCCode='',a.cPersonName,ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Salesman from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
  
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_RegioncountryCitycustomer'))
drop table zhrs_t_RegioncountryCitycustomer

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区+国家/城市+客户',
District=(case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end) ,
cDCName=(case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end),
cInvCCode='',cPersonName='',ccusname=a.cCusName,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_RegioncountryCitycustomer from (select m.district,m.cDCCode,m.cCusName,sum(Sales2015) as 'Sales2015',
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_RegioncountryCitycustomerGroupBy'))
drop table zhrs_t_RegioncountryCitycustomerGroupBy              --------分组  增加一列（cCCName） 国内，欧洲，美洲，亚洲

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区+国家/城市+客户',
District=(case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end) ,
cDCName=(case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end),
cCCName= a.cCCName,
cInvCCode='',cPersonName='',ccusname=a.cCusName,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_RegioncountryCitycustomerGroupBy from (--into zhrs_t_RegioncountryCitycustomer
select m.district,m.cDCCode,m.cCusName,m.cCCName,sum(Sales2015) as 'Sales2015',
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
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,b.cCusName,s.cCCName,
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join districtclass c on b.cDCCode=c.cDCCode 
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'
) m  group by  m.district,m.cDCCode,m.cCusName,m.cCCName ) a  
left join districtclass d on a.cDCCode=d.cDCCode
left join districtclass e on a.district=e.cDCCode

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_RegioncountryCity'))
drop table zhrs_t_RegioncountryCity

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区+国家/城市',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode='',cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_RegioncountryCity  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Region'))
drop table zhrs_t_Region

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName='',
cInvCCode='',cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Region from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
 
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Countrytype'))
drop table zhrs_t_Countrytype

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='国家+类型',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Countrytype  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
 
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_CountrytypeSeries'))
drop table zhrs_t_CountrytypeSeries 

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='国家+类型+系列',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_CountrytypeSeries   from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Countrytypenumberseries'))
drop table zhrs_t_Countrytypenumberseries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='国家+类型+系列+路数',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode=(case when  isnull(a.cInvCCode,'')='' then '配件'  when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Countrytypenumberseries  from (--
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
 
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Summary'))
drop table zhrs_t_Summary

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='汇总',District='',
cDCName='',cInvCCode='',cPersonName='',ccusname='',
Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),
Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),
Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),
Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),
Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),
Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),
Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),
Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),
Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),
Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),
Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),
Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),
Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),
GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),
GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),
GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),
GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),
GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),
GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),
GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),
GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),
GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),
GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),
GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),
GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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




exec zhrs_p_saleTotal_year_report

--客户
select * from  zhrs_t_Customer

---客户+套餐
drop table zhrs_t_Customerpackage

select * from zhrs_t_Customerpackage
--客户+套餐+类型
drop table zhrs_t_Customerpackagetype
select * from  zhrs_t_Customerpackagetype  
---客户+套餐+类型+系列
drop table zhrs_t_Customerpackagetypeseries
select * from zhrs_t_Customerpackagetypeseries 
--客户+套餐+类型+系列+路数
drop table zhrs_t_Customerpackagetypeseriesnumber
select * from zhrs_t_Customerpackagetypeseriesnumber
--套餐
drop table zhrs_t_Package
select * from zhrs_t_Package
---套餐+类型
drop table zhrs_t_Combotype
 select * from zhrs_t_Combotype
-- 套餐+类型+系列
drop table zhrs_t_CombotypeSeries
select * from  zhrs_t_CombotypeSeries  

---套餐+类型+系列+路数
drop table zhrs_t_Packagetypenumberseries
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




if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customer'))
drop table zhrs_t_Customer

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1             --去年
select  ptype='客户',District='',s.cCCName,
cDCName='',cInvCCode='',c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),a.GrossMargin03,
GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customer from ( -- 
select m.ccuscode,sum(Sales2015) as 'Sales2015',
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
select ccuscode,
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',
case when Yr = @CurrentYr  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'
from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode ) a  
left join  Customer b on a.ccuscode=b.ccuscode 
left join Person c on b.ccuspperson=c.cPersonCode
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackage'))
drop table zhrs_t_Customerpackage

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1             --去年
select ptype='客户+套餐',District='',s.cCCName,
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,
c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),
Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),
GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),
GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),
a.GrossMargin03,
GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),
GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customerpackage from (         --
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
case when Yr = @lastyear then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackagetype'))
drop table zhrs_t_Customerpackagetype

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1  
select ptype='客户+套餐+类型',District='',s.cCCName,
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customerpackagetype  from (--
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackagetypeseries'))
drop table zhrs_t_Customerpackagetypeseries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1  
select ptype='客户+套餐+类型+系列',District='',s.cCCName,
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Customerpackagetypeseries  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Customerpackagetypeseriesnumber'))
drop table zhrs_t_Customerpackagetypeseriesnumber

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1  
select ptype='客户+套餐+类型+系列+路数',District='',s.cCCName,
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end) ,c.cPersonName,b.ccusname,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Customerpackagetypeseriesnumber  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Package'))
drop table zhrs_t_Package

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Package from (--
select  cInvCCode=left(m.cInvCCode,2),sum(Sales2015) as 'Sales2015',
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
from    zhrs_v_saleTotal_2016  ) m  group by left(m.cInvCCode,2) ) a 
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Combotype'))
drop table zhrs_t_Combotype

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐+类型',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
  into zhrs_t_Combotype  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_CombotypeSeries'))
drop table zhrs_t_CombotypeSeries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐+类型+系列',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_CombotypeSeries  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Packagetypenumberseries'))
drop table zhrs_t_Packagetypenumberseries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='套餐+类型+系列+路数',District='',
cDCName='',cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end) 
into zhrs_t_Packagetypenumberseries   from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Salesman'))
drop table zhrs_t_Salesman

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='业务员',District='',
cDCName='',cInvCCode='',a.cPersonName,ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Salesman from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_RegioncountryCitycustomer'))
drop table zhrs_t_RegioncountryCitycustomer

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区+国家/城市+客户',
District=(case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end) ,
cDCName=(case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end),
cInvCCode='',cPersonName='',ccusname=a.cCusName,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_RegioncountryCitycustomer from (select m.district,m.cDCCode,m.cCusName,sum(Sales2015) as 'Sales2015',
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_RegioncountryCitycustomerGroupBy'))
drop table zhrs_t_RegioncountryCitycustomerGroupBy              --------分组  增加一列（cCCName） 国内，欧洲，美洲，亚洲

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区+国家/城市+客户',
District=(case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end) ,
cDCName=(case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end),
cCCName= a.cCCName,
cInvCCode='',cPersonName='',ccusname=a.cCusName,Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_RegioncountryCitycustomerGroupBy from (--into zhrs_t_RegioncountryCitycustomer
select m.district,m.cDCCode,m.cCusName,m.cCCName,sum(Sales2015) as 'Sales2015',
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
select zhrs_v_saleTotal_2016.ccuscode,district=left(c.cDCCode,2), c.cDCCode,b.cCusName,s.cCCName,
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join districtclass c on b.cDCCode=c.cDCCode 
join 
(select cCCCode, cCCName from CustomerClass group by cCCName,cCCCode) s on s.cCCCode=b.cCCCode  
 where s.cCCName like '亚洲' or s.cCCName like '欧洲' or s.cCCName like '美洲'or s.cCCName like '国内'
) m  group by  m.district,m.cDCCode,m.cCusName,m.cCCName ) a  
left join districtclass d on a.cDCCode=d.cDCCode
left join districtclass e on a.district=e.cDCCode

go 

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_RegioncountryCity'))
drop table zhrs_t_RegioncountryCity

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区+国家/城市',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode='',cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_RegioncountryCity  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Region'))
drop table zhrs_t_Region

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='地区',
District=case when isnull(e.cDCName,'')='' then '其他地区' else e.cDCName end ,
cDCName='',
cInvCCode='',cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
 into zhrs_t_Region from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Countrytype'))
drop table zhrs_t_Countrytype

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1 
select ptype='国家+类型',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Countrytype  from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 
 
go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_CountrytypeSeries'))
drop table zhrs_t_CountrytypeSeries 

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='国家+类型+系列',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_CountrytypeSeries   from (
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode 

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Countrytypenumberseries'))
drop table zhrs_t_Countrytypenumberseries

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='国家+类型+系列+路数',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '其他' else d.cDCName end,
cInvCCode=(case when  isnull(a.cInvCCode,'')='' then '配件'  when a.cInvCCode='H' then '硬盘' else cls.cInvCName  end),cPersonName='',ccusname='',Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
into zhrs_t_Countrytypenumberseries  from (--
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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
left join InventoryClass cls on a.cInvCCode=cls.cInvCCode

go

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_Summary'))
drop table zhrs_t_Summary

go

declare @CurrentYr varchar(10)
declare @lastyear varchar(10)
set @CurrentYr=datepart(year,getdate())--今年
set @lastyear=@CurrentYr-1
select ptype='汇总',District='',
cDCName='',cInvCCode='',cPersonName='',ccusname='',
Sales2015=(case when isnull(a.Sales2015,'0')='0' then '0' else a.Sales2015 end),
Sales01=(case when isnull(a.Sales01,'0')='0' then '0' else a.Sales01 end),
Sales02=(case when isnull(a.Sales02,'0')='0' then '0' else a.Sales02 end),
Sales03=(case when isnull(a.Sales03,'0')='0' then '0' else a.Sales03 end),
Sales04=(case when isnull(a.Sales04,'0')='0' then '0' else a.Sales04 end),
Sales05=(case when isnull(a.Sales05,'0')='0' then '0' else a.Sales05 end),
Sales06=(case when isnull(a.Sales06,'0')='0' then '0' else a.Sales06 end),
Sales07=(case when isnull(a.Sales07,'0')='0' then '0' else a.Sales07 end),
Sales08=(case when isnull(a.Sales08,'0')='0' then '0' else a.Sales08 end),
Sales09=(case when isnull(a.Sales09,'0')='0' then '0' else a.Sales09 end),
Sales10=(case when isnull(a.Sales10,'0')='0' then '0' else a.Sales10 end),
Sales11=(case when isnull(a.Sales11,'0')='0' then '0' else a.Sales11 end),
Sales12=(case when isnull(a.Sales12,'0')='0' then '0' else a.Sales12 end),
GrossMargin2015=(case when isnull(a.GrossMargin2015,'0')='0' then '0' else a.GrossMargin2015 end),
GrossMargin01=(case when isnull(a.GrossMargin01,'0')='0' then '0' else a.GrossMargin01 end),
GrossMargin02=(case when isnull(a.GrossMargin02,'0')='0' then '0' else a.GrossMargin02 end),
GrossMargin03=(case when isnull(a.GrossMargin03,'0')='0' then '0' else a.GrossMargin03 end),
GrossMargin04=(case when isnull(a.GrossMargin04,'0')='0' then '0' else a.GrossMargin04 end),
GrossMargin05=(case when isnull(a.GrossMargin05,'0')='0' then '0' else a.GrossMargin05 end),
GrossMargin06=(case when isnull(a.GrossMargin06,'0')='0' then '0' else a.GrossMargin06 end),
GrossMargin07=(case when isnull(a.GrossMargin07,'0')='0' then '0' else a.GrossMargin07 end),
GrossMargin08=(case when isnull(a.GrossMargin08,'0')='0' then '0' else a.GrossMargin08 end),
GrossMargin09=(case when isnull(a.GrossMargin09,'0')='0' then '0' else a.GrossMargin09 end),
GrossMargin10=(case when isnull(a.GrossMargin10,'0')='0' then '0' else a.GrossMargin10 end),
GrossMargin11=(case when isnull(a.GrossMargin11,'0')='0' then '0' else a.GrossMargin11 end),
GrossMargin12=(case when isnull(a.GrossMargin12,'0')='0' then '0' else a.GrossMargin12 end)
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
case when Yr = @lastyear   then Sales else 0 end as 'Sales2015',
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
case when Yr = @lastyear  then Costs else 0 end as 'Costs2015',
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


