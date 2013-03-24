<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/displaytag-11.tld" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

		<title>Micro Labs :: Other Materials Outward</title>

<script src="js/jquery-1.8.3.js"></script>
<script src="ui/1.10.0/jquery-ui.js"></script>

<script>
  $(function() {
      $( "#godcdate" ).datepicker();
      $( "#expretdate" ).datepicker();
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
function IsValidTime(timeStr) {

		var timePat = /^(\d{2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;
		
		var matchArray = timeStr.match(timePat);
				if (matchArray == null)
						{
						alert("Time is not in a valid format.(Use HH:MM Format)");
						document.forms[0].exptimeout.focus();
						
						
						return false;
						}
		hour = matchArray[1];
		minute = matchArray[2];
		second = matchArray[4];
		ampm = matchArray[6];
		
		if (second=="") { second = null; }
		if (ampm=="") { ampm = null }
		
			if (hour < 0  || hour > 23) 
					{
					alert("Hour must be between 0 and 23");
					document.forms[0].exptimeout.focus();
					return false;
					}
				//if  (hour > 12 && ampm != null) {
				//alert("You can't specify AM or PM for military time.");
				//return false;
				//} 
		
				if (minute<0 || minute > 59) {
				alert ("Minute must be between 0 and 59.");
				document.forms[0].exptimeout.focus();
				return false;
				}
		
				if (second != null && (second < 0 || second > 59)) {
				alert ("Second must be between 0 and 59.");
				document.forms[0].exptimeout.focus();
				return false;
				}
		
		return true;
}

</script>


<script type="text/javascript">

	function save()
		{

		if(document.forms[0].godcdate.value=="")
	    {
	      alert("Please Enter DC Date...");
	      document.forms[0].godcdate.focus();
	      return false;
	    }

		if(document.forms[0].sentby.value=="")
	    {
	      alert("Please Enter sender Name...");
	      document.forms[0].sentby.focus();
	      return false;
	    }

		if(document.forms[0].sentdept.value=="Select")
	    {
	      alert("Please Select Department...");
	      document.forms[0].sentdept.focus();
	      return false;
	    }

		if(document.forms[0].destination.value=="")
	    {
	      alert("Please enter destination...");
	      document.forms[0].destination.focus();
	      return false;
	    }

		if(document.forms[0].exptimeout.value=="")
	    {
	      alert("Please enter expected time out...");
	      document.forms[0].exptimeout.focus();
	      return false;
	    }

if(document.forms[0].exptimeout.value!="")
	    {
	      
	      
	    var timePat = /^(\d{2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;
		var matchArray =  (document.forms[0].exptimeout.value).match(timePat);
		if (matchArray == null)
		{
			alert("Time is not in a valid format.(Use HH:MM Format)");
			document.forms[0].exptimeout.focus();
			return false;
		}
		hour = matchArray[1];
		minute = matchArray[2];
		second = matchArray[4];
		ampm = matchArray[6];
		
		if (second=="") { second = null; }
		if (ampm=="") { ampm = null }
		
			if (hour < 0  || hour > 23) 
					{
					alert("Hour must be between 0 and 23");
					document.forms[0].exptimeout.focus();
					return false;
					}
				//if  (hour > 12 && ampm != null) {
				//alert("You can't specify AM or PM for military time.");
				//return false;
				//} 
		
				if (minute<0 || minute > 59) {
					alert ("Minute must be between 0 and 59.");
					document.forms[0].exptimeout.focus();
					return false;
				}
		
				if (second != null && (second < 0 || second > 59)) {
					alert ("Second must be between 0 and 59.");
					document.forms[0].exptimeout.focus();
					return false;
				}
	    }

	if(document.forms[0].type[0].checked==true)
	{
		if(document.forms[0].expretdate.value=="")
		{		
			alert("Please enter expretdate...");
			document.forms[0].expretdate.focus();
			return false;
		}
			
		if(document.forms[0].expretdate.value > new Date())
		{
			alert("Date cannot be lesser than current date");
			document.forms[0].expretdate.focus();
			return false;
		}
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

		if(document.forms[0].ItemQty.value=="")
	    {
	      alert("Please enter Qty Received...");
	      document.forms[0].ItemQty.focus();
	      return false;
	    }

				var url="othermatoutward.do?method=submit";
				document.forms[0].action=url;
				document.forms[0].submit();

}

	function reset()
	{
		var url="othermatoutward.do?method=display";
		document.forms[0].action=url;
		document.forms[0].submit();
	}

</script>

<script type="text/javascript">
        function show() { document.getElementById('type').style.display = 'block'; }
		function hide() { document.getElementById('type').style.display = 'none'; }
</script>

<script type="text/javascript">
        function show() { document.getElementById('ppp').style.display = 'block'; }
		function hide() { document.getElementById('ppp').style.display = 'none'; }
</script>

</head>

<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 >

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/menu.jsp"></jsp:include>

<html:form action="othermatoutward.do">

<td width="100%" valign="top" align="left"><br>

			<logic:notEmpty name="disothermatout">
				<html:button property="method" value="Add Materials"  onclick="location.href='othermatoutward.do?method=display&id=addview'"/>
				
						<display:table name="disothermatout" requestURI="" pagesize="20" export="true"  class="its" >

			    		<display:column property="godcno" title="DC No" sortable="true"  headerClass="sortable"/>
            			<display:column property="godcdate" title="DC Date" sortable="true"   headerClass="sortable"/>
            			<display:column property="sentby" title="Sent By" sortable="true" />
						<display:column property="destination" title="Destination" sortable="true" />
						<display:column property="exptimeout" title="Time Out" sortable="true" />
						<display:column property="itemdesc" title="Item Name" sortable="true" />
						<display:column property="type" title="type" sortable="true" />            
            			</display:table>
			</logic:notEmpty>

						

<logic:empty name="disothermatout">

			<table border="0" cellpadding=2 cellspacing=2 width="100%"  style="border: 0px">
				<tr><td width="50%" height="300" valign="top" style="border: 1px solid #4297d7;">
					<div>	<div class="widgetTitle">O T H E R  M A T E R I A L  -  O U T W A R D </div>
		
			<table border="0" cellpadding=3 colspan="3" class="content" style="border: 0px solid #4297d7;" width="50%">
			<tr><td width="25%">Fin Year</td><td> : </td><td width="25%">
					<html:select property="finyear" style="width:150px" styleClass="content">
							<html:option value="1314">2013 - 2014</html:option>
							<html:option value="1213">2012 - 2013</html:option></html:select>
						<br /></td>
			<td width="25%" style="color:red">DC No</td><td> : </td><td width="25%"><html:text property="godcno" readonly="true"/></td>
			<td width="20%" style="color:red">DC Date</td><td> : </td><td width="25%"><html:text property="godcdate" styleId="godcdate" readonly="true" /><br/></td></tr>

			<tr><td width="20%" style="color:red">Sent by</td><td> : </td><td width="25%"><html:text property="sentby"/></td>

						<logic:notEmpty name="othmatoutForm" property="deptlist">
						<bean:define id="dtp" name="othmatoutForm" property="deptlist"/>
						<td cellpadding="20" align="right" style="color:red">Department<br /></td><td> : </td>
						<td><html:select property="sentdept" style="width:150px" styleClass="content">
							<html:option value="Select"></html:option>
							<html:options collection="dtp" property="id" labelProperty="value" />
						</html:select><br /></td>
						</logic:notEmpty>

			<td width="25%" style="color:red">Destination</td><td> : </td><td width="25%"><html:text property="destination"/></td></tr>
			<tr><td width="25%" style="color:red">Exp.Time out</td><td> : </td><td width="25%">
			<html:text property="exptimeout" styleId="exptimeout" styleClass="content" onchange="IsValidTime(this.value)" /><br/></td>

			<td width="25%" ><input type="radio" style="color:red" name="type" value="Returnable" onclick="show();"/></td><td> : </td>
			<td style="color:red">Returnable</td>
			  
			<td width="25%" ><input type="radio" name="type" value="Non Returnable" onclick="hide();" checked /></td><td> : </td>
			<td style="color:red">Non Returnable</td>
			</tr>
			
			<tr><td width="20%">Remarks</td><td> : </td><td colspan="4" width="50%"><html:textarea style="width:100%; height:100%; resize:none" rows="3" property="remarks"/></td>
			<td width="20%" style="color:red" colspan="3"><div id="ppp" style="display: none;">Exp. Return Date : <html:text property="expretdate" styleId="expretdate" /></div></td></tr>

		<tr><td colspan="9"><hr></td><tr>
		<tr>
					<div class="ItemDetails">
					<table class="ItemDetailsForm" class="content" style="border: 1px solid #4297d7;">
					<input type="button" id="btnAddMore"  value="Add row"/>

					<tr bgcolor="#d0e5f5" style="color:red"><td width="40%">Description...</td><td width="5%">UOM</td><td width="10%">No of Cases</td><td width="15%">Qty </td><td style="color:black" width="5%">Delete</td></tr>

					<tr class = "row">

  						<td><input type="text" name="ItemDesc" maxlength="50" size="50"></td>
  						<td><input type="text" name="ItemUom" class="ItemUom" maxlength="5" size="5"></td>
  						<td><input type="text" name="ItemCases" class="ItemCases" maxlength="5" size="5"></td>
  						<td><input type="text" name="ItemQty" class="ItemQty" maxlength="15" size="15"></td>

					 <td><img src="images/Delete.gif" class="deleteThisRow" title="Delete row"></td>

						<!--  input type="button" class="deleteThisRow"  value="Delete"/-->

		</tr>
		</table>
		</div>
 
		</tr>
						<tr>
						<td colspan=9  align="center" style="background-color: #F2F0F1;" ><br />
						<html:button property="method" value="Save" onclick="javascript:save()"/> &nbsp;&nbsp;
						<html:button property="method" value="Close" onclick="location.href='othermatoutward.do?method=display'" /> &nbsp;&nbsp;
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