
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[zhrs_v_saleTotal_2016] as
Select '2017' as 'Yr',b.iSum*c.iexchrate/(b.itaxrate/100+1) as 'Sales',
 a.iUnitCost as '单位成本',a.iPrice as 'Costs',
cInvCCode=case when left(a.cInvCCode,2) in ('CB','SG') then a.cInvCCode else case when a.cInvCCode='0507' then 'H' else '' end  end ,a.ccuscode,c.cexch_name as '币种',c.iexchrate as '汇率',b.itaxrate as '税率',a.dDate,a.cCode as '出库单号',a.iordercode as '销售订单号',a.iorderseq '销售订单行号',a.cDLCode as '发货单号',a.cInvCode as '存货编码',a.cInvName as '存货名称',
a.cInvStd as '规格',a.iQuantity as '数量',b.iTaxUnitPrice as'含税售价',b.iSum as '含税销售金额',
 case when (b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1)) <>0 then 
 case when isnull(b.itaxrate,1)=0 then (b.iTaxUnitPrice*c.iexchrate-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate) else ((b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))   end  else -1 end as '毛利率'
From KCSaleOutList a left join Sales_FHD_W b on a.iDLsID=b.iDLsID
 left join Sales_FHD_T c on b.DLID=c.DLID
WHERE    a.cVouchType = N'32' and  a.ddate between '2017-01-01' and '2017-12-31' --And  isnull(a.bIsSTQc,0)<> 1 and ISNULL(a.bPuFirst,0)<> 1 and ISNULL(a.bIAFirst,0)<> 1



Union all 


Select '2016' as 'Yr',b.iSum*c.iexchrate/(b.itaxrate/100+1) as 'Sales',
 a.iUnitCost as '单位成本',a.iPrice as 'Costs',
cInvCCode=case when left(a.cInvCCode,2) in ('CB','SG') then a.cInvCCode else case when a.cInvCCode='0507' then 'H' else '' end  end ,a.ccuscode,c.cexch_name as '币种',c.iexchrate as '汇率',b.itaxrate as '税率',a.dDate,a.cCode as '出库单号',a.iordercode as '销售订单号',a.iorderseq '销售订单行号',a.cDLCode as '发货单号',a.cInvCode as '存货编码',a.cInvName as '存货名称',
a.cInvStd as '规格',a.iQuantity as '数量',b.iTaxUnitPrice as'含税售价',b.iSum as '含税销售金额',
 case when (b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1)) <>0 then 
 case when isnull(b.itaxrate,1)=0 then (b.iTaxUnitPrice*c.iexchrate-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate) else ((b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))   end  else -1 end as '毛利率'
From UFDATA_559_2016..KCSaleOutList a left join UFDATA_559_2016..Sales_FHD_W b on a.iDLsID=b.iDLsID
 left join UFDATA_559_2016..Sales_FHD_T c on b.DLID=c.DLID
WHERE    a.cVouchType = N'32' and a.ddate between '2016-01-01' and '2016-12-31'
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_p_saleTotal_Year'))
drop proc zhrs_p_saleTotal_Year 

go
create proc zhrs_p_saleTotal_Year 
--@AccID varchar(10),
--@iYear varchar(10),
--@lastYear varchar(10)
as
Select '2017' as 'Yr',b.iSum*c.iexchrate/(b.itaxrate/100+1) as 'Sales',
 a.iUnitCost as '单位成本',a.iPrice as 'Costs',
cInvCCode=case when left(a.cInvCCode,2) in ('CB','SG') then a.cInvCCode else case when a.cInvCCode='0507' then 'H' else '' end  end ,a.ccuscode,c.cexch_name as '币种',c.iexchrate as '汇率',b.itaxrate as '税率',a.dDate,a.cCode as '出库单号',a.iordercode as '销售订单号',a.iorderseq '销售订单行号',a.cDLCode as '发货单号',a.cInvCode as '存货编码',a.cInvName as '存货名称',
a.cInvStd as '规格',a.iQuantity as '数量',b.iTaxUnitPrice as'含税售价',b.iSum as '含税销售金额',
 case when (b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1)) <>0 then 
 case when isnull(b.itaxrate,1)=0 then (b.iTaxUnitPrice*c.iexchrate-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate) else ((b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))   end  else -1 end as '毛利率'
From KCSaleOutList a left join Sales_FHD_W b on a.iDLsID=b.iDLsID
 left join Sales_FHD_T c on b.DLID=c.DLID
WHERE    a.cVouchType = N'32' and  a.ddate between '2017-01-01' and '2017-12-31' --And  isnull(a.bIsSTQc,0)<> 1 and ISNULL(a.bPuFirst,0)<> 1 and ISNULL(a.bIAFirst,0)<> 1



Union all 


Select '2016' as 'Yr',b.iSum*c.iexchrate/(b.itaxrate/100+1) as 'Sales',
 a.iUnitCost as '单位成本',a.iPrice as 'Costs',
cInvCCode=case when left(a.cInvCCode,2) in ('CB','SG') then a.cInvCCode else case when a.cInvCCode='0507' then 'H' else '' end  end ,a.ccuscode,c.cexch_name as '币种',c.iexchrate as '汇率',b.itaxrate as '税率',a.dDate,a.cCode as '出库单号',a.iordercode as '销售订单号',a.iorderseq '销售订单行号',a.cDLCode as '发货单号',a.cInvCode as '存货编码',a.cInvName as '存货名称',
a.cInvStd as '规格',a.iQuantity as '数量',b.iTaxUnitPrice as'含税售价',b.iSum as '含税销售金额',
 case when (b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1)) <>0 then 
 case when isnull(b.itaxrate,1)=0 then (b.iTaxUnitPrice*c.iexchrate-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate) else ((b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))   end  else -1 end as '毛利率'
From UFDATA_559_2016..KCSaleOutList a left join UFDATA_559_2016..Sales_FHD_W b on a.iDLsID=b.iDLsID
 left join UFDATA_559_2016..Sales_FHD_T c on b.DLID=c.DLID
WHERE    a.cVouchType = N'32' and a.ddate between '2016-01-01' and '2016-12-31'

insert into zhrs_t_saleTotal_Year  exec zhrs_p_saleTotal_Year

if exists(select 1 from  sysobjects (nolock) where upper(name)=upper('zhrs_t_saleTotal_Year'))
drop table zhrs_t_saleTotal_Year
go
create table zhrs_t_saleTotal_Year
(

)