<%=request.getAttribute("contentType")%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
	<title>Visitor Listing</title>
</head>
<body>			
			<table width="100%" cellpadding="2" cellspacing="2" border="1" class="sortable">
				<tr style="font-weight:bold; background: #0000ff; color: #ffffff;">
					<td>Name</td>
					<td>Company</td>
					<td>Place</td>
					<td>Purpose</td>
					<td>To Meet</td>
					<td>Department</td>
					<td>Date</td>
					<td>Time In</td>
					<td>Time Out</td>
				</tr>
			<logic:iterate name="visitorList" id="row">
				<tr>
					<td><bean:write name="row" property="visName"/></td>
					<td><bean:write name="row" property="visCompany"/></td>
					<td><bean:write name="row" property="visPlace"/></td>
					<td><bean:write name="row" property="visPurpose"/></td>
					<td><bean:write name="row" property="visTomeet"/></td>
					<td><bean:write name="row" property="visDepartment"/></td>
					<td><bean:write name="row" property="visDate"/></td>
					<td><bean:write name="row" property="timeIn"/></td>
					<td><bean:write name="row" property="timeOut"/></td>
				</tr>
			</logic:iterate>
			</table>
</body>
</html>
