namespace RSERP_SO321
{
    partial class frmRemoveTheSuit
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
            this.dgvRemoveTheSuit = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.btnCsocode = new System.Windows.Forms.Button();
            this.txtCsoCode = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtZtcinvcodes = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtisoid = new System.Windows.Forms.TextBox();
            this.btnclaer = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.SLbServer = new System.Windows.Forms.ToolStripStatusLabel();
            this.SLbAccID = new System.Windows.Forms.ToolStripStatusLabel();
            this.SLbAccName = new System.Windows.Forms.ToolStripStatusLabel();
            this.SLbYear = new System.Windows.Forms.ToolStripStatusLabel();
            this.SLbUser = new System.Windows.Forms.ToolStripStatusLabel();
            this.tsslSqlCount = new System.Windows.Forms.ToolStripStatusLabel();
            this.SLbState = new System.Windows.Forms.ToolStripStatusLabel();
            this.tsslComputing = new System.Windows.Forms.ToolStripStatusLabel();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRemoveTheSuit)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvRemoveTheSuit
            // 
            this.dgvRemoveTheSuit.AllowUserToAddRows = false;
            this.dgvRemoveTheSuit.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvRemoveTheSuit.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRemoveTheSuit.Location = new System.Drawing.Point(3, 69);
            this.dgvRemoveTheSuit.Name = "dgvRemoveTheSuit";
            this.dgvRemoveTheSuit.ReadOnly = true;
            this.dgvRemoveTheSuit.RowTemplate.Height = 23;
            this.dgvRemoveTheSuit.Size = new System.Drawing.Size(811, 366);
            this.dgvRemoveTheSuit.TabIndex = 0;
            this.dgvRemoveTheSuit.CellMouseUp += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvRemoveTheSuit_CellMouseUp);
            this.dgvRemoveTheSuit.CellMouseDown += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvRemoveTheSuit_CellMouseDown);
            this.dgvRemoveTheSuit.CellMouseMove += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvRemoveTheSuit_CellMouseMove);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "订单号";
            // 
            // btnCsocode
            // 
            this.btnCsocode.Location = new System.Drawing.Point(296, 39);
            this.btnCsocode.Name = "btnCsocode";
            this.btnCsocode.Size = new System.Drawing.Size(75, 23);
            this.btnCsocode.TabIndex = 2;
            this.btnCsocode.Text = "查询订单";
            this.btnCsocode.UseVisualStyleBackColor = true;
            this.btnCsocode.Click += new System.EventHandler(this.btnCsocode_Click);
            // 
            // txtCsoCode
            // 
            this.txtCsoCode.Location = new System.Drawing.Point(59, 12);
            this.txtCsoCode.Name = "txtCsoCode";
            this.txtCsoCode.Size = new System.Drawing.Size(171, 21);
            this.txtCsoCode.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 12);
            this.label2.TabIndex = 4;
            this.label2.Text = "母件存货编码";
            // 
            // txtZtcinvcodes
            // 
            this.txtZtcinvcodes.Location = new System.Drawing.Point(95, 39);
            this.txtZtcinvcodes.Name = "txtZtcinvcodes";
            this.txtZtcinvcodes.Size = new System.Drawing.Size(134, 21);
            this.txtZtcinvcodes.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(237, 17);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 12);
            this.label3.TabIndex = 6;
            this.label3.Text = "唯一标识";
            // 
            // txtisoid
            // 
            this.txtisoid.Location = new System.Drawing.Point(296, 12);
            this.txtisoid.Name = "txtisoid";
            this.txtisoid.Size = new System.Drawing.Size(100, 21);
            this.txtisoid.TabIndex = 7;
            // 
            // btnclaer
            // 
            this.btnclaer.Location = new System.Drawing.Point(239, 40);
            this.btnclaer.Name = "btnclaer";
            this.btnclaer.Size = new System.Drawing.Size(51, 23);
            this.btnclaer.TabIndex = 8;
            this.btnclaer.Text = "清空";
            this.btnclaer.UseVisualStyleBackColor = true;
            this.btnclaer.Click += new System.EventHandler(this.btnclaer_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.SLbServer,
            this.SLbAccID,
            this.SLbAccName,
            this.SLbYear,
            this.SLbUser,
            this.tsslSqlCount,
            this.SLbState,
            this.tsslComputing});
            this.statusStrip1.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow;
            this.statusStrip1.Location = new System.Drawing.Point(0, 438);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(817, 26);
            this.statusStrip1.TabIndex = 10;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // SLbServer
            // 
            this.SLbServer.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.SLbServer.Name = "SLbServer";
            this.SLbServer.Size = new System.Drawing.Size(48, 21);
            this.SLbServer.Text = "服务器";
            this.SLbServer.ToolTipText = "服务器";
            // 
            // SLbAccID
            // 
            this.SLbAccID.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.SLbAccID.Name = "SLbAccID";
            this.SLbAccID.Size = new System.Drawing.Size(48, 21);
            this.SLbAccID.Spring = true;
            this.SLbAccID.Text = "帐套号";
            this.SLbAccID.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            // 
            // SLbAccName
            // 
            this.SLbAccName.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.SLbAccName.Name = "SLbAccName";
            this.SLbAccName.Size = new System.Drawing.Size(60, 21);
            this.SLbAccName.Text = "帐套名称";
            // 
            // SLbYear
            // 
            this.SLbYear.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.SLbYear.Name = "SLbYear";
            this.SLbYear.Size = new System.Drawing.Size(36, 21);
            this.SLbYear.Text = "年度";
            // 
            // SLbUser
            // 
            this.SLbUser.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.SLbUser.Name = "SLbUser";
            this.SLbUser.Size = new System.Drawing.Size(48, 21);
            this.SLbUser.Text = "用户名";
            // 
            // tsslSqlCount
            // 
            this.tsslSqlCount.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.tsslSqlCount.Name = "tsslSqlCount";
            this.tsslSqlCount.Size = new System.Drawing.Size(4, 21);
            // 
            // SLbState
            // 
            this.SLbState.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.SLbState.Name = "SLbState";
            this.SLbState.Size = new System.Drawing.Size(4, 21);
            // 
            // tsslComputing
            // 
            this.tsslComputing.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right)));
            this.tsslComputing.ForeColor = System.Drawing.Color.Red;
            this.tsslComputing.Name = "tsslComputing";
            this.tsslComputing.Size = new System.Drawing.Size(4, 21);
            // 
            // frmRemoveTheSuit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(817, 464);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.btnclaer);
            this.Controls.Add(this.txtisoid);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtZtcinvcodes);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtCsoCode);
            this.Controls.Add(this.btnCsocode);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvRemoveTheSuit);
            this.Name = "frmRemoveTheSuit";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "拆套装统计表，不包含套装";
            this.Load += new System.EventHandler(this.frmRemoveTheSuit_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvRemoveTheSuit)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvRemoveTheSuit;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnCsocode;
        private System.Windows.Forms.TextBox txtCsoCode;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtZtcinvcodes;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtisoid;
        private System.Windows.Forms.Button btnclaer;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel SLbServer;
        private System.Windows.Forms.ToolStripStatusLabel SLbAccID;
        private System.Windows.Forms.ToolStripStatusLabel SLbAccName;
        private System.Windows.Forms.ToolStripStatusLabel SLbYear;
        private System.Windows.Forms.ToolStripStatusLabel SLbUser;
        private System.Windows.Forms.ToolStripStatusLabel tsslSqlCount;
        private System.Windows.Forms.ToolStripStatusLabel SLbState;
        private System.Windows.Forms.ToolStripStatusLabel tsslComputing;
    }
}