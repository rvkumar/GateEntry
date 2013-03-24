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

<head><title>Micro Labs :: Home - Gate Entry</title>

<script type="text/javascript">


function writeTime(param)
{
//alert('Param is ************'+param);
var myParam = "&now=" + new Date().getMilliseconds();
//window.showModalDialog("visitors.do?method=viewvisitor&id="+param, myParam, "dialogWidth: 500px; dialogHeight: 400px;");
window.open("visitors.do?method=viewvisitor&id="+param,"active", 
	'width=500, height=400, toolbar=no, location=no, resizable=no,scrollbars=no, directories=no,status=no, titlebar=no');


}



</script>


<META HTTP-EQUIV="Pragma" CONTENT="no-cache"/><META HTTP-EQUIV="Expires" CONTENT="-1"/> 

<meta http-equiv="refresh" content="no-cache"/>

</head>


<body topmargin="0" >

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/menu.jsp"></jsp:include>

		<td  valign="top" align="left"><br>
			<table border="0" cellpadding="0" cellspacing="0" style="border: 0px" >
				<tr>
					<td  height="250" valign="top" style="border: 1px solid #4297d7;">

						<div>
							<div class="widgetTitle" id="visitorref"> V I S I T O R S </div>
							
					<logic:notEmpty name="disvisitors">
						<display:table name="disvisitors" id="anv" requestURI="" pagesize="8" 
						export="false" defaultsort="4" defaultorder="descending" class="simple" >
			     
            			
            			<display:column title="Name" sortable="true"   headerClass="sortable">  
						<a href="javascript:writeTime('${anv.visName}')"><c:out value="${anv.visName}"/></a>  
						</display:column>                
            			
            			
            			<display:column property="visCompany" title="Company" sortable="true"   headerClass="sortable"/>
            			<display:column property="visPlace" title="Place" sortable="true" />
            
            			<display:column property="timeIn" title="Time In&nbsp;" sortable="true"   />
            			<display:column property="timeOut" title="Time Out" sortable="false"   />
            			</display:table>
					</logic:notEmpty>
							<logic:empty name="disvisitors">
						No Records to display...
					</logic:empty>
							
							<!-- <table style="border: 0px solid #5c9ccc;">
									<tr style="background-color: #5c9ccc" ><b><td>Sl. No.</td><td>Visitor Name</td><td>Company Name</td><td>In-Time</td><td>Out-Time</td></b></tr>
									<tr><td>1 </td><td>Santosh </td><td> Matrix Corp Limited </td><td>10.00 AM </td><td>11.45 AM </td></tr>
							</table> -->

						</div>

					</td>
					<td width="50%" height="250" valign="top" style="border: 1px solid #006699;">
						<div align="center">
							<div  align="left" class="widgetTitle" > S U M M A R Y </div>
						
						<% 
						String id=session.getId(); 
						
						%>
				 		<jsp:useBean id="pageViews" class="com.microlabs.utils.PieChart"/>
						<img src="<%="graph/"+id+".jpg?time=" + new Date() %>" width="300" height="220"/>
						
						</div>
					</td>
				</tr>
				<tr>
					<td width="50%" height="250" valign="top" style="border: 1px solid #006699;">
						<div>
							<div class="widgetTitle">M A T E R I A L S &nbsp;-&nbsp; I N W A R D</div>


					<logic:notEmpty name="dismatinward">
						<display:table name="dismatinward" requestURI="" pagesize="8" 
						export="false" defaultsort="4" defaultorder="descending" class="simple" >
			     
            			<display:column property="itemdesc" title="Name" sortable="true"  headerClass="sortable"/>
            			<display:column property="uom" title="Uom" sortable="false"   headerClass="sortable"/>
            			<display:column property="qtyrcvd" title="Qty" sortable="false" />
            
            			<display:column property="timein" title="Time In&nbsp;" sortable="true"   />
            			<display:column property="suppliername" title="Supplier" sortable="true"   />
            			</display:table>
					</logic:notEmpty>
							<logic:empty name="dismatinward">
						No Records to display...
					</logic:empty>

						</div>
					</td>
					<td width="50%" height="250" valign="top" style="border: 1px solid #006699;">
						<div>
							<div class="widgetTitle">M A T E R I A L S &nbsp;-&nbsp; O U T W A R D</div>
					<logic:notEmpty name="disothermatout">
						<display:table name="disothermatout" requestURI="" pagesize="8" 
						export="false" defaultsort="4" defaultorder="descending" class="simple" >
			     
            			<display:column property="itemdesc" title="Name" sortable="true"  headerClass="sortable"/>
            			<display:column property="uom" title="Uom" sortable="false"   headerClass="sortable"/>
            			<display:column property="qty" title="Qty" sortable="false" />
            
            			<display:column property="sentby" title="Sent by" sortable="true"   />
            			<display:column property="destination" title="Destination" sortable="true"   />
            			</display:table>
					</logic:notEmpty>
							<logic:empty name="disothermatout">
						No Records to display...
					</logic:empty>

						</div>
					</td>
				</tr>
				
			</table>
		</td>
	</tr>
	</table>
	</center>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>