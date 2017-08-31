using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using UTLoginEx;
using RSERP_SO321.Models;
using System.Data.OleDb;

namespace RSERP_SO321
{
    public partial class frmiUnitCost : Form
    {
        public UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        List<iUnitCosts> i_lst_all_find = new List<iUnitCosts>();//查询集合表示套装和已拆套装

       // List<iUnitCosts> i_lst_all_find = new List<iUnitCosts>();//查询已拆套装
        public frmiUnitCost()
        {
            InitializeComponent();
        }

        private void frmiUnitCost_Load(object sender, EventArgs e)
        {
            SLbAccID.Text = iLoginEx.AccID(); //固定格式
            SLbAccName.Text = iLoginEx.AccName();//固定格式
            SLbServer.Text = iLoginEx.DBServerHost();//固定格式
            SLbYear.Text = iLoginEx.iYear();//固定格式
            SLbUser.Text = iLoginEx.UserId() + "[" + iLoginEx.UserName() + "]";//固定格式
        }

        private void btnCost_Click(object sender, EventArgs e)
        {  
            OLEDBHelper.iLoginEx=iLoginEx;
          List<iUnitCosts> i_lst = new List<iUnitCosts>();//这个集合表示套装

          string selectSQL = "select ROW_NUMBER() OVER (order by a.ddate) as 'id', 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',a.iSum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iexchrate,a.itaxrate,a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,      \r\n";
          selectSQL += " a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode,a.isosid       \r\n";
          selectSQL += " from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,      \r\n";
          selectSQL += " b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h       \r\n";
          selectSQL += " left join kcsaleoutb k on h.id=k.id       \r\n";
          selectSQL += " left join Sales_FHD_W b on k.iDLsID=b.iDLsID       \r\n";
          selectSQL += " left join Sales_FHD_T c on b.DLID=c.DLID        \r\n";
          selectSQL += " where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a    \r\n";
          selectSQL += "   \r\n";
          selectSQL += " union all  \r\n";
          selectSQL += "   \r\n";
          selectSQL += " select ROW_NUMBER() OVER (order by a.ddate) as 'id', 0 as 'zid','" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "' as 'Yr',a.iSum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iexchrate,a.itaxrate,a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,    \r\n";
          selectSQL += " a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode,a.isosid     \r\n";
          selectSQL += " from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,    \r\n";
          selectSQL += " b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutH h     \r\n";
          selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..kcsaleoutb k on h.id=k.id     \r\n";
          selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_W b on k.iDLsID=b.iDLsID     \r\n";
          selectSQL += " left join UFDATA_" + iLoginEx.AccID() + "_" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "..Sales_FHD_T c on b.DLID=c.DLID      \r\n";
          selectSQL += " where h.ddate between '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-01-01' and '" + (Convert.ToInt32(iLoginEx.iYear()) - 1).ToString() + "-12-31' and k.cInvCCode like 'CB%')a    \r\n";
            OleDbDataReader dr = OLEDBHelper.ExecuteReader(selectSQL,CommandType.Text);
            while (dr.Read())
            {
                i_lst.Add(new iUnitCosts() {
                    id =Convert.ToInt32(dr["id"]),
                    zid = Convert.ToInt32(dr["zid"]),
                    Yr=dr["Yr"].ToString(),
                    sales = Convert.ToDecimal(dr["sales"] == DBNull.Value ? 0 : dr["sales"]),
                    Costs = Convert.ToDecimal(dr["Costs"] == DBNull.Value ? 0 : dr["Costs"]),
                    Number = Convert.ToDecimal(dr["Number"] == DBNull.Value ? 0 : dr["Number"]),
                    aCsocode=dr["aCsocode"].ToString(),
                    ztCinvcode = dr["ztCinvcode"].ToString(),
                    cInvCCode=dr["cInvCCode"].ToString(),
                    ztCinvName = dr["ztCinvName"].ToString(),
                    ztCinvstd = dr["ztCinvstd"].ToString(),
                    addate = Convert.ToDateTime(dr["addate"]),
                    ccuscode = dr["ccuscode"].ToString(),
                    isosid=Convert.ToInt32(dr["isosid"]),
                    iexchrate = Convert.ToDecimal(dr["iexchrate"] == DBNull.Value ? 0 : dr["iexchrate"]),
                    itaxrate = Convert.ToDecimal(dr["itaxrate"] == DBNull.Value ? 0 : dr["itaxrate"]),
                    ZtCinvcodes = dr["ztCinvcode"].ToString(),
                });
            }
            dr.Close();
            OLEDBHelper.CloseCon();
            /////////////////////////////////////////////////////////////////////////////////上面代码获取全部套装的订单

            List<iUnitCosts> i_lst_all = new List<iUnitCosts>();//这个集合表示套装和已拆套装

            foreach (iUnitCosts i_1 in i_lst)
            {
               
             
                selectSQL = "select Count(1) from zhrs_t_zzcSO_SOAddSeriesInfo where Csocode='"+i_1.aCsocode+"' and cinvcodes='"+i_1.ztCinvcode+"' and isosid="+i_1.isosid+"";
                int n=Convert.ToInt32(OLEDBHelper.ExecuteScalar(selectSQL,CommandType.Text));
                if (n>0)//大于零表示有单可拆
                {
                    selectSQL = "select BaseQtyND,Cinvcodes,cInvCCode,Cinvcode,CinvName,Cinvstd,SiQuotedPrice from zhrs_t_zzcSO_SOAddSeriesInfo where Csocode='" + i_1.aCsocode + "' and cinvcodes='" + i_1.ztCinvcode + "' and isosid=" + i_1.isosid + "";
                    OleDbDataReader dr1 = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
                    List<zzcSO_SOAddSeriesInfo> s_lst =new List<zzcSO_SOAddSeriesInfo> ();
                    List<zzcSO_SOAddSeriesInfo> s_lst_DN = new List<zzcSO_SOAddSeriesInfo>();
                    List<zzcSO_SOAddSeriesInfo> s_lst_Ipc = new List<zzcSO_SOAddSeriesInfo>();
                    if (s_lst.Count > 0 || s_lst_DN.Count>0)
                    {
                        s_lst.Clear(); s_lst_DN.Clear();
                    }
                    while (dr1.Read())
                    {
                        s_lst.Add(new zzcSO_SOAddSeriesInfo() {
                            S_BaseQtyND = Convert.ToDecimal(dr1["BaseQtyND"]),
                            S_Cinvcodes = dr1["Cinvcodes"].ToString(),
                            S_cInvCCode = dr1["cInvCCode"].ToString(),
                            S_Cinvcode = dr1["Cinvcode"].ToString(),
                            S_CinvName = dr1["CinvName"].ToString(),
                            S_Cinvstd = dr1["Cinvstd"].ToString(),
                            S_SiQuotedPrice = Convert.ToDecimal(dr1["SiQuotedPrice"])
                        });

                        s_lst_DN.Add(new zzcSO_SOAddSeriesInfo()
                        {
                            S_BaseQtyND = Convert.ToDecimal(dr1["BaseQtyND"]),
                            S_Cinvcodes = dr1["Cinvcodes"].ToString(),
                            S_cInvCCode = dr1["cInvCCode"].ToString(),
                            S_Cinvcode = dr1["Cinvcode"].ToString(),
                            S_CinvName = dr1["CinvName"].ToString(),
                            S_Cinvstd = dr1["Cinvstd"].ToString(),
                            S_SiQuotedPrice = Convert.ToDecimal(dr1["SiQuotedPrice"])
                        });
                        s_lst_Ipc.Add(new zzcSO_SOAddSeriesInfo()
                        {
                            S_BaseQtyND = Convert.ToDecimal(dr1["BaseQtyND"]),
                            S_Cinvcodes = dr1["Cinvcodes"].ToString(),
                            S_cInvCCode = dr1["cInvCCode"].ToString(),
                            S_Cinvcode = dr1["Cinvcode"].ToString(),
                            S_CinvName = dr1["CinvName"].ToString(),
                            S_Cinvstd = dr1["Cinvstd"].ToString(),
                            S_SiQuotedPrice = Convert.ToDecimal(dr1["SiQuotedPrice"])
                        });
                    }
                    dr1.Close();
                    OLEDBHelper.CloseCon();

                    decimal cost = 0;//记录余下成本
                    decimal cost_H = 0;//记录余下成本


                    List<zzcSO_SOAddSeriesInfo> s_sale_sp = s_lst.FindAll((p) => p.S_cInvCCode.IndexOf("0507") >= 0 || p.S_cInvCCode.IndexOf("SGCA") >= 0 || p.S_cInvCCode.IndexOf("SGDV") >= 0 || p.S_cInvCCode.IndexOf("SGNV") >= 0);//先找到是否存在这些
                    if (s_sale_sp.Count <= 0)
                    {
                        cost = i_1.Costs / Convert.ToDecimal(s_lst.Count);//在没有DVR或NVR的情况下才会平均分配,配件成本
                        foreach (zzcSO_SOAddSeriesInfo s_5 in s_lst)
                        {
                            iUnitCosts iunitcost_Sp = new iUnitCosts();
                            iunitcost_Sp.zid = i_1.zid;
                            iunitcost_Sp.Yr = i_1.Yr;
                            iunitcost_Sp.sales = i_1.Number * s_5.S_BaseQtyND * s_5.S_SiQuotedPrice * i_1.iexchrate / ((i_1.itaxrate / 100) + 1);//配件销售额
                            iunitcost_Sp.Costs = cost;//配件成本 = 配件单价成本 * 母件使用数量 * 子件使用数量
                            iunitcost_Sp.Number = i_1.Number * s_5.S_BaseQtyND;           //配件数量 = 母件使用数量 * 子件使用数量
                            iunitcost_Sp.aCsocode = i_1.aCsocode;
                            iunitcost_Sp.ztCinvcode = s_5.S_Cinvcode;
                            iunitcost_Sp.cInvCCode = s_5.S_cInvCCode;
                            iunitcost_Sp.ztCinvName = s_5.S_CinvName;
                            iunitcost_Sp.ztCinvstd = s_5.S_Cinvstd;
                            iunitcost_Sp.addate = i_1.addate;
                            iunitcost_Sp.ccuscode = i_1.ccuscode;
                            iunitcost_Sp.isosid = i_1.isosid;
                            iunitcost_Sp.ZtCinvcodes = s_5.S_Cinvcodes;
                            iunitcost_Sp.id = i_1.id;
                            i_lst_all.Add(iunitcost_Sp);                  //添加配件数据到集合，临时保存
                        }
                    }
                    else
                    {

                        List<zzcSO_SOAddSeriesInfo> s_HD = s_lst.FindAll((p) => p.S_cInvCCode.IndexOf("0507") >= 0);//先找到硬盘_HD
                        decimal iInvRCost = 0;//硬盘单价成本
                        if (s_HD.Count > 0)//是否有硬盘
                        {
                           
                            foreach (zzcSO_SOAddSeriesInfo s_1 in s_HD)
                            {
                                iUnitCosts iunitcost_H = new iUnitCosts();
                                selectSQL = "select iInvRCost from Inventory where cinvcode='" + s_1.S_Cinvcode + "'";
                                OleDbDataReader dr2 = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
                                if (dr2.Read())
                                {
                                    iInvRCost = Convert.ToDecimal(dr2["iInvRCost"] == DBNull.Value ? 0 : dr2["iInvRCost"]);
                                }
                                dr2.Close();
                                OLEDBHelper.CloseCon();
                                iunitcost_H.zid = i_1.zid;
                                iunitcost_H.Yr = i_1.Yr;
                                iunitcost_H.sales = i_1.Number * s_1.S_BaseQtyND * s_1.S_SiQuotedPrice * i_1.iexchrate / ((i_1.itaxrate / 100) + 1);//硬盘销售额
                                if (i_1.Costs==0)
                                {
                                    iunitcost_H.Costs = 0;
                                }
                                else
                                {
                                    iunitcost_H.Costs = iInvRCost * i_1.Number * s_1.S_BaseQtyND;//硬盘成本 = 硬盘单价成本 * 母件使用数量 * 子件使用数量
                                }
                                iunitcost_H.Number = i_1.Number * s_1.S_BaseQtyND;           //硬盘数量 = 母件使用数量 * 子件使用数量
                                iunitcost_H.aCsocode = i_1.aCsocode;
                                iunitcost_H.ztCinvcode = s_1.S_Cinvcode;
                                iunitcost_H.cInvCCode = s_1.S_cInvCCode;
                                iunitcost_H.ztCinvName = s_1.S_CinvName;
                                iunitcost_H.ztCinvstd = s_1.S_Cinvstd;
                                iunitcost_H.addate = i_1.addate;
                                iunitcost_H.ccuscode = i_1.ccuscode;
                                iunitcost_H.isosid = i_1.isosid;
                                iunitcost_H.ZtCinvcodes = s_1.S_Cinvcodes;
                                iunitcost_H.id = i_1.id;
                                i_lst_all.Add(iunitcost_H);                  //添加硬盘数据到集合，临时保存
                                if (s_HD.Count > 1)
                                {
                                    if (i_1.Costs <= 0)
                                    {
                                       iunitcost_H.Costs += iunitcost_H.Costs;
                                       cost = 0;
                                    }
                                    else
                                    {
                                        iunitcost_H.Costs += iunitcost_H.Costs;
                                        cost = i_1.Costs - iunitcost_H.Costs;//记录余下成本
                                    }
                                   
                                }
                                else
                                {
                                    if (i_1.Costs == 0)
                                    {
                                        cost = 0;
                                    }
                                    else if (i_1.Costs<0)
                                    {
                                        cost = i_1.Costs - iunitcost_H.Costs;//记录余下成本
                                        cost_H = cost;
                                    }
                                    else
                                    {
                                        if (iunitcost_H.Costs == 0)
                                        {
                                            cost = i_1.Costs;
                                            cost_H = i_1.Costs;
                                        }
                                        else
                                        {
                                            cost = i_1.Costs - iunitcost_H.Costs;//记录余下成本
                                            cost_H = cost;
                                        }
                                    }

                                }

                            }
                        }
                        s_lst.RemoveAll((f) => f.S_cInvCCode.IndexOf("0507") >= 0);//移除HD,硬盘
                        List<zzcSO_SOAddSeriesInfo> s_IPC = s_lst.FindAll((p) => p.S_cInvCCode.IndexOf("SGCA") >= 0);//找到IPC
                        if (s_IPC.Count > 0)
                        {
                            decimal ipc_cost = 0;
                            foreach (zzcSO_SOAddSeriesInfo s_2 in s_IPC)
                            {
                                iUnitCosts iunitcost_IPC = new iUnitCosts();
                                iunitcost_IPC.Costs = 0;

                                RecordInList ri = new RecordInList();
                                selectSQL = "select mm.cInvCode,iUnitCost01,iUnitCost02,iUnitCost03,iUnitCost04,iUnitCost05,iUnitCost06, \r\n"; // --IPC 
                                selectSQL += " iUnitCost07,iUnitCost08,iUnitCost09,iUnitCost10,iUnitCost11,iUnitCost12,i.cInvCcode    \r\n";
                                selectSQL += " from(select cInvCode,  \r\n";
                                selectSQL += " avg(case when iUnitCost01>0.00 then iUnitCost01 end)as 'iUnitCost01',  \r\n";
                                selectSQL += " avg(case when iUnitCost02>0.00 then iUnitCost02 end)as 'iUnitCost02',  \r\n";
                                selectSQL += " avg(case when iUnitCost03>0.00 then iUnitCost03 end)as 'iUnitCost03',  \r\n";
                                selectSQL += " avg(case when iUnitCost04>0.00 then iUnitCost04 end)as 'iUnitCost04',  \r\n";
                                selectSQL += " avg(case when iUnitCost05>0.00 then iUnitCost05 end)as 'iUnitCost05',  \r\n";
                                selectSQL += " avg(case when iUnitCost06>0.00 then iUnitCost06 end)as 'iUnitCost06',  \r\n";
                                selectSQL += " avg(case when iUnitCost07>0.00 then iUnitCost07 end)as 'iUnitCost07',  \r\n";
                                selectSQL += " avg(case when iUnitCost08>0.00 then iUnitCost08 end)as 'iUnitCost08',  \r\n";
                                selectSQL += " avg(case when iUnitCost09>0.00 then iUnitCost09 end)as 'iUnitCost09',  \r\n";
                                selectSQL += " avg(case when iUnitCost10>0.00 then iUnitCost10 end)as 'iUnitCost10',  \r\n";
                                selectSQL += " avg(case when iUnitCost11>0.00 then iUnitCost11 end)as 'iUnitCost11',  \r\n";
                                selectSQL += " avg(case when iUnitCost12>0.00 then iUnitCost12 end)as 'iUnitCost12'   \r\n";
                                selectSQL += " from (select cInvCode ,  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/01'  then iUnitCost else 0 end as 'iUnitCost01',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/02'  then iUnitCost else 0 end as 'iUnitCost02',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/03'  then iUnitCost else 0 end as 'iUnitCost03',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/04'  then iUnitCost else 0 end as 'iUnitCost04',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/05'  then iUnitCost else 0 end as 'iUnitCost05',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/06'  then iUnitCost else 0 end as 'iUnitCost06',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/07'  then iUnitCost else 0 end as 'iUnitCost07',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/08'  then iUnitCost else 0 end as 'iUnitCost08',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/09'  then iUnitCost else 0 end as 'iUnitCost09',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/10'  then iUnitCost else 0 end as 'iUnitCost10',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/11'  then iUnitCost else 0 end as 'iUnitCost11',  \r\n";
                                selectSQL += " case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/12'  then iUnitCost else 0 end as 'iUnitCost12'  \r\n";
                                selectSQL += " from RecordInList) m  group by m.cInvCode) mm  \r\n";
                                selectSQL += " left join Inventory i on mm.cInvCode=i.cInvCode where i.cInvCcode like '" + s_2.S_cInvCCode + "' and mm.cinvcode='" + s_2.S_Cinvcode + "'   \r\n";
                                selectSQL += "   \r\n";
                                OleDbDataReader dr3 = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
                                if (dr3.Read())
                                {
                                    ri.iUnitCost01 = Convert.ToDecimal(dr3["iUnitCost01"] == DBNull.Value ? 0 : dr3["iUnitCost01"]);
                                    ri.iUnitCost02 = Convert.ToDecimal(dr3["iUnitCost02"] == DBNull.Value ? 0 : dr3["iUnitCost02"]);
                                    ri.iUnitCost03 = Convert.ToDecimal(dr3["iUnitCost03"] == DBNull.Value ? 0 : dr3["iUnitCost03"]);
                                    ri.iUnitCost04 = Convert.ToDecimal(dr3["iUnitCost04"] == DBNull.Value ? 0 : dr3["iUnitCost04"]);
                                    ri.iUnitCost05 = Convert.ToDecimal(dr3["iUnitCost05"] == DBNull.Value ? 0 : dr3["iUnitCost05"]);
                                    ri.iUnitCost06 = Convert.ToDecimal(dr3["iUnitCost06"] == DBNull.Value ? 0 : dr3["iUnitCost06"]);
                                    ri.iUnitCost07 = Convert.ToDecimal(dr3["iUnitCost07"] == DBNull.Value ? 0 : dr3["iUnitCost07"]);
                                    ri.iUnitCost08 = Convert.ToDecimal(dr3["iUnitCost08"] == DBNull.Value ? 0 : dr3["iUnitCost08"]);
                                    ri.iUnitCost09 = Convert.ToDecimal(dr3["iUnitCost09"] == DBNull.Value ? 0 : dr3["iUnitCost09"]);
                                    ri.iUnitCost10 = Convert.ToDecimal(dr3["iUnitCost10"] == DBNull.Value ? 0 : dr3["iUnitCost10"]);
                                    ri.iUnitCost11 = Convert.ToDecimal(dr3["iUnitCost11"] == DBNull.Value ? 0 : dr3["iUnitCost11"]);
                                    ri.iUnitCost12 = Convert.ToDecimal(dr3["iUnitCost12"] == DBNull.Value ? 0 : dr3["iUnitCost12"]);
                                }
                                dr3.Close();
                                OLEDBHelper.CloseCon();

                                iunitcost_IPC.id = i_1.id;
                                iunitcost_IPC.zid = i_1.zid;
                                iunitcost_IPC.Yr = i_1.Yr;
                                iunitcost_IPC.sales = i_1.Number * s_2.S_BaseQtyND * s_2.S_SiQuotedPrice * i_1.iexchrate / ((i_1.itaxrate / 100) + 1);//IPC销售额
                                iunitcost_IPC.Number = i_1.Number * s_2.S_BaseQtyND;           //IPC数量 = 母件使用数量 * 子件使用数量
                                iunitcost_IPC.aCsocode = i_1.aCsocode;
                                //selectSQL = "select dcreatesystime from  SO_SOMain where csocode='" + i_1.aCsocode + "' ";
                                string str = "";
                                //OleDbDataReader dr4 = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
                                //if (dr4.Read())
                                //{
                                //    str = dr4["dcreatesystime"].ToString();//这里的日期指的是制单日期
                                //}
                                //dr4.Close();
                                //OLEDBHelper.CloseCon();
                                iunitcost_IPC.addate = i_1.addate;    //这里的日期指的是发货日期
                                str = i_1.addate.ToString().Substring(5, 2);
                                iunitcost_IPC.ztCinvcode = s_2.S_Cinvcode;
                                iunitcost_IPC.cInvCCode = s_2.S_cInvCCode;
                                iunitcost_IPC.ztCinvName = s_2.S_CinvName;
                                iunitcost_IPC.ztCinvstd = s_2.S_Cinvstd;
                              
                                iunitcost_IPC.ccuscode = i_1.ccuscode;
                                iunitcost_IPC.isosid = i_1.isosid;
                                iunitcost_IPC.ZtCinvcodes = s_2.S_Cinvcodes;
                                if (i_1.Costs <= 0)
                                {
                                    iunitcost_IPC.Costs = 0;
                                }
                                else
                                {
                                    if (s_lst_Ipc.Count == 1 && s_lst_Ipc.Exists((p) => p.S_cInvCCode.IndexOf("SGCA") >= 0))
                                    {
                                        iunitcost_IPC.Costs = i_1.Costs;
                                    }
                                    else
                                    {
                                        switch (str)
                                        {
                                            case "01":
                                                iunitcost_IPC.Costs = ri.iUnitCost01 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "02":
                                                iunitcost_IPC.Costs = ri.iUnitCost02 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "03":
                                                iunitcost_IPC.Costs = ri.iUnitCost03 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "04":
                                                iunitcost_IPC.Costs = ri.iUnitCost04 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "05":
                                                iunitcost_IPC.Costs = ri.iUnitCost05 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "06":
                                                iunitcost_IPC.Costs = ri.iUnitCost06 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "07":
                                                iunitcost_IPC.Costs = ri.iUnitCost07 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "08":
                                                iunitcost_IPC.Costs = ri.iUnitCost08 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "09":
                                                iunitcost_IPC.Costs = ri.iUnitCost09 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "10":
                                                iunitcost_IPC.Costs = ri.iUnitCost10 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "11":
                                                iunitcost_IPC.Costs = ri.iUnitCost10 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                            case "12":
                                                iunitcost_IPC.Costs = ri.iUnitCost10 * i_1.Number * s_2.S_BaseQtyND;//IPC成本 = IPC单价成本 * 母件使用数量 * 子件使用数量
                                                break;
                                        }
                                    }
                                }
                             
                                i_lst_all.Add(iunitcost_IPC);                  //添加IPC数据到集合，临时保存

                                if (s_IPC.Count > 1)
                                {
                                    if (cost <= 0)
                                    {
                                        iunitcost_IPC.Costs += iunitcost_IPC.Costs;
                                        cost = 0;
                                    }
                                    else
                                    {
                                      ipc_cost += iunitcost_IPC.Costs;
                                    }
                                   
                                }
                                else
                                {
                                    if (i_1.Costs == 0)
                                    {
                                        cost = 0;
                                    }
                                    else
                                    {
                                        if (iunitcost_IPC.Costs <= 0)
                                        {
                                            if (cost_H==0)
                                            {
                                                cost = i_1.Costs;
                                            }
                                            else if (cost_H<0)
                                            {
                                                cost = cost_H - iunitcost_IPC.Costs;
                                            }
                                            else
                                            {
                                                cost = cost;
                                            }
                                            
                                        }
                                        else
                                        {
                                            if (cost<=0)
                                            {
                                                cost = i_1.Costs - iunitcost_IPC.Costs;//记录余下成本  
                                            }
                                            else
                                            {
                                                cost = cost - iunitcost_IPC.Costs;//记录余下成本  
                                            }
                                           
                                        }
                                    }
                                }
                            }

                            cost = cost - ipc_cost;//记录余下成本
                        }

                        if (s_IPC.Count>0)
                        {
                              s_IPC.Clear();
                        }
                      
                        s_lst.RemoveAll((f) => f.S_cInvCCode.IndexOf("SGCA") >= 0);//移除IPC
                        List<zzcSO_SOAddSeriesInfo> s_DVR = s_lst.FindAll((p) => p.S_cInvCCode.IndexOf("SGDV") >= 0 || p.S_cInvCCode.IndexOf("SGNV") >= 0);//找到DVR或NVR
                        if (s_DVR.Count > 0)
                        {
                            foreach (zzcSO_SOAddSeriesInfo s_3 in s_DVR)
                            {
                                iUnitCosts iunitcost_DVR = new iUnitCosts();
                                iunitcost_DVR.id = i_1.id;
                                iunitcost_DVR.zid = i_1.zid;
                                iunitcost_DVR.Yr = i_1.Yr;
                                List<zzcSO_SOAddSeriesInfo> s_sale_DN_1 = s_lst_DN.FindAll((p) => p.S_cInvCCode.IndexOf("0507") >= 0 || p.S_cInvCCode.IndexOf("SGCA") >= 0);//先找到是否存在这些
                                s_lst_DN.RemoveAll((f) => f.S_cInvCCode.IndexOf("SGCA") >= 0 || f.S_cInvCCode.IndexOf("0507") >= 0);//移除IPC，HD
                                if (s_sale_DN_1.Count > 0)
                                {
                                    decimal dn_sales = 0;
                                    foreach (zzcSO_SOAddSeriesInfo dn_1 in s_lst_DN)//这里表示这个套装有DVR，有配件的情况，算出它们的销售额，最后放在DVR的销售额
                                    {
                                        dn_sales += i_1.Number * dn_1.S_BaseQtyND * dn_1.S_SiQuotedPrice * i_1.iexchrate / ((i_1.itaxrate / 100) + 1);//DVR销售额
                                    }
                                    iunitcost_DVR.sales = dn_sales; //i_1.Number * s_3.S_BaseQtyND * s_3.S_SiQuotedPrice * i_1.iexchrate / ((i_1.itaxrate / 100) + 1);//DVR销售额
                                }
                                else
                                {
                                    iunitcost_DVR.sales = i_1.sales; 
                                }
                                iunitcost_DVR.Costs = cost;//DVR成本 
                                iunitcost_DVR.Number = i_1.Number * s_3.S_BaseQtyND;           //DVR数量 = 母件使用数量 * 子件使用数量
                                iunitcost_DVR.aCsocode = i_1.aCsocode;
                                iunitcost_DVR.ztCinvcode = s_3.S_Cinvcode;
                                iunitcost_DVR.cInvCCode = s_3.S_cInvCCode;
                                iunitcost_DVR.ztCinvName = s_3.S_CinvName;
                                iunitcost_DVR.ztCinvstd = s_3.S_Cinvstd;
                                iunitcost_DVR.addate = i_1.addate;
                                iunitcost_DVR.ccuscode = i_1.ccuscode;
                                iunitcost_DVR.isosid = i_1.isosid;
                                iunitcost_DVR.ZtCinvcodes = s_3.S_Cinvcodes;
                                i_lst_all.Add(iunitcost_DVR);                  //添加DVR数据到集合，临时保存
                            }
                        }
                        else
                        {
                            if (s_lst.Count > 0)
                            {
                                if (cost==0)
                                {
                                    cost = 0;
                                }
                                else if (cost<0)
                                {
                                    cost = cost;
                                }
                                cost = cost / Convert.ToDecimal(s_lst.Count);//在没有DVR或NVR的情况下才会平均分配,配件成本
                                foreach (zzcSO_SOAddSeriesInfo s_4 in s_lst)
                                {
                                    iUnitCosts iunitcost_Sp = new iUnitCosts();
                                    iunitcost_Sp.id = i_1.id;
                                    iunitcost_Sp.zid = i_1.zid;
                                    iunitcost_Sp.Yr = i_1.Yr;
                                    iunitcost_Sp.sales = i_1.Number * s_4.S_BaseQtyND * s_4.S_SiQuotedPrice * i_1.iexchrate / ((i_1.itaxrate / 100) + 1);//配件销售额
                                    iunitcost_Sp.Costs = cost;//配件成本 = 配件单价成本 * 母件使用数量 * 子件使用数量
                                    iunitcost_Sp.Number = i_1.Number * s_4.S_BaseQtyND;           //配件数量 = 母件使用数量 * 子件使用数量
                                    iunitcost_Sp.aCsocode = i_1.aCsocode;
                                    iunitcost_Sp.ztCinvcode = s_4.S_Cinvcode;
                                    iunitcost_Sp.cInvCCode = s_4.S_cInvCCode;
                                    iunitcost_Sp.ztCinvName = s_4.S_CinvName;
                                    iunitcost_Sp.ztCinvstd = s_4.S_Cinvstd;
                                    iunitcost_Sp.addate = i_1.addate;
                                    iunitcost_Sp.ccuscode = i_1.ccuscode;
                                    iunitcost_Sp.isosid = i_1.isosid;
                                    iunitcost_Sp.ZtCinvcodes = s_4.S_Cinvcodes;
                                    i_lst_all.Add(iunitcost_Sp);                  //添加配件数据到集合，临时保存
                                }
                            }
                        }
                    }
                   
                } 
                else//如果套装没有拆单,否则按套装显示
                {
                    iUnitCosts iunitcost_sales = new iUnitCosts();
                    iunitcost_sales.id = i_1.id;
                    iunitcost_sales.zid = i_1.zid;
                    iunitcost_sales.Yr = i_1.Yr;
                    iunitcost_sales.sales = i_1.sales ;      //套装销售额
                    iunitcost_sales.Costs = i_1.Costs;       //套装成本 
                    iunitcost_sales.Number = i_1.Number;     //套装数量 
                    iunitcost_sales.aCsocode = i_1.aCsocode;
                    iunitcost_sales.ztCinvcode = i_1.ztCinvcode;
                    iunitcost_sales.cInvCCode =i_1.cInvCCode;
                    iunitcost_sales.ztCinvName = i_1.ztCinvName;
                    iunitcost_sales.ztCinvstd = i_1.ztCinvstd;
                    iunitcost_sales.addate = i_1.addate;
                    iunitcost_sales.ccuscode = i_1.ccuscode;
                    iunitcost_sales.isosid = i_1.isosid;
                    iunitcost_sales.ZtCinvcodes = i_1.ZtCinvcodes;
                    i_lst_all.Add(iunitcost_sales);                  //添加套装数据到集合，临时保存
                }
            }      ///////////////////

            i_lst_all_find = i_lst_all;
            dgvCosts.DataSource = i_lst_all;
            lblNum.Text = "总记录数：" + i_lst_all.Count.ToString();


            selectSQL = "if object_id('zhrs_t_SaleaCosts')is  not null  \r\n";
            selectSQL += " drop table zhrs_t_SaleaCosts   \r\n";
            selectSQL += "create table zhrs_t_SaleaCosts  \r\n";
            selectSQL += " (  \r\n";
            selectSQL += " id int null,  \r\n";
            selectSQL += " Cid int identity(1,1) primary key,  \r\n";
            selectSQL += " zid int null,  \r\n";
            selectSQL += " Yr  varchar(50) null,  \r\n";
            selectSQL += " sales decimal(28,4)null,  \r\n";
            selectSQL += " Costs decimal(28,4)null,  \r\n";
            selectSQL += " Number decimal(28,4) null,  \r\n";
            selectSQL += " aCsocode varchar(225)null,  \r\n";
            selectSQL += " ztCinvcode varchar(225)null,  \r\n";
            selectSQL += " cInvCCode varchar(225)null,  \r\n";
            selectSQL += " ztCinvName varchar(225)null,  \r\n";
            selectSQL += " ztCinvstd varchar(500)null,  \r\n";
            selectSQL += " addate dateTime null,  \r\n";
            selectSQL += " ccuscode varchar(500) null,  \r\n";
            selectSQL += " isosid int null,  \r\n";
            selectSQL += " ZtCinvcodes varchar(225) null  \r\n";
            selectSQL += " )  \r\n";
            OLEDBHelper.ExecuteNonQuery(selectSQL, CommandType.Text);

            StringBuilder sb = new StringBuilder();
            foreach (iUnitCosts c in i_lst_all)
            {
               selectSQL = "insert into zhrs_t_SaleaCosts(zid,Yr,sales,Costs,Number,aCsocode,ztCinvcode,cInvCCode,ztCinvName,ztCinvstd,addate,ccuscode,isosid,ZtCinvcodes,id)  \r\n";
               selectSQL += " values (" + c.zid + ",'" + c.Yr + "'," + c.sales + "," + c.Costs + "," + c.Number + ",'" + c.aCsocode + "','" + c.ztCinvcode + "','" + c.cInvCCode + "','" + c.ztCinvName + "','" + c.ztCinvstd + "','" + c.addate + "','" + c.ccuscode + "',"+c.isosid+",'"+c.ZtCinvcodes+"',"+c.id+" ); \r\n";
               sb.Append(selectSQL);
            }
            OLEDBHelper.ExecuteNonQuery(sb.ToString(), CommandType.Text);

        }

