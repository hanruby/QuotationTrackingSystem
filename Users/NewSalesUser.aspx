﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewSalesUser.aspx.cs" Inherits="Users_NewSalesUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="breadcrumb">
  <ul>
    <li><a href="Index.aspx">Users</a><span class="divider">></span></li>
    <li><a href="Details.aspx?id=<%= SupervisorUser.Id%>"><%= SupervisorUser.UserName %></a><span class="divider">></span></li>
    <li><a class="active">New Sales User</a></li>
  </ul>
</div>
<fieldset>
  <legend>New Sales User</legend>
  <p>
    <label>First Name </label>
    <asp:HiddenField ID="hdnSalesSupervisorId" runat="server" />
    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Middle Name</label>
    <asp:HiddenField ID="hdnFldUserRole" runat="server" />
    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="300"></asp:TextBox>
  </p>
  <p>
    <label>Last Name</label>
    <asp:TextBox ID="txtLastName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ControlToValidate="txtLastName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Status</label>
    <asp:DropDownList ID="ddlStatus" runat="server">
      <asp:ListItem Value="0">Select</asp:ListItem>
      <asp:ListItem Value="Active">Active</asp:ListItem>
      <asp:ListItem Value="InActive">Inactive</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" ForeColor="#FF3300" SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>User Name</label>
    <asp:TextBox ID="txtUserName" runat="server" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
  </p>
  <p>
    <label>Password</label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revPassword" runat="server" ForeColor="#FF3300" ValidationExpression=".{6}.*" ControlToValidate="txtPassword" SetFocusOnError="True">*</asp:RegularExpressionValidator>
  </p>
  <p>
    <label>Confirm Password</label>
    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="300"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="#FF3300" SetFocusOnError="True">*</asp:CompareValidator>
  </p>
  <p></p>
  <p>
    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save"  CssClass="btn btn-save"/>
    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" onclick="btnCancel_Click" Text="Cancel"  CssClass="btn"/>
  </p>
</fieldset>
</asp:Content>

