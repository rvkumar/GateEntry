<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<link href="css/microlabs.css" type="text/css" rel="stylesheet" />
<link href="css1/displaytag.css" type="text/css" rel="stylesheet" />

 <style type="text/css" media="all">
        @import
      url("css1/screen.css");
    </style>
    <link rel="stylesheet" href="./css1/print.css" type="text/css" media="print" />

<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>

<style>
#accordion-resizer {
padding: 0px;
width: 250px;
height: 300px;
}
</style>

<script>
$(function() {
$( "#accordion" ).accordion({
heightStyle: "fill"
});
});
</script>

<script>
  $(document).ready(function() {
    $("#accordion").accordion();   
  });
</script>

 <div class="main">
 <div class="header">
    <div class="header_resize">
		<br>

		<%String location=(String)session.getAttribute("LocationName");
		String UserName=(String)session.getAttribute("UserName"); 
		String GateNo=(String)session.getAttribute("GateNo"); 
		
		
		if (UserName==""){
			response.sendRedirect("login.do?method=logout");
		}
		%>

		<!-- table border="0" class="content">	
		<tr><td align="right">User name : </td><td align="left"> <%=UserName %></td></tr>
		<tr><td align="right">Location : </td><td align="left"> <%=location %></td></tr>
		<tr><td align="right">Gate No : </td><td align="left"> <%=GateNo %></td></tr>
		</table-->

		<h2>Gate No. : <%=GateNo %></h2>
		<h2>Location : <%=location %></h2>
    </div>
  </div>
  
  	<center>
	<table border="0" width="100%" cellpadding="0" cellspacing="0" style="border: 0px; background-color: #F2F0F1;">
		<tr>	<td width="70%" align="left" class="contentBold">Welcome :&nbsp;<image src="images/User1.gif" title="User name"><font color="blue">&nbsp;<%=UserName %></font></td>
			<td class="content" align="right" valign="middle">
				<img src="images/msl_password.png">&nbsp;<a href="javascript:alert('Change Password');">Change Password</a>&nbsp;|&nbsp;
				<img src="images/msl_help.gif">&nbsp;<a href="login.do?method=homehelp">Help</a>&nbsp;|&nbsp;
				<img src="images/Logoff.gif" valign="middle">&nbsp;<a href="login.do?method=logout">Logoff</a>&nbsp;
			</td>			
		</tr>
	</table>
	</center>
</div>    

<div>
	<center>
	<table border="0" cellpadding="0" cellspacing="0" style="border: 0px" width="100%">
	<tr>