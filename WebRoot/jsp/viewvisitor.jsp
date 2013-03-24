<%@page import="com.microlabs.action.HomeAction"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.microlabs.db.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.awt.*" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.data.general.*"%>
<%@page import="org.jfree.data.*"%>
<%@page import="org.jfree.data.category.*"%>

<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head><title>Micro Labs :: Visitor View</title>
<link href="css/microlabs.css" type="text/css" rel="stylesheet" />

</head>


<body><html:form action="/visitors.do">
<table cellpadding=2 cellspacing=2 width="100%" class="content" border="0">
<td colspan="3" align="center"><h1>VISITOR DISPLAY</h1></td>

<tr>
<td rowspan="8" width="210">
<img src="images/visitors/<bean:write name='visitorsForm' property='visitorimage' />" onerror="javascript:visitorImage();" id='visitorImage' height="200" width="200"/>
</td>
</tr>

<tr align="right">
<td width="25%">Visitor No:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="visitorno" /></td>
</tr>

<tr align="right">
<td>Visitor Name:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="visName" /></td>
</tr>

<tr align="right">
<td>Company:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="visCompany" /></td>
</tr>

<tr align="right">
<td>To Meet:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="toMeet" /></td>
</tr>

<tr align="right">
<td>Department:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="deptType" /></td>
</tr>

<tr align="right">
<td>Time In:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="timeIn" /></td>
</tr>

<tr align="right">
<td>Time Out:&nbsp;</td>
<td align="left"><bean:write name="visitorsForm" property="timeOut" /></td>
</tr>


</table>
</html:form>
</body>

<script>
function visitorImage() {
	var imgObj = document.getElementById("visitorImage");
	imgObj.src = "images/visitors/noimage.jpg";
}
</script>



</html>
