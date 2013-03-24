<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

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
  
  </html:form>
    
  </body>
</html>
