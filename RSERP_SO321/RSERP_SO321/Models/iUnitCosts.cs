using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RSERP_SO321.Models
{
   public class iUnitCosts
    {
       /// <summary>
       /// 自增标识
       /// </summary>
       public int id { get; set; }
       /// <summary>
       /// 标识 0,1
       /// </summary>
       public int zid { get; set; }
       /// <summary>
       /// 年份
       /// </summary>
       public string  Yr { get; set; }
       /// <summary>
       /// 套装销售额
       /// </summary>
       public decimal sales { get; set; }
       /// <summary>
       /// 套装成本
       /// </summary>
       public decimal Costs { get; set; }
       /// <summary>
       /// 套装数量
       /// </summary>
       public decimal Number { get; set; }
       /// <summary>
       /// 含税金额
       /// </summary>
       public decimal iSum { get; set; }
       /// <summary>
       /// 订单号
       /// </summary>
       public string aCsocode { get; set; }
       /// <summary>
       /// 子件存货编码
       /// </summary>
       public string ztCinvcode { get; set; }
       /// <summary>
       /// 存货大类编码
       /// </summary>
       public string cInvCCode { get; set; }
       /// <summary>
       /// 存货名称
       /// </summary>
       public string ztCinvName { get; set; }
       /// <summary>
       /// 存货规格型号
       /// </summary>
       public string ztCinvstd { get; set; }
       /// <summary>
       /// 日期
       /// </summary>
       public DateTime addate { get; set; }
       /// <summary>
       /// 客户简称
       /// </summary>
       public string ccuscode { get; set; }
       /// <summary>
       /// 子表主标识
       /// </summary>
       public int isosid { get; set; }
       /// <summary>
       /// 汇率
       /// </summary>
       public decimal iexchrate { get; set; }
       /// <summary>
       /// 税率
       /// </summary>
       public decimal itaxrate { get; set; }
       /// <summary>
       /// 母件存货编码
       /// </summary>
       public string ZtCinvcodes { get; set; }
    }
   public class Inventory 
   {
       /// <summary>
       ///  硬盘存货编码
       /// </summary>
       public string In_cinvcode { get; set; }
       /// <summary>
       /// 硬盘存货大类编码
       /// </summary>
       public string In_cInvCCode { get; set; }
       /// <summary>
       /// 硬盘成本
       /// </summary>
       public decimal In_iInvRCost { get; set; }
   }
   public class RecordInList 
   {
       /// <summary>
       /// IPC的存货编码
       /// </summary>
       public string Re_cInvCode { get; set; }
       /// <summary>
       /// IPC存货大类编码
       /// </summary>
       public string Re_cInvCcode { get; set; }
       /// <summary>
       /// IPC每个月平均成本
       /// </summary>
       public decimal iUnitCost01 { get; set; }
       public decimal iUnitCost02 { get; set; }
       public decimal iUnitCost03 { get; set; }
       public decimal iUnitCost04 { get; set; }
       public decimal iUnitCost05 { get; set; }
       public decimal iUnitCost06 { get; set; }
       public decimal iUnitCost07 { get; set; }
       public decimal iUnitCost08 { get; set; }
       public decimal iUnitCost09 { get; set; }
       public decimal iUnitCost10 { get; set; }
       public decimal iUnitCost11 { get; set; }
       public decimal iUnitCost12 { get; set; }

   }
   public class zzcSO_SOAddSeriesInfo 
   {
       /// <summary>
       /// 订单号
       /// </summary>
       public string S_Csocode { get; set; }
       /// <summary>
       /// 母件存货编码
       /// </summary>
       public string S_Cinvcodes { get; set; }
       /// <summary>
       /// 子件存货编码
       /// </summary>
       public string S_Cinvcode { get; set; }
       /// <summary>
       /// 子件存货名称
       /// </summary>
       public string S_CinvName { get; set; }
       /// <summary>
       /// 子件规格型号
       /// </summary>
       public string S_Cinvstd { get; set; }
       /// <summary>
       /// 子件单位
       /// </summary>
       public string S_CcomunitName { get; set; }
       /// <summary>
       /// 子件使用数量
       /// </summary>
       public decimal S_BaseQtyND { get; set; }
       /// <summary>
       /// 子件使用数量*母件数量
       /// </summary>
       public decimal S_Ciquantity { get; set; }
       /// <summary>
       /// 含税单价
       /// </summary>
       public decimal S_SiQuotedPrice { get; set; }
       /// <summary>
       /// 子件存货大类编码
       /// </summary>
       public string S_cInvCCode { get; set; }     


   }
}
