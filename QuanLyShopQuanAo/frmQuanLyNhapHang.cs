using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyShopQuanAo
{
    public partial class frmQuanLyNhapHang : Form
    {
        QLShopQuanAoEntities qlShop = new QLShopQuanAoEntities();

        public frmQuanLyNhapHang()
        {
            InitializeComponent();
            LoadData();
            //AddBinding();
            
        }
         /*void AddBinding()
        {
            txtMaHang.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "ID"));
            txtMaLoai.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "CategoryID"));
            txtTen.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "ProductName"));
            txtGiaNhap.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "ImportPrice"));
            txtGiaBan.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "ExportPrice"));
            txtDvt.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "Unit"));
            cbSize.DataBindings.Add(new Binding("ValueMember", dtgNhapHang.DataSource, "Size"));
            txtMau.DataBindings.Add(new Binding("Text", dtgNhapHang.DataSource, "Color"));
            npudNhap.DataBindings.Add(new Binding("Value", dtgNhapHang.DataSource, "ImportNumber"));
            npudTon.DataBindings.Add(new Binding("Value", dtgNhapHang.DataSource, "Remained"));
            dtpNhap.DataBindings.Add(new Binding("Value", dtgNhapHang.DataSource, "ImportDate"));
            
        }*/
        private void LoadData()
        {
            var products = from p in qlShop.ProductProperties
                           select new
                           {
                               p.Product.ID,
                               p.Product.CategoryID,
                               p.Product.ProductName,
                               p.Product.ImportPrice,
                              p.Product.ExportPrice,
                               p.Product.Unit,
                               p.Size,
                              p.Color,
                              p.ImportNumber,
                               p.Remained,
                              p.ImportDate
                           };
            dtgNhapHang.DataSource = products.ToList();
        }
        private void frmQuanLyNhapHang_Load(object sender, EventArgs e)
        {
            
            LoadData();
        }
        private string AuToGenerateID(string a, string b)
        {
            string result = "";
            result += a[0];
            result += b;
            result += a.Substring(1, a.Length - 1);
            return result;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            qlShop.Products.Add(new Product() { ID = txtMaHang.Text, CategoryID= txtMaLoai.Text, ProductName =txtTen.Text,
                ImportPrice = Convert.ToInt32(txtGiaNhap.Text)
                ,ExportPrice = Convert.ToInt32(txtGiaBan.Text), 
                Unit = txtDvt.Text,
                Pic = txtHinh.Text });

            qlShop.ProductProperties.Add(new ProductProperty()
            {
                ID = AuToGenerateID(txtMaHang.Text, cbSize.Text),
                ProductID = txtMaHang.Text,
                Size = cbSize.Text,
                Color = txtMau.Text,
                ImportNumber = Convert.ToInt32(npudNhap.Text),
                Remained = Convert.ToInt32(npudTon.Text)
            });

            qlShop.SaveChanges();
            LoadData();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            ProductProperty pdp = qlShop.ProductProperties.Where(p=>p.ProductID==txtMaHang.Text && p.Size == cbSize.ValueMember && p.Color == txtMau.Text).SingleOrDefault();
           
            qlShop.ProductProperties.Remove(pdp);
            qlShop.SaveChanges();
            LoadData();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string id = dtgNhapHang.SelectedCells[0].OwningRow.Cells["ID"].Value.ToString();
            Product pd = qlShop.Products.Find(id);
            if (pd != null)
            {
                pd.ProductName = txtTen.Text;
            }
            else
            {
                //MessageBox
            }
            qlShop.SaveChanges();
        }
    }
}
