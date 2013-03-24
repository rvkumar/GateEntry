package com.microlabs.utils;

/*import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.ChartPostProcessor;
*/
import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;


import org.apache.struts.action.ActionMapping;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

import com.microlabs.action.HomeAction;
import com.microlabs.db.ConnectionFactory;



	public class PieChart {
		
		public void saveChart(JFreeChart chart, String fileLocation) 
		{       
			String fileName = fileLocation;       
			try {       

				// Creating image size along with storing path
				
				
				ChartUtilities.saveChartAsJPEG(new File(fileName), chart, 300, 200);  
				} catch (IOException e) {  
					e.printStackTrace();   
					System.err.println("Problem occurred creating chart.");     
					}     }     
		
		public void processgraphimage(String fileLocation, String location) 
		{       
			String fileName = fileLocation; 
			PieChart p1 = new PieChart();
			
			PieDataset pieDataset = p1.createPieDataSet(location);
			/** Create 3D Pie Chart based on this dataset* */     
			JFreeChart chart = p1.create3DPieChart(pieDataset);   
			
			    
			/** Save the chart to the file system* */   
			p1.saveChart(chart, fileLocation);   
			
		}
		
		public PieDataset createPieDataSet(String loString) { 
			DefaultPieDataset pieDataset = new DefaultPieDataset();     

			// Data filling
			final String[] categories = new String[3];
			final int[] votes= new int[3];
			System.out.println("loString"+loString);
			String sql_visitors = "";
			String sql_matin = "";
			String sql_matout = "";
			
			if (loString == null) {

			}else {
								
				sql_visitors = "Select count(*) from GE_VISITORS where LOCATION_ID = '"+loString+"' ";
				sql_matin = "Select count(*) from GE_MATINWARD_M where LOCATION_ID = '"+loString+"' ";
				sql_matout = "Select count(*) from GE_OTHERMAT_M where LOCATION_ID = '"+loString+"' ";
			}
			
			Connection geconn = ConnectionFactory.getConnection();	
			

			try {
				
				String query = "select a.*, b.*, c.* from " +
						"(Select count(*) from GE_VISITORS where LOCATION_ID = ?) as a, " +
						"(Select count(*) from GE_MATINWARD_M where LOCATION_ID = ?) as b, " +
						"(Select count(*) from GE_OTHERMAT_M where LOCATION_ID = ?) as c ";
				
				PreparedStatement pt = geconn.prepareStatement(query);
				pt.setString(1, loString);
				pt.setString(2, loString);
				pt.setString(3, loString);
				ResultSet rs = pt.executeQuery();
				
				rs.next();
				for(int i=0; i<votes.length;i++) {
					votes[i] = rs.getInt(i+1);
				}
				
				/*
				Statement st1 = geconn.createStatement();
				ResultSet rs1 = st1.executeQuery(sql_visitors);
				
				Statement st2 = geconn.createStatement();
				ResultSet rs2 = st2.executeQuery(sql_matin);
				
				Statement st3 = geconn.createStatement();
				ResultSet rs3 = st3.executeQuery(sql_matout);
				
				while(rs1.next()) {
					votes[0] = rs1.getInt(1);
				}
				while(rs2.next()) {
					votes[1] = rs2.getInt(1);
				}
				while(rs3.next()) {
					votes[2] = rs3.getInt(1);
				}
				*/
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			categories[0]="Visitors-"+votes[0];
			categories[1]="Mat.Inward-"+votes[1];
			categories[2]="Mat.Outward-"+votes[2];
			
			pieDataset.setValue(categories[0], votes[0]);    
			pieDataset.setValue(categories[1], votes[1]);   
			pieDataset.setValue(categories[2], votes[2]);   
			return pieDataset;       
			}    
		
		public JFreeChart create3DPieChart(PieDataset dataset) {      
					/**          * createPieChart3D method Parameters: --java.lang.String title,      
					 *     * --PieDataset dataset, --boolean legend, --boolean tooltips, --boolean     
					 *          * urls          */        
					JFreeChart chart = ChartFactory.createPieChart3D("", dataset, true, true, true); 
					PiePlot3D p = (PiePlot3D) chart.getPlot();  
					p.setForegroundAlpha(0.5f);     
					p.setBackgroundAlpha(0.2f);
					
					chart.setBackgroundPaint(Color.white); 
					chart.setAntiAlias(true);   
					chart.setBorderVisible(false);  
					
					return chart;    
					} 

		
		}
