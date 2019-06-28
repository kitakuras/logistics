package com.zz.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.zz.common.Constant;
import com.zz.dto.CustomerDto;
import com.zz.mapper.CustomerMapper;
import com.zz.pojo.BasicData;
import com.zz.pojo.Customer;
import com.zz.pojo.CustomerExample;
import com.zz.pojo.User;
import com.zz.service.IBasicDataService;
import com.zz.service.ICustomerService;
import com.zz.service.IUserService;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private IBasicDataService basicDataService;
	@Autowired
	private IUserService userService;
	
	@Override
	public List<CustomerDto> query(Customer customer) {
		CustomerExample example = new CustomerExample();
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		if (subject.hasRole(Constant.ROLE_YWY)) {
			System.out.println(Constant.ROLE_YWY);
			example.createCriteria().andUserIdEqualTo(user.getUserId());
			return customerMapper.selectByExample(example);
		} else if (subject.hasRole(Constant.ROLE_ADMIN) || subject.hasRole(Constant.ROLE_CZY)) {
			System.out.println(Constant.ROLE_ADMIN+"&"+Constant.ROLE_CZY);
			return customerMapper.selectByExample(example);
		}
		return null;
	}

	@Override
	public void getSalesManAndCommonInterval(Model m) {
		List<BasicData> L1 = basicDataService.queryBase(Constant.BASE_COMMON_INTERVAL);
		List<User> L2 = userService.queryRole(Constant.ROLE_YWY);
		m.addAttribute("commons", L1);
		m.addAttribute("users", L2);
		
	}

	@Override
	public void addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.insertSelective(customer);
	}

	@Override
	public CustomerDto queryById(Integer id) {
		// TODO Auto-generated method stub
		return customerMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		customerMapper.updateByPrimaryKeySelective(customer);
	}

	@Override
	public boolean deleteById(Integer id) {
		// TODO Auto-generated method stub
		int result = customerMapper.hasOrder(id);
		if (result != 0) {
			return false;
		} else {
			customerMapper.deleteByPrimaryKey(id);
			return true;
		}
		
	}

	

}
