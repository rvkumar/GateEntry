<link href="css/microlabs.css" type="text/css" rel="stylesheet" />

<%@ page  language="java" import="java.util.*,java.text.*"%>
<%!
public int nullIntconv(String inv)
{   
	int conv=0;
		
	try{
		conv=Integer.parseInt(inv);
	}
	catch(Exception e)
	{}
	return conv;
}
%>
<%
 int iYear=nullIntconv(request.getParameter("iYear"));
 int iMonth=nullIntconv(request.getParameter("iMonth"));

 Calendar ca = new GregorianCalendar();
 int iTDay=ca.get(Calendar.DATE);
 int iTYear=ca.get(Calendar.YEAR);
 int iTMonth=ca.get(Calendar.MONTH);

 if(iYear==0)
 {
	  iYear=iTYear;
	  iMonth=iTMonth;
 }

 GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 

 int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
 int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
 
 cal = new GregorianCalendar (iYear, iMonth, days); 
 int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
  

%>
<script>
function goTo()
{
  document.frm.submit();
}
</script>

<form name="frm" method="post">
<table width="85%" border="0" cellspacing="0" cellpadding="0" class="content" style="border: 0px solid #5c9ccc;">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="content" style="border: 1px solid #5c9ccc;">
      <tr>
        <!-- td width="6%"></td -->
        <td width="7%">
        
		<select name="iYear" onchange="goTo()" title="Year">
        <%
		// start year and end year in combo box to change year in calendar
	    for(int iy=iTYear-33;iy<=iTYear+37;iy++)
		{
		  if(iy==iYear)
		  {
		  
		  
		    %>
          <option value="<%=iy%>" selected="selected"><%=iy%></option>
          <%
		  }
		  else
		  {
		    %>
          <option value="<%=iy%>"><%=iy%></option>
          <%
		  }
		}
	   %>
        </select></td>
        <!--h3><%=new SimpleDateFormat("MMMM").format(new Date(2008,iMonth,01))%> <%=iYear%></h3-->
        <td width="73%" align="center"><small><a href="calendar.jsp">Today</a></small></td>
        <!--td width="6%"></td -->
        <td width="8%">
		<select name="iMonth" onchange="goTo()" title="Month">
        <%
		// print month in combo box to change month in calendar
	    for(int im=0;im<=11;im++)
		{
		  if(im==iMonth)
		  {
	     %>
          <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
          <%
		  }
		  else
		  {
		    %>
          <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
          <%
		  }
		}
	   %>
        </select></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <table class="content" align="center" border="0" cellpadding="3" cellspacing="0" width="100%" style="border: 1px solid #5c9ccc;">
      <tbody class="content" >
        <tr>
          <th style="color: red;">Sun</th>
          <th>Mon</th>
          <th>Tue</th>
          <th>Wed</th>
          <th>Thr</th>
          <th>Fri</th>
          <th>Sat</th>
        </tr>
        <%
        int cnt =1;
        for(int i=1;i<=iTotalweeks;i++)
        {
		%>
        <tr>
          <% 
	        for(int j=1;j<=7;j++)
	        {
		        if(cnt<weekStartDay || (cnt-weekStartDay+1)>days)
		        {
		        
		        
		        
		        
		         %>
                <td align="center" height="13">&nbsp;</td>
               <% 
		        }
		        else
		        {
		        
		        
		         %>
                              <% 
		        
		        
		        if(iYear==iTYear && iMonth==iTMonth && iTDay==(cnt-weekStartDay+1)){
		        
		         %>
                <td align="center" height="13" id="day_<%=(cnt-weekStartDay+1)%>" style="background-color: #5c9ccc;"><span><%=(cnt-weekStartDay+1)%></span></td>
               <% 
		        } else{%>
		        
		        <td align="center" height="13" id="day_<%=(cnt-weekStartDay+1)%>" ><span><%=(cnt-weekStartDay+1)%></span></td>
		        
		        <% } }
		        cnt++;
		      }
	        %>
        </tr>
        <% 
	    }
	    %>
      </tbody>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
