namespace RSERP_SO321
{
    partial class frmDetailed
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDetailed));
            this.dgvDetailed = new System.Windows.Forms.DataGridView();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolToExcel = new System.Windows.Forms.ToolStripButton();
            this.toolClose = new System.Windows.Forms.ToolStripButton();
            this.cbDetail = new System.Windows.Forms.CheckBox();
            this.dtpbegin = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpend = new System.Windows.Forms.DateTimePicker();
            this.btndate = new System.Windows.Forms.Button();
            this.lblsum = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetailed)).BeginInit();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvDetailed
            // 
            this.dgvDetailed.AllowUserToAddRows = false;
            dataGridViewCellStyle4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.dgvDetailed.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvDetailed.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvDetailed.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDetailed.Location = new System.Drawing.Point(2, 85);
            this.dgvDetailed.Name = "dgvDetailed";
            this.dgvDetailed.ReadOnly = true;
            this.dgvDetailed.RowTemplate.Height = 23;
            this.dgvDetailed.Size = new System.Drawing.Size(707, 400);
            this.dgvDetailed.TabIndex = 0;
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolToExcel,
            this.toolClose});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(714, 40);
            this.toolStrip1.TabIndex = 113;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolToExcel
            // 
            this.toolToExcel.Image = ((System.Drawing.Image)(resources.GetObject("toolToExcel.Image")));
            this.toolToExcel.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolToExcel.Name = "toolToExcel";
            this.toolToExcel.Size = new System.Drawing.Size(41, 37);
            this.toolToExcel.Text = "Excel";
            this.toolToExcel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolToExcel.Click += new System.EventHandler(this.toolToExcel_Click);
            // 
            // toolClose
            // 
            this.toolClose.Image = ((System.Drawing.Image)(resources.GetObject("toolClose.Image")));
            this.toolClose.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolClose.Name = "toolClose";
            this.toolClose.Size = new System.Drawing.Size(36, 37);
            this.toolClose.Text = "退出";
            this.toolClose.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolClose.Click += new System.EventHandler(this.toolClose_Click);
            // 
            // cbDetail
            // 
            this.cbDetail.AutoSize = true;
            this.cbDetail.Location = new System.Drawing.Point(13, 44);
            this.cbDetail.Name = "cbDetail";
            this.cbDetail.Size = new System.Drawing.Size(15, 14);
            this.cbDetail.TabIndex = 114;
            this.cbDetail.UseVisualStyleBackColor = true;
            this.cbDetail.CheckedChanged += new System.EventHandler(this.cbDetail_CheckedChanged);
            // 
            // dtpbegin
            // 
            this.dtpbegin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpbegin.Location = new System.Drawing.Point(94, 37);
            this.dtpbegin.Name = "dtpbegin";
            this.dtpbegin.Size = new System.Drawing.Size(127, 21);
            this.dtpbegin.TabIndex = 115;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(35, 44);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 116;
            this.label1.Text = "开始日期";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(227, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(17, 12);
            this.label2.TabIndex = 117;
            this.label2.Text = "至";
            // 
            // dtpend
            // 
            this.dtpend.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpend.Location = new System.Drawing.Point(250, 38);
            this.dtpend.Name = "dtpend";
            this.dtpend.Size = new System.Drawing.Size(127, 21);
            this.dtpend.TabIndex = 118;
            // 
            // btndate
            // 
            this.btndate.Location = new System.Drawing.Point(383, 37);
            this.btndate.Name = "btndate";
            this.btndate.Size = new System.Drawing.Size(48, 23);
            this.btndate.TabIndex = 119;
            this.btndate.Text = "查询";
            this.btndate.UseVisualStyleBackColor = true;
            this.btndate.Click += new System.EventHandler(this.btndate_Click);
            // 
            // lblsum
            // 
            this.lblsum.AutoSize = true;
            this.lblsum.Location = new System.Drawing.Point(12, 70);
            this.lblsum.Name = "lblsum";
            this.lblsum.Size = new System.Drawing.Size(0, 12);
            this.lblsum.TabIndex = 120;
            // 
            // frmDetailed
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(714, 488);
            this.Controls.Add(this.lblsum);
            this.Controls.Add(this.btndate);
            this.Controls.Add(this.dtpend);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dtpbegin);
            this.Controls.Add(this.cbDetail);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.dgvDetailed);
            this.Name = "frmDetailed";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "订单明细";
            this.Load += new System.EventHandler(this.frmDetailed_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetailed)).EndInit();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDetailed;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton toolToExcel;
        private System.Windows.Forms.ToolStripButton toolClose;
        private System.Windows.Forms.CheckBox cbDetail;
        private System.Windows.Forms.DateTimePicker dtpbegin;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpend;
        private System.Windows.Forms.Button btndate;
        private System.Windows.Forms.Label lblsum;
    }
}