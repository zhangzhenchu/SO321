using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using UTLoginEx;
using System.Data.OleDb;  //固定格式
using RSERP_SO321.Models;


namespace RSERP_SO321
{
    public partial class frmSaleDVRHSI : Form
    {
        public  UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        public frmSaleDVRHSI()
        {
            InitializeComponent();
        }
        //成品分类
        public string cInvCCode = "";
        //private void btnfind_Click(object sender, EventArgs e)
        //{
        //    string sql = "";
        //    lblDVR.Text = "DVR";
        //    lblHD.Text = "硬盘";
        //    lblSp.Text = "配件";
        //    lblIPC.Text = "IPC";
        //    decimal psum = 0;//合计金额
        //    OleDbConnection conn = new OleDbConnection(iLoginEx.ConnString());
        //    conn.Open();
        //    OleDbCommand comm = new OleDbCommand(sql, conn);
        //    if (cbDVR.Checked)
        //    {   
        //        List<DVRHSI> dvrlst = new List<DVRHSI>();
        //        sql = "select distinct zt.Cinvcode,zt.COption1 from (  \r\n";
        //        sql += " select 销售订单号 as Csocode,存货编码 as cInvCode  from tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + " zv where zv.cinvccode=  \r\n";
        //        sql += " (select cinvccode from InventoryClass  where cinvcName='" + cInvCCode + "') and zv.ddate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'   \r\n";
        //        sql += " )a left join zhrs_t_zzcSO_SOAddSeriesInfo zt on a.Csocode=zt.Csocode  where zt.COption1='DVR' and a.Csocode=zt.Csocode   \r\n";
        //        comm.CommandText = sql;
        //        OleDbDataReader dr = comm.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            DVRHSI dvr = new DVRHSI();
        //            dvr.Cinvcode = dr["Cinvcode"].ToString();
        //            dvr.COption1 = dr["COption1"].ToString();
        //            dvrlst.Add(dvr);
        //        }
        //        dr.Close();
        //        decimal dvrP=0 ;
        //        decimal dvrN=0;
        //        if (dvrlst.Count > 0)
        //        {
        //            foreach (DVRHSI d in dvrlst)
        //            {
        //                sql = "select * from (select Sum(Ciquantity)as Number,sum(SiSum) as SiSum,Cinvcode,COption1 from zhrs_t_zzcSO_SOAddSeriesInfo   \r\n";
        //                sql += "  group by Cinvcode,COption1) a where a.Cinvcode='" + d.Cinvcode + "'  \r\n";
        //                comm.CommandText = sql;
        //                OleDbDataReader drd = comm.ExecuteReader();
        //                if (drd.Read())
        //                {
        //                    dvrP += Convert.ToDecimal(drd["SiSum"]);
        //                    dvrN += Convert.ToDecimal(drd["Number"]);
        //                }
        //                drd.Close();
        //            }
        //            lblDVR.Text = "DVR  数量：" + dvrN + "    金额：" + dvrP + "";
        //            psum += dvrP;
        //        }
               
