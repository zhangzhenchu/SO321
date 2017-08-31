using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using UTLoginEx;
using System.Data;
using System.Windows.Forms;
using RSERP_SO321.Models;

namespace RSERP_SO321.BLL
{
    public class ReportService
    {
        private static UTLoginEx.LoginEx iLoginEx = new LoginEx();
        //创建一个连接对象
        private static OleDbConnection con = null;

        #region 获取连接对象
        /// <summary>
        /// 获取连接对象
        /// </summary>
        public static OleDbConnection GetCon()
        {
            if (con == null || con.ConnectionString == "")
            {
                con = new OleDbConnection(iLoginEx.ConnString());
            }
            return con;
        }
        #endregion

        #region 打开连接
        /// <summary>
        /// 打开连接
        /// </summary>
        public static void OpenCon()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
        #endregion

        #region 关闭连接
        /// <summary>
        /// 关闭连接
        /// </summary>
        public static void CloseCon()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        #endregion


        #region 分装字段
        private static Report FieldInfo(OleDbDataReader dr)
        {
            Report r = new Report();
            r.ccusname = dr["ccusname"].ToString();
            r.cDCName = dr["cDCName"].ToString();
            r.cInvCCode = dr["cInvCCode"].ToString();
            r.cPersonName = dr["cPersonName"].ToString();
            r.District = dr["District"].ToString();
            r.ptype = dr["ptype"].ToString();
            r.GrossMargin01 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin01"] == DBNull.Value ? "0" : dr["GrossMargin01"]));
            r.GrossMargin02 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin02"] == DBNull.Value ? "0" : dr["GrossMargin02"]));
            r.GrossMargin03 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin03"] == DBNull.Value ? "0" : dr["GrossMargin03"]));
            r.GrossMargin04 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin04"] == DBNull.Value ? "0" : dr["GrossMargin04"]));
            r.GrossMargin05 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin05"] == DBNull.Value ? "0" : dr["GrossMargin05"]));
            r.GrossMargin06 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin06"] == DBNull.Value ? "0" : dr["GrossMargin06"]));
            r.GrossMargin07 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin07"] == DBNull.Value ? "0" : dr["GrossMargin07"]));
            r.GrossMargin08 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin08"] == DBNull.Value ? "0" : dr["GrossMargin08"]));
            r.GrossMargin09 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin09"] == DBNull.Value ? "0" : dr["GrossMargin09"]));
            r.GrossMargin10 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin10"] == DBNull.Value ? "0" : dr["GrossMargin10"]));
            r.GrossMargin11 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin11"] == DBNull.Value ? "0" : dr["GrossMargin11"]));
            r.GrossMargin12 = Convert.ToDecimal(String.Format("{0:F}", dr["GrossMargin12"] == DBNull.Value ? "0" : dr["GrossMargin12"]));
            r.GrossMargin2015 = Convert.ToDecimal(String.Format("{0:F}",dr["GrossMargin2015"] == DBNull.Value ? "0" : dr["GrossMargin2015"]));
            r.Sales01 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales01"] == DBNull.Value ? "0" : dr["Sales01"]));
            r.Sales02 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales02"] == DBNull.Value ? "0" : dr["Sales02"]));
            r.Sales03 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales03"] == DBNull.Value ? "0" : dr["Sales03"]));
            r.Sales04 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales04"] == DBNull.Value ? "0" : dr["Sales04"]));
            r.Sales05 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales05"] == DBNull.Value ? "0" : dr["Sales05"]));
            r.Sales06 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales06"] == DBNull.Value ? "0" : dr["Sales06"]));
            r.Sales07 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales07"] == DBNull.Value ? "0" : dr["Sales07"]));
            r.Sales08 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales08"] == DBNull.Value ? "0" : dr["Sales08"]));
            r.Sales09 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales09"] == DBNull.Value ? "0" : dr["Sales09"]));
            r.Sales10 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales10"] == DBNull.Value ? "0" : dr["Sales10"]));
            r.Sales11 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales11"] == DBNull.Value ? "0" : dr["Sales11"]));
            r.Sales12 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales12"] == DBNull.Value ? "0" : dr["Sales12"]));
            r.Sales2015 = Convert.ToDecimal(String.Format("{0:F}", dr["Sales2015"] == DBNull.Value ? "0" : dr["Sales2015"]));

            r.YeaSales =Convert.ToDecimal(r.Sales01+r.Sales02+r.Sales03+r.Sales04+r.Sales05+r.Sales06+r.Sales07+r.Sales08+r.Sales09+r.Sales10+r.Sales11+r.Sales12); //Convert.ToDecimal(dr["Sales12"]) + Convert.ToDecimal(dr["Sales11"]) + Convert.ToDecimal(dr["Sales10"]) + Convert.ToDecimal(dr["Sales09"]) + Convert.ToDecimal(dr["Sales08"]) + Convert.ToDecimal(dr["Sales07"]) + Convert.ToDecimal(dr["Sales06"]) + Convert.ToDecimal(dr["Sales05"]) + Convert.ToDecimal(dr["Sales04"]) + Convert.ToDecimal(dr["Sales03"]) + Convert.ToDecimal(dr["Sales02"]) + Convert.ToDecimal(dr["Sales01"]);
            r.YeaGrossMargin = Convert.ToDecimal(r.GrossMargin01 + r.GrossMargin02 + r.GrossMargin03 + r.GrossMargin04 + r.GrossMargin05 + r.GrossMargin06 + r.GrossMargin07 + r.GrossMargin08 + r.GrossMargin09 + r.GrossMargin10 + r.GrossMargin11 + r.GrossMargin12);// Convert.ToDecimal(dr["GrossMargin12"]) + Convert.ToDecimal(dr["GrossMargin11"]) + Convert.ToDecimal(dr["GrossMargin10"]) + Convert.ToDecimal(dr["GrossMargin09"]) + Convert.ToDecimal(dr["GrossMargin08"]) + Convert.ToDecimal(dr["GrossMargin07"]) + Convert.ToDecimal(dr["GrossMargin06"]) + Convert.ToDecimal(dr["GrossMargin05"]) + Convert.ToDecimal(dr["GrossMargin04"]) + Convert.ToDecimal(dr["GrossMargin03"]) + Convert.ToDecimal(dr["GrossMargin02"]) + Convert.ToDecimal(dr["GrossMargin01"]);
            
            //GMYearGMOneGMTowGMThreeGMFourGMFiveGMSixGMSeverGMEightGMNineGMTenGMElevenGMTwelve
          
            #region 毛利率
            if (Convert.ToInt32(r.GrossMargin2015) == 0 || Convert.ToInt32(r.Sales2015) == 0)
                r.GMYear = Convert.ToDecimal(0.00);
            else
                r.GMYear = Convert.ToDecimal(dr["GrossMargin2015"]) / Convert.ToDecimal(dr["Sales2015"]) * 100;
            if (Convert.ToInt32(r.GrossMargin01) == 0 || Convert.ToInt32(r.Sales01) == 0)
                r.GMOne = Convert.ToDecimal(0.00);
            else
                r.GMOne = Convert.ToDecimal(dr["GrossMargin01"]) / Convert.ToDecimal(dr["Sales01"]) * 100;
            if (Convert.ToInt32(r.GrossMargin02) == 0 || Convert.ToInt32(r.Sales02) == 0)
                r.GMTow = Convert.ToDecimal(0.00);
            else
                r.GMTow = Convert.ToDecimal(dr["GrossMargin02"]) / Convert.ToDecimal(dr["Sales02"]) * 100;
            if (Convert.ToInt32(r.GrossMargin03) == 0 || Convert.ToInt32(r.Sales03) == 0)
                r.GMThree = Convert.ToDecimal(0.00);
            else
                r.GMThree = Convert.ToDecimal(dr["GrossMargin03"]) / Convert.ToDecimal(dr["Sales03"]) * 100;
            if (Convert.ToInt32(r.GrossMargin04) == 0 || Convert.ToInt32(r.Sales04) == 0)
                r.GMFour = Convert.ToDecimal(0.00);
            else
                r.GMFour = Convert.ToDecimal(dr["GrossMargin04"]) / Convert.ToDecimal(dr["Sales04"]) * 100;
            if (Convert.ToInt32(r.GrossMargin05) == 0 || Convert.ToInt32(r.Sales05) == 0)
                r.GMFive = Convert.ToDecimal(0.00);
            else
                r.GMFive = Convert.ToDecimal(dr["GrossMargin05"]) / Convert.ToDecimal(dr["Sales05"]) * 100;
            if (Convert.ToInt32(r.GrossMargin06) == 0 || Convert.ToInt32(r.Sales06) == 0)
                r.GMSix = Convert.ToDecimal(0.00);
            else
                r.GMSix = Convert.ToDecimal(dr["GrossMargin06"]) / Convert.ToDecimal(dr["Sales06"]) * 100;
            if (Convert.ToInt32(r.GrossMargin07) == 0 || Convert.ToInt32(r.Sales07) == 0)
                r.GMSever = Convert.ToDecimal(0.00);
            else
                r.GMSever = Convert.ToDecimal(dr["GrossMargin07"]) / Convert.ToDecimal(dr["Sales07"]) * 100;
            if (Convert.ToInt32(r.GrossMargin08) == 0 || Convert.ToInt32(r.Sales08) == 0)
                r.GMEight = Convert.ToDecimal(0.00);
            else
                r.GMEight = Convert.ToDecimal(dr["GrossMargin08"]) / Convert.ToDecimal(dr["Sales08"]) * 100;
            if (Convert.ToInt32(r.GrossMargin09) == 0 || Convert.ToInt32(r.Sales09) == 0)
                r.GMNine = Convert.ToDecimal(0.00);
            else
                r.GMNine = Convert.ToDecimal(dr["GrossMargin09"]) / Convert.ToDecimal(dr["Sales09"]) * 100;
            if (Convert.ToInt32(r.GrossMargin10) == 0 || Convert.ToInt32(r.Sales10) == 0)
                r.GMTen = Convert.ToDecimal(0.00);
            else
                r.GMTen = Convert.ToDecimal(dr["GrossMargin10"]) / Convert.ToDecimal(dr["Sales10"]) * 100;
            if (Convert.ToInt32(r.GrossMargin11) == 0 || Convert.ToInt32(r.Sales11) == 0)
                r.GMEleven = Convert.ToDecimal(0.00);
            else
                r.GMEleven = Convert.ToDecimal(dr["GrossMargin11"]) / Convert.ToDecimal(dr["Sales11"]) * 100;
            if (Convert.ToInt32(r.GrossMargin12) == 0 || Convert.ToInt32(r.Sales12) == 0)
                r.GMTwelve = Convert.ToDecimal(0.00);
            else
                r.GMTwelve = Convert.ToDecimal(dr["GrossMargin12"]) / Convert.ToDecimal(dr["Sales12"]) * 100;
            #endregion
           
         
            return r;
        }
        #endregion

