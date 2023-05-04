package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;


import model.ProductModelDM;

public class ProductModelDM implements ProductModel {

	private static final String TABLE_NAME = "product";


	@Override
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME + " WHERE CODICE = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return bean;
	}

	

	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return products;
	}



	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "INSERT INTO " + ProductModelDM.TABLE_NAME
				+ " (codice, nome, prezzo, descrizione, gradazione, tipo, img) VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, product.getCode());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setString(4, product.getDescription());
			preparedStatement.setFloat(5, product.getDegree());
			preparedStatement.setString(6,product.getType());
			preparedStatement.setString(7, product.getImg());

			preparedStatement.executeUpdate();
			//connection.setAutoCommit(false);
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}



	@Override
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDM.TABLE_NAME + " WHERE CODICE = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}



	@Override
	public void doModify(ProductBean product, int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE " + ProductModelDM.TABLE_NAME
				+ " SET codice=?, nome=?, prezzo=?, descrizione=?, gradazione=?, tipo=?, img=? "
				+ "WHERE codice = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, product.getCode());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setString(4, product.getDescription());
			preparedStatement.setFloat(5, product.getDegree());
			preparedStatement.setString(6,product.getType());
			preparedStatement.setString(7, product.getImg());
			preparedStatement.setInt(8, code);

			preparedStatement.executeUpdate();
			connection.setAutoCommit(false);
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
	}

	@Override
	public Collection<ProductBean> doFilter(int min, int max) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME
				+ " WHERE gradazione >= ? AND gradazione <= ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, min);
			preparedStatement.setInt(2, max);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		//products.forEach(e -> System.out.println(e.getName()+", "+e.getDegree()));
		return products;
		
	}



	@Override
	public Collection<ProductBean> doRetrieveByVino() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Collection<ProductBean> doRetrieveByDistillato() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Collection<ProductBean> doRetrieveByLiquore() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
