package dao;

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
}
