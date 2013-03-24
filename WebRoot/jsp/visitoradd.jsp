<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/displaytag-11.tld" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>Micro Labs :: Visitors </title>

   <!-- Scripts required for sorting the table starts -->
   <script type="text/javascript" src="js/sorttable.js"></script>
   <!-- Scripts required for sorting the table ends -->


<script type="text/javascript">

function visrch()
{

	var url = "visitors.do?method=vissearch";
	document.forms[0].action=url;
				document.forms[0].submit();
}


</script>

<script type="text/javascript">
	function save()
		{


function allnumeric(inputtxt)   
   {   
   alert("HI");
      var numbers = /^[0-9]+$/;   
      if(inputtxt.value.match(numbers))   
      {   
      return true;
      }   
      else  
      {   
      alert('Please input numeric  only');   
      document.forms[0].visContact.focus();   
      return false;   
      }   
   }  


		if(document.forms[0].visType.value=="Select")
	    {
	      alert("Please Select Visitor type...");
	      document.forms[0].visType.focus();
	      return false;
	    }

		if(document.forms[0].visPurpose.value=="Select")
	    {
	      alert("Please Select Visitor purpose...");
	      document.forms[0].visPurpose.focus();
	      return false;
	    }

		if(document.forms[0].visName.value=="")
	    {
	      alert("Please Enter Name...");
	      document.forms[0].visName.focus();
	      return false;
	    }

		if(document.forms[0].visCompany.value=="")
	    {
	      alert("Please Enter Company...");
	      document.forms[0].visCompany.focus();
	      return false;
	    }

		if(document.forms[0].visPlace.value=="")
	    {
	      alert("Please Enter place...");
	      document.forms[0].visPlace.focus();
	      return false;
	    }


		if(document.forms[0].toMeet.value=="")
	    {
	      alert("Please Enter person to meet...");
	      document.forms[0].toMeet.focus();
	      return false;
	    }

		if(document.forms[0].deptType.value=="Select")
	    {
	      alert("Please Select Department...");
	      document.forms[0].deptType.focus();
	      return false;
	    }

				var url="visitors.do?method=submit";
				document.forms[0].action=url;
				document.forms[0].submit();
			
		}
	
	function displaymessage(){
	if(document.forms[0].message.value!="")  
			{
				alert(document.forms[0].message.value);
			}
			document.forms[0].message.value="";
			return false;
	}

	function reset()
	{
		var url="visitors.do?method=display";
		document.forms[0].action=url;
		document.forms[0].submit();
	}

</script>

<script type="text/javascript">
//Description: This Javascript displays the current time (hour:minute:second AM/PM format)
//in a text field on the webpage, updating the display once every second.

var currtime;
var currhour;
var currminute;
var currsecond;
var AP;

function updateVisitor(visitorId) {
	if (confirm("Are you sure, you want to update the time-out for this visitor?")) {
		window.location.href='visitors.do?method=modifyvisitor&visitorno=' + visitorId;
	}
	//window.showModalDialog("visitors.do?method=modifyvisitor&id=" + param, myParam, "dialogWidth: 500px; dialogHeight: 400px;");
}

function writeTime()
{

currtime = new Date(); //creates representation of current time on user's local computer
currhour = currtime.getHours(); //gets current hour (in 24-hour format)
currminute = currtime.getMinutes(); //gets current minute
currsecond = currtime.getSeconds(); //gets current time

if (currminute < 10) //if current minute is one digit number
	currminute = "0" + currminute; //place zero in front of it

if (currsecond < 10) //if current second is one digit number
	currsecond = "0" + currsecond; //place zero in front of it

AP = (currhour >= 12 ? "PM" : "AM"); //determine whether it is AM or PM


if (currhour > 12) //if current time is past 1:00 PM (13:00)
	currhour -= 12; //reduce hour display by 12 (i.e. 20:00 becomes 8:00 PM)
else if(currhour == 0) //if it is currently the midnight hour
	currhour = 12; //give more friendly hour display (i.e. 12:30 AM instead of 0:30 AM)

document.forms[0].timeIn.value = currhour + ":" + currminute + ":" + currsecond + " " + AP; //update text field displaying time
setTimeout("writeTime()",1000); //set function to run again, 1 second from now (1000 milliseconds)
}

-->

</script>

<script type="text/javascript">
writeTime(); //begin the script
</script>	
</head>

<body topmargin="0" onload="displaymessage(), writeTime()">

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/menu.jsp"></jsp:include>
<html:form action="visitors.do">

<html:hidden property="message"/>
<logic:present name="visitorsForm" property="message">
<font color="red">
<!-- bean:write name="visitorsForm" property="message"/-->

