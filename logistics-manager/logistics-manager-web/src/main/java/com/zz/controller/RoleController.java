package com.zz.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.zz.dto.RoleDto;
import com.zz.pojo.Role;
import com.zz.service.IRoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private IRoleService roleSerivce;

	@RequestMapping("/query")
	
	public String query(Model m){
		List<Role> list = roleSerivce.query();
		m.addAttribute("list", list);
		return "role/role";
	}
	
	@RequestMapping("/queryPage")
	@RequiresRoles("管理员")
	public String queryPage(Model m,RoleDto dto) {
		PageInfo<Role> pageInfo = roleSerivce.queryUserByPage(dto);
		m.addAttribute("pageModel", pageInfo);
		return "role/role";
	}
	
	@RequestMapping("/goAddOrUpdate")
	public String goAddOrUpdate(Integer roleId,Model m) {
		if (roleId != null) {
			Role role = roleSerivce.queryById(roleId);
			m.addAttribute("role",role);
		}
		return "role/update_role";
	}
	
	@RequestMapping("/saveAddOrUpdate")
	public String saveAddOrUpdate(Role role) {
		if (role != null && role.getRoleId() !=null ) {
			roleSerivce.updateRole(role);
		}else {
			roleSerivce.addRole(role);
		}
		return "redirect:/role/queryPage";
	}
	
	@RequestMapping("/delete")
	public String delete(Integer roleId){
		roleSerivce.deleteRole(roleId);
		return "redirect:/role/query";
	}
}
