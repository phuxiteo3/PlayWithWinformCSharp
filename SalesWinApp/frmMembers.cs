﻿using BusinessObject;
using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SalesWinApp
{
    public partial class frmMembers : Form
    {
        MemberRepository memRepository = new MemberRepository();
        BindingSource source = new BindingSource();
        IEnumerable<MemberObject> members = null;
        public frmMembers()
        {
            InitializeComponent();
        }
        private void frmMembers_Load(object sender, EventArgs e)
        {
            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
            btnAscSort.Enabled = false;
            btnDescSort.Enabled = false;
        }
        private void LoadMemberList(IEnumerable<MemberObject> list)
        {
            try
            {
                source.DataSource = list;
                txtID.DataBindings.Clear();
                txtCompanyName.DataBindings.Clear();
                txtEmail.DataBindings.Clear();
                txtPassword.DataBindings.Clear();
                cboCity.DataBindings.Clear();
                cboCountry.DataBindings.Clear();
                txtRole.DataBindings.Clear();

                txtID.DataBindings.Add("Text", source, "MemberID");
                txtCompanyName.DataBindings.Add("Text", source, "CompanyName");
                txtEmail.DataBindings.Add("Text", source, "Email");
                txtPassword.DataBindings.Add("Text", source, "Password");
                txtRole.DataBindings.Add("Text", source, "Role");
                cboCity.DataBindings.Add("Text", source, "City");
                cboCountry.DataBindings.Add("Text", source, "Country");

                dgvMemberList.DataSource = null;
                dgvMemberList.DataSource = source;
                if (list.Count() == 0)
                {
                    ClearText();
                    btnUpdate.Enabled = false;
                    btnDelete.Enabled = false;
                    btnAscSort.Enabled = false;
                    btnDescSort.Enabled = false;
                    MessageBox.Show("Sorry, we can't show result you want!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else if (list.Count() == 1)
                {
                    btnDelete.Enabled = false;
                    btnAscSort.Enabled = false;
                    btnDescSort.Enabled = false;
                }
                else
                {
                    btnDelete.Enabled = true;
                    btnUpdate.Enabled = true;
                    btnAscSort.Enabled = true;
                    btnDescSort.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load member list", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void ClearText()
        {
            txtID.Clear();
            txtCompanyName.Clear();
            txtEmail.Clear();
            txtPassword.Clear();
            cboCity.Text = string.Empty;
            cboCountry.Text = string.Empty;
            txtRole.Clear();
        }

        private MemberObject GetMemberObject()
        {
            MemberObject mem = null;
            try
            {
                mem = new MemberObject
                {
                    MemberID = int.Parse(txtID.Text),
                    Email = txtEmail.Text,
                    CompanyName = txtCompanyName.Text,
                    Password = txtPassword.Text,
                    City = cboCity.Text,
                    Country = cboCountry.Text,
                    Role = txtRole.Text
                };
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Get Member Object", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            return mem;
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            txtIDSearch.Clear();
            txtEmailSearch.Clear();
            members = memRepository.GetMembers();
            LoadMemberList(members);
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            var frmMemberDetails = new frmMemberDetails()
            {
                Text = "Add a new Member",
                InsertOrUpdate = false,
                MemberRepository = memRepository
            };
            if (frmMemberDetails.ShowDialog() == DialogResult.OK)
            {
                members = memRepository.GetMembers();
                LoadMemberList(members);
                source.Position = source.Count - 1;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            var frmMemberDetails = new frmMemberDetails()
            {
                Text = "Update a member",
                InsertOrUpdate = true,
                MemberInfo = GetMemberObject(),
                MemberRepository = memRepository
            };
            if (frmMemberDetails.ShowDialog() == DialogResult.OK)
            {
                members = memRepository.GetMembers();
                LoadMemberList(members);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            var mem = GetMemberObject();
            if (MessageBox.Show($"Are you sure to delete member name: {mem.Email}?", "Confirm message", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                try
                {
                    if (mem.Role.Equals("admin", StringComparison.OrdinalIgnoreCase))
                    {
                        MessageBox.Show("Sorry, we can't delete member with Admin role!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    else
                    {
                        source.Position = 0;
                        memRepository.DeleteMember(mem.MemberID);
                        members = memRepository.GetMembers();
                        LoadMemberList(members);
                        if (memRepository.GetMembers().Count() == 1)
                        {
                            btnDelete.Enabled = false;
                            MessageBox.Show("We have only 1 member existing in list, now. Please don't remove it!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Delete a member", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtIDSearch.TextLength == 0 || txtEmailSearch.TextLength == 0)
                {
                    MessageBox.Show("Sorry, you must full fill both ID and Email!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    List<MemberObject> list = memRepository.GetMemberByIDAndEmail(int.Parse(txtIDSearch.Text), txtEmail.Text.Trim());
                    if (list.Count == 0)
                    {
                        MessageBox.Show("Sorry, can't find this Member!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    else
                    {
                        LoadMemberList(list);
                    }
                }
            }
            catch (Exception ex)//Nơi bắt lỗi chung!
            {
                MessageBox.Show("Sorry, Member ID must be number!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        private void btnAscSort_Click(object sender, EventArgs e)
        {
            txtIDSearch.Clear();
            txtEmailSearch.Clear();
            List<MemberObject> tmp = memRepository.GetMembers().OrderBy(mem => mem.Email).ToList<MemberObject>();
            LoadMemberList(tmp);
        }

        private void btnDescSort_Click(object sender, EventArgs e)
        {
            txtIDSearch.Clear();
            txtEmailSearch.Clear();
            List<MemberObject> tmp = memRepository.GetMembers().OrderBy(mem => mem.Email).ToList<MemberObject>();
            tmp.Reverse();
            LoadMemberList(tmp);
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void frmMembers_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Are you sure to quit?", "Confirm information", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
            {
                e.Cancel = true;
            }
        }

    }
}
