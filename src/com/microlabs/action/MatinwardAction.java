/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.microlabs.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.jfree.ui.LengthAdjustmentType;
import org.omg.CORBA.StringHolder;

import com.microlabs.db.ConnectionFactory;
import com.microlabs.form.MatinwardForm;
import com.microlabs.form.VisitorsForm;
import com.microlabs.db.MatinwardDB;
import com.microlabs.utils.MicrolabsUtils;
import com.microlabs.db.VisitorsDB;

/** 
 * MyEclipse Struts
 * Creation date: 02-08-2013
 * 
 * XDoclet definition:
 * @struts.action path="/matinward" name="matinwardForm" input="/form/matinward.jsp" parameter="method" scope="request" validate="true"
 * @struts.action-forward name="home" path="/jsp/home.jsp"
 */
public class MatinwardAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */

	public ActionForward displayall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MatinwardForm matinwardForm = (MatinwardForm) form;// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		Connection geconn = ConnectionFactory.getConnection();
		
		String addview = request.getParameter("id");
		String location = (String)session.getAttribute("LocationName");
		String locationid = (String)session.getAttribute("Locationid");
	
		cleardata(mapping, form, request, response);		
		MatinwardDB mw=new MatinwardDB();
		matinwardForm.setMatlist(mw.getmatlist());
		
		try {
			Statement st = geconn.createStatement();
			MatinwardDB mi=new MatinwardDB();
			if (addview == null){ 
			
			ArrayList a1=mi.getMatinward(locationid);
			request.setAttribute("dismatinward", a1);
			}


			
	} catch (SQLException e) {
			e.printStackTrace();
	}
		
		return mapping.findForward("displayall");
	}
	
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MatinwardForm matinwardForm = (MatinwardForm) form;// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		Connection geconn = ConnectionFactory.getConnection();
		
		String addview = request.getParameter("id");
		String location = (String)session.getAttribute("LocationName");
		String locationid = (String)session.getAttribute("Locationid");
	
		cleardata(mapping, form, request, response);		
		MatinwardDB mw=new MatinwardDB();
		matinwardForm.setMatlist(mw.getmatlist());
		
		try {
			Statement st = geconn.createStatement();

			MatinwardDB mi=new MatinwardDB();
			if (addview == null){ 
			
			ArrayList a1=mi.getMatinward(locationid);
			request.setAttribute("dismatinward", a1);
			}
			
	} catch (SQLException e) {
			e.printStackTrace();
	}
		
		return mapping.findForward("display");
	}

	
	public ActionForward cleardata(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MatinwardForm matinwardForm = (MatinwardForm) form;// TODO Auto-generated method stub

		 Connection geconn = ConnectionFactory.getConnection();
		 String sqlreccnt="select max(GI_NO) as GI_NO from GE_MATINWARD_M";
		 int gi_no=1;
		 try {
			 Statement st = geconn.createStatement();			
			 ResultSet rs1 = st.executeQuery(sqlreccnt);
			 	
			 	if (rs1.next())
				{
					gi_no=rs1.getInt("GI_NO")+1;
				}
			 	
		 }catch (Exception e) {
			e.printStackTrace();
		}
		matinwardForm.setMandt("150");
		matinwardForm.setFinyear("") ;
		matinwardForm.setGino(String.valueOf(gi_no));
		matinwardForm.setGidate(MicrolabsUtils.getSysDate());
		matinwardForm.setTimein("");
		matinwardForm.setDocno("");
		matinwardForm.setDocdate(MicrolabsUtils.getSysDate());
		matinwardForm.setSuppliername("");
		matinwardForm.setSupplierplace("");
		matinwardForm.setVehicleno("");
		matinwardForm.setDrivername("");
		matinwardForm.setTransportername("");
		matinwardForm.setEnteredby("");
		matinwardForm.setReasonremarks("");
		matinwardForm.setPotype("Without PO");
		matinwardForm.setPono("");
		matinwardForm.setPodate("");
		
		// ge_matinward_details fields
		matinwardForm.setItemno("");
		matinwardForm.setItemcode("");
		matinwardForm.setItemdesc("");
		matinwardForm.setUom("");
		matinwardForm.setNoofcases("");
		matinwardForm.setQty("");
		matinwardForm.setQtyrcvd("");
		
		return null;
	
	}	
	
	public ActionForward submit(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			MatinwardForm matinwardForm = (MatinwardForm) form;// TODO Auto-generated method stub
			
			
			matinwardForm.setGidate(MicrolabsUtils.getmssqldatetime());
			matinwardForm.setTimein(MicrolabsUtils.getSysTime());
			matinwardForm.setDocdate(MicrolabsUtils.getmssqldatetime());
			
			 HttpSession session = request.getSession();
			 String gateno = (String)session.getAttribute("GateNo");
			 String username = (String)session.getAttribute("UserName");
			 String location = (String)session.getAttribute("LocationName");
			 String locationid = location.substring(0,location.lastIndexOf("-"));

			 
				String mandt = matinwardForm.getMandt();
				String finyear = matinwardForm.getFinyear() ;
				String gino = matinwardForm.getGino();
				String gidate = matinwardForm.getGidate();
				String timein = matinwardForm.getTimein();
				String docno = matinwardForm.getDocno();
				String docdate = matinwardForm.getDocdate();
				String suppliername = matinwardForm.getSuppliername();
				String supplierplace = matinwardForm.getSupplierplace();
				String vehicleno = matinwardForm.getVehicleno();
				String drivername = matinwardForm.getDrivername();
				String transportername = matinwardForm.getTransportername();
				String enteredby = matinwardForm.getEnteredby();
				String reasonremarks = matinwardForm.getReasonremarks();
				String potype = matinwardForm.getPotype();
				String pono = matinwardForm.getPono();
				String podate = matinwardForm.getPodate();				
				
				if (matinwardForm.getPotype().equalsIgnoreCase("Without PO")){
					pono ="";
				}
				
				// ge_matinward_details fields
				String itemno = matinwardForm.getItemno();
				String itemcode = matinwardForm.getItemcode();
				String itemdesc = matinwardForm.getItemdesc();
				String uom = matinwardForm.getUom();
				String noofcases = matinwardForm.getNoofcases();
				String qty = matinwardForm.getQty();
				String qtyrcvd = matinwardForm.getQtyrcvd();
				

				 try {
					 
					 Connection geconn = ConnectionFactory.getConnection();
						Statement st = geconn.createStatement();
				 String sqlreccnt="select max(GI_NO) as GI_NO from GE_MATINWARD_M";
				 
				 ResultSet rs1 = st.executeQuery(sqlreccnt);
				 int gi_no=1;
				 if (rs1.next())
				 {
					 gi_no=rs1.getInt("GI_NO")+1;
				 }
				 
				 String sql1="insert into GE_MATINWARD_M (MANDT,"+
							"FIN_YEAR,"+
							"LOCATION_ID,"+
							"GATE_NO,"+
							"GI_NO,"+
							"GI_DATE, "+
							"TIME_IN, "+
							"DOC_NO, "+
							"DOC_DATE, "+
							"SUPPLIER_NAME, "+
							"SUPPLIER_PLACE, "+
							"VEHICLE_NO, "+
							"DRIVER_NAME, "+
							"TRANSPORTER_NAME,"+
							"ENTERED_BY,"+
							"REASON_REMARKS," +
							"PO_TYPE," +
							"PO_NO," +
							"PO_DATE ) values ('150','"+finyear+"','"+locationid+"','"+gateno+"','"+gi_no+"','"+gidate+"','"+timein+"'," +
									"'"+docno+"','"+docdate+"','"+suppliername+"','"+supplierplace+"','"+vehicleno+"'," +
									"'"+drivername+"','"+transportername+"','"+enteredby+"','"+reasonremarks+"'," +
									"'"+potype+"','"+pono+"','"+podate+"')";
					
							int insert1 = st.executeUpdate(sql1);
							
							String[] matid = matinwardForm.getMatid();
							
									String[] ItemDesc=request.getParameterValues("ItemDesc");
									String[] ItemUom=request.getParameterValues("ItemUom");
									String[] ItemCases=request.getParameterValues("ItemCases");
									String[] ItemQtyrcvd=request.getParameterValues("ItemQtyrcvd");
									int count=1;
							for(int i=0;i<ItemDesc.length;i++){
								 	
								/*System.out.println("matid[i]"+matid[i]);
								System.out.println("ItemDesc[i]"+ItemDesc[i]);
								System.out.println("ItemUom[i]"+ItemUom[i]);
								System.out.println("ItemQtyrcvd[i]"+ItemQtyrcvd[i]);
								System.out.println("ItemCases[i]"+ItemCases[i]);*/
								
								String sql2="insert into GE_MATINWARD_D (GI_NO,"+
									"ITEM_NO,"+
									"MAT_ID,"+
									"ITEM_DESC, "+
									"UOM, "+
									"NO_OF_CASES, "+
									"QTY_RCVD, "+
									"CREATED_BY, "+
									"CREATED_DATE) values ('"+gi_no+"','"+count+"','"+matid[i]+"'," +
											"'"+ItemDesc[i]+"','"+ItemUom[i]+"'," +
											"'"+ItemCases[i]+"','"+ItemQtyrcvd[i]+"','"+username+"','"+MicrolabsUtils.getmssqldatetime()+"')";
							
								 System.out.println("Getting sql2 is ************"+sql2);
									int insert2 = st.executeUpdate(sql2);
									count++;
								 
							}
							
							if (insert1>0 ){
								
								cleardata(mapping, form, request, response);
								matinwardForm.setMessage("Materials Details saved Successfully...");
							}else {
								matinwardForm.setMessage("Error while saving details...");
							}

							MatinwardDB mv=new MatinwardDB();
							matinwardForm.setMatlist(mv.getmatlist());

				 }catch (Exception e) {
						e.printStackTrace();
					}
					//return display(mapping, form, request, response);
					
				return mapping.findForward("display");
				
				
				
			 
			}

		

}