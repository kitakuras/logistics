package com.zz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zz.dto.CustomerDto;
import com.zz.pojo.Customer;
import com.zz.service.ICustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private ICustomerService customerService;

	@RequestMapping("/query")
	public String query(Customer customer, Model m) {
		List<CustomerDto> query = customerService.query(customer);
		System.out.println(query);
		m.addAttribute("list", query);
		return "customer/customer";
	}

	@RequestMapping("/goAddOrUpdate")
	public String goAddOrUpdate(Integer id, Model m) {
		System.out.println("id:" + id);
		if (id != null) {
			CustomerDto dto = customerService.queryById(id);
			System.out.println(dto);
			m.addAttribute("dto", dto);
		}
		customerService.getSalesManAndCommonInterval(m);
		return "customer/update_customer";
	}

	@RequestMapping("/saveAddOrUpdate")
	public String saveAddOrUpdate(Customer customer) {
		if (customer.getCustomerId() != null) {
			customerService.updateCustomer(customer);
		} else {
			customerService.addCustomer(customer);
		}
		return "redirect:/customer/query";
	}

	@RequestMapping("/delete")
	public void delete(Integer id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		boolean flag = customerService.deleteById(id);
		String msg = "数据删除成功！！!";
		if (!flag) {
			msg = "数据删除失败！！!";
		}
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter w = resp.getWriter();
		w.append("<script type='text/javascript'>");
		w.append("alert('" + msg + "');");
		w.append("location.href='/customer/query';");
		w.append("</script>");
		w.flush();
		w.close();
	}

	@RequestMapping("/queryBaseIdByCustomerId")
	@ResponseBody
	public Integer queryBaseIdByCustomerId(Integer customerId) {
		CustomerDto dto = customerService.queryById(customerId);
		return dto.getCustomer().getBaseId();
	}

}