        private void btnCsoCode_Click(object sender, EventArgs e)
        {
            List<iUnitCosts> i_lst_all_find_1 = new List<iUnitCosts>();//查询集合表示套装和已拆套装
            if (!String.IsNullOrEmpty(txtCsocode.Text.Trim()))
            {
                i_lst_all_find_1 = i_lst_all_find.FindAll((p) => p.aCsocode.IndexOf(txtCsocode.Text) >= 0 || p.addate.ToString().IndexOf(txtCsocode.Text) >= 0);
                lblNum.Text ="总记录数："+ i_lst_all_find_1.Count.ToString();
                dgvCosts.DataSource = i_lst_all_find_1;
            }
            else
            {
                dgvCosts.DataSource = i_lst_all_find;
                lblNum.Text = "总记录数：" + i_lst_all_find.Count.ToString();
            }
        }

        private void btnCinv_Click(object sender, EventArgs e)
        {
            OLEDBHelper.iLoginEx = iLoginEx;
            string sqlw = "";
            if (String.IsNullOrEmpty(txtCinvccode.Text.Trim())&&String.IsNullOrEmpty(txtCinvcode.Text.Trim()))
            {
                sqlw = "";
            }
            else if(!String.IsNullOrEmpty(txtCinvccode.Text.Trim())&&String.IsNullOrEmpty(txtCinvcode.Text.Trim()))
            {
                sqlw = "where i.cInvCcode like '" + txtCinvccode.Text.Trim() + "'";  
            }
            else if (!String.IsNullOrEmpty(txtCinvccode.Text.Trim())&&!String.IsNullOrEmpty(txtCinvcode.Text.Trim()))
            {
                sqlw = "where i.cInvCcode like '" + txtCinvccode.Text.Trim() + "' and mm.cinvcode='" + txtCinvcode.Text.Trim() + "'";  
            }
            string selectSQL = "select mm.cInvCode as 'IPC存货编码',i.cinvName as '存货名称',i.cInvCcode as 'IPC存货大类编码',iUnitCost01 as '1月份IPC的平均成本',iUnitCost02 as '2月份IPC的平均成本',iUnitCost03 as '3月份IPC的平均成本',iUnitCost04 as '4月份IPC的平均成本',iUnitCost05 as '5月份IPC的平均成本',iUnitCost06 as '6月份IPC的平均成本',   \r\n";
            selectSQL += "  iUnitCost07 as '7月份IPC的平均成本',iUnitCost08 as '8月份IPC的平均成本',iUnitCost09,iUnitCost10,iUnitCost11,iUnitCost12      \r\n";
            selectSQL += "  from(select cInvCode,    \r\n";
            selectSQL += "  avg(case when iUnitCost01>0.00 then iUnitCost01 end)as 'iUnitCost01',    \r\n";
            selectSQL += "  avg(case when iUnitCost02>0.00 then iUnitCost02 end)as 'iUnitCost02',    \r\n";
            selectSQL += "  avg(case when iUnitCost03>0.00 then iUnitCost03 end)as 'iUnitCost03',    \r\n";
            selectSQL += "  avg(case when iUnitCost04>0.00 then iUnitCost04 end)as 'iUnitCost04',    \r\n";
            selectSQL += "  avg(case when iUnitCost05>0.00 then iUnitCost05 end)as 'iUnitCost05',    \r\n";
            selectSQL += "  avg(case when iUnitCost06>0.00 then iUnitCost06 end)as 'iUnitCost06',    \r\n";
            selectSQL += "  avg(case when iUnitCost07>0.00 then iUnitCost07 end)as 'iUnitCost07',    \r\n";
            selectSQL += "  avg(case when iUnitCost08>0.00 then iUnitCost08 end)as 'iUnitCost08',    \r\n";
            selectSQL += "  avg(case when iUnitCost09>0.00 then iUnitCost09 end)as 'iUnitCost09',    \r\n";
            selectSQL += "  avg(case when iUnitCost10>0.00 then iUnitCost10 end)as 'iUnitCost10',    \r\n";
            selectSQL += "  avg(case when iUnitCost11>0.00 then iUnitCost11 end)as 'iUnitCost11',    \r\n";
            selectSQL += "  avg(case when iUnitCost12>0.00 then iUnitCost12 end)as 'iUnitCost12'     \r\n";
            selectSQL += "  from (select cInvCode ,    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/01'  then iUnitCost else 0 end as 'iUnitCost01',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/02'  then iUnitCost else 0 end as 'iUnitCost02',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/03'  then iUnitCost else 0 end as 'iUnitCost03',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/04'  then iUnitCost else 0 end as 'iUnitCost04',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/05'  then iUnitCost else 0 end as 'iUnitCost05',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/06'  then iUnitCost else 0 end as 'iUnitCost06',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/07'  then iUnitCost else 0 end as 'iUnitCost07',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/08'  then iUnitCost else 0 end as 'iUnitCost08',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/09'  then iUnitCost else 0 end as 'iUnitCost09',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/10'  then iUnitCost else 0 end as 'iUnitCost10',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/11'  then iUnitCost else 0 end as 'iUnitCost11',    \r\n";
            selectSQL += "  case when  left(convert(varchar,dDate,111),7)='" + iLoginEx.iYear() + "/12'  then iUnitCost else 0 end as 'iUnitCost12'    \r\n";
            selectSQL += "  from RecordInList) m  group by m.cInvCode) mm    \r\n";
            selectSQL += "  left join Inventory i on mm.cInvCode=i.cInvCode  " + sqlw + "  \r\n";
            DataTable td = OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
            dgvIPC.DataSource = td;
          
        }

