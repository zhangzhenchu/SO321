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
    public partial class frmRemoveTheSuit : Form
    {
        public UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        public frmRemoveTheSuit()
        {
            InitializeComponent();
        }

        private void frmRemoveTheSuit_Load(object sender, EventArgs e)
        {
            SLbAccID.Text = iLoginEx.AccID(); //固定格式
            SLbAccName.Text = iLoginEx.AccName();//固定格式
            SLbServer.Text = iLoginEx.DBServerHost();//固定格式
            SLbYear.Text = iLoginEx.iYear();//固定格式
            SLbUser.Text = iLoginEx.UserId() + "[" + iLoginEx.UserName() + "]";//固定格式
            dgvLoadInfo();
        }

        private void dgvLoadInfo()
        {
            string sql = "";
            if (String.IsNullOrEmpty(txtCsoCode.Text.Trim()) && String.IsNullOrEmpty(txtZtcinvcodes.Text.Trim()) && String.IsNullOrEmpty(txtisoid.Text.Trim()))
            {
                sql = " where zs.cinvCCode not like 'CB%' and Yr='" + iLoginEx.iYear() + "' ";
            }
            else if (!String.IsNullOrEmpty(txtCsoCode.Text.Trim()) && String.IsNullOrEmpty(txtZtcinvcodes.Text.Trim()) && String.IsNullOrEmpty(txtisoid.Text.Trim()))
            {
                sql = " where zs.cinvCCode not like 'CB%' and Yr='" + iLoginEx.iYear() + "' and aCsocode='" + txtCsoCode.Text.Trim() + "'";
            }
            else if (!String.IsNullOrEmpty(txtCsoCode.Text.Trim()) && !String.IsNullOrEmpty(txtZtcinvcodes.Text.Trim()) && String.IsNullOrEmpty(txtisoid.Text.Trim()))
            {
                sql = " where zs.cinvCCode not like 'CB%' and Yr='" + iLoginEx.iYear() + "' and aCsocode='" + txtCsoCode.Text.Trim() + "' and ZtCinvcodes='" + txtZtcinvcodes.Text.Trim() + "'";

            }
            else if (!String.IsNullOrEmpty(txtCsoCode.Text.Trim()) && !String.IsNullOrEmpty(txtZtcinvcodes.Text.Trim()) && !String.IsNullOrEmpty(txtisoid.Text.Trim()))
            {
               sql = " where zs.cinvCCode not like 'CB%' and Yr='" + iLoginEx.iYear() + "' and aCsocode='" + txtCsoCode.Text.Trim() + "' and ZtCinvcodes='" + txtZtcinvcodes.Text.Trim() + "' and isosid=" + txtisoid.Text.Trim() + " ";

            }
        
            DataTable dt = new DataTable();
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "select aCsocode as '订单号',ZtCinvcodes as '母件存货编码',addate as '日期',sales as '销售额',Costs as '成本',Number as '数量',isosid as '唯一的标识', ztCinvcode as '子件存货编码',zs.cinvCCode as '分类编码',ztCinvName as '存货名称',ic.cinvCName as '分类名称',  \r\n";
            selectSQL += " ztCinvstd as '规格型号',zid as '类别',Yr as '年份'  \r\n";
            selectSQL += " from zhrs_t_SaleaCosts zs  left join   \r\n";
            selectSQL += " Inventoryclass ic on zs.cinvCCode=ic.cinvccode   \r\n";
            selectSQL += " " + sql + "  \r\n";
            dt = OLEDBHelper.GetDataTalbe(selectSQL, CommandType.Text);
            dgvRemoveTheSuit.DataSource = dt;
            tsslSqlCount.Text = "记录数：" + dt.Rows.Count.ToString();
            dgvRemoveTheSuit.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgvRemoveTheSuit.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            for (int i = 3; i < 6; i++)
            {
                dgvRemoveTheSuit.Columns[i].DefaultCellStyle.Format = "#,###0.0000";
                dgvRemoveTheSuit.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }
        }

        private void btnCsocode_Click(object sender, EventArgs e)
        {
            dgvLoadInfo();
        }

        private void btnclaer_Click(object sender, EventArgs e)
        {
            txtCsoCode.Clear();
            txtisoid.Clear();
            txtZtcinvcodes.Clear();
        }

        public bool CellMouseDown = false;
        private void dgvRemoveTheSuit_CellMouseDown(object sender, DataGridViewCellMouseEventArgs e)
        {
            CellMouseDown = true;
            tsslComputing.Text = "";
        }

        private void dgvRemoveTheSuit_CellMouseMove(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                decimal SelectTotal = 0;
                int selectedCellCount = dgvRemoveTheSuit.GetCellCount(DataGridViewElementStates.Selected);
                if (selectedCellCount > 0 && CellMouseDown)
                {
                    SelectTotal = 0;
                    for (int i = 0; i < selectedCellCount; i++)
                    {
                        SelectTotal += Convert.ToDecimal(Convert.ToString(Convert.IsDBNull(dgvRemoveTheSuit.SelectedCells[i].Value) ? "" : dgvRemoveTheSuit.SelectedCells[i].Value) == "" ? "0" : dgvRemoveTheSuit.SelectedCells[i].Value.ToString());
                    }
                    tsslComputing.Text = string.Format("{0:N2}", SelectTotal);
                }
            }
            catch
            {
            }
        }

        private void dgvRemoveTheSuit_CellMouseUp(object sender, DataGridViewCellMouseEventArgs e)
        {
            dgvRemoveTheSuit_CellMouseMove(sender, e);
            CellMouseDown = false;
        }

        
    }
}
