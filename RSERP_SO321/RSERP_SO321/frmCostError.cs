using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using UTLoginEx;

namespace RSERP_SO321
{
    public partial class frmCostError : Form
    {
        public UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        public  string s = "";
        public frmCostError()
        {
            InitializeComponent();
        }

        private void frmCostError_Load(object sender, EventArgs e)
        {

        }

        private void btnSalesCost_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "select zs.Yr as 年份,zs.aCsocode as 订单号,zs.ztCinvcode as 存货编码,ic.cinvCName as 存货分类 ,zs.ztCinvName as 存货名称,zs.ztCinvstd as 规格型号,zs.addate as 日期,zs.Costs as 成本,zs.sales as 销售额,zs.Number as 数量   \r\n";
            selectSQL += " from zhrs_t_SaleaCosts zs  left join   \r\n";
            selectSQL += " Inventoryclass ic on zs.cinvCCode=ic.cinvccode  \r\n";
            selectSQL += " where zs.sales<zs.Costs and zs.Yr='"+iLoginEx.iYear()+"'  \r\n";
            selectSQL += " and zs.cinvCCode=case when left(zs.cInvCCode,2) in ('CB','SG')   \r\n";
            selectSQL += " then zs.cInvCCode else case when zs.cInvCCode='0507' then zs.cInvCCode  end  end  \r\n";
           dt= OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
           dgvcostError.DataSource = dt;
           dgvcostError.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
           dgvcostError.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
           for (int i = 7; i < 10; i++)
           {
               dgvcostError.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
               dgvcostError.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
           }
           lblsalescost.Text = "总记录数：" + dt.Rows.Count;
           s = "成本高于销售额";


        }

        private void btnHD_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "select zs.Yr as 年份,zs.aCsocode as 订单号,zs.ztCinvcode as 存货编码,ic.cinvCName as 存货分类 ,zs.ztCinvName as 存货名称,zs.ztCinvstd as 规格型号,zs.addate as 日期,zs.Costs as 成本,zs.sales as 销售额,zs.Number as 数量   \r\n";
            selectSQL += " from zhrs_t_SaleaCosts zs  left join   \r\n";
            selectSQL += " Inventoryclass ic on zs.cinvCCode=ic.cinvccode  \r\n";
            selectSQL += " where zs.cinvCCode='0507' and costs<=0 and zs.Yr='"+iLoginEx.iYear()+"'   \r\n";
            dt = OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
            dgvcostError.DataSource = dt;
            dgvcostError.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgvcostError.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            for (int i = 7; i < 10; i++)
            {
                dgvcostError.Columns[i].DefaultCellStyle.Format = "#,###0.000";
                dgvcostError.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }
            lblsalescost.Text = "总记录数：" + dt.Rows.Count;
            s = "硬盘成本为零";
        }

        private void btnIPC_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "select zs.Yr as 年份,zs.aCsocode as 订单号,zs.ztCinvcode as 存货编码,zs.cinvCCode as 存货大类编码,ic.cinvCName as 存货分类 ,zs.ztCinvName as 存货名称,zs.ztCinvstd as 规格型号,zs.addate as 日期,zs.Costs as 成本,zs.sales as 销售额,zs.Number as 数量   \r\n";
            selectSQL += " from zhrs_t_SaleaCosts zs  left join   \r\n";
            selectSQL += " Inventoryclass ic on zs.cinvCCode=ic.cinvccode  \r\n";
            selectSQL += " where zs.cinvCCode like 'SGCA%' and zs.Costs<=0 and zs.Yr='" + iLoginEx.iYear() + "'    \r\n";
            dt = OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
            dgvcostError.DataSource = dt;
            dgvcostError.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgvcostError.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            for (int i = 8; i < 10; i++)
            {
                dgvcostError.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
                dgvcostError.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }
            lblsalescost.Text = "总记录数：" + dt.Rows.Count;
            s = "IPC成本为零";
        }

        private void tsmiclose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tsmiExecl_Click(object sender, EventArgs e)
        {
            
                
                try
                {
                    this.Text =  "     正在导出，" + s + "，请稍候...";
                    iLoginEx.ExportExcel(s + DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "_").Replace(".", "_").Replace(":", "_").Replace("/", "_").Replace(" ", "_"), s, dgvcostError, 12);
                }
                catch (Exception ex)
                {

                    MessageBox.Show("异常:" + ex.Message);
                }
                finally
                {
                    this.Text = "成本异常信息";
                }
           
        }

        private void btncsocode_Click(object sender, EventArgs e)
        {
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "select  0 as 'zid','2017' as '年份',a.Csocode as '订单号',a.Cinvcode as '存货编码',a.ddate as '发货单日期',a.isosid  as '子表存货唯一标识,a.iSum/a.iquantity as '含税单价',a.iSum*a.iexchrate/(a.itaxrate/100+1) as '销售额',a.iPrice as '成本',a.iexchrate as '汇率',a.itaxrate as '税率',a.iquantity as '数量',a.cInvCCode as '存货大类编码',        \r\n";
            selectSQL += "  a.CinvName as '存货名称',a.Cinvstd as '规格型号',a.ccuscode as '客户编码''       \r\n";
            selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,        \r\n";
            selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h         \r\n";
            selectSQL += "  left join kcsaleoutb k on h.id=k.id         \r\n";
            selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID         \r\n";
            selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID          \r\n";
            selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a where   Csocode='" + txtcsocode.Text.Trim() + "'  \r\n";
            DataTable dt = new DataTable();
           dt= OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
           dgvsuit.DataSource = dt;
           for (int i = 2; i < 7; i++)
           {
               dgvsuit.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
               dgvsuit.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
           }
           lblcso.Text = "记录数："+dt.Rows.Count.ToString();
        }

       
    }
}
