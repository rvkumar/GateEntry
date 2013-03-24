<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script language="javascript">
	
	function Load()
	{
			var url="login.do?method=displaylocations";
			document.forms[0].action=url;
			document.forms[0].submit();
	}
	
	</script>
  </head>
  
  <body  onload="Load()">
  <html:form action="login.do">
  
  </html:form>>
    
  </body>
</html>
