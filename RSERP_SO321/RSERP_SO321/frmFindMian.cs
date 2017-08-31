using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using UTLoginEx;  //固定格式
using RSERP_SO321.BLL;
using RSERP_SO321.Models;
using System.Data.OleDb;

namespace RSERP_SO321
{
    public partial class frmFindMian : Form
    {
        private int FormWidth = 0, FormHeight = 0, dataGridView1Width = 0, dataGridView1Height = 0;//固定格式
        private UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        private int AuthID = 48; //权限ID ,不能为零。这里的零，只是模板 //固定格式
        private string frmText = "销售统计分析表";
        public static List<Report> lst = new List<Report>();
        /// <summary>
        /// //类型，拆套装，套装
        /// </summary>
        public string salePSC = "";
        List<Report> Relst = new List<Report>();
        RSERP_SO321.BindingCollection<Report> re = new RSERP_SO321.BindingCollection<Report>(lst);
      


        public frmFindMian(string[] args)
        {
            try
            {
                InitializeComponent();


                //iLoginEx.AccID()  005/559
                //iLoginEx.iYear ()  2017
                iLoginEx.Initialize(args, AuthID);//必须先初始化LoginEx  //固定格式

                SLbAccID.Text = iLoginEx.AccID(); //固定格式
                SLbAccName.Text = iLoginEx.AccName();//固定格式
                SLbServer.Text = iLoginEx.DBServerHost();//固定格式
                SLbYear.Text = iLoginEx.iYear();//固定格式
                SLbUser.Text = iLoginEx.UserId() + "[" + iLoginEx.UserName() + "]";//固定格式

            }
            catch (Exception ex)
            {
                frmMessege frmmsg = new frmMessege(ex.ToString(), "Form1()");
                frmmsg.ShowDialog(this);
                    
            }


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            FormWidth = this.Width; //固定格式
            FormHeight = this.Height;//固定格式
            dataGridView1Width = dgvDataInfo.Width;//固定格式
            dataGridView1Height = dgvDataInfo.Height;//固定格式

            txtfind.Text = iLoginEx.ReadUserProfileValue("SO321", "txtfind");
            cbocombination.Text = iLoginEx.ReadUserProfileValue("SO321", "cbocombination");
            cboDistrict.Text = iLoginEx.ReadUserProfileValue("SO321", "cboDistrict");
            if (iLoginEx.UserName()=="张振初")
            {
                btnCosts.Visible = true;
            }
           // btnsalePSC.Text = iLoginEx.ReadUserProfileValue("SO321", "btnsalePSC");
            NewMethod();
            try
            {
               // lst = ReportService.GetRegionInfoAll(iLoginEx);
               

                OleDbConnection con = new OleDbConnection (iLoginEx.ConnString());
                con.Open();
                string selectSQL = "";
                //if exists (select 1 from sysobjects (nolock) where upper(name)=upper(zhrs_v_saleTotal_2016))
                int n = 0;
                selectSQL = " if object_id('zhrs_v_saleTotal_2016') is not null \r\n";
                selectSQL += " drop view zhrs_v_saleTotal_2016  \r\n";
                OleDbCommand com = new OleDbCommand(selectSQL, con);
                n = com.ExecuteNonQuery();
                selectSQL = "create view zhrs_v_saleTotal_2016 as   \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Select '" + iLoginEx.iYear() + "' as 'Yr',b.iSum*c.iexchrate/(b.itaxrate/100+1) as 'Sales',  \r\n";
                selectSQL += "  a.iUnitCost as '单位成本',a.iPrice as 'Costs',  \r\n";
                selectSQL += " cInvCCode=case when left(a.cInvCCode,2) in ('CB','SG') then a.cInvCCode else case when a.cInvCCode='0507' then 'H' else '' end  end ,a.ccuscode,c.cexch_name as '币种',c.iexchrate as '汇率',b.itaxrate as '税率',a.dDate,a.cCode as '出库单号',a.iordercode as '销售订单号',a.iorderseq '销售订单行号',a.cDLCode as '发货单号',a.cInvCode as '存货编码',a.cInvName as '存货名称',  \r\n";
                selectSQL += " a.cInvStd as '规格',a.iQuantity as '数量',b.iTaxUnitPrice as'含税售价',b.iSum as '含税销售金额',  \r\n";
                selectSQL += "  case when (b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1)) <>0 then   \r\n";
                selectSQL += "  case when isnull(b.itaxrate,1)=0 then (b.iTaxUnitPrice*c.iexchrate-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate) else ((b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))   end  else -1 end as '毛利率'  \r\n";
                selectSQL += " From KCSaleOutList a left join Sales_FHD_W b on a.iDLsID=b.iDLsID  \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID  \r\n";
                selectSQL += " WHERE    a.cVouchType = N'32' and  a.ddate between '" + Convert.ToInt32(iLoginEx.iYear()).ToString() + "-01-01' and '" + Convert.ToInt32(iLoginEx.iYear()).ToString() + "-12-31' --And  isnull(a.bIsSTQc,0)<> 1 and ISNULL(a.bPuFirst,0)<> 1 and ISNULL(a.bIAFirst,0)<> 1  \r\n";
                selectSQL += "   \r\n";
                selectSQL += "   \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Union all   \r\n";
                selectSQL += "   \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Select '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',b.iSum*c.iexchrate/(b.itaxrate/100+1) as 'Sales',  \r\n";
                selectSQL += "  a.iUnitCost as '单位成本',a.iPrice as 'Costs',  \r\n";
                selectSQL += " cInvCCode=case when left(a.cInvCCode,2) in ('CB','SG') then a.cInvCCode else case when a.cInvCCode='0507' then 'H' else '' end  end ,a.ccuscode,c.cexch_name as '币种',c.iexchrate as '汇率',b.itaxrate as '税率',a.dDate,a.cCode as '出库单号',a.iordercode as '销售订单号',a.iorderseq '销售订单行号',a.cDLCode as '发货单号',a.cInvCode as '存货编码',a.cInvName as '存货名称',  \r\n";
                selectSQL += " a.cInvStd as '规格',a.iQuantity as '数量',b.iTaxUnitPrice as'含税售价',b.iSum as '含税销售金额',  \r\n";
                selectSQL += "  case when (b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1)) <>0 then   \r\n";
                selectSQL += "  case when isnull(b.itaxrate,1)=0 then (b.iTaxUnitPrice*c.iexchrate-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate) else ((b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))-a.iUnitCost)/(b.iTaxUnitPrice*c.iexchrate/(isnull(b.itaxrate,1)/100+1))   end  else -1 end as '毛利率'  \r\n";
                selectSQL += " From UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..KCSaleOutList a left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on a.iDLsID=b.iDLsID  \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID  \r\n";
                selectSQL += " WHERE    a.cVouchType = N'32' and a.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31'  \r\n";
                selectSQL += "   \r\n";
                com = new OleDbCommand(selectSQL, con);
                com.ExecuteNonQuery();
                selectSQL = "if object_id('zhrs_v_CB_SG_zzc') is not null  \r\n";
                selectSQL += " drop view zhrs_v_CB_SG_zzc  \r\n";
                com = new OleDbCommand(selectSQL, con);
                com.ExecuteNonQuery();
                selectSQL = "create view zhrs_v_CB_SG_zzc as  \r\n";
                #region MyRegion
                //selectSQL += " select 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',a.iSum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,  \r\n";
                //selectSQL += " a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode   \r\n";
                //selectSQL += " from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,  \r\n";
                //selectSQL += " b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h   \r\n";
                //selectSQL += " left join kcsaleoutb k on h.id=k.id   \r\n";
                //selectSQL += " left join Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                //selectSQL += " left join Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                //selectSQL += " where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a where   \r\n";
                //selectSQL += "  not exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zt where a.Csocode= zt.Csocode and a.Cinvcode=zt.Cinvcodes and a.isosid=zt.isosid )   \r\n";
                //selectSQL += "   \r\n";
                //selectSQL += " union all  \r\n";
                //selectSQL += "   \r\n";
                //selectSQL += " select 0 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',a.iSum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,  \r\n";
                //selectSQL += " a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode   \r\n";
                //selectSQL += " from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,  \r\n";
                //selectSQL += " b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h   \r\n";
                //selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id   \r\n";
                //selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                //selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                //selectSQL += " where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'CB%')a where   \r\n";
                //selectSQL += "  not exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zt where a.Csocode= zt.Csocode and a.Cinvcode=zt.Cinvcodes and a.isosid=zt.isosid )  \r\n";
                //selectSQL += "   \r\n";
                //selectSQL += " union all  \r\n";
                //selectSQL += "   \r\n";
                //selectSQL += " select 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr', f.aiquantity*zt.BaseQtyND*zt.SiQuotedPrice*f.aiexchrate/(f.aitaxrate/100+1) as 'sales',  \r\n";
                //selectSQL += " f.aiquantity*zt.BaseQtyND*(zt.SiQuotedPrice*(1.00-f.aitaxrate/100))*f.aiexchrate as 'Costs',f.aiquantity*zt.BaseQtyND as 'Number',  \r\n";
                //selectSQL += " f.aCsocode,zt.Cinvcode as 'ztCinvcode',  \r\n";
                //selectSQL += " cInvCCode=case when left(zt.cInvCCode,2) in ('SG') then zt.cInvCCode else case when zt.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                //selectSQL += " zt.CinvName as 'ztCinvName',zt.Cinvstd as 'ztCinvstd',f.addate,f.ccuscode   \r\n";
                //selectSQL += " from(select a.Csocode as 'aCsocode',a.Cinvcode as 'aCinvcode',a.iorderrowno as 'aiRowNo',a.iPrice,a.iquantity as 'aiquantity',  \r\n";
                //selectSQL += " a.itaxrate as 'aitaxrate',a.iSum as 'aiSum',a.ddate as 'addate', a.iexchrate as 'aiexchrate',a.ccuscode,a.isosid   \r\n";
                //selectSQL += " from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,  \r\n";
                //selectSQL += " b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h   \r\n";
                //selectSQL += " left join kcsaleoutb k on h.id=k.id   \r\n";
                //selectSQL += " left join Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                //selectSQL += " left join Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                //selectSQL += " where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a where   \r\n";
                //selectSQL += " exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zs where a.Csocode= zs.Csocode and a.Cinvcode=zs.Cinvcodes and a.isosid=zs.isosid))f   \r\n";
                //selectSQL += " left join zhrs_t_zzcSO_SOAddSeriesInfo zt on f.aCsocode= zt.Csocode and f.aCinvcode=zt.Cinvcodes and f.isosid=zt.isosid  \r\n";
                //selectSQL += "   \r\n";
                //selectSQL += " union all  \r\n";
                //selectSQL += "   \r\n";
                //selectSQL += " select 0 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr', f.aiquantity*zt.BaseQtyND*zt.SiQuotedPrice*f.aiexchrate/(f.aitaxrate/100+1) as 'sales',  \r\n";
                //selectSQL += " f.aiquantity*zt.BaseQtyND*(zt.SiQuotedPrice*(1.00-f.aitaxrate/100))*f.aiexchrate as 'Costs',f.aiquantity*zt.BaseQtyND as 'Number',  \r\n";
                //selectSQL += " f.aCsocode,zt.Cinvcode as 'ztCinvcode',  \r\n";
                //selectSQL += " cInvCCode=case when left(zt.cInvCCode,2) in ('SG') then zt.cInvCCode else case when zt.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                //selectSQL += " zt.CinvName as 'ztCinvName',zt.Cinvstd as 'ztCinvstd',f.addate,f.ccuscode   \r\n";
                //selectSQL += " from(select a.Csocode as 'aCsocode',a.Cinvcode as 'aCinvcode',a.iorderrowno as 'aiRowNo',a.iPrice,a.iquantity as 'aiquantity',  \r\n";
                //selectSQL += " a.itaxrate as 'aitaxrate',a.iSum as 'aiSum',a.ddate as 'addate', a.iexchrate as 'aiexchrate',a.ccuscode,a.isosid  \r\n";
                //selectSQL += " from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,  \r\n";
                //selectSQL += " b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h   \r\n";
                //selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id   \r\n";
                //selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                //selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                //selectSQL += " where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'CB%')a where   \r\n";
                //selectSQL += " exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zs where a.Csocode= zs.Csocode and a.Cinvcode=zs.Cinvcodes and a.isosid=zs.isosid))f   \r\n";
                //selectSQL += " left join zhrs_t_zzcSO_SOAddSeriesInfo zt on f.aCsocode= zt.Csocode and f.aCinvcode=zt.Cinvcodes and f.isosid=zt.isosid  \r\n";
                //selectSQL += "   \r\n"; 
                #endregion
                selectSQL += "select zid,Yr,sales,Costs,Number,aCsocode,ztCinvcode,  \r\n";
                selectSQL += " cInvCCode=case when left(cInvCCode,2) in ('CB','SG') then cInvCCode else case when cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " ztCinvName,ztCinvstd,addate,ccuscode    \r\n";
                selectSQL += " from zhrs_t_SaleaCosts  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Union all  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " select 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',w.iSum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',  \r\n";
                selectSQL += " cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode   \r\n";
                selectSQL += " from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,  \r\n";
                selectSQL += " b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from kcsaleoutH h   \r\n";
                selectSQL += " left join kcsaleoutb k on h.id=k.id   \r\n";
                selectSQL += " left join Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += " left join Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                selectSQL += " where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'SG%')w  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Union all  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " select 0 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',w.iSum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',   \r\n";
                selectSQL += " cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode   \r\n";
                selectSQL += " from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,  \r\n";
                selectSQL += " b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                selectSQL += " where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'SG%')w  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Union all  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " select 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',w.iSum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',   \r\n";
                selectSQL += " cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode   \r\n";
                selectSQL += " from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,  \r\n";
                selectSQL += " b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from kcsaleoutH h   \r\n";
                selectSQL += " left join kcsaleoutb k on h.id=k.id   \r\n";
                selectSQL += " left join Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += " left join Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                selectSQL += " where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like '0507')w  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " Union all  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " select 0 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',w.iSum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',   \r\n";
                selectSQL += " cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode   \r\n";
                selectSQL += " from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,  \r\n";
                selectSQL += " b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                selectSQL += " where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like '0507')w  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " union all  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " select 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',w.iSum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',   \r\n";
                selectSQL += " cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode   \r\n";
                selectSQL += " from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,  \r\n";
                selectSQL += " b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from kcsaleoutH h   \r\n";
                selectSQL += " left join kcsaleoutb k on h.id=k.id   \r\n";
                selectSQL += " left join Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += " left join Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                selectSQL += " where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode not like('CB%') and k.cInvCCode not like('SG%')and k.cInvCCode not like('0507') )w   \r\n";
                selectSQL += "   \r\n";
                selectSQL += " union all  \r\n";
                selectSQL += "   \r\n";
                selectSQL += " select 0 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',w.iSum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',   \r\n";
                selectSQL += " cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,  \r\n";
                selectSQL += " w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode   \r\n";
                selectSQL += " from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,  \r\n";
                selectSQL += " b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID    \r\n";
                selectSQL += " where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode not like('CB%') and k.cInvCCode not like('SG%')and k.cInvCCode not like('0507') )w   \r\n";
                selectSQL += "   \r\n";
                selectSQL += "union all  \r\n";  //累计开票金额
                selectSQL += "   \r\n";
                selectSQL += "  select 1 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',a.isettlenum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,    \r\n";
                selectSQL += "  a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,b.isettlenum,    \r\n";
                selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h     \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a where     \r\n";
                selectSQL += "   not exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zt where a.Csocode= zt.Csocode and a.Cinvcode=zt.Cinvcodes and a.isosid=zt.isosid )     \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',a.isettlenum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,    \r\n";
                selectSQL += "  a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,b.isettlenum,    \r\n";
                selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'CB%')a where     \r\n";
                selectSQL += "   not exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zt where a.Csocode= zt.Csocode and a.Cinvcode=zt.Cinvcodes and a.isosid=zt.isosid )    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + iLoginEx.iYear() + "' as 'Yr', f.aiquantity*zt.BaseQtyND*zt.SiQuotedPrice*f.aiexchrate/(f.aitaxrate/100+1) as 'sales',    \r\n";
                selectSQL += "  f.aiquantity*zt.BaseQtyND*(zt.SiQuotedPrice*(1.00-f.aitaxrate/100))*f.aiexchrate as 'Costs',f.aiquantity*zt.BaseQtyND as 'Number',    \r\n";
                selectSQL += "  f.aCsocode,zt.Cinvcode as 'ztCinvcode',    \r\n";
                selectSQL += "  cInvCCode=case when left(zt.cInvCCode,2) in ('SG') then zt.cInvCCode else case when zt.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  zt.CinvName as 'ztCinvName',zt.Cinvstd as 'ztCinvstd',f.addate,f.ccuscode     \r\n";
                selectSQL += "  from(select a.Csocode as 'aCsocode',a.Cinvcode as 'aCinvcode',a.iorderrowno as 'aiRowNo',a.iPrice,a.iquantity as 'aiquantity',    \r\n";
                selectSQL += "  a.itaxrate as 'aitaxrate',a.iSum as 'aiSum',a.ddate as 'addate', a.iexchrate as 'aiexchrate',a.ccuscode,a.isosid     \r\n";
                selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,    \r\n";
                selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h     \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a where     \r\n";
                selectSQL += "  exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zs where a.Csocode= zs.Csocode and a.Cinvcode=zs.Cinvcodes and a.isosid=zs.isosid))f     \r\n";
                selectSQL += "  left join zhrs_t_zzcSO_SOAddSeriesInfo zt on f.aCsocode= zt.Csocode and f.aCinvcode=zt.Cinvcodes and f.isosid=zt.isosid    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr', f.aiquantity*zt.BaseQtyND*zt.SiQuotedPrice*f.aiexchrate/(f.aitaxrate/100+1) as 'sales',    \r\n";
                selectSQL += "  f.aiquantity*zt.BaseQtyND*(zt.SiQuotedPrice*(1.00-f.aitaxrate/100))*f.aiexchrate as 'Costs',f.aiquantity*zt.BaseQtyND as 'Number',    \r\n";
                selectSQL += "  f.aCsocode,zt.Cinvcode as 'ztCinvcode',    \r\n";
                selectSQL += "  cInvCCode=case when left(zt.cInvCCode,2) in ('SG') then zt.cInvCCode else case when zt.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  zt.CinvName as 'ztCinvName',zt.Cinvstd as 'ztCinvstd',f.addate,f.ccuscode     \r\n";
                selectSQL += "  from(select a.Csocode as 'aCsocode',a.Cinvcode as 'aCinvcode',a.iorderrowno as 'aiRowNo',a.iPrice,a.iquantity as 'aiquantity',    \r\n";
                selectSQL += "  a.itaxrate as 'aitaxrate',a.iSum as 'aiSum',a.ddate as 'addate', a.iexchrate as 'aiexchrate',a.ccuscode,a.isosid    \r\n";
                selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,    \r\n";
                selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'CB%')a where     \r\n";
                selectSQL += "  exists (select * from zhrs_t_zzcSO_SOAddSeriesInfo zs where a.Csocode= zs.Csocode and a.Cinvcode=zs.Cinvcodes and a.isosid=zs.isosid))f     \r\n";
                selectSQL += "  left join zhrs_t_zzcSO_SOAddSeriesInfo zt on f.aCsocode= zt.Csocode and f.aCinvcode=zt.Cinvcodes and f.isosid=zt.isosid    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  Union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',w.isettlenum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',    \r\n";
                selectSQL += "  cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,b.isettlenum,    \r\n";
                selectSQL += "  b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from kcsaleoutH h     \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'SG%')w    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  Union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',w.isettlenum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',     \r\n";
                selectSQL += "  cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,b.isettlenum,    \r\n";
                selectSQL += "  b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'SG%')w    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  Union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',w.isettlenum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',     \r\n";
                selectSQL += "  cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,b.isettlenum,    \r\n";
                selectSQL += "  b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from kcsaleoutH h     \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like '0507')w    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  Union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',w.isettlenum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',     \r\n";
                selectSQL += "  cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,b.isettlenum,    \r\n";
                selectSQL += "  b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like '0507')w    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',w.isettlenum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',     \r\n";
                selectSQL += "  cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,b.isettlenum,    \r\n";
                selectSQL += "  b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from kcsaleoutH h     \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode not like('CB%') and k.cInvCCode not like('SG%')and k.cInvCCode not like('0507') )w     \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  union all    \r\n";
                selectSQL += "      \r\n";
                selectSQL += "  select 1 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',w.isettlenum*w.iexchrate/(w.itaxrate/100+1) as 'sales',w.iPrice as 'Costs',w.iquantity as 'Number',w.Csocode as 'aCsocode',w.Cinvcode as 'ztCinvcode',     \r\n";
                selectSQL += "  cInvCCode=case when left(w.cInvCCode,2) in ('SG') then w.cInvCCode else case when w.cInvCCode='0507' then 'H' else '' end  end ,    \r\n";
                selectSQL += "  w.cInvName as 'ztCinvName',w.cInvStd as 'ztCinvstd',w.ddate as 'addate',w.ccuscode     \r\n";
                selectSQL += "  from (select b.Csocode ,b.Cinvcode,k.cInvCCode,h.ccuscode ,k.iPrice,b.isettlenum,    \r\n";
                selectSQL += "  b.iquantity,b.itaxrate ,h.ddate,c.iexchrate,b.iSum,k.cInvName,k.cInvStd from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
                selectSQL += "  left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID      \r\n";
                selectSQL += "  where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode not like('CB%') and k.cInvCCode not like('SG%')and k.cInvCCode not like('0507') )w     \r\n";
                selectSQL += "   \r\n";
                com = new OleDbCommand(selectSQL, con);
                com.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("异常：" + ex.Message);
            }
            finally { GC.Collect(); }
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            IniFile.Ini ini = new IniFile.Ini(System.Windows.Forms.Application.StartupPath.ToString() + "\\utconfig.ini");//固定格式
            ini.Writue("Window", "AutoAdaptive2", "");//固定格式
            if (ini.ReadValue("Window", "AutoAdaptive") != "N")//固定格式
            {
                dgvDataInfo.Width = dataGridView1Width + (this.Width - FormWidth);//固定格式
                dgvDataInfo.Height = dataGridView1Height + (this.Height - FormHeight);//固定格式
            }//固定格式
        } 
      

       
        #region 单击网格事件
        /// <summary>
        /// 单击网格事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvDataInfo_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //if (dgvDataInfo.SelectedRows.Count > 0)
            //{

            //    #region 去年毛利率
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin2015"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales2015"].Value) == 0.00)
            //    {
            //        lblYearGM.Text = "去年的毛利率   N/A";
            //    }
            //    else
            //    {
            //        lblYearGM.Text = "去年的毛利率   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin2015"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales2015"].Value) * 100);
            //    }
            //    #endregion

            //    #region 1月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin01"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales01"].Value) == 0.00)
            //    {
            //        lblGM01.Text = "1月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM01.Text = "1月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin01"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales01"].Value) * 100);
            //    }
            //    #endregion

            //    #region 2月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin02"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales02"].Value) == 0.00)
            //    {
            //        lblGM02.Text = "2月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM02.Text = "2月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin02"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales02"].Value) * 100);
            //    }
            //    #endregion

            //    #region 3月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin03"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales03"].Value) == 0.00)
            //    {
            //        lblGM03.Text = "3月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM03.Text = "3月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin03"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales03"].Value) * 100);
            //    }
            //    #endregion

            //    #region 4月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin04"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales04"].Value) == 0.00)
            //    {
            //        lblGM04.Text = "4月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM04.Text = "4月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin04"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales04"].Value) * 100);
            //    }
            //    #endregion

            //    #region 5月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin05"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales05"].Value) == 0.00)
            //    {
            //        lblGM05.Text = "5月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM05.Text = "5月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin05"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales05"].Value) * 100);
            //    }
            //    #endregion

            //    #region 6月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin06"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales06"].Value) == 0.00)
            //    {
            //        lblGM06.Text = "6月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM06.Text = "6月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin06"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales06"].Value) * 100);
            //    }
            //    #endregion

            //    #region 7月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin07"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales07"].Value) == 0.00)
            //    {
            //        lblGM07.Text = "7月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM07.Text = "7月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin07"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales07"].Value) * 100);
            //    }
            //    #endregion

            //    #region 8月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin08"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales08"].Value) == 0.00)
            //    {
            //        lblGM08.Text = "8月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM08.Text = "8月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin08"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales08"].Value) * 100);
            //    }
            //    #endregion

            //    #region 9月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin09"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales09"].Value) == 0.00)
            //    {
            //        lblGM09.Text = "9月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM09.Text = "9月:   " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin09"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales09"].Value) * 100);
            //    }
            //    #endregion

            //    #region 10月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin10"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales10"].Value) == 0.00)
            //    {
            //        lblGM10.Text = "10月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM10.Text = "10月:  " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin10"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales10"].Value) * 100);
            //    }
            //    #endregion

            //    #region 11月

            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin11"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales11"].Value) == 0.00)
            //    {
            //        lblGM11.Text = "11月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM11.Text = "11月:  " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin11"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales11"].Value) * 100);
            //    }
            //    #endregion

            //    #region 12月
            //    if (Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin12"].Value) == 0.00 || Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales12"].Value) == 0.00)
            //    {
            //        lblGM12.Text = "12月:   N/A";
            //    }
            //    else
            //    {
            //        lblGM12.Text = "12月:  " + string.Format("{0:F}", Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["GrossMargin12"].Value) / Convert.ToDouble(dgvDataInfo.CurrentRow.Cells["Sales12"].Value) * 100);
            //    }
            //    #endregion


            //}
        } 
        #endregion

        #region Excel单击
        private void toolToExcel_Click(object sender, EventArgs e)
        {


            if (cbocombination.SelectedIndex > 0)
            {
                string s = cbocombination.SelectedItem.ToString();
                try
                {
                    this.Text = frmText + "     正在导出，"+s+"，请稍候...";
                    iLoginEx.ExportExcel(s + DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "_").Replace(".", "_").Replace(":", "_").Replace("/", "_").Replace(" ", "_"), s, dgvDataInfo, 31);
                }
                catch (Exception ex)
                {

                    MessageBox.Show("异常:" + ex.Message);
                }
                finally
                {
                    this.Text = frmText;
                }
            }

            
        } 
        #endregion

        #region 单击退出
        /// <summary>
        /// 退出
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void toolClose_Click(object sender, EventArgs e)
        {
            this.Close();
        } 
        #endregion

        #region 销售额
        //
        /// <summary>
        /// 销售额
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSales_Click(object sender, EventArgs e)
        {
            dgvDataInfo.DataSource = re;
            for (int i = 1; i < 10; i++)
            {
                dgvDataInfo.Columns["GrossMargin0" + i].Visible = false;
                dgvDataInfo.Columns["colGM" + i].Visible = false;
                dgvDataInfo.Columns["Sales0" + i].Visible = true;
            }
            dgvDataInfo.Columns["GrossMargin10"].Visible = false;
            dgvDataInfo.Columns["GrossMargin11"].Visible = false;
            dgvDataInfo.Columns["GrossMargin12"].Visible = false;


            dgvDataInfo.Columns["colGM10"].Visible = false;
            dgvDataInfo.Columns["colGM11"].Visible = false;
            dgvDataInfo.Columns["colGM12"].Visible = false;

            dgvDataInfo.Columns["Sales10"].Visible = true;
            dgvDataInfo.Columns["Sales11"].Visible = true;
            dgvDataInfo.Columns["Sales12"].Visible = true;

        } 
        #endregion

        #region 毛利
        //
        /// <summary>
        /// 毛利
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnGMAll_Click(object sender, EventArgs e)
        {
            dgvDataInfo.DataSource = re;
            for (int i = 1; i < 10; i++)
            {
                dgvDataInfo.Columns["Sales0" + i].Visible = false;
                dgvDataInfo.Columns["colGM" + i].Visible = false;
                dgvDataInfo.Columns["GrossMargin0" + i].Visible = true;

            }
            dgvDataInfo.Columns["Sales10"].Visible = false;
            dgvDataInfo.Columns["Sales11"].Visible = false;
            dgvDataInfo.Columns["Sales12"].Visible = false;


            dgvDataInfo.Columns["colGM10"].Visible = false;
            dgvDataInfo.Columns["colGM11"].Visible = false;
            dgvDataInfo.Columns["colGM12"].Visible = false;

            dgvDataInfo.Columns["GrossMargin10"].Visible = true;
            dgvDataInfo.Columns["GrossMargin11"].Visible = true;
            dgvDataInfo.Columns["GrossMargin12"].Visible = true;


        } 
        #endregion

        #region 毛利率
        //
        /// <summary>
        /// 毛利率
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnGM_Click(object sender, EventArgs e)
        {
            dgvDataInfo.DataSource = re;
            for (int i = 1; i < 10; i++)
            {
                dgvDataInfo.Columns["Sales0" + i].Visible = false;
                dgvDataInfo.Columns["GrossMargin0" + i].Visible = false;
                dgvDataInfo.Columns["colGM" + i].Visible = true;
            }
            dgvDataInfo.Columns["Sales10"].Visible = false;
            dgvDataInfo.Columns["Sales11"].Visible = false;
            dgvDataInfo.Columns["Sales12"].Visible = false;

            dgvDataInfo.Columns["GrossMargin10"].Visible = false;
            dgvDataInfo.Columns["GrossMargin11"].Visible = false;
            dgvDataInfo.Columns["GrossMargin12"].Visible = false;

            dgvDataInfo.Columns["colGM10"].Visible = true;
            dgvDataInfo.Columns["colGM11"].Visible = true;
            dgvDataInfo.Columns["colGM12"].Visible = true;

        } 
        #endregion

        #region 单击筛选各地区
        /// <summary>
        /// 单击筛选各地区
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDistrict_Click(object sender, EventArgs e)
        {

            iLoginEx.WriteUserProfileValue("SO321", "cboDistrict", cboDistrict.Text);
            switch (cbocombination.SelectedIndex)
            {
                case 11:
                   
                    switch (cboDistrict.SelectedIndex)
                    {
                        case 0:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '国内'", "zhrs_t_RegioncountryCitycustomerGroupBy");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '国内' and zid=1", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '国内' and zid=0", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 1:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '亚洲", "zhrs_t_RegioncountryCitycustomerGroupBy");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '亚洲' and zid=1", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '亚洲' and zid=0", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                   
                                    break;
                            }
                            break;
                        case 2:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '欧洲'", "zhrs_t_RegioncountryCitycustomerGroupBy");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '欧洲' and zid=1", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '欧洲' and zid=0", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 3:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '美洲'", "zhrs_t_RegioncountryCitycustomerGroupBy");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '美洲' and zid=1", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GroupByRCCCGroupbytype(iLoginEx, " where cCCName like '美洲' and zid=0", "zhrs_V_RegioncountryCitycustomerGroupBy_1");
                                    }
                                    
                                    break;
                            }
                            break;
                    }
                    break;
                case 1:
                    switch (cboDistrict.SelectedIndex)
                    {
                        case 0:
                            switch (salePSC)
                            {
                                case"套装":
                                    lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '国内'", "zhrs_t_Customer");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '国内' and zid=1 ", "zhrs_V_Customer_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '国内' and zid=0 ", "zhrs_V_Customer_1");
                                    }
                                   
                                    break;
                            }
                            break;
                        case 1:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '亚洲'", "zhrs_t_Customer");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=1 ", "zhrs_V_Customer_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=0 ", "zhrs_V_Customer_1");
                                    }
                                    break;
                            }
                            break;
                        case 2:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '欧洲'", "zhrs_t_Customer");
                                    break;
                                case "拆套装":
                                    
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=1 ", "zhrs_V_Customer_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=0 ", "zhrs_V_Customer_1");
                                    }
                                    break;
                            }
                            break;
                        case 3:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '美洲'", "zhrs_t_Customer");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '美洲' and zid=1 ", "zhrs_V_Customer_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCustomerInfoAll(iLoginEx, "where cCCName like '美洲' and zid=0 ", "zhrs_V_Customer_1");
                                    }
                                    
                                    break;
                            }
                            break;
                    }
                    break;
                case 2:
                    switch (cboDistrict.SelectedIndex)
                    {
                        case 0:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '国内'", "zhrs_t_Customerpackage");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '国内' and zid=1 ", "zhrs_V_Customerpackage_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '国内' and zid=0", "zhrs_V_Customerpackage_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 1:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '亚洲'", "zhrs_t_Customerpackage");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=1 ", "zhrs_V_Customerpackage_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=0 ", "zhrs_V_Customerpackage_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 2:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '欧洲'", "zhrs_t_Customerpackage");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=1", "zhrs_V_Customerpackage_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=0", "zhrs_V_Customerpackage_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 3:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '美洲'", "zhrs_t_Customerpackage");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '美洲' and zid=1", "zhrs_V_Customerpackage_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPInfoAll(iLoginEx, "where cCCName like '美洲' and zid=0", "zhrs_V_Customerpackage_1");
                                    }
                                   
                                    break;
                            }
                            break;
                    }
                    break;
                case 3:
                    switch (cboDistrict.SelectedIndex)
                    {
                        case 0:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '国内'", "zhrs_t_Customerpackagetype");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '国内' and zid=1", "zhrs_V_Customerpackagetype_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '国内' and zid=0", "zhrs_V_Customerpackagetype_1");
                                    }
                                   
                                    break;
                            }
                            break;
                        case 1:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '亚洲'", "zhrs_t_Customerpackagetype");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=1", "zhrs_V_Customerpackagetype_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=0", "zhrs_V_Customerpackagetype_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 2:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '欧洲'", "zhrs_t_Customerpackagetype");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=1", "zhrs_V_Customerpackagetype_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=0", "zhrs_V_Customerpackagetype_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 3:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '美洲'", "zhrs_t_Customerpackagetype");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '美洲' and zid=1", "zhrs_V_Customerpackagetype_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTInfoAll(iLoginEx, "where cCCName like '美洲' and zid=0", "zhrs_V_Customerpackagetype_1");
                                    }
                                    
                                    break;
                            }
                            break;
                    }
                    break;
                case 4:
                    switch (cboDistrict.SelectedIndex)
                    {
                        case 0:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '国内'", "zhrs_t_Customerpackagetypeseries");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '国内' and zid=1", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '国内' and zid=0", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                   
                                    break;
                            }
                            break;
                        case 1:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '亚洲'", "zhrs_t_Customerpackagetypeseries");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=1", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=0", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 2:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '欧洲'", "zhrs_t_Customerpackagetypeseries");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=1", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=0", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    break;
                            }
                            break;
                        case 3:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '美洲'", "zhrs_t_Customerpackagetypeseries");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '美洲' and zid=1", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCPTSInfoAll(iLoginEx, "where cCCName like '美洲' and zid=0", "zhrs_V_Customerpackagetypeseries_1");
                                    }
                                    break;
                            }
                            break;
                    }
                    break;
                case 5:
                    switch (cboDistrict.SelectedIndex)
                    {
                        case 0:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '国内'", "zhrs_t_Customerpackagetypeseriesnumber");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '国内' and zid=1", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '国内' and zid=0", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 1:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '亚洲'", "zhrs_t_Customerpackagetypeseriesnumber");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=1", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '亚洲' and zid=0", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 2:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '欧洲'", "zhrs_t_Customerpackagetypeseriesnumber");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=1", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '欧洲' and zid=0", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    
                                    break;
                            }
                            break;
                        case 3:
                            switch (salePSC)
                            {
                                case "套装":
                                    lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '美洲'", "zhrs_t_Customerpackagetypeseriesnumber");
                                    break;
                                case "拆套装":
                                    if (cbisum.Checked)
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '美洲' and zid=1", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    else
                                    {
                                        lst = ReportService.GetCTPSNInfoAll(iLoginEx, "where cCCName like '美洲' and zid=0", "zhrs_V_Customerpackagetypeseriesnumber_1");
                                    }
                                    
                                    break;
                            }
                            break;
                    }
                    break;
            }

         


            re = new RSERP_SO321.BindingCollection<Report>(lst);
            dgvDataInfo.DataSource = re;

        }

        #endregion


        #region 单击各类模糊查询
        /// <summary>
        /// 单击各类模糊查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnFind_Click(object sender, EventArgs e)
        {
            try
            {                
                iLoginEx.WriteUserProfileValue("SO321", "txtfind", txtfind.Text);
                Report r = new Report();
                if (txtfind.Text == "" || String.IsNullOrEmpty(txtfind.Text))
                {
                    MessageBox.Show("请输入要筛选的条件，如：城市名称/客户名称/业务员/成品分类");
                    return;
                }
                else
                {
                    r.ccusname = txtfind.Text;
                    r.cPersonName = txtfind.Text;
                    r.cInvCCode = txtfind.Text;
                    r.cDCName = txtfind.Text;
                    r.District = txtfind.Text;

                   

                    if (cbocombination.SelectedIndex == 11)
                    {
                        switch (salePSC)
                        {
                            case"套装":
                                lst = ReportService.GetSelectRCCCInfoAllConn(iLoginEx, r, "zhrs_t_RegioncountryCitycustomer");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectRCCCInfoAllConn(iLoginEx, r, "zhrs_V_RegioncountryCitycustomer_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectRCCCInfoAllConn(iLoginEx, r, "zhrs_V_RegioncountryCitycustomer_1 where zid=0");
                                }
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 12)
                    {
                       
                        switch (salePSC)
                        {
                            case"套装":
                                lst = ReportService.GetSelectRCCInfoAllConn(iLoginEx, r, "zhrs_t_RegioncountryCity");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectRCCInfoAllConn(iLoginEx, r, "zhrs_V_RegioncountryCity_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectRCCInfoAllConn(iLoginEx, r, "zhrs_V_RegioncountryCity_1 where zid=0");
                                }
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 13)
                    {
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetFindRegionInfoAllConn(iLoginEx, r, "zhrs_t_Region");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetFindRegionInfoAllConn(iLoginEx, r, "zhrs_V_Region_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetFindRegionInfoAllConn(iLoginEx, r, "zhrs_V_Region_1 where zid=0");
                                }
                               
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 14)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCTInfoAll(iLoginEx, r, "zhrs_t_Countrytype");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCTInfoAll(iLoginEx, r, "zhrs_V_Countrytype_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCTInfoAll(iLoginEx, r, "zhrs_V_Countrytype_1 where zid=0");
                                }
                                
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 15)
                    {
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCTSInfoAll(iLoginEx, r, "zhrs_t_CountrytypeSeries");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCTSInfoAll(iLoginEx, r, "zhrs_V_CountrytypeSeries_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCTSInfoAll(iLoginEx, r, "zhrs_V_CountrytypeSeries_1 where zid=0");
                                }
                                break;
                        }
                        
                    }
                    else if (cbocombination.SelectedIndex == 16)
                    {
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCTNSInfoAll(iLoginEx, r, "zhrs_t_Countrytypenumberseries");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCTNSInfoAll(iLoginEx, r, "zhrs_V_Countrytypenumberseries_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCTNSInfoAll(iLoginEx, r, "zhrs_V_Countrytypenumberseries_1 where zid=0");
                                }
                                
                                break;
                        }
                       
                    }
                    else if (cbocombination.SelectedIndex == 1)
                    {
                        
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCustomerInfoAll(iLoginEx, r, "zhrs_t_Customer");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCustomerInfoAll(iLoginEx, r, "zhrs_V_Customer_1 where zid=1 ");
                                }
                                else
                                {
                                  lst = ReportService.GetSelectCustomerInfoAll(iLoginEx, r, "zhrs_V_Customer_1 where zid=0 ");
                                }
                                
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 2)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCPInfoAll(iLoginEx, r, "zhrs_t_Customerpackage");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCPInfoAll(iLoginEx, r, "zhrs_V_Customerpackage_1 where zid=1 ");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCPInfoAll(iLoginEx, r, "zhrs_V_Customerpackage_1  where zid=0 ");
                                }
                                break;
                        }
                       
                    }
                    else if (cbocombination.SelectedIndex == 3)
                    {
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCPTInfoAll(iLoginEx, r, "zhrs_t_Customerpackagetype");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCPTInfoAll(iLoginEx, r, "zhrs_V_Customerpackagetype_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCPTInfoAll(iLoginEx, r, "zhrs_V_Customerpackagetype_1 where zid=0");
                                }
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 4)
                    {
                        
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCPTSInfoAll(iLoginEx, r, "zhrs_t_Customerpackagetypeseries");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCPTSInfoAll(iLoginEx, r, "zhrs_V_Customerpackagetypeseries_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCPTSInfoAll(iLoginEx, r, "zhrs_V_Customerpackagetypeseries_1 where zid=0");
                                }
                               
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 5)
                    {
                        
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectCTPSNInfoAll(iLoginEx, r, "zhrs_t_Customerpackagetypeseriesnumber");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectCTPSNInfoAll(iLoginEx, r, "zhrs_V_Customerpackagetypeseriesnumber_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectCTPSNInfoAll(iLoginEx, r, "zhrs_V_Customerpackagetypeseriesnumber_1 where zid=0");
                                }
                                break;
                        }
                       
                    }
                    else if (cbocombination.SelectedIndex == 6)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectPInfoAll(iLoginEx, r, "zhrs_t_Package");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectPInfoAll(iLoginEx, r, "zhrs_V_Package_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectPInfoAll(iLoginEx, r, "zhrs_V_Package_1 where zid=0");
                                }
                                break;
                        }

                    }
                    else if (cbocombination.SelectedIndex == 7)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectPTInfoAll(iLoginEx, r, "zhrs_t_Combotype");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                   lst = ReportService.GetSelectPTInfoAll(iLoginEx, r, "zhrs_V_Combotype_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectPTInfoAll(iLoginEx, r, "zhrs_V_Combotype_1 where zid=0");
                                }
                                
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 8)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectPTSInfoAll(iLoginEx, r, "zhrs_t_CombotypeSeries");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectPTSInfoAll(iLoginEx, r, "zhrs_V_CombotypeSeries_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectPTSInfoAll(iLoginEx, r, "zhrs_V_CombotypeSeries_1 where zid=0");
                                }
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 9)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectPTNSInfoAll(iLoginEx, r, "zhrs_t_Packagetypenumberseries");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectPTNSInfoAll(iLoginEx, r, "zhrs_V_Packagetypenumberseries_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectPTNSInfoAll(iLoginEx, r, "zhrs_V_Packagetypenumberseries_1 where zid=0");
                                }
                                break;
                        }
                    }
                    else if (cbocombination.SelectedIndex == 10)
                    {
                       
                        switch (salePSC)
                        {
                            case "套装":
                                lst = ReportService.GetSelectSalesmanInfoAll(iLoginEx, r, "zhrs_t_Salesman");
                                break;
                            case "拆套装":
                                if (cbisum.Checked)
                                {
                                    lst = ReportService.GetSelectSalesmanInfoAll(iLoginEx, r, "zhrs_V_Salesman_1 where zid=1");
                                }
                                else
                                {
                                    lst = ReportService.GetSelectSalesmanInfoAll(iLoginEx, r, "zhrs_V_Salesman_1 where zid=0");
                                }
                                break;
                        }
                    }

                }
                re = new RSERP_SO321.BindingCollection<Report>(lst);
                dgvDataInfo.DataSource = re;
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
        } 
        #endregion


        #region 单击查询各类条件
        /// <summary>
        /// 单击查询各类条件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSelect_Click(object sender, EventArgs e)
        {
            
            iLoginEx.WriteUserProfileValue("SO321", "cbocombination", cbocombination.Text);
            tsmiCsoDetail.Visible = false;
            try
            {
                btnsaleNum.Visible = false;//不可见销售数量
                this.Text = frmText + "     正在查询，请稍候...";

                if (cbocombination.SelectedIndex == 17)
                {
                    switch (salePSC)
                    {
                        case"套装":
                            lst = ReportService.GetSummaryInfoAll(iLoginEx, "zhrs_t_Summary");
                             gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetSummaryInfoAll(iLoginEx, "zhrs_V_Summary_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetSummaryInfoAll(iLoginEx, "zhrs_V_Summary_1 where zid=0");
                            }
                            
                            gbDistrict.Visible = false;
                            break;
                    }
                   
                }
                else if (cbocombination.SelectedIndex == 16)
                {
                    switch (salePSC)
                    {
                        case"套装":
                            lst = ReportService.GetCTNSInfoAll(iLoginEx, "zhrs_t_Countrytypenumberseries");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetCTNSInfoAll(iLoginEx, "zhrs_V_Countrytypenumberseries_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetCTNSInfoAll(iLoginEx, "zhrs_V_Countrytypenumberseries_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                   
                }
                else if (cbocombination.SelectedIndex == 15)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCTSInfoAll(iLoginEx, "zhrs_t_CountrytypeSeries");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            { 
                                lst = ReportService.GetCTSInfoAll(iLoginEx, "zhrs_V_CountrytypeSeries_1 where zid=1");
                            }
                            else
                            { 
                                lst = ReportService.GetCTSInfoAll(iLoginEx, "zhrs_V_CountrytypeSeries_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 14)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCTInfoAll(iLoginEx, "zhrs_t_Countrytype");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetCTInfoAll(iLoginEx, "zhrs_V_Countrytype_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetCTInfoAll(iLoginEx, "zhrs_V_Countrytype_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }

                else if (cbocombination.SelectedIndex == 13)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetRegionInfoAll(iLoginEx, "zhrs_t_Region");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetRegionInfoAll(iLoginEx, "zhrs_V_Region_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetRegionInfoAll(iLoginEx, "zhrs_V_Region_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                    

                }
                else if (cbocombination.SelectedIndex == 12)
                {
                    
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetRCCInfoAll(iLoginEx, "zhrs_t_RegioncountryCity");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetRCCInfoAll(iLoginEx, "zhrs_V_RegioncountryCity_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetRCCInfoAll(iLoginEx, "zhrs_V_RegioncountryCity_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }

                }
                else if (cbocombination.SelectedIndex == 11)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetRCCCInfoAll(iLoginEx, "zhrs_t_RegioncountryCitycustomer");
                            gbDistrict.Visible = true;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetRCCCInfoAll(iLoginEx, "zhrs_V_RegioncountryCitycustomer_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetRCCCInfoAll(iLoginEx, "zhrs_V_RegioncountryCitycustomer_1 where zid=0");
                            }
                            gbDistrict.Visible = true;
                            break;
                    }

                }
                else if (cbocombination.SelectedIndex == 10)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetSalesmanInfoAll(iLoginEx, "zhrs_t_Salesman");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            { 
                                lst = ReportService.GetSalesmanInfoAll(iLoginEx, "zhrs_V_Salesman_1 where zid=1");
                            }
                            else
                            {
                                tsmiCsoDetail.Visible = true;
                                lst = ReportService.GetSalesmanInfoAll(iLoginEx, "zhrs_V_Salesman_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 9)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetPTNSInfoAll(iLoginEx, "zhrs_t_Packagetypenumberseries");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetPTNSInfoAll(iLoginEx, "zhrs_V_Packagetypenumberseries_1 where zid=1");
                            }
                            else
                            {
                                btnsaleNum.Visible = true;
                                tsmiCsoDetail.Visible = true;
                                lst = ReportService.GetPTNSInfoAll(iLoginEx, "zhrs_V_Packagetypenumberseries_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 8)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetPTSInfoAll(iLoginEx, "zhrs_t_CombotypeSeries");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetPTSInfoAll(iLoginEx, "zhrs_V_CombotypeSeries_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetPTSInfoAll(iLoginEx, "zhrs_V_CombotypeSeries_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 7)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetPTInfoAll(iLoginEx, "zhrs_t_Combotype");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetPTInfoAll(iLoginEx, "zhrs_V_Combotype_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetPTInfoAll(iLoginEx, "zhrs_V_Combotype_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 6)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetPInfoAll(iLoginEx, "zhrs_t_Package");
                            gbDistrict.Visible = false;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetPInfoAll(iLoginEx, "zhrs_V_Package_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetPInfoAll(iLoginEx, "zhrs_V_Package_1 where zid=0");
                            }
                            gbDistrict.Visible = false;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 5)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCTPSNInfoAll(iLoginEx, "", "zhrs_t_Customerpackagetypeseriesnumber");
                            gbDistrict.Visible = true;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetCTPSNInfoAll(iLoginEx, "", "zhrs_V_Customerpackagetypeseriesnumber_1 where zid=1");
                            }
                            else
                            {
                                btnsaleNum.Visible = true;
                                lst = ReportService.GetCTPSNInfoAll(iLoginEx, "", "zhrs_V_Customerpackagetypeseriesnumber_1 where zid=0");
                            }
                            gbDistrict.Visible = true;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 4)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCPTSInfoAll(iLoginEx, "", "zhrs_t_Customerpackagetypeseries");
                            gbDistrict.Visible = true;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetCPTSInfoAll(iLoginEx, "", "zhrs_V_Customerpackagetypeseries_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetCPTSInfoAll(iLoginEx, "", "zhrs_V_Customerpackagetypeseries_1 where zid=0");
                            }
                            gbDistrict.Visible = true;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 3)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCPTInfoAll(iLoginEx, "", "zhrs_t_Customerpackagetype");
                            gbDistrict.Visible = true;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetCPTInfoAll(iLoginEx, "", "zhrs_V_Customerpackagetype_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetCPTInfoAll(iLoginEx, "", "zhrs_V_Customerpackagetype_1 where zid=0");
                            }
                            gbDistrict.Visible = true;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 2)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCPInfoAll(iLoginEx, "", "zhrs_t_Customerpackage");
                            gbDistrict.Visible = true;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                 lst = ReportService.GetCPInfoAll(iLoginEx, "", "zhrs_V_Customerpackage_1 where zid=1");
                            }
                            else
                            {
                                lst = ReportService.GetCPInfoAll(iLoginEx, "", "zhrs_V_Customerpackage_1 where zid=0");
                            }
                            gbDistrict.Visible = true;
                            break;
                    }
                }
                else if (cbocombination.SelectedIndex == 1)
                {
                    switch (salePSC)
                    {
                        case "套装":
                            lst = ReportService.GetCustomerInfoAll(iLoginEx, "", "zhrs_t_Customer");
                            gbDistrict.Visible = true;
                            break;
                        case "拆套装":
                            if (cbisum.Checked)
                            {
                                lst = ReportService.GetCustomerInfoAll(iLoginEx, "", "zhrs_V_Customer_1 where zid=1");
                            }
                            else
                            {
                                tsmiCsoDetail.Visible = true;
                                lst = ReportService.GetCustomerInfoAll(iLoginEx, "", "zhrs_V_Customer_1 where zid=0");
                            }
                            gbDistrict.Visible = true;
                            break;
                    }
                }

                re = new RSERP_SO321.BindingCollection<Report>(lst);

                dgvDataInfo.DataSource = re;
                dgvDataInfo.Columns["District"].Frozen = true;
                dgvDataInfo.Columns["cDCName"].Frozen = true;
                dgvDataInfo.Columns["cInvCCode"].Frozen = true;
                dgvDataInfo.Columns["cPersonName"].Frozen = true;
                dgvDataInfo.Columns["ccusname"].Frozen = true;

                for (int i = 1; i < 10; i++)
                {
                    dgvDataInfo.Columns["GrossMargin0" + i].Visible = true;
                    dgvDataInfo.Columns["Sales0" + i].Visible = true;
                    dgvDataInfo.Columns["colGM" + i].Visible = true;
                }
                    dgvDataInfo.Columns["GrossMargin10"].Visible = true;
                    dgvDataInfo.Columns["GrossMargin11"].Visible = true;
                    dgvDataInfo.Columns["GrossMargin12"].Visible = true;

                    dgvDataInfo.Columns["Sales10"].Visible = true;
                    dgvDataInfo.Columns["Sales11"].Visible = true;
                    dgvDataInfo.Columns["Sales12"].Visible = true;

                    dgvDataInfo.Columns["colGM10"].Visible = true;
                    dgvDataInfo.Columns["colGM11"].Visible = true;
                    dgvDataInfo.Columns["colGM12"].Visible = true;

                for (int i = 6; i < dgvDataInfo.Columns.Count; i++)
                {
                    dgvDataInfo.Columns[i].DefaultCellStyle.Format = "#,###0.00";
                    dgvDataInfo.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("错误：" + ex.Message);
            }
            finally
            {
                this.Text = frmText;
            }
        }
          #endregion


        private void btnsalePSC_Click(object sender, EventArgs e)
        {
            iLoginEx.WriteUserProfileValue("SO321", "btnsalePSC", btnsalePSC.Text);
            NewMethod();
            
        }
        #region 选择不同类型
        /// <summary>
        /// 选择不同类型
        /// </summary>
        private void NewMethod()
        {
            frmText = "";
            switch (btnsalePSC.Text)
            {
                case "套装":
                    cbocombination.Text = "";
                    cbocombination.Items.Clear();
                    cbocombination.Items.Insert(0, "请选择");
                    cbocombination.Items.Insert(1, "客户");
                    cbocombination.Items.Insert(2, "客户+套餐");
                    cbocombination.Items.Insert(3, "客户+套餐+类型");
                    cbocombination.Items.Insert(4, "客户+套餐+类型+系列");
                    cbocombination.Items.Insert(5, "客户+套餐+类型+系列+路数");
                    cbocombination.Items.Insert(6, "套餐");
                    cbocombination.Items.Insert(7, "套餐+类型");
                    cbocombination.Items.Insert(8, "套餐+类型+系列");
                    cbocombination.Items.Insert(9, "套餐+类型+系列+路数");
                    cbocombination.Items.Insert(10, "业务员");
                    cbocombination.Items.Insert(11, "地区+国家或城市+客户");
                    cbocombination.Items.Insert(12, "地区+国家或城市");
                    cbocombination.Items.Insert(13, "地区");
                    cbocombination.Items.Insert(14, "国家+类型");
                    cbocombination.Items.Insert(15, "国家+类型+系列");
                    cbocombination.Items.Insert(16, "国家+类型+系列+路数");
                    cbocombination.Items.Insert(17, "汇总");
                    salePSC = "套装";
                    cbisum.Visible = false;
                    btnsalePSC.Text = "拆套装";
                    this.Text = "套装销售统计分析表     " + System.Windows.Forms.Application.ProductVersion;
                    frmText = this.Text;
                    break;
                case "拆套装":
                    cbocombination.Text = "";
                    cbocombination.Items.Clear();
                    cbocombination.Items.Insert(0, "请选择");
                    cbocombination.Items.Insert(1, "客户");
                    cbocombination.Items.Insert(2, "客户+已拆套餐");
                    cbocombination.Items.Insert(3, "客户+已拆套餐+类型");
                    cbocombination.Items.Insert(4, "客户+已拆套餐+类型+系列");
                    cbocombination.Items.Insert(5, "客户+已拆套餐+类型+系列+路数");
                    cbocombination.Items.Insert(6, "已拆套餐");
                    cbocombination.Items.Insert(7, "已拆套餐+类型");
                    cbocombination.Items.Insert(8, "已拆套餐+类型+系列");
                    cbocombination.Items.Insert(9, "已拆套餐+类型+系列+路数");
                    cbocombination.Items.Insert(10, "业务员");
                    cbocombination.Items.Insert(11, "地区+国家或城市+客户");
                    cbocombination.Items.Insert(12, "地区+国家或城市");
                    cbocombination.Items.Insert(13, "地区");
                    cbocombination.Items.Insert(14, "国家+类型");
                    cbocombination.Items.Insert(15, "国家+类型+系列");
                    cbocombination.Items.Insert(16, "国家+类型+系列+路数");
                    cbocombination.Items.Insert(17, "汇总");
                    salePSC = "拆套装";
                    cbisum.Visible = true;
                    btnsalePSC.Text = "套装";
                    this.Text = "拆套装销售统计分析表     " + System.Windows.Forms.Application.ProductVersion;
                    frmText = this.Text;
                    break;
            }
        } 
        #endregion

        private void btnsaleNum_Click(object sender, EventArgs e)
        {
            frmDVRHSI frm = new frmDVRHSI();
            switch (salePSC)
            {
                case "拆套装":
                    switch (cbocombination.SelectedIndex)
                    {
                        case 9:
                            frm.iLoginEx = iLoginEx;
                            frm.cbocombinationIndex = 9;
                            frm.Show();
                            break;
                        case 5:
                            frm.iLoginEx = iLoginEx;
                            frm.cbocombinationIndex = 5;
                            frm.Show();
                            break;
                    }
                    break;
                  
            }
        }

        private void btnClrea_Click(object sender, EventArgs e)
        {
            txtfind.Clear();
        }

        private void btnCosts_Click(object sender, EventArgs e)
        {
            frmiUnitCost frm = new frmiUnitCost();
            frm.iLoginEx = iLoginEx;
            frm.Show();
        }

        private void btnCostErrer_Click(object sender, EventArgs e)
        {
            frmCostError frm = new frmCostError();
            frm.iLoginEx = iLoginEx;
            frm.Show();
        }

        private void dgvDataInfo_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            frmDetailed frm = new frmDetailed();
            frm.iLoginEx = iLoginEx;
          
            switch (cbocombination.SelectedIndex)
            {
                case 10:
                    switch (salePSC)
                    {
                        case "拆套装":
                            frm.cPersonName = dgvDataInfo.Rows[dgvDataInfo.CurrentCell.RowIndex].Cells["cPersonName"].Value.ToString() ;
                            frm.zz_Index = 10;
                            frm.Show();
                            break;
                    }
                    break;
                case 1:
                    switch (salePSC)
                    {
                        case "拆套装":
                            frm.cPersonName = dgvDataInfo.Rows[dgvDataInfo.CurrentCell.RowIndex].Cells["ccusname"].Value.ToString();
                            frm.zz_Index = 1;
                            frm.Show();
                            break;
                    }
                    break;
                case 9:
                    switch (salePSC)
                    {
                        case "拆套装":
                            frm.cPersonName = dgvDataInfo.Rows[dgvDataInfo.CurrentCell.RowIndex].Cells["cInvCCode"].Value.ToString();
                            frm.zz_Index = 9;
                            frm.Show();
                            break;
                    }
                    break;
            }
            
        }

        private void tsmiCsoDetail_Click(object sender, EventArgs e)
        {
            dgvDataInfo.Rows[dgvDataInfo.CurrentCell.RowIndex].Selected = true;
            if (dgvDataInfo.SelectedRows.Count>0)
            {
                dgvDataInfo_CellMouseDoubleClick(null,null);
            }
        }
        public bool CellMouseDown = false;
        private void dgvDataInfo_CellMouseDown(object sender, DataGridViewCellMouseEventArgs e)
        {
            CellMouseDown = true;
            tsslComputing.Text = "";
        }

        private void dgvDataInfo_CellMouseMove(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                decimal SelectTotal = 0;
                int selectedCellCount = dgvDataInfo.GetCellCount(DataGridViewElementStates.Selected);
                if (selectedCellCount > 0 && CellMouseDown)
                {
                    SelectTotal = 0;
                    for (int i = 0; i < selectedCellCount; i++)
                    {
                        SelectTotal += Convert.ToDecimal(Convert.ToString(Convert.IsDBNull(dgvDataInfo.SelectedCells[i].Value) ? "" : dgvDataInfo.SelectedCells[i].Value) == "" ? "0" : dgvDataInfo.SelectedCells[i].Value.ToString());
                    }
                    tsslComputing.Text = string.Format("{0:N2}", SelectTotal);
                }
            }
            catch
            {
            }
        }

        private void dgvDataInfo_CellMouseUp(object sender, DataGridViewCellMouseEventArgs e)
        {
            dgvDataInfo_CellMouseMove(sender, e);
            CellMouseDown = false;
        }


    }
}
