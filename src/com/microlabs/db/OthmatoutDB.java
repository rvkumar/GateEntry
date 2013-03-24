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
import com.microlabs.utils.MicrolabsUtils;
import com.microlabs.utils.IdValuePair;
import com.microlabs.utils.OthmatoutDash;

public class OthmatoutDB {
	
	
	public ArrayList getOthmatoutDateWise(String locationid){
		ArrayList ary_othmatout = new ArrayList();
		
		String sql_othmatout = "";
		if (locationid == null) {
			 
		}else {
			sql_othmatout = "Select B.ITEM_DESC, B.UOM, B.QTY, A.GO_SENTBY, A.GO_DESTINATION from GE_OTHERMAT_M AS A, GE_OTHERMAT_D AS B " +
					"where (DATEPART(dd, A.GO_DCDATE) = "+MicrolabsUtils.getDay()+" "+
			"AND DATEPART(mm, A.GO_DCDATE) = "+MicrolabsUtils.getMonth()+" "+
			"AND DATEPART(yy, A.GO_DCDATE) = "+MicrolabsUtils.getYear()+")"+
			" and LOCATION_ID = '"+locationid+"' and A.GO_DCNO = B.GO_DCNO ORDER BY A.GO_DCDATE DESC" ;
			
			
		}
		System.out.println("sql_othmatout ************"+sql_othmatout);
		Connection geconn = ConnectionFactory.getConnection();
				
								
		try {
			Statement st = geconn.createStatement();
			ResultSet rs = st.executeQuery(sql_othmatout);
		HomeForm homeForm1 =null;
		while(rs.next()) {
			
			OthmatoutDash othmatoutDash =new OthmatoutDash(rs.getString("ITEM_DESC"),rs.getString("UOM"),
					rs.getString("QTY"),rs.getString("GO_SENTBY"),rs.getString("GO_DESTINATION"));

			
			ary_othmatout.add(othmatoutDash);
			
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ary_othmatout;
		
	}
	
	public ArrayList getOthmatout(String locationid){
		ArrayList ary_othmatout = new ArrayList();
		
		String sql_othmatout = "";
		if (locationid == null) {
			 
		}else {

			sql_othmatout ="Select A.GO_DCNO, A.GO_DCDATE, A.GO_SENTBY, A.GO_DESTINATION, A.GO_EXPTIMEOUT, B.ITEM_DESC, A.GO_TYPE from GE_OTHERMAT_M as A, GE_OTHERMAT_D as B where " + 
			" A.LOCATION_ID = '"+locationid+"' and A.GO_DCNO = B.GO_DCNO";
			
			try {
				Connection geconn = ConnectionFactory.getConnection();
				Statement st = geconn.createStatement();
				ResultSet rs = st.executeQuery(sql_othmatout);
			HomeForm homeForm1 =null;
			while(rs.next()) {
				
				OthmatoutDash othmatoutDash=new OthmatoutDash(rs.getString("GO_DCNO"),MicrolabsUtils.display(rs.getDate("GO_DCDATE")),
						rs.getString("GO_SENTBY"),rs.getString("GO_DESTINATION"),rs.getString("GO_EXPTIMEOUT"),rs.getString("ITEM_DESC"),
						rs.getString("GO_TYPE"));

				ary_othmatout.add(othmatoutDash);
				
			}		
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		System.out.println("sql_othmatout ************"+sql_othmatout);
		
				
		
		
		return ary_othmatout;
		
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
	

}
