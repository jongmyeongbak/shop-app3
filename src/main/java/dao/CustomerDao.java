package dao;

import java.util.List;

import util.DaoHelper;
import vo.Customer;

public class CustomerDao {

	public void insertCustomer(Customer customer) {
		DaoHelper.update("customerDao.insertCustomer", customer.getId(),
													customer.getPassword(),
													customer.getName(),
													customer.getTel(),
													customer.getEmail());
	}
	
	public List<Customer> getCustomers() {
		return DaoHelper.selectList("customerDao.getCustomers", rs -> {
			Customer customer = new Customer(rs.getString("cust_id"),
											rs.getString("cust_name"),
											rs.getString("cust_tel"),
											rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));
			
			return customer;
		});
	}
	
	public void updateCustomerDisabled(String disabled, String id) {
		DaoHelper.update("customerDao.updateCustomerDisabled", disabled, id);
	}
}
