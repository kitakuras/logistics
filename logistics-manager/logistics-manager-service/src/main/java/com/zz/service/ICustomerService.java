package com.zz.service;

import java.util.List;

import org.springframework.ui.Model;

import com.zz.dto.CustomerDto;
import com.zz.pojo.Customer;

public interface ICustomerService {

	public List<CustomerDto> query(Customer customer);

	public void getSalesManAndCommonInterval(Model m);

	public void addCustomer(Customer customer);

	public CustomerDto queryById(Integer id);

	public void updateCustomer(Customer customer);

	public boolean deleteById(Integer id);

}
