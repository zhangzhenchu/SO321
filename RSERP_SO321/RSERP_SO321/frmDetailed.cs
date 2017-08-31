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
    public partial class frmDetailed : Form
    {
        public  UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        public string cPersonName = "";
        public int zz_Index=0;
        public frmDetailed()
        {
            InitializeComponent();
        }

        private void frmDetailed_Load(object sender, EventArgs e)
        {
              
                dtpbegin.Text = iLoginEx.ReadUserProfileValue("SO321", "dtpbegind");
                dtpend.Text = iLoginEx.ReadUserProfileValue("SO321", "dtpendd");
                cbDetail.Checked = iLoginEx.ReadUserProfileValue("SO321", "cbDetail") == "1" ? true : false;
            string sql = "";
            switch (zz_Index)
            {
                case 10:       //业务员
                    sql = "and c.cPersonName ='" + cPersonName + "' and cy.addate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31'";

                    break;
                case 1:        //客户
                    sql = "and b.ccusname ='" + cPersonName + "' and cy.addate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31'";
                    break;
                case 9:        //成品分类
                    if (cPersonName == "配件")
                    {
                        sql = "and cy.cinvccode ='' and cy.addate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31'";
                    }
                    else if (cPersonName == "硬盘")
                    {
                        sql = "and cy.cinvccode ='H' and cy.addate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31'";
                    }
                    else
                    {
                        sql = "and cls.cInvCName ='" + cPersonName + "' and cy.addate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31'";
                    }
                    break;
            }
            dgvLoadInfo(sql);

        }

        private void dgvLoadInfo(string sql)
        {
            
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "declare @CurrentYr varchar(10)  \r\n";//业务员
            selectSQL += " declare @lastyear varchar(10)  \r\n";
            selectSQL += " set @CurrentYr=datepart(year,getdate())--今年  \r\n";
            selectSQL += " set @lastyear=@CurrentYr-1  \r\n";
            selectSQL += " select cy.aCsocode as '订单号',cy.ztcinvcode as '存货编码',(case when  isnull(cy.cinvccode ,'')='' then '配件' when cy.cinvccode ='H' then '硬盘' else cls.cInvCName  end) as '分类名称',cy.ztcinvName as '存货名称',cy.ztCinvstd as '规格型号',c.cPersonName as '业务员',b.ccusname as '客户简称',cy.ccuscode as '客户编码',cy.addate as '日期',cy.sales as '销售额',cy.Number as '数量',  \r\n";
            // selectSQL += " case when zid=0 and Yr = @lastyear   then Sales else 0 end as 'Sales2015',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/01'  then Sales else 0 end as '1月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/02'  then Sales else 0 end as '2月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/03'  then Sales else 0 end as '3月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/04'  then Sales else 0 end as '4月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/05'  then Sales else 0 end as '5月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/06'  then Sales else 0 end as '6月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/07'  then Sales else 0 end as '7月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/08'  then Sales else 0 end as '8月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/09'  then Sales else 0 end as '9月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/10'  then Sales else 0 end as '10月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/11'  then Sales else 0 end as '11月销售额',  \r\n";
            selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/12'  then Sales else 0 end as '12月销售额'  \r\n";
            //selectSQL += " case when zid=0 and Yr = @lastyear  then Costs else 0 end as 'Costs2015',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/01'  then Costs else 0 end as 'Costs01',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/02'  then Costs else 0 end as 'Costs02',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/03'  then Costs else 0 end as 'Costs03',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/04'  then Costs else 0 end as 'Costs04',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/05'  then Costs else 0 end as 'Costs05',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/06'  then Costs else 0 end as 'Costs06',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/07'  then Costs else 0 end as 'Costs07',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/08'  then Costs else 0 end as 'Costs08',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/09'  then Costs else 0 end as 'Costs09',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/10'  then Costs else 0 end as 'Costs10',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/11'  then Costs else 0 end as 'Costs11',  \r\n";
            //selectSQL += " case when zid=0 and Yr = @CurrentYr+''   and left(convert(varchar,adDate,111),7)=@CurrentYr+'/12'  then Costs else 0 end as 'Costs12'  \r\n";
            selectSQL += " from    Copy_sale_t_zhrs_v_CB_SG_zzc cy left join  Customer b on cy.ccuscode=b.ccuscode   \r\n";
            selectSQL += " left join Person c on b.ccuspperson=c.cPersonCode  \r\n";
            selectSQL += " left join InventoryClass cls on cy.cinvccode=cls.cInvCCode  \r\n";
            selectSQL += " where zid=0 " + sql + " order by cy.addate  \r\n";
            DataTable dt = new DataTable();
            dt = OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
            dgvDetailed.DataSource = dt;
            lblsum.Text = "记录数："+dt.Rows.Count;
            for (int i = 9; i < dgvDetailed.Columns.Count; i++)
            {
                dgvDetailed.Columns[i].DefaultCellStyle.Format = "#,###0.00";
                dgvDetailed.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }
            cbDetail_CheckedChanged(null, null);
        }

        private void toolClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void toolToExcel_Click(object sender, EventArgs e)
        {
            string s = cPersonName;
            try
            {
                this.Text = "订单明细" + "     正在导出，" + s + "，请稍候...";
                iLoginEx.ExportExcel(s + DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "_").Replace(".", "_").Replace(":", "_").Replace("/", "_").Replace(" ", "_"), s, dgvDetailed, 25);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常:" + ex.Message);
            }
            finally
            {
                this.Text = "订单明细";
            }
        }

        private void btndate_Click(object sender, EventArgs e)
        {
            iLoginEx.WriteUserProfileValue("SO321", "dtpbegind", dtpbegin.Value.ToString());
            iLoginEx.WriteUserProfileValue("SO321", "dtpendd", dtpend.Value.ToString());
            iLoginEx.WriteUserProfileValue("SO321", "cbDetail", cbDetail.Checked == true ? "1" : "0");
            if (cbDetail.Checked)
            {
                string sql = "";
                switch (zz_Index)
                {
                    case 10:       //业务员
                        sql = "and c.cPersonName ='" + cPersonName + "' and cy.addate between '"+dtpbegin.Text+"' and '"+dtpend.Text+"'";

                        break;
                    case 1:        //客户
                        sql = "and b.ccusname ='" + cPersonName + "' and cy.addate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'";
                        break;
                    case 9:        //成品分类
                        if (cPersonName == "配件")
                        {
                            sql = "and cy.cinvccode ='' and cy.addate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'";
                        }
                        else if (cPersonName == "硬盘")
                        {
                            sql = "and cy.cinvccode ='H' and cy.addate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'";
                        }
                        else
                        {
                            sql = "and cls.cInvCName ='" + cPersonName + "' and cy.addate between '" + dtpbegin.Text + "' and '" + dtpend.Text + "'";
                        }
                        break;
                }
                dgvLoadInfo(sql);
            }
            else
            {
                frmDetailed_Load(null, null);
            }
        }

        private void cbDetail_CheckedChanged(object sender, EventArgs e)
        {
            if (cbDetail.Checked)
            {
                dtpbegin.Enabled = true;
                dtpend.Enabled = true;
            }
            else
            {
                dtpbegin.Enabled = false;
                dtpend.Enabled = false;
            }
        }
    }
}
