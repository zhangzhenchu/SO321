namespace RSERP_SO321
{
    partial class frmSuitCsoCode
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
            this.dgvSc = new System.Windows.Forms.DataGridView();
            this.btnCompare = new System.Windows.Forms.Button();
            this.lblCount = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSc)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvSc
            // 
            this.dgvSc.AllowUserToAddRows = false;
            this.dgvSc.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvSc.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSc.Location = new System.Drawing.Point(12, 75);
            this.dgvSc.Name = "dgvSc";
            this.dgvSc.ReadOnly = true;
            this.dgvSc.RowTemplate.Height = 23;
            this.dgvSc.Size = new System.Drawing.Size(972, 422);
            this.dgvSc.TabIndex = 0;
            // 
            // btnCompare
            // 
            this.btnCompare.Location = new System.Drawing.Point(12, 12);
            this.btnCompare.Name = "btnCompare";
            this.btnCompare.Size = new System.Drawing.Size(114, 23);
            this.btnCompare.TabIndex = 1;
            this.btnCompare.Text = "计算销售额比较";
            this.btnCompare.UseVisualStyleBackColor = true;
            this.btnCompare.Click += new System.EventHandler(this.btnCompare_Click);
            // 
            // lblCount
            // 
            this.lblCount.AutoSize = true;
            this.lblCount.Location = new System.Drawing.Point(13, 48);
            this.lblCount.Name = "lblCount";
            this.lblCount.Size = new System.Drawing.Size(59, 12);
            this.lblCount.TabIndex = 2;
            this.lblCount.Text = "记录数：0";
            // 
            // frmSuitCsoCode
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(996, 509);
            this.Controls.Add(this.lblCount);
            this.Controls.Add(this.btnCompare);
            this.Controls.Add(this.dgvSc);
            this.Name = "frmSuitCsoCode";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "查询套装销售额与已拆套装销售额不一致的订单";
            this.Load += new System.EventHandler(this.frmSuitCsoCode_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSc)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvSc;
        private System.Windows.Forms.Button btnCompare;
        private System.Windows.Forms.Label lblCount;
    }
}