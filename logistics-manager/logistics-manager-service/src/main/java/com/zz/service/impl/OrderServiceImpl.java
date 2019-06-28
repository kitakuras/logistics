package com.zz.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.zz.common.Constant;
import com.zz.dto.CustomerDto;
import com.zz.dto.OrderDto;
import com.zz.mapper.OrderDetailMapper;
import com.zz.mapper.OrderMapper;
import com.zz.pojo.BasicData;
import com.zz.pojo.Customer;
import com.zz.pojo.OrderDetail;
import com.zz.pojo.User;
import com.zz.service.IBasicDataService;
import com.zz.service.ICustomerService;
import com.zz.service.IOrderService;
import com.zz.service.IUserService;
@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private IUserService userService;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private IBasicDataService basicDataService;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	@Override
	public void getAddOrUpdateInfo(Model m, Integer orderId) {
		// TODO Auto-generated method stub
		List<User> users = userService.queryRole(Constant.ROLE_YWY);
		List<CustomerDto> customerDtos = customerService.query(null);
		List<BasicData> intervals = basicDataService.queryBase(Constant.BASE_COMMON_INTERVAL);
		List<BasicData> units = basicDataService.queryBase(Constant.BASIC_UNIT);
		List<BasicData> payments = basicDataService.queryBase(Constant.BASIC_PAYMENT_TYPE);
		List<BasicData> freights = basicDataService.queryBase(Constant.BASIC_FREIGHT_TYPE);
		List<BasicData> fetchs = basicDataService.queryBase(Constant.BASIC_FETCH_TYPE);
		
		List<Customer> customers = new ArrayList<>();
		for (CustomerDto customerDto : customerDtos) {
			customers.add(customerDto.getCustomer());
		}
		
		m.addAttribute("users", users);
        m.addAttribute("intervals", intervals);
        m.addAttribute("payments", payments);
        m.addAttribute("freights", freights);
        m.addAttribute("fetchs", fetchs);
        m.addAttribute("customers", customers);
//      m.addAttribute("countrys", countrys);
        m.addAttribute("units", units);

		

	}
	@Override
	public boolean saveOrder(OrderDto dto) {
		// TODO Auto-generated method stub
		try {
			orderMapper.insertSelective(dto);
			List<OrderDetail> orderDesc = dto.getOrderDetails();
			for (OrderDetail o : orderDesc) {
				o.setOrderId(dto.getOrderId());
				orderDetailMapper.insertSelective(o);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
