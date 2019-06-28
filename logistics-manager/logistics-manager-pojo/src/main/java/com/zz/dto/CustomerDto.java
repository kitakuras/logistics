package com.zz.dto;

import com.zz.pojo.Customer;

public class CustomerDto extends Customer {
	private Customer customer;
	private String commonInterval;
	private String realName;
	private String orderNum;

	public CustomerDto(Customer customer, String commonInterval, String realName, String orderNum) {
		super();
		this.customer = customer;
		this.commonInterval = commonInterval;
		this.realName = realName;
		this.orderNum = orderNum;
	}

	public CustomerDto() {
		super();
	}

	@Override
	public String toString() {
		return "CustomerDto [customer=" + customer + ", commonInterval=" + commonInterval + ", realName=" + realName
				+ ", orderNum=" + orderNum + "]";
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCommonInterval() {
		return commonInterval;
	}

	public void setCommonInterval(String commonInterval) {
		this.commonInterval = commonInterval;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

}
