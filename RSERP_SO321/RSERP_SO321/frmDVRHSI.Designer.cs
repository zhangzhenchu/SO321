namespace RSERP_SO321
{
    partial class frmDVRHSI
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDVRHSI));
            this.dgvDVRHSI = new System.Windows.Forms.DataGridView();
            this.tsMain = new System.Windows.Forms.ToolStrip();
            this.tsmiExcel = new System.Windows.Forms.ToolStripButton();
            this.tsmiClose = new System.Windows.Forms.ToolStripButton();
            this.gbinfo = new System.Windows.Forms.GroupBox();
            this.btnQuery = new System.Windows.Forms.Button();
            this.txtQuery_DVRHSI = new System.Windows.Forms.TextBox();
            this.btnClear = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDVRHSI)).BeginInit();
            this.tsMain.SuspendLayout();
            this.gbinfo.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvDVRHSI
            // 
            this.dgvDVRHSI.AllowUserToAddRows = false;
            this.dgvDVRHSI.AllowUserToDeleteRows = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.dgvDVRHSI.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvDVRHSI.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvDVRHSI.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDVRHSI.Location = new System.Drawing.Point(3, 110);
            this.dgvDVRHSI.Name = "dgvDVRHSI";
            this.dgvDVRHSI.ReadOnly = true;
            this.dgvDVRHSI.RowTemplate.Height = 23;
            this.dgvDVRHSI.Size = new System.Drawing.Size(1023, 393);
            this.dgvDVRHSI.TabIndex = 0;
            // 
            // tsMain
            // 
            this.tsMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiExcel,
            this.tsmiClose});
            this.tsMain.Location = new System.Drawing.Point(0, 0);
            this.tsMain.Name = "tsMain";
            this.tsMain.Size = new System.Drawing.Size(1027, 40);
            this.tsMain.TabIndex = 113;
            this.tsMain.Text = "toolStrip1";
            // 
            // tsmiExcel
            // 
            this.tsmiExcel.Image = ((System.Drawing.Image)(resources.GetObject("tsmiExcel.Image")));
            this.tsmiExcel.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsmiExcel.Name = "tsmiExcel";
            this.tsmiExcel.Size = new System.Drawing.Size(41, 37);
            this.tsmiExcel.Text = "Excel";
            this.tsmiExcel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsmiExcel.Click += new System.EventHandler(this.tsmiExcel_Click);
            // 
            // tsmiClose
            // 
            this.tsmiClose.Image = ((System.Drawing.Image)(resources.GetObject("tsmiClose.Image")));
            this.tsmiClose.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsmiClose.Name = "tsmiClose";
            this.tsmiClose.Size = new System.Drawing.Size(36, 37);
            this.tsmiClose.Text = "关闭";
            this.tsmiClose.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsmiClose.Click += new System.EventHandler(this.tsmiClose_Click);
            // 
            // gbinfo
            // 
            this.gbinfo.Controls.Add(this.btnClear);
            this.gbinfo.Controls.Add(this.btnQuery);
            this.gbinfo.Controls.Add(this.txtQuery_DVRHSI);
            this.gbinfo.Location = new System.Drawing.Point(7, 46);
            this.gbinfo.Name = "gbinfo";
            this.gbinfo.Size = new System.Drawing.Size(396, 58);
            this.gbinfo.TabIndex = 114;
            this.gbinfo.TabStop = false;
            this.gbinfo.Text = "请输入筛选条件(可模糊查询)";
            // 
            // btnQuery
            // 
            this.btnQuery.Location = new System.Drawing.Point(283, 23);
            this.btnQuery.Name = "btnQuery";
            this.btnQuery.Size = new System.Drawing.Size(49, 23);
            this.btnQuery.TabIndex = 1;
            this.btnQuery.Text = "查询";
            this.btnQuery.UseVisualStyleBackColor = true;
            this.btnQuery.Click += new System.EventHandler(this.btnQuery_Click);
            // 
            // txtQuery_DVRHSI
            // 
            this.txtQuery_DVRHSI.Location = new System.Drawing.Point(6, 25);
            this.txtQuery_DVRHSI.Name = "txtQuery_DVRHSI";
            this.txtQuery_DVRHSI.Size = new System.Drawing.Size(271, 21);
            this.txtQuery_DVRHSI.TabIndex = 0;
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(338, 23);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(49, 23);
            this.btnClear.TabIndex = 2;
            this.btnClear.Text = "重置";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btn1_Click);
            // 
            // frmDVRHSI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1027, 505);
            this.Controls.Add(this.gbinfo);
            this.Controls.Add(this.tsMain);
            this.Controls.Add(this.dgvDVRHSI);
            this.Name = "frmDVRHSI";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "拆套装统计分析表";
            this.Load += new System.EventHandler(this.frmDVRHSI_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDVRHSI)).EndInit();
            this.tsMain.ResumeLayout(false);
            this.tsMain.PerformLayout();
            this.gbinfo.ResumeLayout(false);
            this.gbinfo.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDVRHSI;
        private System.Windows.Forms.ToolStrip tsMain;
        private System.Windows.Forms.ToolStripButton tsmiExcel;
        private System.Windows.Forms.ToolStripButton tsmiClose;
        private System.Windows.Forms.GroupBox gbinfo;
        private System.Windows.Forms.Button btnQuery;
        private System.Windows.Forms.TextBox txtQuery_DVRHSI;
        private System.Windows.Forms.Button btnClear;
    }
}