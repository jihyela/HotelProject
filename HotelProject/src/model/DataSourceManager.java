package model;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp.BasicDataSource;
/**
 * Database Connection Pool ( DBCP )  
 * : 시스템 성능 향상을 위해 
 * 	 컨넥션을 생성 소멸하지 않고 
 *   미리 만들어 놓은 컨넥션을 빌려주고 반납받도록 한다. 
 */
public class DataSourceManager {
	private static DataSourceManager instance=new DataSourceManager();
	private DataSource dataSource;
	private DataSourceManager(){
		BasicDataSource dbcp=new BasicDataSource();
		dbcp.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dbcp.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:xe");
		dbcp.setUsername("scott");
		dbcp.setPassword("tiger");
		dbcp.setMaxActive(20);
		dataSource=dbcp;
	}
	public static DataSourceManager getInstance(){
		return instance;
	}
	public DataSource getDataSource(){
		return dataSource;
	}
}

