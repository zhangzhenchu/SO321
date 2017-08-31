namespace RSERP_SO321
{
    partial class frmCostError
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmCostError));
            this.dgvcostError = new System.Windows.Forms.DataGridView();
            this.lblsalescost = new System.Windows.Forms.Label();
            this.btnHD = new System.Windows.Forms.Button();
            this.btnIPC = new System.Windows.Forms.Button();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.tsmiExecl = new System.Windows.Forms.ToolStripButton();
            this.tsmiclose = new System.Windows.Forms.ToolStripButton();
            this.dgvsuit = new System.Windows.Forms.DataGridView();
            this.txtcsocode = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btncsocode = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblcso = new System.Windows.Forms.Label();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvcostError)).BeginInit();
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvsuit)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvcostError
            // 
            this.dgvcostError.AllowUserToAddRows = false;
            this.dgvcostError.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvcostError.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvcostError.Location = new System.Drawing.Point(3, 83);
            this.dgvcostError.Name = "dgvcostError";
            this.dgvcostError.ReadOnly = true;
            this.dgvcostError.RowTemplate.Height = 23;
            this.dgvcostError.Size = new System.Drawing.Size(420, 378);
            this.dgvcostError.TabIndex = 0;
            // 
            // lblsalescost
            // 
            this.lblsalescost.AutoSize = true;
            this.lblsalescost.Location = new System.Drawing.Point(271, 60);
            this.lblsalescost.Name = "lblsalescost";
            this.lblsalescost.Size = new System.Drawing.Size(71, 12);
            this.lblsalescost.TabIndex = 2;
            this.lblsalescost.Text = "总记录数：0";
            // 
            // btnHD
            // 
            this.btnHD.Location = new System.Drawing.Point(11, 49);
            this.btnHD.Name = "btnHD";
            this.btnHD.Size = new System.Drawing.Size(106, 23);
            this.btnHD.TabIndex = 3;
            this.btnHD.Text = "硬盘成本为零";
            this.btnHD.UseVisualStyleBackColor = true;
            this.btnHD.Click += new System.EventHandler(this.btnHD_Click);
            // 
            // btnIPC
            // 
            this.btnIPC.Location = new System.Drawing.Point(132, 49);
            this.btnIPC.Name = "btnIPC";
            this.btnIPC.Size = new System.Drawing.Size(121, 23);
            this.btnIPC.TabIndex = 4;
            this.btnIPC.Text = "IPC成本为零";
            this.btnIPC.UseVisualStyleBackColor = true;
            this.btnIPC.Click += new System.EventHandler(this.btnIPC_Click);
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiExecl,
            this.tsmiclose});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1104, 40);
            this.toolStrip1.TabIndex = 6;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // tsmiExecl
            // 
            this.tsmiExecl.Image = ((System.Drawing.Image)(resources.GetObject("tsmiExecl.Image")));
            this.tsmiExecl.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsmiExecl.Name = "tsmiExecl";
            this.tsmiExecl.Size = new System.Drawing.Size(41, 37);
            this.tsmiExecl.Text = "Execl";
            this.tsmiExecl.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsmiExecl.Click += new System.EventHandler(this.tsmiExecl_Click);
            // 
            // tsmiclose
            // 
            this.tsmiclose.Image = ((System.Drawing.Image)(resources.GetObject("tsmiclose.Image")));
            this.tsmiclose.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsmiclose.Name = "tsmiclose";
            this.tsmiclose.Size = new System.Drawing.Size(36, 37);
            this.tsmiclose.Text = "退出";
            this.tsmiclose.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.tsmiclose.Click += new System.EventHandler(this.tsmiclose_Click);
            // 
            // dgvsuit
            // 
            this.dgvsuit.AllowUserToAddRows = false;
            this.dgvsuit.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvsuit.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvsuit.Location = new System.Drawing.Point(6, 42);
            this.dgvsuit.Name = "dgvsuit";
            this.dgvsuit.ReadOnly = true;
            this.dgvsuit.RowTemplate.Height = 23;
            this.dgvsuit.Size = new System.Drawing.Size(657, 330);
            this.dgvsuit.TabIndex = 7;
            // 
            // txtcsocode
            // 
            this.txtcsocode.Location = new System.Drawing.Point(75, 19);
            this.txtcsocode.Name = "txtcsocode";
            this.txtcsocode.Size = new System.Drawing.Size(154, 21);
            this.txtcsocode.TabIndex = 8;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 9;
            this.label1.Text = "订单号";
            // 
            // btncsocode
            // 
            this.btncsocode.Location = new System.Drawing.Point(235, 17);
            this.btncsocode.Name = "btncsocode";
            this.btncsocode.Size = new System.Drawing.Size(41, 23);
            this.btncsocode.TabIndex = 10;
            this.btncsocode.Text = "查询";
            this.btncsocode.UseVisualStyleBackColor = true;
            this.btncsocode.Click += new System.EventHandler(this.btncsocode_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.lblcso);
            this.groupBox1.Controls.Add(this.dgvsuit);
            this.groupBox1.Controls.Add(this.btncsocode);
            this.groupBox1.Controls.Add(this.txtcsocode);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(429, 83);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(669, 378);
            this.groupBox1.TabIndex = 11;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "套装查询信息";
            // 
            // lblcso
            // 
            this.lblcso.AutoSize = true;
            this.lblcso.Location = new System.Drawing.Point(292, 27);
            this.lblcso.Name = "lblcso";
            this.lblcso.Size = new System.Drawing.Size(59, 12);
            this.lblcso.TabIndex = 11;
            this.lblcso.Text = "记录数：0";
            // 
            // richTextBox1
            // 
            this.richTextBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.richTextBox1.ForeColor = System.Drawing.Color.Red;
            this.richTextBox1.Location = new System.Drawing.Point(3, 467);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(1095, 40);
            this.richTextBox1.TabIndex = 12;
            this.richTextBox1.Text = "注：硬盘成本为零：有两种情况，一种是订单的成本为零，通过查询可得知订单的成本是否为零；第二种是订单的成本不为零，但是  硬盘成本查询为零。\nIPC成本为零：一种是" +
                "订单的成本为零，通过查询可得知订单的成本是否为零；第二种是订单的成本不为零，但是  IPC成本查询为零。";
            // 
            // frmCostError
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1104, 513);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.btnIPC);
            this.Controls.Add(this.btnHD);
            this.Controls.Add(this.lblsalescost);
            this.Controls.Add(this.dgvcostError);
            this.Name = "frmCostError";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "成本异常信息";
            this.Load += new System.EventHandler(this.frmCostError_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvcostError)).EndInit();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvsuit)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvcostError;
        private System.Windows.Forms.Label lblsalescost;
        private System.Windows.Forms.Button btnHD;
        private System.Windows.Forms.Button btnIPC;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton tsmiExecl;
        private System.Windows.Forms.ToolStripButton tsmiclose;
        private System.Windows.Forms.DataGridView dgvsuit;
        private System.Windows.Forms.TextBox txtcsocode;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btncsocode;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label lblcso;
        private System.Windows.Forms.RichTextBox richTextBox1;
    }
}