        //    }
        //    if (cbHD.Checked)
        //    {
        //        List<DVRHSI> HDlst = new List<DVRHSI>();
        //        sql = "select distinct zt.Cinvcode,zt.COption1 from (  \r\n";
        //        sql += " select 销售订单号 as Csocode,存货编码 as cInvCode  from tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + " zv where zv.cinvccode=  \r\n";
        //        sql += " (select cinvccode from InventoryClass  where cinvcName='" + cInvCCode + "') and zv.ddate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'   \r\n";
        //        sql += " )a left join zhrs_t_zzcSO_SOAddSeriesInfo zt on a.Csocode=zt.Csocode  where zt.COption1='HD' and a.Csocode=zt.Csocode   \r\n";
        //        comm.CommandText = sql;
        //        OleDbDataReader drH = comm.ExecuteReader();
        //        while (drH.Read())
        //        {
        //            DVRHSI Hd = new DVRHSI();
        //            Hd.Cinvcode = drH["Cinvcode"].ToString();
        //            Hd.COption1 = drH["COption1"].ToString();
        //            HDlst.Add(Hd);
        //        }
        //        drH.Close();
        //        decimal HP = 0;//金额
        //        decimal HN = 0;//数量
        //        if (HDlst.Count > 0)
        //        {
        //            foreach (DVRHSI h in HDlst)
        //            {
        //                sql = "select * from (select Sum(Ciquantity)as Number,sum(SiSum) as SiSum,Cinvcode,COption1 from zhrs_t_zzcSO_SOAddSeriesInfo   \r\n";
        //                sql += "  group by Cinvcode,COption1) a where a.Cinvcode='" + h.Cinvcode + "'  \r\n";
        //                comm.CommandText = sql;
        //                OleDbDataReader drhd = comm.ExecuteReader();
        //                if (drhd.Read())
        //                {
        //                    HP += Convert.ToDecimal(drhd["SiSum"]);
        //                    HN += Convert.ToDecimal(drhd["Number"]);
        //                }
        //                drhd.Close();
        //            }
        //            lblHD.Text = "硬盘  数量：" + HN + "    金额：" + HP + "";
        //            psum += HP;
        //        }
        //    }
        //    if (cbIPC.Checked)
        //    {
        //        List<DVRHSI> IPClst = new List<DVRHSI>();
        //        sql = "select distinct zt.Cinvcode,zt.COption1 from (  \r\n";
        //        sql += " select 销售订单号 as Csocode,存货编码 as cInvCode  from tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + " zv where zv.cinvccode=  \r\n";
        //        sql += " (select cinvccode from InventoryClass  where cinvcName='" + cInvCCode + "') and zv.ddate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'   \r\n";
        //        sql += " )a left join zhrs_t_zzcSO_SOAddSeriesInfo zt on a.Csocode=zt.Csocode  where zt.COption1='IPC' and a.Csocode=zt.Csocode   \r\n";
        //        comm.CommandText = sql;
        //        OleDbDataReader dri = comm.ExecuteReader();
        //        while (dri.Read())
        //        {
        //            DVRHSI ipc = new DVRHSI();
        //            ipc.Cinvcode = dri["Cinvcode"].ToString();
        //            ipc.COption1 = dri["COption1"].ToString();
        //            IPClst.Add(ipc);
        //        }
        //        dri.Close();
        //        decimal ipcP = 0;//金额
        //        decimal ipcN = 0;//数量
        //        if (IPClst.Count > 0)
        //        {
        //            foreach (DVRHSI i in IPClst)
        //            {
        //                sql = "select * from (select Sum(Ciquantity)as Number,sum(SiSum) as SiSum,Cinvcode,COption1 from zhrs_t_zzcSO_SOAddSeriesInfo   \r\n";
        //                sql += "  group by Cinvcode,COption1) a where a.Cinvcode='" + i.Cinvcode + "'  \r\n";
        //                comm.CommandText = sql;
        //                OleDbDataReader dripc = comm.ExecuteReader();
        //                if (dripc.Read())
        //                {
        //                    ipcP += Convert.ToDecimal(dripc["SiSum"]);
        //                    ipcN += Convert.ToDecimal(dripc["Number"]);
        //                }
        //                dripc.Close();
        //            }
        //            lblIPC.Text = "IPC  数量：" + ipcN + "    金额：" + ipcP + "";
        //            psum += ipcP;
        //        }
        //    }
        //    if (cbSp.Checked)
        //    {
        //        List<DVRHSI> SPlst = new List<DVRHSI>();
        //        sql = "select distinct zt.Cinvcode,zt.COption1 from (  \r\n";
        //        sql += " select 销售订单号 as Csocode,存货编码 as cInvCode  from tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + " zv where zv.cinvccode=  \r\n";
        //        sql += " (select cinvccode from InventoryClass  where cinvcName='" + cInvCCode + "') and zv.ddate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'   \r\n";
        //        sql += " )a left join zhrs_t_zzcSO_SOAddSeriesInfo zt on a.Csocode=zt.Csocode  where zt.COption1='配件' and a.Csocode=zt.Csocode   \r\n";
        //        comm.CommandText = sql;
        //        OleDbDataReader drs = comm.ExecuteReader();
        //        while (drs.Read())
        //        {
        //            DVRHSI sp = new DVRHSI();
        //            sp.Cinvcode = drs["Cinvcode"].ToString();
        //            sp.COption1 = drs["COption1"].ToString();
        //            SPlst.Add(sp);
        //        }
        //        drs.Close();
        //        decimal SP = 0;//金额
        //        decimal SN = 0;//数量
        //        if (SPlst.Count > 0)
        //        {
        //            foreach (DVRHSI s in SPlst)
        //            {
        //                sql = "select * from (select Sum(Ciquantity)as Number,sum(SiSum) as SiSum,Cinvcode,COption1 from zhrs_t_zzcSO_SOAddSeriesInfo   \r\n";
        //                sql += "  group by Cinvcode,COption1) a where a.Cinvcode='" + s.Cinvcode + "'  \r\n";
        //                comm.CommandText = sql;
        //                OleDbDataReader drsp = comm.ExecuteReader();
        //                if (drsp.Read())
        //                {
        //                    SP += Convert.ToDecimal(drsp["SiSum"]);
        //                    SN += Convert.ToDecimal(drsp["Number"]);
        //                }
        //                drsp.Close();
        //            }
        //            lblSp.Text = "配件  数量：" + SN + "    金额：" + SP + "";
        //            psum += SP;
        //        }
        //    }
        //    lblPSum.Text = psum.ToString();

            
        //}

        private void frmSaleDVRHSI_Load(object sender, EventArgs e)
        {
            try
            {
                string sql = "";
                OleDbConnection conn = new OleDbConnection(iLoginEx.ConnString());
                conn.Open();
                sql = "if Object_id('tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + "') is not null  \r\n";
                sql += " drop table tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + "  \r\n";
                OleDbCommand comm = new OleDbCommand(sql, conn);
                comm.ExecuteNonQuery();
                sql = " select * into tempdb..so321_zzcsale" + iLoginEx.GetMacAddress().Replace(":", "") + " from zhrs_v_saleTotal_2016";
                comm.CommandText = sql;
                comm.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("错误！" + ex.Message);
            }
            finally
            {
                GC.Collect();
            }
        }
    }
}
