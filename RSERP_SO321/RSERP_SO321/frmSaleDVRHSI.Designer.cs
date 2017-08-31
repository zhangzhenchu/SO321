namespace RSERP_SO321
{
    partial class frmSaleDVRHSI
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
            this.cbDVR = new System.Windows.Forms.CheckBox();
            this.cbIPC = new System.Windows.Forms.CheckBox();
            this.cbHD = new System.Windows.Forms.CheckBox();
            this.cbSp = new System.Windows.Forms.CheckBox();
            this.dtpbegin = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpend = new System.Windows.Forms.DateTimePicker();
            this.btnfind = new System.Windows.Forms.Button();
            this.lblDVR = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblSp = new System.Windows.Forms.Label();
            this.lblHD = new System.Windows.Forms.Label();
            this.lblIPC = new System.Windows.Forms.Label();
            this.lblPSum = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbDVR
            // 
            this.cbDVR.AutoSize = true;
            this.cbDVR.Location = new System.Drawing.Point(12, 12);
            this.cbDVR.Name = "cbDVR";
            this.cbDVR.Size = new System.Drawing.Size(42, 16);
            this.cbDVR.TabIndex = 0;
            this.cbDVR.Text = "DVR";
            this.cbDVR.UseVisualStyleBackColor = true;
            // 
            // cbIPC
            // 
            this.cbIPC.AutoSize = true;
            this.cbIPC.Location = new System.Drawing.Point(60, 12);
            this.cbIPC.Name = "cbIPC";
            this.cbIPC.Size = new System.Drawing.Size(42, 16);
            this.cbIPC.TabIndex = 1;
            this.cbIPC.Text = "IPC";
            this.cbIPC.UseVisualStyleBackColor = true;
            // 
            // cbHD
            // 
            this.cbHD.AutoSize = true;
            this.cbHD.Location = new System.Drawing.Point(108, 12);
            this.cbHD.Name = "cbHD";
            this.cbHD.Size = new System.Drawing.Size(48, 16);
            this.cbHD.TabIndex = 2;
            this.cbHD.Text = "硬盘";
            this.cbHD.UseVisualStyleBackColor = true;
            // 
            // cbSp
            // 
            this.cbSp.AutoSize = true;
            this.cbSp.Location = new System.Drawing.Point(162, 12);
            this.cbSp.Name = "cbSp";
            this.cbSp.Size = new System.Drawing.Size(48, 16);
            this.cbSp.TabIndex = 3;
            this.cbSp.Text = "配件";
            this.cbSp.UseVisualStyleBackColor = true;
            // 
            // dtpbegin
            // 
            this.dtpbegin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpbegin.Location = new System.Drawing.Point(268, 12);
            this.dtpbegin.Name = "dtpbegin";
            this.dtpbegin.Size = new System.Drawing.Size(123, 21);
            this.dtpbegin.TabIndex = 4;
            this.dtpbegin.Value = new System.DateTime(2017, 7, 4, 0, 0, 0, 0);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(233, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 12);
            this.label1.TabIndex = 5;
            this.label1.Text = "日期";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(406, 16);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(17, 12);
            this.label2.TabIndex = 6;
            this.label2.Text = "到";
            // 
            // dtpend
            // 
            this.dtpend.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpend.Location = new System.Drawing.Point(438, 12);
            this.dtpend.Name = "dtpend";
            this.dtpend.Size = new System.Drawing.Size(123, 21);
            this.dtpend.TabIndex = 7;
            this.dtpend.Value = new System.DateTime(2017, 7, 4, 0, 0, 0, 0);
            // 
            // btnfind
            // 
            this.btnfind.Location = new System.Drawing.Point(591, 11);
            this.btnfind.Name = "btnfind";
            this.btnfind.Size = new System.Drawing.Size(75, 23);
            this.btnfind.TabIndex = 8;
            this.btnfind.Text = "查询";
            this.btnfind.UseVisualStyleBackColor = true;
           // this.btnfind.Click += new System.EventHandler(this.btnfind_Click);
            // 
            // lblDVR
            // 
            this.lblDVR.AutoSize = true;
            this.lblDVR.Location = new System.Drawing.Point(23, 31);
            this.lblDVR.Name = "lblDVR";
            this.lblDVR.Size = new System.Drawing.Size(23, 12);
            this.lblDVR.TabIndex = 9;
            this.lblDVR.Text = "DVR";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lblPSum);
            this.groupBox1.Controls.Add(this.lblSp);
            this.groupBox1.Controls.Add(this.lblHD);
            this.groupBox1.Controls.Add(this.lblIPC);
            this.groupBox1.Controls.Add(this.lblDVR);
            this.groupBox1.Location = new System.Drawing.Point(4, 40);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(849, 156);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "详细信息";
            // 
            // lblSp
            // 
            this.lblSp.AutoSize = true;
            this.lblSp.Location = new System.Drawing.Point(17, 106);
            this.lblSp.Name = "lblSp";
            this.lblSp.Size = new System.Drawing.Size(29, 12);
            this.lblSp.TabIndex = 12;
            this.lblSp.Text = "配件";
            // 
            // lblHD
            // 
            this.lblHD.AutoSize = true;
            this.lblHD.Location = new System.Drawing.Point(17, 81);
            this.lblHD.Name = "lblHD";
            this.lblHD.Size = new System.Drawing.Size(29, 12);
            this.lblHD.TabIndex = 11;
            this.lblHD.Text = "硬盘";
            // 
            // lblIPC
            // 
            this.lblIPC.AutoSize = true;
            this.lblIPC.Location = new System.Drawing.Point(23, 56);
            this.lblIPC.Name = "lblIPC";
            this.lblIPC.Size = new System.Drawing.Size(23, 12);
            this.lblIPC.TabIndex = 10;
            this.lblIPC.Text = "IPC";
            // 
            // lblPSum
            // 
            this.lblPSum.AutoSize = true;
            this.lblPSum.Location = new System.Drawing.Point(17, 132);
            this.lblPSum.Name = "lblPSum";
            this.lblPSum.Size = new System.Drawing.Size(53, 12);
            this.lblPSum.TabIndex = 13;
            this.lblPSum.Text = "合计金额";
            // 
            // frmSaleDVRHSI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(855, 384);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnfind);
            this.Controls.Add(this.dtpend);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dtpbegin);
            this.Controls.Add(this.cbSp);
            this.Controls.Add(this.cbHD);
            this.Controls.Add(this.cbIPC);
            this.Controls.Add(this.cbDVR);
            this.Name = "frmSaleDVRHSI";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmSaleDVRHSI";
            this.Load += new System.EventHandler(this.frmSaleDVRHSI_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckBox cbDVR;
        private System.Windows.Forms.CheckBox cbIPC;
        private System.Windows.Forms.CheckBox cbHD;
        private System.Windows.Forms.CheckBox cbSp;
        private System.Windows.Forms.DateTimePicker dtpbegin;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpend;
        private System.Windows.Forms.Button btnfind;
        private System.Windows.Forms.Label lblDVR;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label lblSp;
        private System.Windows.Forms.Label lblHD;
        private System.Windows.Forms.Label lblIPC;
        private System.Windows.Forms.Label lblPSum;
    }
}