if exists (select 1 from sysobjects where name='zhrs_v_Customer')
drop table zhrs_v_Customer
go
create view [zhrs_v_Customer]as
select ptype='�ͻ�',District='',cDCName='',cInvCCode='',c.cPersonName,b.ccusname,a.Sales2015,a.Sales01,a.Sales02,a.Sales03,a.Sales04,a.Sales05,a.Sales06,a.Sales07,a.Sales08,a.Sales09,a.Sales10,a.Sales11,a.Sales12,a.GrossMargin2015,a.GrossMargin01,a.GrossMargin02,a.GrossMargin03,a.GrossMargin04,a.GrossMargin05,a.GrossMargin06,a.GrossMargin07,a.GrossMargin08,a.GrossMargin09,a.GrossMargin10,a.GrossMargin11,a.GrossMargin12 
  into zhrs_v_Customer
from (select m.ccuscode,sum(Sales2015) as 'Sales2015',sum(Sales01) as 'Sales01',sum(Sales02) as 'Sales02',sum(Sales03) as 'Sales03',sum(Sales04) as 'Sales04',sum(Sales05) as 'Sales05',sum(Sales06) as 'Sales06',sum(Sales07) as 'Sales07',sum(Sales08) as 'Sales08',sum(Sales09) as 'Sales09',sum(Sales10) as 'Sales10',sum(Sales11) as 'Sales11',sum(Sales12) as 'Sales12',sum(Sales2015-Costs2015)as 'GrossMargin2015',sum(Sales01-Costs01) as 'GrossMargin01',sum(Sales02-Costs02) as 'GrossMargin02',sum(Sales03-Costs03) as 'GrossMargin03',sum(Sales04-Costs04) as 'GrossMargin04',sum(Sales05-Costs05) as 'GrossMargin05',sum(Sales06-Costs06) as 'GrossMargin06',sum(Sales07-Costs07) as 'GrossMargin07',sum(Sales08-Costs08) as 'GrossMargin08',sum(Sales09-Costs09) as 'GrossMargin09',sum(Sales10-Costs10) as 'GrossMargin10',sum(Sales11-Costs11) as 'GrossMargin11',sum(Sales12-Costs12) as 'GrossMargin12' from(select ccuscode,case when Yr = '2016' then Sales else 0 end as 'Sales2015',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as 'Sales01',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as 'Sales02',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as 'Sales03',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as 'Sales04',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as 'Sales05',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as 'Sales06',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as 'Sales07',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as 'Sales08',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as 'Sales09',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as 'Sales10',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as 'Sales11',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as 'Sales12',case when Yr = '2016'then Costs else 0 end as 'Costs2015',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',case when Yr = @CurrentYr+''  and left(convert(varchar,dDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'from    zhrs_v_saleTotal_2016  ) m  group by  m.ccuscode ) a 
 left join  Customer b on a.ccuscode=b.ccuscode left join Person c on b.ccuspperson=c.cPersonCode 

--�ͻ�
select * from  zhrs_v_Customer

go

declare @LastYr varchar(4),@CurrentYr varchar(4)

set @LastYr

select ptype='�ͻ�+�ײ�',District='',
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
select ptype='�ͻ�+�ײ�+����',District='',
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

--�ͻ�+�ײ�+����
select * from  zhrs_v_Customerpackagetype  

go

select ptype='�ͻ�+�ײ�+����+ϵ��',District='',
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

---�ͻ�+�ײ�+����+ϵ��
select * from zhrs_v_Customerpackagetypeseries 


go
select ptype='�ͻ�+�ײ�+����+ϵ��+·��',District='',
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
--�ͻ�+�ײ�+����+ϵ��+·��
select * from zhrs_v_Customerpackagetypeseriesnumber

go
if object_id('zhrs_v_Package')is not null
drop table zhrs_v_Package
go
create view zhrs_v_Package as

select ptype='�ײ�',District='',
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
--�ײ�
select * from zhrs_v_Package
go
select ptype='�ײ�+����',District='',
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
---�ײ�+����
 select * from zhrs_v_Combotype

go

select ptype='�ײ�+����+ϵ��',District='',
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

-- �ײ�+����+ϵ��
select * from  zhrs_v_CombotypeSeries  

go

select ptype='�ײ�+����+ϵ��+·��',District='',
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
---�ײ�+����+ϵ��+·��
select * from zhrs_v_Packagetypenumberseries
go
select ptype='ҵ��Ա',District='',
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

--ҵ��Ա
select * from zhrs_v_Salesman

go
select ptype='����+����/����+�ͻ�',
District=case when isnull(e.cDCName,'')='' then '��������' else e.cDCName end ,
cDCName=case when isnull(d.cDCName,'')='' then '����' else d.cDCName end,
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

--����+����/����+�ͻ�
select * from zhrs_v_RegioncountryCitycustomer  

go
select ptype='����+����/����',
District=case when isnull(e.cDCName,'')='' then '��������' else e.cDCName end ,
cDCName=case when isnull(d.cDCName,'')='' then '����' else d.cDCName end,
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
--����+����/����
select * from zhrs_v_RegioncountryCity  

go

select ptype='����',
District=case when isnull(e.cDCName,'')='' then '��������' else e.cDCName end ,
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

--����
select * from zhrs_v_Region

go
select ptype='����+����',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '����' else d.cDCName end,
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
--����+����
select * from zhrs_v_Countrytype  
go


select ptype='����+����+ϵ��',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '����' else d.cDCName end,
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

--����+����+ϵ��
select * from zhrs_v_CountrytypeSeries  
go

select ptype='����+����+ϵ��+·��',
District='' ,
cDCName=case when isnull(d.cDCName,'')='' then '����' else d.cDCName end,
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

--����+����+ϵ��+·��
select * from zhrs_v_Countrytypenumberseries  

go

select ptype='����',District='',
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
--����
select * from zhrs_v_Summary



--�ͻ�
select * from  zhrs_t_Customer
---�ͻ�+�ײ�
select * from zhrs_t_Customerpackage
--�ͻ�+�ײ�+����
select * from  zhrs_t_Customerpackagetype  
---�ͻ�+�ײ�+����+ϵ��
select * from zhrs_t_Customerpackagetypeseries 
--�ͻ�+�ײ�+����+ϵ��+·��
select * from zhrs_t_Customerpackagetypeseriesnumber
--�ײ�
select * from zhrs_t_Package
---�ײ�+����
 select * from zhrs_t_Combotype
-- �ײ�+����+ϵ��
select * from  zhrs_t_CombotypeSeries  
---�ײ�+����+ϵ��+·��
select * from zhrs_t_Packagetypenumberseries
--ҵ��Ա
select * from zhrs_t_Salesman
--����+����/����+�ͻ�
select * from zhrs_t_RegioncountryCitycustomer  
--����+����/����
select * from zhrs_t_RegioncountryCity  
--����
select * from zhrs_t_Region
--����+����
select * from zhrs_t_Countrytype  
--����+����+ϵ��
select * from zhrs_t_CountrytypeSeries 
--����+����+ϵ��+·��
select * from zhrs_t_Countrytypenumberseries  
--����
select * from zhrs_t_Summary








