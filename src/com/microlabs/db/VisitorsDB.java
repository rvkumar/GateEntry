package com.microlabs.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.commons.validator.Var;

import com.microlabs.db.ConnectionFactory;
import com.microlabs.form.HomeForm;
import com.microlabs.utils.IdValuePair;
import com.microlabs.utils.MicrolabsUtils;
import com.microlabs.utils.VisitorsDash;

public class VisitorsDB {
	
	public ArrayList getVisitorsDateWise(String locationid){
		ArrayList ary_visitors = new ArrayList();
		
		String sql_visitors = "";
		if (locationid == null) {
			 //sql_visitors = "Select * from GE_VISITORS where CREATED_DATE = '"+MicrolabsUtils.getmssqldate()+"'";
		}else {
			sql_visitors = "Select * from GE_VISITORS " +
					"where (DATEPART(dd, CREATED_DATE) = "+MicrolabsUtils.getDay()+" "+
			"AND DATEPART(mm, CREATED_DATE) = "+MicrolabsUtils.getMonth()+" "+
			"AND DATEPART(yy, CREATED_DATE) = "+MicrolabsUtils.getYear()+")"+
			" and LOCATION_ID = '"+locationid+"' ";
			
			
		}
		System.out.println("sql_visitors ************"+sql_visitors);
		Connection geconn = ConnectionFactory.getConnection();
				
								
		try {
			Statement st = geconn.createStatement();
			ResultSet rs = st.executeQuery(sql_visitors);
		HomeForm homeForm1 =null;
		while(rs.next()) {
			VisitorsDash visitorsDash=new VisitorsDash(rs.getString("VISITOR_NAME"),rs.getString("COMPANY"),
					rs.getString("PLACE"),rs.getString("TIME_IN"),rs.getString("TIME_OUT"), rs.getInt("VISITOR_NO"));

			ary_visitors.add(visitorsDash);
			
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ary_visitors;
		
	}
	
	public ArrayList<IdValuePair> getvistypelist(){
		ResultSet rs=null;
		Statement st=null;
		Connection conn=ConnectionFactory.getConnection();
		ArrayList<IdValuePair> vistypelist = null;
	 	
		String query="";
		query="select VIS_TYPE_ID,VIS_TYPE_NAME from GE_VISTYPE order by VIS_TYPE_ID;";
	 	
	 if(conn!=null){
			try {
				 st=conn.createStatement();
				 rs=st.executeQuery(query);
				 vistypelist=new ArrayList<IdValuePair>();
				 while(rs.next()){
					 vistypelist.add(new IdValuePair(rs.getInt(1), rs.getString(2)));
				 }
			} catch (SQLException e) { 
				e.printStackTrace();
			}
	 }
		 return vistypelist;
	}

	
	public ArrayList<IdValuePair> getvispurposelist(){
		ResultSet rs=null;
		Statement st=null;
		Connection conn=ConnectionFactory.getConnection();
		ArrayList<IdValuePair> vispurposelist = null;
	 	
		String query="";
		query="select VIS_PURPOSE_ID,VIS_PURPOSE_NAME from GE_VISPURPOSE order by VIS_PURPOSE_ID;";
	 	
	 if(conn!=null){
			try {
				 st=conn.createStatement();
				 rs=st.executeQuery(query);
				 vispurposelist=new ArrayList<IdValuePair>();
				 while(rs.next()){
					 vispurposelist.add(new IdValuePair(rs.getInt(1), rs.getString(2)));
				 }
			} catch (SQLException e) { 
				e.printStackTrace();
			}
	 }
		 return vispurposelist;
	}
	
	
	public ArrayList<IdValuePair> getdeptlist(){
		ResultSet rs=null;
		Statement st=null;
		Connection conn=ConnectionFactory.getConnection();
		ArrayList<IdValuePair> deptlist = null;
	 	
		String query="";
		query="select DEPT_ID,DEPT_NM from GE_DEPT order by DEPT_ID;";
	 	
	 if(conn!=null){
			try {
				 st=conn.createStatement();
				 rs=st.executeQuery(query);
				 deptlist=new ArrayList<IdValuePair>();
				 while(rs.next()){
					 deptlist.add(new IdValuePair(rs.getInt(1), rs.getString(2)));
				 }
			} catch (SQLException e) { 
				e.printStackTrace();
			}
	 }
		 return deptlist;
	}
	
	
	public ArrayList getVisitors(String locationid){
		ArrayList ary_visitors = new ArrayList();
		
		String sql_visitors = "";
		if (locationid == null) {
			 //sql_visitors = "Select * from GE_VISITORS where CREATED_DATE = '"+MicrolabsUtils.getmssqldate()+"'";
		}else {

			sql_visitors ="Select A.VISITOR_NAME,A.COMPANY, A.PLACE, D.VIS_PURPOSE_NAME, A.TO_MEET, B.DEPT_NM,C.VIS_TYPE_NAME," +
					"D.VIS_PURPOSE_NAME, A.CREATED_DATE, A.TIME_IN, A.TIME_OUT, A.VISITOR_NO from GE_VISITORS as A, GE_DEPT as B, GE_VISTYPE as C, GE_VISPURPOSE as D where " + 
			" A.LOCATION_ID = '"+locationid+"' and A.DEPT_ID = B.DEPT_ID and A.VIS_TYPE_ID=C.VIS_TYPE_ID and A.VIS_PURPOSE_ID=D.VIS_PURPOSE_ID ORDER BY A.CREATED_DATE DESC";
		
		}
		System.out.println("sql_visitors ************"+sql_visitors);
		Connection geconn = ConnectionFactory.getConnection();
				
		try {
			Statement st = geconn.createStatement();
			ResultSet rs = st.executeQuery(sql_visitors);
		HomeForm homeForm1 =null;
		while(rs.next()) {
			
			VisitorsDash visitorsDash=new VisitorsDash(rs.getString("VISITOR_NAME"),rs.getString("COMPANY"),
					rs.getString("PLACE"),rs.getString("VIS_PURPOSE_NAME"),rs.getString("TO_MEET"),rs.getString("DEPT_NM"),
					MicrolabsUtils.display(rs.getDate("CREATED_DATE")),rs.getString("TIME_IN"),rs.getString("TIME_OUT"),rs.getInt("VISITOR_NO"));

			ary_visitors.add(visitorsDash);
			
		}		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ary_visitors;
		
	}

	public ArrayList getVisitorssearch(String locationid, String visSearch){
		ArrayList ary_visitors = new ArrayList();
		
		String vsrch = visSearch;
		String sql_visitors = "";
		if (locationid == null) {

		}else {

			sql_visitors ="Select A.VISITOR_NAME,A.COMPANY, A.PLACE, D.VIS_PURPOSE_NAME, A.TO_MEET, B.DEPT_NM,C.VIS_TYPE_NAME," +
					"D.VIS_PURPOSE_NAME, A.CREATED_DATE, A.TIME_IN, A.TIME_OUT, A.VISITOR_NO from GE_VISITORS as A, GE_DEPT as B, GE_VISTYPE as C, GE_VISPURPOSE as D where " + 
			" A.LOCATION_ID = '"+locationid+"' and A.DEPT_ID = B.DEPT_ID and A.VIS_TYPE_ID=C.VIS_TYPE_ID and A.VIS_PURPOSE_ID=D.VIS_PURPOSE_ID " +
			" and (A.VISITOR_NAME LIKE '%"+vsrch+"%' or A.COMPANY LIKE '%"+vsrch+"%' or A.PLACE LIKE '%"+vsrch+"%' or A.TO_MEET LIKE '%"+vsrch+"%') ORDER BY A.CREATED_DATE DESC";
		
		}
		System.out.println("sql_visitors ************"+sql_visitors);
		Connection geconn = ConnectionFactory.getConnection();
				
		try {
			Statement st = geconn.createStatement();
			ResultSet rs = st.executeQuery(sql_visitors);
		HomeForm homeForm1 =null;
		while(rs.next()) {
			
			VisitorsDash visitorsDash=new VisitorsDash(rs.getString("VISITOR_NAME"),rs.getString("COMPANY"),
					rs.getString("PLACE"),rs.getString("VIS_PURPOSE_NAME"),rs.getString("TO_MEET"),rs.getString("DEPT_NM"),
					MicrolabsUtils.display(rs.getDate("CREATED_DATE")),rs.getString("TIME_IN"),rs.getString("TIME_OUT"), rs.getInt("VISITOR_NO"));

			ary_visitors.add(visitorsDash);
			
		}		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ary_visitors;
		
	}
	
	
}
