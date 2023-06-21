package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.IndirizzoBean;

public class IndirizzoDAO {
	private static DataSource ds;
	private static  String table_name="indirizzo";
	private static String table2_name="spedizione";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/burn_house");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	
	public synchronized IndirizzoBean DoRetrieveByKey(String via, String cap, String citta) throws SQLException{
		Connection con=null;
		PreparedStatement query=null;
		
		IndirizzoBean ind=new IndirizzoBean();
		
		try {
			con=ds.getConnection();
			query=con.prepareStatement("Select * From "+table_name+" Where via=? AND cap=? AND citta=?");
			if((via!=null && !via.equals(""))&&(cap!=null && !cap.equals(""))&&(citta!=null && !citta.equals(""))) {
				query.setString(1, via);
				query.setString(2, cap);
				query.setString(3, citta);
				
				ResultSet res=query.executeQuery();
			while(res.next()) {
				ind.SetVia(res.getString("via"));
				ind.SetCap(res.getString("cap"));
				ind.SetCitta(res.getString("citta"));
			}
			
			}
		}finally {
			try {
				if (query != null)
					query.close();
			} finally {
				if (con != null)
					con.close();
			}
		}
		return ind;
		
	}
	
	public synchronized ArrayList<IndirizzoBean> DoRetrieveAll(String order) throws SQLException{
		Connection con=null;
		PreparedStatement query=null;
		
		IndirizzoBean ind=new IndirizzoBean();
		ArrayList<IndirizzoBean> indirizzi=new ArrayList<IndirizzoBean>();
		
		try {
			con=ds.getConnection();
			query=con.prepareStatement("Select * From "+table_name+" Order by ?");
			if(order!=null && order!="") {
				query.setString(1, order);
				
				ResultSet res=query.executeQuery();
				
				while(res.next()) {
				ind.SetVia(res.getString("via"));
				ind.SetCap(res.getString("cap"));
				ind.SetCitta(res.getString("citta"));
				indirizzi.add(ind);
				}
			}
		}finally {
			try {
				if (query != null)
					query.close();
			} finally {
				if (con != null)
					con.close();
			}
		}
		return indirizzi;	
}
	
	public synchronized void DoSave(String via, String cap, String citta, String utente) throws SQLException{
		Connection con=null;
		PreparedStatement query=null;
		PreparedStatement query2=null;
		IndirizzoBean ind=new IndirizzoBean();
		ind=this.DoRetrieveByKey(via, cap, citta);
		
		try {
			con=ds.getConnection();
			query=con.prepareStatement("INSERT INTO "+table_name+" Values(?,?,?)");
			query2=con.prepareStatement("INSERT INTO "+table2_name+" VALUES(?,?,?,?)");
			
			
			if((via!=null && !via.equals(""))&&(cap!=null && !cap.equals(""))&&(citta!=null && !citta.equals(""))&&(!utente.equals("") && utente!=null)) {
				if(!ind.GetVia().equals(via)) {
				query.setString(1, via);
				query.setString(2, cap);
				query.setString(3, citta);
				query.executeUpdate();
				}
				
				query2.setString(1,utente);
				query2.setString(2, via);
				query2.setString(3, cap);
				query2.setString(4, citta);
				
				
				query2.executeUpdate();
				
				
			}
			
		}finally {
			try {
				if(query!=null||query2!=null) {query.close();
				query2.close();
				}
			}finally {
				if(con!=null)con.close();
			}
		}
	}
	
	public synchronized void DoDelete(String via, String cap, String citta,String utente) throws SQLException{
		Connection con=null;
		PreparedStatement query=null;
		PreparedStatement query2=null;
		
		try {
			con=ds.getConnection();
			query=con.prepareStatement("DELETE FROM "+table_name+" WHERE via=? AND cap=? AND citta=?");
			query2=con.prepareStatement("DELETE FROM "+table2_name+" WHERE utente=? AND via=? AND cap=? AND citta=?");
			
			if((via!=null && !via.equals(""))&&(cap!=null && !cap.equals(""))&&(citta!=null && !citta.equals(""))&&(!utente.equals("") && utente!=null)) {
				query.setString(1, via);
				query.setString(2, cap);
				query.setString(3, citta);
				query2.setString(1,utente);
				query2.setString(2, via);
				query2.setString(3, cap);
				query2.setString(4, citta);
				
				query2.executeUpdate();
				
				
				
				
			}
		}finally {
			try {
				if(query!=null||query2!=null) {query.close();
				query2.close();
				}
			}finally {
				if(con!=null)con.close();
			}
			
		}
	}
	
	
	public synchronized ArrayList<IndirizzoBean> DoRetrieveByUser(String user) throws SQLException{
		Connection con=null;
		PreparedStatement query=null;
		
		ArrayList<IndirizzoBean> indirizzi=new ArrayList<IndirizzoBean>();
		
		try {
			con=ds.getConnection();
			query=con.prepareStatement("Select via,cap,citta from "+table2_name+" Where utente=?");
			
			if(user!=null && (!user.equals("")))
			{
				query.setString(1,user);
				ResultSet res=query.executeQuery();
				
				while(res.next()) {
					IndirizzoBean ind=new IndirizzoBean();
					ind.SetVia(res.getString("via"));
					ind.SetCap(res.getString("cap"));
					ind.SetCitta(res.getString("citta"));
					indirizzi.add(ind);
				}
				
			}
			
		}finally {
			try {
				if(query!=null)query.close();
			}finally {
				con.close();
			}
		}
		return indirizzi;
	}
	
}