</font>
</logic:present>

		<td width="100%" valign="top" align="left"><br>
		
		<logic:notEmpty name="disvisitors">
		<table border="0" cellpadding=2 cellspacing=2 width="100%"  style="border: 0px" >
		<tr><td width="25"%><html:button property="method" value="Add Visitor" onclick="location.href='visitors.do?method=display&id=addview'"/>
		</td>
		<td width="50%" align="center">Search : <a href="#" border=0><img src="images/clearsearch.jpg"title="Clear Search" onclick="location.href='visitors.do?method=display'"/></a>
		<html:text style="color: grey" property="visSearch" styleId="VisSearch" maxlength="50" size="50" title="Name / Company / Place / To Meet" />
		<a href="#" border=0><img src="images/Search01.jpg" title="Name / Company / Place / To Meet" onclick="visrch();"></a></td>
		
		</tr></table>

			<div>
				Export Options: 
				<a href="visitors.do?method=exportDisplay&type=XML">XML</a>
				&nbsp;::&nbsp;<a href="visitors.do?method=exportDisplay&type=XLS">Excel</a>
				&nbsp;::&nbsp;<a href="visitors.do?method=exportDisplay&type=DOC">Word</a>
			</div>

			<%
				session.setAttribute("visitorList", request.getAttribute("disvisitors"));
			%>

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
			<logic:iterate name="disvisitors" id="row">
				<tr>
					<td><bean:write name="row" property="visName"/></td>
					<td><bean:write name="row" property="visCompany"/></td>
					<td><bean:write name="row" property="visPlace"/></td>
					<td><bean:write name="row" property="visPurpose"/></td>
					<td><bean:write name="row" property="visTomeet"/></td>
					<td><bean:write name="row" property="visDepartment"/></td>
					<td><bean:write name="row" property="visDate"/></td>
					<td><bean:write name="row" property="timeIn"/></td>
					<td>
						<logic:notEmpty name="row" property="timeOut">
							<bean:write name="row" property="timeOut"/>
						</logic:notEmpty>
						<logic:empty name="row" property="timeOut">
							<a href="javascript:updateVisitor(<bean:write name='row' property='visitorno'/>);">Update</a>
						</logic:empty>
					</td>
				</tr>
			</logic:iterate>
			</table>

		
						<display:table name="disvisitors" requestURI="" pagesize="20" export="true"  class="its" id="row">						
			    		<display:column property="visName" title="Name" sortable="true"  headerClass="sortable" paramId="visitorno" href="visitors.do?method=modifyvisitor" paramProperty="visitorno" />
            			<display:column property="visCompany" title="Company" sortable="true"   headerClass="sortable"/>
            			<display:column property="visPlace" title="Place" sortable="true" />
						<display:column property="visPurpose" title="Purpose" sortable="true" />
						<display:column property="visTomeet" title="To Meet" sortable="true" />
						<display:column property="visDepartment" title="Department" sortable="true" />
						<display:column property="visDate" title="Date" sortable="true" />            
            			<display:column property="timeIn" title="Time In " sortable="true"   />
            			<display:column property="timeOut" title="Time Out" sortable="false" />
						<display:column property="updateLink" title="Update Time Out" sortable="false" paramId="visitorno"
							href="visitors.do?method=modifyvisitor" paramProperty="visitorno" />
            			</display:table>

		</logic:notEmpty>
		
		<logic:empty name="disvisitors">
			<table border="0" cellpadding=2 cellspacing=2 width="100%"  style="border: 0px">
				<tr><td width="50%" height="300" valign="top" style="border: 1px solid #4297d7;">
					<div>
						<div class="widgetTitle"> V I S I T O R - P A S S </div>
						<br>
						<table border="0" cellpadding=3 colspan=3 class="content" style="border: 0px solid #4297d7;">
						<tr><td>Fin. Year : <br /></td>
						<td><html:select property="finYear" style="width:150px" styleClass="content">
							<html:option value="1314">2013 - 2014</html:option>
							<html:option value="1213">2012 - 2013</html:option></html:select>
						<br /></td>

					<logic:notEmpty name="visitorsForm" property="vistypelist">
					<bean:define id="dtp" name="visitorsForm" property="vistypelist"/>
						<td align="right" width="30%" style="color:red">Visitor Type : <br /></td>
						<td><html:select property="visType" style="width:150px" styleClass="content">
							<html:option value="Select"></html:option>
							<html:options collection="dtp" property="id" labelProperty="value" />
						</html:select><br /></td>
						</logic:notEmpty>

					<logic:notEmpty name="visitorsForm" property="vispurposelist">
					<bean:define id="dtp" name="visitorsForm" property="vispurposelist"/>
					<td width="30%" style="color:red">Purpose : <br /></td>
						<td><html:select property="visPurpose" style="width:150px" styleClass="content">
							<html:option value="Select"></html:option>
							<html:options collection="dtp" property="id" labelProperty="value" />
						</html:select><br /></td></tr>
					</logic:notEmpty>

						<tr><td style="color:red">Name :&nbsp;	<a href="#" border=0><img src="images/Search01.jpg" style="vertical-align:middle" title="Search Visitor Name"></a><br /></td>
							<td><html:text property="visName" styleId="VisName" maxlength="35" size="35" styleClass="content"/><br /></td>

							<td style="color:red" align="right">Company : <br /></td>
							<td><html:text style="" property="visCompany" styleId="VisCompany" maxlength="35" size="35" styleClass="content"/><br /></td>

							<td style="background-color: #F2F0F1;" colspan="2" rowspan="8">
							<img src="images/visitors/noimage.jpg" height="220px" width="240px" border="2" />
							<html:button property="imgCapture" styleId="ImgCapture" value="Capture" styleClass="content"/>
							</td></tr>

							<tr><td rowspan="3" >Address&nbsp;: </td>
							<td rowspan="3"  ><html:textarea style="width:100%; height:100%; resize:none" rows="6" property="address" title="100 characters max"></html:textarea></td>

							<tr><td align="right" style="color:red">Place :<br /></td>
							<td><html:text property="visPlace" styleId="VisPlace" maxlength="35" size="35" styleClass="content"/><br /></td>

							<tr><td align="right">Contact No : <br /></td>
							<td><html:text property="visContact" styleId="VisContact" maxlength="10" size="35" styleClass="content" onkeyup="isInteger(this.value)"/><br /></td></tr>
							
							<tr><td rowspan=3 align="left">Belongings&nbsp;: <br /></td>
							<td rowspan=3><html:textarea property="belongings" style="width:100%; height:100%; resize:none" rows="6" title="100 characters max"></html:textarea><br /></td>

							<tr><td cellpadding="20" align="right" style="color:red">To meet : &nbsp;&nbsp;<br /></td>
							<td><html:text property="toMeet" styleId="ToMeet" maxlength="35" size="35" styleClass="content"/><br /></td></tr>

						<logic:notEmpty name="visitorsForm" property="deptlist">
						<bean:define id="dtp" name="visitorsForm" property="deptlist"/>
						<tr><td cellpadding="20" align="right" style="color:red">Department :<br /></td>
						<td><html:select property="deptType" style="width:150px" styleClass="content">
							<html:option value="Select"></html:option>
							<html:options collection="dtp" property="id" labelProperty="value" />
						</html:select><br /></td></tr>
						</logic:notEmpty>

							<tr><td >No of persons : <br /></td>
						<td><html:select property="nopersons" style="width:50px" styleClass="content">
							<html:option value="1">1</html:option>
							<html:option value="2">2</html:option>
							<html:option value="3">3</html:option>
							<html:option value="4">4</html:option>
							<html:option value="5">5</html:option>
							<html:option value="6">6</html:option>
							<html:option value="7">7</html:option>
							<html:option value="8">8</html:option>
							<html:option value="9">9</html:option>
							<html:option value="10">10</html:option>
							</html:select>
						<br /></td>
							
							<td rowspan="2">Person Names : <br /></td>
							<td><html:textarea property="personnames" style="width:100%; height:100%; resize:none" rows="3" title="100 characters max"></html:textarea><br /></td></tr>

							<tr><td colspan="6"><hr></td></tr>
							<tr><td>Date : <br /></td>
							<td><html:text property="visDate" styleId="VisDate" size="10" styleClass="content" readonly="true"/><br /></td>

							<td>Time In : <br /></td>
							<td><html:text property="timeIn" styleId="VisTimein" size="12" styleClass="content" readonly="true"/>							
							<br /></td>

							<td>Time Out : <br /></td>
							<td><html:text property="timeOut" styleId="VisTimeout" size="12" styleClass="content" readonly="true"/><br /></td>
							</tr>
						<tr>
						<td colspan=6  align="center" style="background-color: #F2F0F1;" ><br />
						<html:button property="method" value="Save" onclick="javascript:save()"/> &nbsp;&nbsp;
						<html:button property="method" value="Close" onclick="location.href='visitors.do?method=display'" /> &nbsp;&nbsp;
						<html:button property="method" value="Reset" onclick="javascript:reset()"/>
						</td>

						</tr></table>
					</div>
				</td></tr>
			</table>
			</logic:empty>
		</td>
		</html:form>
		
		
	</tr>
	</table>
	</center>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body></html>