        #region 获取汇总信息
        /// <summary>
        /// 获取汇总信息
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetSummaryInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }



        #endregion


        #region 国家+类型+系列+路数
        /// <summary>
        /// 国家+类型+系列+路数
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCTNSInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊查询 国家+类型+系列+路数
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCTNSInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetCTNSInfoAll(iiLoginEx, tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0 ||
                       p.cDCName.IndexOf(r.cDCName) >= 0);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }


        #endregion


        #region 国家+类型+系列
        /// <summary>
        /// 国家+类型+系列
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCTSInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }


        /// <summary>
        /// 模糊查询 国家+类型+系列
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCTSInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetCTSInfoAll(iiLoginEx, tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0 ||
                       p.cDCName.IndexOf(r.cDCName) >= 0);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }

        #endregion



        #region 国家+类型
        /// <summary>
        /// 国家+类型
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCTInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        /// <summary>
        /// 模糊查询 国家+类型
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCTInfoAll(LoginEx iiLoginEx, Report r,string tableName) 
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetCTInfoAll(iiLoginEx, tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0 ||
                       p.cDCName.IndexOf(r.cDCName) >= 0);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }

        #endregion

      
        #region 地区类

        #region 地区
        /// <summary>
        ///  地区
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetRegionInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        #endregion

        #region 模糊查询 地区
        /// <summary>
        /// 模糊查询 地区
        /// </summary>
        /// <param name="iiloginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetFindRegionInfoAllConn(LoginEx iiloginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();
            rep = GetRegionInfoAll(iiloginEx,tableName).FindAll((p) => p.District.IndexOf(r.District) >= 0);
            return rep;
        }
        #endregion


        #region 地区+国家/城市
        /// <summary>
        ///  地区+国家/城市
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetRCCInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        #endregion


        #region 筛选地区+国家/城市
        /// <summary>
        /// 筛选 地区+国家/城市
        /// </summary>
        /// <param name="iiloginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetFindRCCInfoAllConn(LoginEx iiloginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();
            rep = GetRCCInfoAll(iiloginEx,tableName).FindAll((p) => p.District.IndexOf(r.District) >= 0);
            return rep;
        }

        /// <summary>
        /// 模糊查询城市
        /// </summary>
        /// <param name="iiloginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectRCCInfoAllConn(LoginEx iiloginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetRCCInfoAll(iiloginEx,tableName).FindAll((p) =>
                       p.cDCName.IndexOf(r.cDCName) >= 0
                       ||p.District.IndexOf(r.District)>=0);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;
        }


        #endregion


        #region 地区+国家/城市+客户
        /// <summary>
        ///  地区+国家/城市+客户
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetRCCCInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        #region 分组国内,欧洲，美洲，亚洲
        /// <summary>
        /// 分组国内,欧洲，美洲，亚洲
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <returns></returns>
        public static List<Report> GroupByRCCCGroupbytype(LoginEx iiLoginEx, string groupbytype,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from " + tableName + "" + groupbytype + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        } 
        #endregion

        #region 地区国内分组  不用
        /// <summary>
        /// 地区国内分组
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <returns></returns>
        public static List<Report> GroupByRCCCDistrict(LoginEx iiLoginEx, string district)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  zhrs_t_RegioncountryCitycustomer where District like '%" + district + "%'";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        
        #endregion

        #endregion

        #region 筛选地区+国家/城市+客户 不用
        /// <summary>
        /// 筛选 地区+国家/城市+客户
        /// </summary>
        /// <param name="iiloginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetFindRCCCInfoAllConn(LoginEx iiloginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetRCCCInfoAll(iiloginEx, tableName).FindAll((p) => p.District.IndexOf(r.District) >= 0);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;
        }

        /// <summary>
        /// 模糊查询 地区+国家/城市+客户
        /// </summary>
        /// <param name="iiloginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectRCCCInfoAllConn(LoginEx iiloginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetRCCCInfoAll(iiloginEx,tableName).FindAll((p) => p.ccusname.IndexOf(r.ccusname) >= 0
                       || p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                       || p.cPersonName.IndexOf(r.cPersonName) >= 0
                       || p.cDCName.IndexOf(r.cDCName) >= 0
                       || p.District.IndexOf(r.District) >= 0);
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;
        }
        #endregion 
      
        #endregion

        #region 业务员
        /// <summary>
        ///  业务员
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetSalesmanInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        /// <summary>
        /// 模糊业务员
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectSalesmanInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetSalesmanInfoAll(iiLoginEx,tableName).FindAll((p) => p.cPersonName.IndexOf(r.cPersonName) >= 0 
                       );
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }

        #endregion

        #region 套餐+类型+系列+路数
        /// <summary>
        ///  套餐+类型+系列+路数
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetPTNSInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 套餐+类型+系列+路数
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectPTNSInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetPTNSInfoAll(iiLoginEx,tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                       );
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion

        #region 套餐+类型+系列
        /// <summary>
        ///  套餐+类型+系列
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetPTSInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 套餐+类型+系列
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectPTSInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetPTSInfoAll(iiLoginEx,tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                       );
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion

        #region 套餐+类型
        /// <summary>
        /// 套餐+类型
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetPTInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 套餐+类型
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectPTInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetPTInfoAll(iiLoginEx, tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                       );
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }

        #endregion

        #region 套餐
        /// <summary>
        /// 套餐
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetPInfoAll(LoginEx iiLoginEx,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        /// <summary>
        /// 模糊套餐
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectPInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetPInfoAll(iiLoginEx, tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                       );
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }

        #endregion


        #region 客户+套餐+类型+系列+路数
        /// <summary>
        /// 客户+套餐+类型+系列+路数
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCTPSNInfoAll(LoginEx iiLoginEx, string groupbytype,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + " " + groupbytype + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 客户+套餐+类型+系列+路数
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCTPSNInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetCTPSNInfoAll(iiLoginEx, "", tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                    || p.ccusname.IndexOf(r.ccusname) >= 0
                    || p.cPersonName.IndexOf(r.cPersonName) >= 0);
                   
            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion


        #region 客户+套餐+类型+系列
        /// <summary>
        /// 客户+套餐+类型+系列
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCPTSInfoAll(LoginEx iiLoginEx, string groupbytype,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + " " + groupbytype + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }
        /// <summary>
        /// 模糊 客户+套餐+类型+系列
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCPTSInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetCPTSInfoAll(iiLoginEx, "", tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                    || p.ccusname.IndexOf(r.ccusname) >= 0
                    || p.cPersonName.IndexOf(r.cPersonName) >= 0);

            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion


        #region 客户+套餐+类型
        /// <summary>
        /// 客户+套餐+类型
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCPTInfoAll(LoginEx iiLoginEx, string groupbytype,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + " " + groupbytype + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                OleDbDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    Report r = FieldInfo(dr);
                    lst.Add(r);

                }
                dr.Close();
                CloseCon();

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 客户+套餐+类型
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCPTInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();

            try
            {
                rep = GetCPTInfoAll(iiLoginEx,"",tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                    || p.ccusname.IndexOf(r.ccusname) >= 0
                    || p.cPersonName.IndexOf(r.cPersonName) >= 0);

            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion


        #region 客户+套餐
        /// <summary>
        /// 客户+套餐
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCPInfoAll(LoginEx iiLoginEx, string groupbytype,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + " " + groupbytype + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                using (OleDbDataReader dr = com.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Report r = FieldInfo(dr);
                        lst.Add(r);

                    }
                    dr.Close();
                    CloseCon();
                }

               

            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 客户+套餐
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCPInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();
            try
            {
                rep = GetCPInfoAll(iiLoginEx, "", tableName).FindAll((p) => p.cInvCCode.IndexOf(r.cInvCCode) >= 0
                    || p.ccusname.IndexOf(r.ccusname) >= 0
                    || p.cPersonName.IndexOf(r.cPersonName) >= 0);

            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion


        #region 客户
        /// <summary>
        /// 客户
        /// </summary>
        /// <returns></returns>
        public static List<Report> GetCustomerInfoAll(LoginEx iiLoginEx, string groupbytype,string tableName)
        {
            iLoginEx = iiLoginEx;
            List<Report> lst = new List<Report>();
            try
            {

                OleDbConnection con = GetCon();
                OpenCon();
                string sql = "select * from  " + tableName + " " + groupbytype + "";
                OleDbCommand com = new OleDbCommand(sql, con);
                com.CommandTimeout = 3600;
                using (OleDbDataReader dr = com.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Report r = FieldInfo(dr);
                        lst.Add(r);

                    }
                    dr.Close();
                    CloseCon();
                }
                


            }
            catch (Exception ex)
            {

                MessageBox.Show("错误：" + ex.Message);
            }
            return lst;

        }

        /// <summary>
        /// 模糊 客户
        /// </summary>
        /// <param name="iiLoginEx"></param>
        /// <param name="r"></param>
        /// <returns></returns>
        public static List<Report> GetSelectCustomerInfoAll(LoginEx iiLoginEx, Report r,string tableName)
        {
            List<Report> rep = new List<Report>();
            try
            {
                rep = GetCustomerInfoAll(iiLoginEx, "", tableName).FindAll((p) => 
                     p.ccusname.IndexOf(r.ccusname) >= 0
                    || p.cPersonName.IndexOf(r.cPersonName) >= 0);

            }
            catch (Exception ex)
            {

                MessageBox.Show("异常：" + ex.Message);
            }
            return rep;

        }
        #endregion


    }
}
