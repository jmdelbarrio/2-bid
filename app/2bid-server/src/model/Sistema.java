package model;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;





public class Sistema {
	public static Logger logger = Logger.getLogger(Sistema.class);
	DataSource pool;
	private static Sistema instance;
	private String path;
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Sistema() {
		 pool=new BasicDataSource();
		 //TODO poner esto en un archivo, http://www.chuidiang.com/java/mysql/BasicDataSource-Pool-Conexiones.php
		((BasicDataSource) pool).setDriverClassName("com.mysql.jdbc.Driver");
		((BasicDataSource) pool).setUrl("jdbc:mysql://localhost:3306/2bid");
		((BasicDataSource) pool).setUsername("root");
		((BasicDataSource) pool).setPassword("dracula");
		
		//DOMConfigurator.configure(System.getProperty("user.dir") + "log4j.xml");
		//DOMConfigurator.configure(  "log4j.xml");
		
		
	}
	
	public void setLogger(String path) {
		System.setProperty("path",this.getPathLogs());
		DOMConfigurator.configure( path + "WEB-INF\\log4j.xml");
	}
	
	public static Sistema getInstance(){
		if (instance == null) {
			instance = new Sistema();
		}
		return instance;
		
	}
	
	public  String getPathLogs() {
		return "C:\\2bid\\logs\\";	
		
	}
	
	
	public String getPathReports() {
		//return "C:\\blazeds\\tomcat\\webapps\\libros-mario-server\\WEB-INF\\reports\\";
		return path + "WEB-INF\\reports\\";
	}
	

	
	public static Connection getConnection() throws SQLException {
		if (instance == null) {
			instance = new Sistema();
		}
		try {
			return instance.pool.getConnection();
		} catch (SQLException e) {
			throw e;
		}
	}
	
	
}