<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
	<title>Micro Labs :: Login - Gate Entry</title>
	
	<link href="css/microlabs.css" type="text/css" rel="stylesheet" />	
	
	<script language="javascript">
	
	
	function Load()
	{
			var url="login.do?method=displaylocations";
			document.forms[0].action=url;
			document.forms[0].submit();
	}

	function validateForm()/*function to check userid & password*/	
	{
		var form = document.forms[0];
		/*the following code checkes whether the entered userid and password are matching*/
		
		if(form.location.value=="Select")
	    {
	      alert("Please Select Location...");
	      form.location.focus();
	      return false;
	    }
			if ( form.userId.value == "" ) {
				alert("Enter your Username");
				form.userId.focus();
				return;
			}
			
			if ( form.userPassword.value == "" ) {
				alert("Enter your password");			
				form.userPassword.focus();
				return;
			}
			
			var url="login.do?method=signIn";
			document.forms[0].action=url;
			document.forms[0].submit();
			
	}
	</script>	

<script>

function dialogLink() {

	window.alert("Select Plant Location\r\n Enter Username & Password\r\n Select Gate No.");

}

</script>

</head>

<!-- Always make use of forward slash as a separator -->
<body background="images/login_page_bg.png">
<br><br><br><br><br>

<center>
<!-- Never use the custom fonts until you make sure the used fonts are installed in all your client machines. -->
<!-- Always make use of style sheet for specifying the font family. And include 2/3 fonts as a family. Browser will pick up in the order whichever is avaialble on the client machine -->
<!--<font face="Cambria">-->
<table border="0" cellpadding=2 cellspacing=2 style="border:1px solid #000000; width: 500px">

<tr><td colspan=2><img src="images/loginBanner.png"></td></tr>
<tr><td align="center" colspan=2><br>
	<!--h1 style="font-family:Comic Sans MS;text-align="center";font-size:20pt; color:#00FF00;>Sign in ...</h1-->
	<html:form action="/login.do">
	<table width="100%" border="0" cellpadding="2" cellspacing="2" class="contentBold">
	
		<tr>
			
			<td align="center" colspan="2" class="errorMessage"><logic:present name="loginForm" property="message">
				<bean:write name="loginForm" property="message"/>
			</logic:present>
			
			</td>
		</tr>		
		<tr><td colspan="2"><br></td></tr>
		
		<tr>
			<td align="right" width="30%">Location :&nbsp;</td>
			<td>
				<html:select property="location" style="width:220px" styleClass="content">
				<html:option value="Select"></html:option>
				<html:options property="ar1_id" labelProperty="ar2_name" name="loginForm" />
				</html:select>			
			</td>
		</tr>
		
		<tr>
			<td align="right">Username :&nbsp;</td>
			<td><html:text property="username" styleId="userId" size="34" styleClass="content"/></td>
		</tr>

		<tr>
			<td align="right">Password :&nbsp;</td>
			<td><html:password property="password" styleId="userPassword" size="34" styleClass="content"/></td>
		</tr>

		<tr>
			<td align="right">Gate No. :&nbsp;</td>
			<td>
				<html:select property="gateno" style="width:220px" styleClass="content">
				<html:option value="1">1</html:option>
				<html:option value="2">2</html:option>
				</html:select>
			</td>
		</tr>

		<tr>			
			<td colspan="2" align="center">
				<input type="button" value="Sign In" class="login-button" onClick="javascript:validateForm();">
				<!--<input type="button" value="Forgot Password" class="login-button">-->
			</td>
		</tr>
		
		
	</table>
	</html:form>
</td></tr>

<tr class="content">
	<td>Copyright &copy; 2012 <a href="http://www.microlabsltd.com/" target="_new">Micro Labs Limited</a> - All Rights Reserved</td>
	<td align="right"><img src="images/help.png"  align="top">&nbsp;<a href="#" onclick="dialogLink()">Help</a></td>
</tr>

<!--</font>-->
</table>

</center>

</body>

</html>