using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using UTLoginEx;
using System.Data.OleDb;
using RSERP_SO321.Models;


namespace RSERP_SO321
{
    public partial class frmDVRHSI : Form
    {
        public UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        private string frmText = "拆套装统计分析表";
        public static List<DVRHSI> lst = new List<DVRHSI>();
        RSERP_SO321.BindingCollection<DVRHSI> dlst = new RSERP_SO321.BindingCollection<DVRHSI>(lst);
        /// <summary>
        /// 索引
        /// </summary>
        public int cbocombinationIndex;
        public frmDVRHSI()
        {
            InitializeComponent();
        }
        #region 加载数据
        /// <summary>
        /// 加载数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmDVRHSI_Load(object sender, EventArgs e)
        {

            txtQuery_DVRHSI.Text = iLoginEx.ReadUserProfileValue("SO321", "txtQuery_DVRHSI");
        
            DgvSaleInfo();
        } 
        #endregion

     

        #region 加载网格数据
        /// <summary>
        /// 加载网格数据
        /// </summary>
        private void DgvSaleInfo()
        {

            #region MyRegion
            //string selectSQL = "select Cinvcname= (case when  isnull(a.cInvCCode,'')='' then '配件' when a.cInvCCode='H' then '硬盘' else itc.cinvcname  end),  \r\n";
            //selectSQL += " Sales01 as '1月销售额',Number01 as '1月数量',Sales02 as '2月销售额',Number02 as '2月数量',Sales03 as '3月销售额',Number03 as '3月数量',Sales04 as '4月销售额',Number04 as '4月数量',Sales05 as '5月销售额',Number05 as '5月数量',Sales06 as '6月销售额',Number06 as '6月数量',  \r\n";
            //selectSQL += " Sales07 as '7月销售额',Number07 as '7月数量',Sales08 as '8月销售额',Number08 as '8月数量',Sales09 as '9月销售额',Number09 as '9月数量',Sales10 as '10月销售额',Number10 as '10月数量',Sales11 as '11月销售额',Number11 as '11月数量',Sales12 as '12月销售额',Number12 as '12月数量'  \r\n";
            //selectSQL += " from (select cInvCCode ,  \r\n";
            //selectSQL += " sum(Sales01) as 'Sales01',sum(Number01) as 'Number01',  \r\n";
            //selectSQL += " sum(Sales02) as 'Sales02',sum(Number02) as 'Number02',  \r\n";
            //selectSQL += " sum(Sales03) as 'Sales03',sum(Number03) as 'Number03',  \r\n";
            //selectSQL += " sum(Sales04) as 'Sales04',sum(Number04) as 'Number04',  \r\n";
            //selectSQL += " sum(Sales05) as 'Sales05',sum(Number05) as 'Number05',  \r\n";
            //selectSQL += " sum(Sales06) as 'Sales06',sum(Number06) as 'Number06',  \r\n";
            //selectSQL += " sum(Sales07) as 'Sales07',sum(Number07) as 'Number07',  \r\n";
            //selectSQL += " sum(Sales08) as 'Sales08',sum(Number08) as 'Number08',  \r\n";
            //selectSQL += " sum(Sales09) as 'Sales09',sum(Number09) as 'Number09',  \r\n";
            //selectSQL += " sum(Sales10) as 'Sales10',sum(Number10) as 'Number10',  \r\n";
            //selectSQL += " sum(Sales11) as 'Sales11',sum(Number11) as 'Number11',  \r\n";
            //selectSQL += " sum(Sales12) as 'Sales12',sum(Number12) as 'Number12'  \r\n";
            //selectSQL += " from (select cInvCCode,  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/01'  then sales else 0 end as 'Sales01',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/01'  then Number else 0 end as 'Number01',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/02'  then sales else 0 end as 'Sales02',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/02'  then Number else 0 end as 'Number02',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/03'  then sales else 0 end as 'Sales03',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/03'  then Number else 0 end as 'Number03',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/04'  then sales else 0 end as 'Sales04',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/04'  then Number else 0 end as 'Number04',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/05'  then sales else 0 end as 'Sales05',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/05'  then Number else 0 end as 'Number05',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/06'  then sales else 0 end as 'Sales06',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/06'  then Number else 0 end as 'Number06',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/07'  then sales else 0 end as 'Sales07',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/07'  then Number else 0 end as 'Number07',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/08'  then sales else 0 end as 'Sales08',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/08'  then Number else 0 end as 'Number08',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/09'  then sales else 0 end as 'Sales09',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/09'  then Number else 0 end as 'Number09',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/10'  then sales else 0 end as 'Sales10',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/10'  then Number else 0 end as 'Number10',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/11'  then sales else 0 end as 'Sales11',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/11'  then Number else 0 end as 'Number11',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/12'  then sales else 0 end as 'Sales12',  \r\n";
            //selectSQL += " case when  left(convert(varchar,addate,111),7)='" + iLoginEx.iYear() + "/12'  then Number else 0 end as 'Number12'  \r\n";
            //selectSQL += " from tempdb..Copy_t_zhrs_v_CB_SG_zzc) m group by m.cInvCCode)a  \r\n";
            //selectSQL += " left join InventoryClass itc on a.cInvCCode=itc.cInvCCode  \r\n";
            //DataSet ds = new DataSet();
            //OleDbDataAdapter oledat = new OleDbDataAdapter(selectSQL, conn);
            //oledat.Fill(ds, "sqltable");
            //dgvDVRHSI.DataSource = ds.Tables["sqltable"]; 
            #endregion
            lst.Clear();
            switch (cbocombinationIndex)
            {
                case 9:
                    if (String.IsNullOrEmpty(txtQuery_DVRHSI.Text))
                    {
                        
                        lst = GetDVRHSIinfoAll("Copy_t_zhrs_v_CB_SG_zzc_sales_Number");
                        dlst = new RSERP_SO321.BindingCollection<DVRHSI>(lst);
                        dgvDVRHSI.DataSource = dlst;
                        dgvDVRHSI.Columns["cPersonName"].Visible = false;
                        dgvDVRHSI.Columns["ccusname"].Visible = false;
                    }
                    else
                    {

                        lst = GetDVRHSIinfo_9("Copy_t_zhrs_v_CB_SG_zzc_sales_Number");//方法不同
                        dlst = new RSERP_SO321.BindingCollection<DVRHSI>(lst);
                        dgvDVRHSI.DataSource = dlst;
                        dgvDVRHSI.Columns["cPersonName"].Visible = false;
                        dgvDVRHSI.Columns["ccusname"].Visible = false;
                    }
                    break;
                case 5:
                    if (String.IsNullOrEmpty(txtQuery_DVRHSI.Text))
                    {
                        
                        lst = GetDVRHSIinfoAll("zhrs_t_Customerpackagetypeseriesnumber_saleNumber");
                        dlst = new RSERP_SO321.BindingCollection<DVRHSI>(lst);
                        dgvDVRHSI.DataSource = dlst;
                        dgvDVRHSI.Columns["cPersonName"].Visible = true;
                        dgvDVRHSI.Columns["ccusname"].Visible = true;
                    }
                    else
                    {
                       
                        lst = GetDVRHSIinfo_5("zhrs_t_Customerpackagetypeseriesnumber_saleNumber");//方法不同
                        dlst = new RSERP_SO321.BindingCollection<DVRHSI>(lst);
                        dgvDVRHSI.DataSource = dlst;
                        dgvDVRHSI.Columns["cPersonName"].Visible = true;
                        dgvDVRHSI.Columns["ccusname"].Visible = true;
                    }
                    break;
            }
           
           
            dgvDVRHSI.Columns["Cinvcname"].Frozen = true;
            dgvDVRHSI.Columns["cPersonName"].Frozen = true;
            dgvDVRHSI.Columns["ccusname"].Frozen = true;
             ColumnsHeaderText();
            for (int i = 1; i < dgvDVRHSI.Columns.Count; i++)
            {
                dgvDVRHSI.Columns[i].DefaultCellStyle.Format = "#,###0.00";
                dgvDVRHSI.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }
        }