        private void btnHDF_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtHDCinvcode.Text.Trim()))
            {
                return;
            }
            OLEDBHelper.iLoginEx = iLoginEx;
            string sql = "select cinvccode as '硬盘大类编码', cinvcode as 硬盘编码,cinvName as 硬盘名称,iInvRCost as 硬盘成本  from Inventory where cinvcode='" + txtHDCinvcode.Text.Trim() + "'";
            DataTable td = OLEDBHelper.GetDataTalbe(sql, CommandType.Text);
            dgvHD.DataSource = td;
           
        }

        private void btnClearHD_Click(object sender, EventArgs e)
        {
            txtHDCinvcode.Clear();
        }

        private void btnIPcClear_Click(object sender, EventArgs e)
        {
            txtCinvccode.Clear();
            txtCinvcode.Clear();
        }

        private void btntable_Click(object sender, EventArgs e)
        {
            frmRemoveTheSuit frm = new frmRemoveTheSuit();
            frm.iLoginEx = iLoginEx;
            frm.Show();
        }

        private void btnsuitsales_Click(object sender, EventArgs e)
        {
            frmSuitCsoCode frm = new frmSuitCsoCode();
            frm.iLoginEx = iLoginEx;
            frm.Show();
        }
        List<iUnitCosts_1> C_lst_1 = new List<iUnitCosts_1>();
        List<iUnitCosts_1> C_lst_2 = new List<iUnitCosts_1>();
        private void btnCalculation_Click(object sender, EventArgs e)
        {
            try
            {
                List<iUnitCosts> C_lst = new List<iUnitCosts>();
                C_lst.Clear();
                C_lst_1.Clear();
                OLEDBHelper.iLoginEx = iLoginEx;
                string selectSQL = "select ROW_NUMBER() OVER (order by a.ddate) as 'id', 0 as 'zid','" + iLoginEx.iYear() + "' as 'Yr',a.iSum,a.iSum*a.iexchrate/(a.itaxrate/100+1) as 'sales',a.iexchrate,a.itaxrate,  \r\n";
                selectSQL += " a.iPrice as 'Costs',a.iquantity as 'Number',a.Csocode as 'aCsocode',a.Cinvcode as 'ztCinvcode',a.cInvCCode,        \r\n";
                selectSQL += "  a.CinvName as 'ztCinvName',a.Cinvstd as 'ztCinvstd',a.ddate as 'addate',a.ccuscode,a.isosid         \r\n";
                selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,        \r\n";
                selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h         \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id         \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID         \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID          \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a     \r\n";
                OleDbDataReader dr = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
                while (dr.Read())
                {
                    C_lst.Add(new iUnitCosts()
                    {
                        iSum=Convert.ToDecimal(dr["iSum"]==DBNull.Value?0:dr["iSum"]),
                        id = Convert.ToInt32(dr["id"]),
                        zid = Convert.ToInt32(dr["zid"]),
                        Yr = dr["Yr"].ToString(),
                        sales = Convert.ToDecimal(dr["sales"] == DBNull.Value ? 0 : dr["sales"]),
                        Costs = Convert.ToDecimal(dr["Costs"] == DBNull.Value ? 0 : dr["Costs"]),
                        Number = Convert.ToDecimal(dr["Number"] == DBNull.Value ? 0 : dr["Number"]),
                        aCsocode = dr["aCsocode"].ToString(),
                        ZtCinvcodes = dr["ztCinvcode"].ToString(),
                        cInvCCode = dr["cInvCCode"].ToString(),
                        ztCinvName = dr["ztCinvName"].ToString(),
                        ztCinvstd = dr["ztCinvstd"].ToString(),
                        addate = Convert.ToDateTime(dr["addate"]),
                        ccuscode = dr["ccuscode"].ToString(),
                        isosid = Convert.ToInt32(dr["isosid"]),
                        iexchrate = Convert.ToDecimal(dr["iexchrate"] == DBNull.Value ? 0 : dr["iexchrate"]),
                        itaxrate = Convert.ToDecimal(dr["itaxrate"] == DBNull.Value ? 0 : dr["itaxrate"]),
                    });
                }
                dr.Close();
                OLEDBHelper.CloseCon();
                foreach (iUnitCosts c1 in C_lst)
                {

                    string aCsocode_1 = "不存在订单";
                    selectSQL = "select count(*) from zhrs_t_SaleaCosts where Yr='" + iLoginEx.iYear() + "' and id=" + c1.id + "";
                    int n = Convert.ToInt32(OLEDBHelper.ExecuteScalar(selectSQL, CommandType.Text));
                    if (n > 0)
                    {
                        selectSQL = "select * from zhrs_t_SaleaCosts where Yr='" + iLoginEx.iYear() + "' and id=" + c1.id + "";
                        OleDbDataReader dr_1 = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);

                        iUnitCosts_1 iu = new iUnitCosts_1();
                      
                        while (dr_1.Read())
                        {
                         
                            iu.aCsocode_1 = dr_1["aCsocode"].ToString();
                            iu.addate = Convert.ToDateTime(dr_1["addate"]);
                            iu.ccuscode = dr_1["ccuscode"].ToString();
                            iu.isosid = Convert.ToInt32(dr_1["isosid"]);
                            iu.id = Convert.ToInt32(dr_1["id"]);
                            iu.ZtCinvcodes = dr_1["ZtCinvcodes"].ToString();
                            iu.sales_1 += Convert.ToDecimal(dr_1["sales"]);
                            iu.Costs_1 += Convert.ToDecimal(dr_1["Costs"]);

                            iUnitCosts_1 iu_1 = new iUnitCosts_1();
                            iu_1.aCsocode_1 = dr_1["aCsocode"].ToString();
                            iu_1.addate = Convert.ToDateTime(dr_1["addate"]);
                            iu_1.ccuscode = dr_1["ccuscode"].ToString();
                            iu_1.isosid = Convert.ToInt32(dr_1["isosid"]);
                            iu_1.id = Convert.ToInt32(dr_1["id"]);
                            iu_1.ZtCinvcodes = dr_1["ZtCinvcodes"].ToString();
                            iu_1.ztCinvcode = dr_1["ztCinvcode"].ToString();
                            iu_1.ztCinvName = dr_1["ztCinvName"].ToString();
                            iu_1.ztCinvstd = dr_1["ztCinvstd"].ToString();
                            iu_1.Number_1 = Convert.ToDecimal(dr_1["Number"]);
                            iu_1.cInvCCode = dr_1["cInvCCode"].ToString();
                            iu_1.sales_1_s = Convert.ToDecimal(dr_1["sales"]);
                            C_lst_2.Add(iu_1);
                        }
                        dr_1.Close();
                        OLEDBHelper.CloseCon();
                        decimal sal = Convert.ToDecimal(c1.sales.ToString("####0.00"));
                        decimal sal_1 = Convert.ToDecimal(iu.sales_1.ToString("####0.00"));

                        decimal cos = Convert.ToDecimal(c1.Costs.ToString("####0.00"));
                        decimal cos_1 = Convert.ToDecimal(iu.Costs_1.ToString("####0.00"));
                        if (!sal.ToString().Equals(sal_1.ToString()) || !cos.ToString().Equals(cos_1.ToString()))
                        {
                            iu.aCsocode = c1.aCsocode;
                            iu.sales = c1.sales;
                            iu.Costs = c1.Costs;
                            iu.sales_Difference = c1.sales - iu.sales_1;
                            iu.Costs_Difference = c1.Costs - iu.Costs_1;
                            iu.Number = c1.Number;
                            iu.itaxunitprice = c1.iSum / c1.Number;
                            C_lst_1.Add(iu);
                        }
                    }
                    else
                    {
                        iUnitCosts_1 ius = new iUnitCosts_1();
                        ius.aCsocode = c1.aCsocode;
                        ius.sales = c1.sales;
                        ius.Costs = c1.Costs;
                        ius.aCsocode_1 = aCsocode_1;
                        C_lst_1.Add(ius);
                    }
                } 
                dgvdetaileError.AutoGenerateColumns = false;
                dgvdetaileError.DataSource = C_lst_1;
               
                lbldetaileError.Text = "记录数：" + C_lst_1.Count;
                for (int i = 1; i < 11; i++)
                {
                    if (i==10)
                    {
                         dgvdetaileError.Columns[i].DefaultCellStyle.Format = "####";
                    }
                    else
                    {
                         dgvdetaileError.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
                    }
                    dgvdetaileError.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show("发生错误！" + ex.Message);
            }
            finally { GC.Collect(); }
        }
        

        private void dgvdetaileError_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            dgvdetaileError.Rows[dgvdetaileError.CurrentCell.RowIndex].Selected = true;
            if (dgvdetaileError.SelectedRows.Count>0)
            {   
                dgvdetaileError.AutoGenerateColumns = true;
                List<iUnitCosts_1> C_lst_2_1 = C_lst_2.FindAll((p) => p.id == Convert.ToInt32(dgvdetaileError.Rows[dgvdetaileError.CurrentCell.RowIndex].Cells["colid"].Value));
                dgvdetaileError.DataSource = C_lst_2_1;
                lbldetaileError.Text = "记录数：" + C_lst_2_1.Count;
                for (int i = 1; i < 11; i++)
                {
                    if (i == 10)
                    {
                        dgvdetaileError.Columns[i].DefaultCellStyle.Format = "####";
                    }
                    else
                    {
                        dgvdetaileError.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
                    }
                    dgvdetaileError.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
                }
            }
        }

        private void btnSS_Click(object sender, EventArgs e)
        {
          
            dgvdetaileError.AutoGenerateColumns = false;
            dgvdetaileError.DataSource = C_lst_1;
            lbldetaileError.Text = "记录数：" + C_lst_1.Count;
            for (int i = 1; i < 11; i++)
            {
                if (i == 10)
                {
                    dgvdetaileError.Columns[i].DefaultCellStyle.Format = "####";
                }
                else
                {
                    dgvdetaileError.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
                }
                dgvdetaileError.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }
        }
        public bool CellMouseDown = false;
        private void dgvdetaileError_CellMouseDown(object sender, DataGridViewCellMouseEventArgs e)
        {
            CellMouseDown = true;
            tsslComputing.Text = "";
        }

        private void dgvdetaileError_CellMouseMove(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                decimal SelectTotal = 0;
                int selectedCellCount = dgvdetaileError.GetCellCount(DataGridViewElementStates.Selected);
                if (selectedCellCount > 0 && CellMouseDown)
                {
                    SelectTotal = 0;
                    for (int i = 0; i < selectedCellCount; i++)
                    {
                        SelectTotal += Convert.ToDecimal(Convert.ToString(Convert.IsDBNull(dgvdetaileError.SelectedCells[i].Value) ? "" : dgvdetaileError.SelectedCells[i].Value) == "" ? "0" : dgvdetaileError.SelectedCells[i].Value.ToString());
                    }
                    tsslComputing.Text = string.Format("{0:N2}", SelectTotal);
                }
            }
            catch
            {
            }
        }

        private void dgvdetaileError_CellMouseUp(object sender, DataGridViewCellMouseEventArgs e)
        {
            dgvdetaileError_CellMouseMove(sender, e);
            CellMouseDown = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                OLEDBHelper.iLoginEx = iLoginEx;
                string selectSQL = "select a.isosid  as '子表存货唯一标识', a.Csocode as '订单号',a.Cinvcode as '存货编码',a.ddate as '发货单日期',a.iSum/a.iquantity as '含税单价',a.iSum*a.iexchrate/(a.itaxrate/100+1) as '销售额',a.iPrice as '成本',a.iexchrate as '汇率',a.itaxrate as '税率',a.iquantity as '数量',a.cInvCCode as '存货大类编码',        \r\n";
                selectSQL += "  a.CinvName as '存货名称',a.Cinvstd as '规格型号',a.ccuscode as '客户编码',0 as 'zid','2017' as '年份'      \r\n";
                selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,        \r\n";
                selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h         \r\n";
                selectSQL += "  left join kcsaleoutb k on h.id=k.id         \r\n";
                selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID   \r\n";
                selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID          \r\n";
                selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a where   Csocode='" + txtcsocode_suit.Text.Trim() + "'  \r\n";
                DataTable dt = new DataTable();
                dt = OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
                dgvsuit.DataSource = dt;
                for (int i = 4; i < 10; i++)
                {
                    dgvsuit.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
                    dgvsuit.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
                }
                lblcso.Text = "记录数：" + dt.Rows.Count.ToString();
            }
            catch (Exception ex)
            {

                MessageBox.Show("发生错误！" + ex.Message);
            }
        }

    }
    public class iUnitCosts_1 
    {
        /// <summary>
        /// 套装订单号
        /// </summary>
        public string aCsocode { get; set; }
        /// <summary>
        /// 套装的含税单价
        /// </summary>
        public decimal itaxunitprice { get; set; }
          /// <summary>
        /// 套装销售额
        /// </summary>
        public decimal sales { get; set; }
        /// <summary>
        /// 套装数量
        /// </summary>
        public decimal Number { get; set; }
        /// <summary>
        /// 套装成本
        /// </summary>
        public decimal Costs { get; set; }
        /// <summary>
        /// 拆订单号
        /// </summary>
        public string aCsocode_1 { get; set; }
        /// <summary>
        /// 拆销售之和
        /// </summary>
        public decimal sales_1 { get; set; }
        /// <summary>
        /// 拆成本之和
        /// </summary>
        public decimal Costs_1 { get; set; }
        /// <summary>
        /// 销售额之差
        /// </summary>
        public decimal sales_Difference { get; set; }
        /// <summary>
        /// 成本之差
        /// </summary>
        public decimal Costs_Difference { get; set; }
        /// <summary>
        /// 客户简称
        /// </summary>
        public string ccuscode { get; set; }
        /// <summary>
        /// 母件存货编码
        /// </summary>
        public string ZtCinvcodes { get; set; }
        /// <summary>
        /// 物料唯一标识
        /// </summary>
        public int isosid { get; set; }
        /// <summary>
        /// 自增标识
        /// </summary>
        public int id { get; set; } 
        /// <summary>
        /// 发货单日期
        /// </summary>
        public DateTime addate { get; set; }
        /// <summary>
        /// 每个物料的销售额sales_1_s
        /// </summary>
        public decimal sales_1_s { get; set; }
        /// <summary>
        /// 子件数量Number_1
        /// </summary>
        public decimal Number_1 { get; set; }
        /// <summary>
        /// 子件物料编码
        /// </summary>
        public string ztCinvcode { get; set; }
        /// <summary>
        /// 子件物料名称ztCinvName
        /// </summary>
        public string ztCinvName { get; set; }
        /// <summary>
        /// 子件规格型号ztCinvstd
        /// </summary>
        public string ztCinvstd { get; set; }
        /// <summary>
        /// 子件存货大类编码cInvCCode
        /// </summary>
        public string cInvCCode { get; set; }
      
    }
    public class iUnitCosts_2
    {
        /// <summary>
        /// 拆订单号
        /// </summary>
        public string aCsocode_1 { get; set; }
        /// <summary>
        /// 每个物料的销售额sales_1_s
        /// </summary>
        public decimal sales_1_s { get; set; }
        /// <summary>
        /// 子件数量Number_1
        /// </summary>
        public decimal Number_1 { get; set; }
        /// <summary>
        /// 发货单日期
        /// </summary>
        public DateTime addate { get; set; }
        /// <summary>
        /// 子件物料编码
        /// </summary>
        public string ztCinvcode { get; set; }
        /// <summary>
        /// 子件物料名称ztCinvName
        /// </summary>
        public string ztCinvName { get; set; }
        /// <summary>
        /// 子件规格型号ztCinvstd
        /// </summary>
        public string ztCinvstd { get; set; }
        /// <summary>
        /// 子件存货大类编码cInvCCode
        /// </summary>
        public string cInvCCode { get; set; }
        /// <summary>
        /// 自增标识
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// 客户简称编码
        /// </summary>
        public string ccuscode { get; set; }
        /// <summary>
        /// 母件存货编码
        /// </summary>
        public string ZtCinvcodes { get; set; }
        /// <summary>
        /// 物料唯一标识
        /// </summary>
        public int isosid { get; set; }
    }
}
