package com.zz.dto;

import java.util.List;

import com.zz.pojo.Order;
import com.zz.pojo.OrderDetail;

public class OrderDto extends Order{

	List<OrderDetail> orderDetails;

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
}
