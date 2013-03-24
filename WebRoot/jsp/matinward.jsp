<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/displaytag-11.tld" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
		<title>Micro Labs :: Materials Inward</title>

<script src="js/jquery-1.8.3.js"></script>
<script src="ui/1.10.0/jquery-ui.js"></script>

<script>
  $(function() {
      $( "#podate" ).datepicker();
      $( "#docdate" ).datepicker();
        });
</script>

<script type="text/javascript">
$(document).ready(function(){
 //This line clones the row inside the '.row' class and transforms it to plain html.
 var clonedRow = $('.row').clone().html();
 
 //This line wraps the clonedRow and wraps it <tr> tags since cloning ignores those tags
 var appendRow = '<tr class = "row">' + clonedRow + '</tr>';  
      
 $('#btnAddMore').click(function(){
  //this line get's the last row and appends the appendRow when it finds the correct row.
        $('.ItemDetailsForm tr:last').after(appendRow);
    });
 
 //when you click on the button called "delete", the function inside will be triggered.
 $('.deleteThisRow').live('click',function(){
     var rowLength = $('.row').length;
         //this line makes sure that we don't ever run out of rows.
     if(rowLength > 1){
   deleteRow(this);
  }else{
   $('.ItemDetailsForm tr:last').after(appendRow);
   deleteRow(this);
  }
 });
   
 function deleteRow(currentNode){
  $(currentNode).parent().parent().remove();
 }
 });
 </script> 

<script type="text/javascript">
	function save()
		{

		if(document.forms[0].docno.value=="")
	    {
	      alert("Please Enter Doc No...");
	      document.forms[0].docno.focus();
	      return false;
	    }

		if(document.forms[0].docdate.value=="")
	    {
	      alert("Please Enter Doc Date...");
	      document.forms[0].docdate.focus();
	      return false;
	    }

		if(document.forms[0].suppliername.value=="")
	    {
	      alert("Please Enter Supplier Name...");
	      document.forms[0].suppliername.focus();
	      return false;
	    }

		if(document.forms[0].supplierplace.value=="")
	    {
	      alert("Please Supplier Place...");
	      document.forms[0].supplierplace.focus();
	      return false;
	    }

		if(document.forms[0].matid.value=="Select")
	    {
	      alert("Please Select Material Type...");
	      document.forms[0].matid.focus();
	      return false;
	    }

		if(document.forms[0].ItemDesc.value=="")
	    {
	      alert("Please enter Description...");
	      document.forms[0].ItemDesc.focus();
	      return false;
	    }

		if(document.forms[0].ItemUom.value=="")
	    {
	      alert("Please enter UOM...");
	      document.forms[0].ItemUom.focus();
	      return false;
	    }

		if(document.forms[0].ItemCases.value=="")
	    {
	      alert("Please enter No of cases...");
	      document.forms[0].ItemCases.focus();
	      return false;
	    }

		if(document.forms[0].ItemQtyrcvd.value=="")
	    {
	      alert("Please enter Qty Received...");
	      document.forms[0].ItemQtyrcvd.focus();
	      return false;
	    }

				var url="matinward.do?method=submit";
				document.forms[0].action=url;
				document.forms[0].submit();

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

document.forms[0].timein.value = currhour + ":" + currminute + ":" + currsecond + " " + AP; //update text field displaying time
setTimeout("writeTime()",1000); //set function to run again, 1 second from now (1000 milliseconds)
}

-->

</script>

<script type="text/javascript">
writeTime(); //begin the script
</script>

<script type="text/javascript">
        function show() { document.getElementById('ppp').style.display = 'block'; }
		function hide() { document.getElementById('ppp').style.display = 'none'; }
</script>

</head>

<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 onload="writeTime()">

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/menu.jsp"></jsp:include>

<html:form action="matinward.do" method="post">

<td width="100%" valign="top" align="left"><br>

			<logic:notEmpty name="dismatinward">
				<html:button property="method" value="Add Materials"  onclick="location.href='matinward.do?method=display&id=addview'"/>
				
						<display:table name="dismatinward" requestURI="" pagesize="20" export="true"  class="its" >
						
			    		<display:column property="gino" title="GI No" sortable="true"  headerClass="sortable"/>
            			<display:column property="gidate" title="GI Date" sortable="true"   headerClass="sortable"/>
            			<display:column property="suppliername" title="Supplier" sortable="true" />
						<display:column property="supplierplace" title="Place" sortable="true" />
						<display:column property="timein" title="Time In" sortable="true" />
						<display:column property="pono" title="PO No" sortable="true" />
						<display:column property="podate" title="PO Date" sortable="true" />            
            			</display:table>
			</logic:notEmpty>

