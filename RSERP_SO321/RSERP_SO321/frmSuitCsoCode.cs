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
    public partial class frmSuitCsoCode : Form
    {

        public UTLoginEx.LoginEx iLoginEx = new LoginEx();//固定格式
        List<aCsocodeSales> i_lst = new List<aCsocodeSales>();//这个集合表示套装
        List<aCsocodeSales> i_lst_1 = new List<aCsocodeSales>();//这个集合表示销售额不一致的集合
        public frmSuitCsoCode()
        {
            InitializeComponent();
        }

        private void frmSuitCsoCode_Load(object sender, EventArgs e)
        {
            

        }

        private void btnCompare_Click(object sender, EventArgs e)
        {
            if (i_lst_1.Count>0)
            {
                i_lst_1.Clear();
            }
            OLEDBHelper.iLoginEx = iLoginEx;
            string selectSQL = "select a.Csocode as 'aCsocode', sum(a.iSum*a.iexchrate/(a.itaxrate/100+1)) as 'sales',sum(a.iPrice) as 'Costs'     \r\n";
            selectSQL += "  from (select b.Csocode,b.Cinvcode,k.cInvCCode,h.ccuscode,k.iPrice,k.CinvName,k.Cinvstd,        \r\n";
            selectSQL += "  b.iorderrowno,b.iquantity ,b.itaxrate,b.iSum,h.ddate,c.iexchrate,b.isosid from kcsaleoutH h         \r\n";
            selectSQL += "  left join kcsaleoutb k on h.id=k.id         \r\n";
            selectSQL += "  left join Sales_FHD_W b on k.iDLsID=b.iDLsID         \r\n";
            selectSQL += "  left join Sales_FHD_T c on b.DLID=c.DLID          \r\n";
            selectSQL += "  where h.ddate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' and k.cInvCCode like 'CB%')a group by Csocode   \r\n";
            OleDbDataReader dr = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
            while (dr.Read())
            {
                i_lst.Add(new aCsocodeSales()
                {
                    aCsocode = dr["aCsocode"].ToString(),
                    sales = Convert.ToDecimal(dr["sales"] == DBNull.Value ? 0 : dr["sales"]),
                });
            }
            dr.Close();
            OLEDBHelper.CloseCon();
            decimal sum_1 = 0;
            string aCsocode_1 = "不存在订单";
            foreach (aCsocodeSales u in i_lst)
            {
                selectSQL = "select count(*) from zhrs_t_SaleaCosts where aCsocode='" + u.aCsocode + "'";
                int n = Convert.ToInt32(OLEDBHelper.ExecuteScalar(selectSQL, CommandType.Text));
                if (n > 0)
                {
                    selectSQL = "select sum(sales) as 'sales_1',aCsocode from zhrs_t_SaleaCosts where aCsocode='" + u.aCsocode + "' and addate between '" + iLoginEx.iYear() + "-01-01' and '" + iLoginEx.iYear() + "-12-31' group by aCsocode";

                    OleDbDataReader dr_1 = OLEDBHelper.ExecuteReader(selectSQL, CommandType.Text);
                    if (dr_1.Read())
                    {
                        sum_1 = Convert.ToDecimal(dr_1["sales_1"] == DBNull.Value ? 0 : dr_1["sales_1"]);
                        aCsocode_1 = dr_1["aCsocode"].ToString();
                    }
                    dr_1.Close();
                    OLEDBHelper.CloseCon();
                    decimal dec = Convert.ToDecimal(u.sales.ToString("####0.00"));
                    decimal dec_1 = Convert.ToDecimal(sum_1.ToString("####0.00"));
                    if (!dec.Equals(dec_1))
                    {
                        aCsocodeSales ia = new aCsocodeSales();
                        ia.aCsocode = u.aCsocode;
                        ia.sales = u.sales;
                        ia.aCsocode_1 = aCsocode_1;
                        ia.sales_1 = sum_1;
                        ia.Difference = u.sales - sum_1;
                        i_lst_1.Add(ia);
                    }
                }
                else
                {
                    aCsocodeSales ia_1 = new aCsocodeSales();
                    ia_1.aCsocode = u.aCsocode;
                    ia_1.sales = u.sales;
                    ia_1.aCsocode_1 = aCsocode_1;
                    ia_1.sales_1 = sum_1;
                    i_lst_1.Add(ia_1);
                }
            }
            dgvSc.DataSource = i_lst_1;
            lblCount.Text = "记录数：" + i_lst_1.Count;
        }
    }
    public class aCsocodeSales 
    {
        public string aCsocode { get; set; }

        public decimal sales { get; set; }

        public string aCsocode_1 { get; set; }

        public decimal sales_1 { get; set; }

        public decimal Difference { get; set; }

    }
}
