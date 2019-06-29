package com.zz.service;

import java.util.List;

import org.springframework.ui.Model;

import com.zz.dto.OrderDto;
import com.zz.pojo.Order;

public interface IOrderService {

	public void getAddOrUpdateInfo(Model m,Integer orderId);

	public boolean saveOrder(OrderDto dto);

	public List<Order> query();

	public void queryInfo(Model m);

	public boolean update(OrderDto dto);

	

}
