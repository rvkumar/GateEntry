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
import com.microlabs.utils.MatinwardDash;
import com.microlabs.utils.MicrolabsUtils;
import com.microlabs.utils.IdValuePair;;

public class MatinwardDB {
	
	
	public ArrayList getMatinwardDateWise(String locationid){
		ArrayList ary_matinward = new ArrayList();
		
		String sql_matinward = "";
		if (locationid == null) {
			 //sql_visitors = "Select * from GE_VISITORS where CREATED_DATE = '"+MicrolabsUtils.getmssqldate()+"'";
		}else {
			sql_matinward = "Select B.ITEM_DESC, B.UOM, B.QTY_RCVD, A.TIME_IN, A.SUPPLIER_NAME from GE_MATINWARD_M AS A, GE_MATINWARD_D AS B " +
					"where (DATEPART(dd, A.GI_DATE) = "+MicrolabsUtils.getDay()+" "+
			"AND DATEPART(mm, A.GI_DATE) = "+MicrolabsUtils.getMonth()+" "+
			"AND DATEPART(yy, A.GI_DATE) = "+MicrolabsUtils.getYear()+")"+
			" and LOCATION_ID = '"+locationid+"' and A.GI_NO = B.GI_NO";
			
			
		}
		System.out.println("sql_matinward ************"+sql_matinward);
		Connection geconn = ConnectionFactory.getConnection();
				
								
		try {
			Statement st = geconn.createStatement();
			ResultSet rs = st.executeQuery(sql_matinward);
		HomeForm homeForm1 =null;
		while(rs.next()) {
			
			MatinwardDash matinwardDash =new MatinwardDash(rs.getString("ITEM_DESC"),rs.getString("UOM"),
					rs.getString("QTY_RCVD"),rs.getString("TIME_IN"),rs.getString("SUPPLIER_NAME"));

			
			ary_matinward.add(matinwardDash);
			
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ary_matinward;
		
	}
	
	public ArrayList<IdValuePair> getmatlist(){
		ResultSet rs=null;
		Statement st=null;
		Connection conn=ConnectionFactory.getConnection();
		ArrayList<IdValuePair> matlist = null;
	 	
		String query="";
		query="select MAT_ID,MAT_NAME from GE_MATTYPE order by MAT_ID;";
	 	
	 if(conn!=null){
			try {
				 st=conn.createStatement();
				 rs=st.executeQuery(query);
				 matlist=new ArrayList<IdValuePair>();
				 while(rs.next()){
					 matlist.add(new IdValuePair(rs.getInt(1), rs.getString(2)));
				 }
			} catch (SQLException e) { 
				e.printStackTrace();
			}
	 }
		 return matlist;
	}

	public ArrayList getMatinward(String locationid){
		ArrayList ary_matinward = new ArrayList();
		
		String sql_matinward = "";
		if (locationid == null) {
			 //sql_visitors = "Select * from GE_VISITORS where CREATED_DATE = '"+MicrolabsUtils.getmssqldate()+"'";
		}else {

			sql_matinward ="Select A.GI_NO, A.GI_DATE, A.SUPPLIER_NAME, A.SUPPLIER_PLACE, A.TIME_IN, A.PO_NO, A.PO_DATE from GE_MATINWARD_M as A, GE_MATINWARD_D as B where " + 
			" A.LOCATION_ID = '"+locationid+"' and A.GI_NO = B.GI_NO";
		
		}
		System.out.println("sql_matinward ************"+sql_matinward);
		Connection geconn = ConnectionFactory.getConnection();
				
		try {
			Statement st = geconn.createStatement();
			ResultSet rs = st.executeQuery(sql_matinward);
		HomeForm homeForm1 =null;
		while(rs.next()) {
			
			MatinwardDash matinwardDash=new MatinwardDash(rs.getString("GI_NO"),MicrolabsUtils.display(rs.getDate("GI_DATE")),
					rs.getString("SUPPLIER_NAME"),rs.getString("SUPPLIER_PLACE"),rs.getString("TIME_IN"),rs.getString("PO_NO"),
					MicrolabsUtils.display(rs.getDate("PO_DATE")));

			ary_matinward.add(matinwardDash);
			
		}		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ary_matinward;
		
	}

	

}