        #region 更改列标题名称
        /// <summary>
        /// 更改列标题名称
        /// </summary>
        private void ColumnsHeaderText()
        {
            dgvDVRHSI.Columns["Cinvcname"].HeaderText = "成品分类名称";
            dgvDVRHSI.Columns["cPersonName"].HeaderText = "业务员";
            dgvDVRHSI.Columns["ccusname"].HeaderText = "客户";
            for (int i = 1; i < 10; i++)
            {
                dgvDVRHSI.Columns["Sales0" + i + ""].HeaderText = "" + i + "月销售额"; dgvDVRHSI.Columns["Number0" + i + ""].HeaderText = "" + i + "月销售数量";
            }
            dgvDVRHSI.Columns["Sales10"].HeaderText = "10月销售额"; dgvDVRHSI.Columns["Number10"].HeaderText = "10月销售数量";
            dgvDVRHSI.Columns["Sales11"].HeaderText = "11月销售额"; dgvDVRHSI.Columns["Number11"].HeaderText = "11月销售数量";
            dgvDVRHSI.Columns["Sales12"].HeaderText = "12月销售额"; dgvDVRHSI.Columns["Number12"].HeaderText = "12月销售数量";

        } 
        #endregion

        #region 查询数据
        /// <summary>
        /// 查询数据
        /// </summary>
        /// <returns></returns>
        public List<DVRHSI> GetDVRHSIinfoAll(string tableName)
        {
            OleDbConnection conn = new OleDbConnection(iLoginEx.ConnString());
            try
            {
                conn.Open();
                string sql = "select * from " + tableName + "";//
                OleDbCommand comm = new OleDbCommand(sql, conn);
                OleDbDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    DVRHSI dvrhsi = new DVRHSI();
                    dvrhsi.Cinvcname = dr["Cinvcname"].ToString();
                    switch (cbocombinationIndex)
                    {
                        case 5:
                            dvrhsi.cPersonName = dr["cPersonName"].ToString();
                            dvrhsi.ccusname = dr["ccusname"].ToString();
                            break;
                    }
                    dvrhsi.Number01 = Convert.ToDecimal(dr["Number01"]); dvrhsi.Sales01 = Convert.ToDecimal(dr["Sales01"]);
                    dvrhsi.Number02 = Convert.ToDecimal(dr["Number02"]); dvrhsi.Sales02 = Convert.ToDecimal(dr["Sales02"]);
                    dvrhsi.Number03 = Convert.ToDecimal(dr["Number03"]); dvrhsi.Sales03 = Convert.ToDecimal(dr["Sales03"]);
                    dvrhsi.Number04 = Convert.ToDecimal(dr["Number04"]); dvrhsi.Sales04 = Convert.ToDecimal(dr["Sales04"]);
                    dvrhsi.Number05 = Convert.ToDecimal(dr["Number05"]); dvrhsi.Sales05 = Convert.ToDecimal(dr["Sales05"]);
                    dvrhsi.Number06 = Convert.ToDecimal(dr["Number06"]); dvrhsi.Sales06 = Convert.ToDecimal(dr["Sales06"]);
                    dvrhsi.Number07 = Convert.ToDecimal(dr["Number07"]); dvrhsi.Sales07 = Convert.ToDecimal(dr["Sales07"]);
                    dvrhsi.Number08 = Convert.ToDecimal(dr["Number08"]); dvrhsi.Sales08 = Convert.ToDecimal(dr["Sales08"]);
                    dvrhsi.Number09 = Convert.ToDecimal(dr["Number09"]); dvrhsi.Sales09 = Convert.ToDecimal(dr["Sales09"]);
                    dvrhsi.Number10 = Convert.ToDecimal(dr["Number10"]); dvrhsi.Sales10 = Convert.ToDecimal(dr["Sales10"]);
                    dvrhsi.Number11 = Convert.ToDecimal(dr["Number11"]); dvrhsi.Sales11 = Convert.ToDecimal(dr["Sales11"]);
                    dvrhsi.Number12 = Convert.ToDecimal(dr["Number12"]); dvrhsi.Sales12 = Convert.ToDecimal(dr["Sales12"]);
                    lst.Add(dvrhsi);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show("加载失败！frmDVRHSI " + ex.Message);
            }
            finally
            {
                conn.Close();
                GC.Collect();
            }
            return lst;
        } 
        #endregion

