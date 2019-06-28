package com.zz.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zz.dto.RoleDto;
import com.zz.pojo.Role;

public interface IRoleService {

	public List<Role> query();
	
	public Integer addRole(Role role);
	
	public Integer updateRole(Role role);
	
	public Integer deleteRole(Integer id);
	
	public Role queryById(Integer id);

	public List<Role> queryRoleByUserId(Integer userId);

	public PageInfo<Role> queryUserByPage(RoleDto dto);

	public Role queryByName(String roleYwy);
}