<logic:empty name="dismatinward">

			<table border="0" cellpadding=2 cellspacing=2 width="100%"  style="border: 0px">
				<tr><td width="50%" height="300" valign="top" style="border: 1px solid #4297d7;">
					<div>	<div class="widgetTitle">M A T E R I A L  -  I N W A R D </div>

		

		<table border="0" cellpadding=3 colspan="3" class="content" style="border: 1px solid #4297d7;" width="50%">
		<html:radio property="potype" value="Without PO" styleId="podet" onclick="hide();" >Without PO</html:radio> | 
		<html:radio property="potype" value="With PO" styleId="podet" onclick="show();">With PO</html:radio>
	
		
			<tr id="ppp" style="display: none;"><td width="20%">PO No&nbsp;</td>
			<td><a href="#" border=0><img src="images/Search01.jpg" style="vertical-align:middle" title="Search PO from SAP"></a></td>
			</td><td> : </td><td width="25%"><html:text property="pono" styleId="pono"/></td>
			<td width="25%">PO Date</td><td> : </td><td width="25%"><html:text property="podate" readonly="true"/></td></tr>
			</table>
			<table border="0" cellpadding=3 colspan="3" class="content" style="border: 0px solid #4297d7;" width="50%">
			<tr><td width="25%" style="color:red">Fin Year</td><td> : </td><td width="25%">
					<html:select property="finyear" style="width:150px" styleClass="content">
							<html:option value="1314">2013 - 2014</html:option>
							<html:option value="1213">2012 - 2013</html:option></html:select>
						<br /></td>

			<td width="20%" style="color:red">G I No</td><td> : </td><td width="25%"><html:text property="gino" readonly="true"/><br/></td>
			<td width="20%" style="color:red">G I Date</td><td> : </td><td width="25%"><html:text property="gidate" styleId="gidate" readonly="true" /><html:errors property="gidate"/><br/></td>
			</tr>
			<tr><td width="20%" style="color:red">Doc No</td><td> : </td><td width="25%"><html:text property="docno"/><html:errors property="docno"/><br/></td>
			<td width="20%" style="color:red">Doc Date</td><td> : </td><td width="25%"><html:text property="docdate" styleId="docdate" /><html:errors property="docdate"/><br/></td>
			<td width="25%" style="color:red">Time In</td><td> : </td><td width="25%"><html:text property="timein" styleId="timein" styleClass="content" readonly="true"/><br/></td></tr>

			<tr><td width="20%" style="color:red">Supplier Name</td><td> : </td><td width="25%"><html:text property="suppliername" size="35" maxlength="35" /><br/></td>
			<td width="20%" style="color:red">Supplier Place</td><td> : </td><td width="25%"><html:text property="supplierplace"/><html:errors property="supplierplace"/><br/></td>
			<td width="20%">Transporter Name</td><td> : </td><td width="25%"><html:text property="transportername" size="35" maxlength="35"/><br/></td></tr>

			<tr><td width="20%">Vehicle No</td><td> : </td><td width="25%"><html:text property="vehicleno"/><html:errors property="vehicleno"/><br/></td>
			<td width="20%">Driver Name</td><td> : </td><td width="25%"><html:text property="drivername"/><html:errors property="drivername"/><br/></td>
			<td width="20%">Entered by</td><td> : </td><td width="25%"><html:text property="enteredby"/><html:errors property="enteredby"/><br/></td></tr>
			
			<tr><td width="20%">Reason / Remarks</td><td> : </td><td colspan="7" width="50%"><html:textarea style="width:100%; height:100%; resize:none" rows="3" property="reasonremarks"/><html:errors property="reasonremarks"/><br/></td></tr>


		<tr><td colspan="9"><hr></td><tr>
		<tr>
					<div class="ItemDetails">
					<table class="ItemDetailsForm" class="content" style="border: 1px solid #4297d7;">
					<input type="button" id="btnAddMore"  value="Add row"/>

					<tr bgcolor="#d0e5f5" style="color:red"><td width="15%" >Material Type</td><td width="40%">Description...</td><td width="5%">UOM</td><td width="10%">No of Cases</td><td width="15%">Qty received</td><td style="color:black" width="5%">Delete</td></tr>

					<tr class = "row">

						<logic:present name="matinwardForm" property="matlist">
								<bean:define id="dtp" name="matinwardForm" property="matlist"/>	
						</logic:present>
		
						<logic:notPresent name="matinwardForm" property="matlist">
								<bean:define id="dtp" value="0"/>	
						</logic:notPresent>
						
						<td><html:select property="matid" style="width:150px" styleClass="content">
							<html:option value="Select"></html:option>
							<html:options collection="dtp" property="id" labelProperty="value" />
						</html:select><br /></td>
						
  						<td><input type="text" name="ItemDesc" maxlength="50" size="50"></td>
  						<td><input type="text" name="ItemUom" class="ItemUom" maxlength="5" size="5"></td>
  						<td><input type="text" name="ItemCases" class="ItemCases" maxlength="5" size="5"></td>
  						<td><input type="text" name="ItemQtyrcvd" class="ItemQtyrcvd" maxlength="15" size="15"></td>

					 <td><img src="images/Delete.gif" class="deleteThisRow" title="Delete row"></td>

						<!--  input type="button" class="deleteThisRow"  value="Delete"/-->

		</tr>
		</table>
		</div>
 
		</tr>
						<tr>
						<td colspan=9  align="center" style="background-color: #F2F0F1;" ><br />
						<html:button property="method" value="Save" onclick="javascript:save()"/> &nbsp;&nbsp;
						<html:button property="method" value="Close" onclick="location.href='matinward.do?method=display'" /> &nbsp;&nbsp;
						<html:button property="method" value="Reset" onclick="javascript:reset()"/>
						</td></tr>

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