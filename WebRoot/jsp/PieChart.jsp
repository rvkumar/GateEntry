<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<HTML>
<BODY>
<H1>Pie Chart</H1>
<HR>
<%
String chartTitle = "Pie Chart: Percentage of The Votes For Contestants";
%>
<jsp:useBean id="pageViews" class="com.microlabs.utils.PieChart"/>
<cewolf:chart id="pieChart" title="<%=chartTitle%>" type="pie">
<cewolf:gradientpaint>
<cewolf:point x="0" y="0" color="#FFFFFF" />
<cewolf:point x="300" y="0" color="#DDDDFF" />
</cewolf:gradientpaint>
<cewolf:data>
<cewolf:producer id="pageViews" />
</cewolf:data>
</cewolf:chart>
<cewolf:img chartid="pieChart3D" renderer="/cewolf" width="450" height="450"/>
</BODY>
</HTML>
