﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuotationTrackingSystemDBModel;
using System.Data;

public partial class Enquiries_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            hdnScope.Value = Request.QueryString["scope"] == null ? "Created" : Request.QueryString["scope"].ToString().Trim();            
        }
        BindDataToGridView();
    }
    protected void gvEnquiries_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEnquiries.PageIndex = e.NewPageIndex;
        BindDataToGridView();
    }
    protected void gvEnquiries_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;

        LinkButton lb;
        lb = new LinkButton();
        lb.CommandArgument = e.Row.Cells[5].Text;
        lb.CommandName = "NumClick";
        lb.Text = "Details";
        lb.PostBackUrl = "Details.aspx?id=" + e.Row.Cells[5].Text;
        e.Row.Cells[5].Controls.Add((Control)lb);

    }
    protected void BindDataToGridView()
    {
        QuotationTrackingSystemDBEntities _quotationTrackingSystemDBEntities = new QuotationTrackingSystemDBEntities();
        DataTable dt = new DataTable();
        DataRow dr = null;

        dt.Columns.Add(new DataColumn("Requested At", typeof(string)));
        dt.Columns.Add(new DataColumn("Client Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Phone", typeof(string)));
        dt.Columns.Add(new DataColumn("Status", typeof(string)));
        dt.Columns.Add(new DataColumn("Insurance Type", typeof(string)));
        dt.Columns.Add(new DataColumn("Details", typeof(string)));

        var _currentUserId = CurrentUser.Id();
        foreach (var x in _quotationTrackingSystemDBEntities.Enquiries.Where(x => x.CreatedBy == _currentUserId).Where(x => x.Status == hdnScope.Value).OrderByDescending(x => x.CreatedAt).ToList())
        {
            dr = dt.NewRow();
            dr["Requested At"] = DateTimeHelper.ConvertToString(x.CreatedAt.ToString());
            dr["Client Name"] = x.ClientName;
            dr["Phone"] = x.Phone1;
            dr["Status"] = StringHelper.ToSentenceCase(x.Status);
            dr["Insurance Type"] = StringHelper.ToSentenceCase(x.InsuranceType);
            dr["Details"] = x.Id;
            dt.Rows.Add(dr);
        }

        gvEnquiries.DataSource = dt;
        gvEnquiries.DataBind();
    }
}