        #region 模糊 套餐+类型+系列+路数 拆套装
        /// <summary>
        /// 模糊 套餐+类型+系列+路数 拆套装
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public List<DVRHSI> GetDVRHSIinfo_9(string tableName)
        {
            List<DVRHSI> dvrlst = new List<DVRHSI>();
            try
            {
                dvrlst = GetDVRHSIinfoAll(tableName).FindAll((p) => p.Cinvcname.IndexOf(txtQuery_DVRHSI.Text.Trim()) >= 0);
                   
            }
            catch (Exception ex)
            {
                MessageBox.Show("异常：" + ex.Message);
            }
            return dvrlst;
        }
        public List<DVRHSI> GetDVRHSIinfo_5(string tableName)
        {
            List<DVRHSI> dvrlst = new List<DVRHSI>();
            try
            {
                dvrlst = GetDVRHSIinfoAll(tableName).FindAll((p) => p.Cinvcname.IndexOf(txtQuery_DVRHSI.Text.Trim()) >= 0
                    || p.cPersonName.IndexOf(txtQuery_DVRHSI.Text.Trim()) >= 0
                    || p.ccusname.IndexOf(txtQuery_DVRHSI.Text.Trim()) >= 0);
            }
            catch (Exception ex)
            {
                MessageBox.Show("异常：" + ex.Message);
            }
            return dvrlst;
        }
        
        #endregion

        #endregion

        #region 单击退出事件
        /// <summary>
        /// 单击退出事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmiClose_Click(object sender, EventArgs e)
        {
            this.Close();
        } 
        #endregion

        #region 单击Execl事件
        /// <summary>
        /// 单击Execl事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmiExcel_Click(object sender, EventArgs e)
        {
            try
            {
                this.Text = "     正在导出，" + frmText + "，请稍候...";
                iLoginEx.ExportExcel(frmText + DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "_").Replace(".", "_").Replace(":", "_").Replace("/", "_").Replace(" ", "_"), frmText, dgvDVRHSI, 31);
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
        #endregion

        #region 查询事件方法
        /// <summary>
        /// 查询事件方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnQuery_Click(object sender, EventArgs e)
        {
            iLoginEx.WriteUserProfileValue("SO321", "txtQuery_DVRHSI", txtQuery_DVRHSI.Text);
            DgvSaleInfo();
        } 
        #endregion

        private void btn1_Click(object sender, EventArgs e)
        {
            txtQuery_DVRHSI.Clear();
        }
    }
}
