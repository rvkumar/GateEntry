package com.microlabs.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

//import com.sun.org.apache.xpath.internal.operations.Variable;

public class MicrolabsUtils {

	public static String getSysDate(){	
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
		String sysDate= sdf.format(new Date());
		return sysDate;
	}
	
	public static String dateConvert(String dbDate)
	  {
	   Date fdt=null;
	   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	   try{
	    fdt=sdf.parse(dbDate);
	    System.out.println("Getting Fdate is &&&&&&&&&&&&&&&&&&&"+fdt);
	   }
	   catch(Exception e)
	   {
	    e.printStackTrace();
	   }
	   //DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	   DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   String dt=dateFormat.format(fdt);
	   System.out.println("Getting Fdate is &&&&&&&&&&&&&&&&&&&"+dt); 
	  
	   return dt;
	  }
	
	public static String getDay()
	{
		
		String date = getSysDate();
		System.out.println("Inside cobra utils");
	    String day=null;
		StringTokenizer st = new StringTokenizer(date,"/");
		while (st.hasMoreTokens())
		{
			System.out.println("Inside while");
			day=st.nextToken("/");
			String month=st.nextToken("/");
			String year=st.nextToken("/");
		}
		System.out.println("---------Day"+day);
		return day;
	}
	public static String getMonth()
	{
		String date = getSysDate();
		System.out.println("Inside cobra utils");
	    String month=null;
		StringTokenizer st = new StringTokenizer(date,"/");
		while (st.hasMoreTokens())
		{
			System.out.println("Inside while");
			String day=st.nextToken("/");
			 month=st.nextToken("/");
			String year=st.nextToken("/");
		}
		System.out.println("---------Day"+month);
		return month;
	}
	
	public static String getYear()
	{
		String date = getSysDate();
		System.out.println("Inside cobra utils");
	    String year=null;
		StringTokenizer st = new StringTokenizer(date,"/");
		while (st.hasMoreTokens())
		{
			System.out.println("Inside while");
			String day=st.nextToken("/");
			String month=st.nextToken("/");
			 year=st.nextToken("/");
		}
		System.out.println("---------Day"+year);
		return year;
	}
	
	public static String display(Date dbDate)
	{
		String dt="";
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try{
			dt=dateFormat.format(dbDate);
		}catch (Exception e) {
			dt="";
		}
		
		
		//System.out.println("dt:::::::::"+dt); log.info("dt:::::::::"+dt);
		return dt;
	}


	public static String getSysTime() {
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		return dateFormat.format(cal.getTime());
	}
	
	public static String getmssqldatetime(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sysDate= sdf.format(new Date());
		return sysDate;
	}

	public static String getmssqldate(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String sysDate= sdf.format(new Date());
		return sysDate;
	}

}

