package model;

import javax.sql.DataSource;

public class CustomerDAO {
	private static CustomerDAO cdao = new CustomerDAO();
	private DataSource dataSource;
	private CustomerDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
}
