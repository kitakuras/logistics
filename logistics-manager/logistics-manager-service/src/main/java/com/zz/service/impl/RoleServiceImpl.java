package com.zz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zz.dto.RoleDto;
import com.zz.mapper.RoleMapper;
import com.zz.pojo.Role;
import com.zz.pojo.RoleExample;
import com.zz.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<Role> query() {
		RoleExample example = new RoleExample();
		return roleMapper.selectByExample(example);
	}

	@Override
	public Integer addRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insertSelective(role);
	}

	@Override
	public Integer updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	@Override
	public Integer deleteRole(Integer id) {
		// TODO Auto-generated method stub
		return roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Role queryById(Integer id) {
		// TODO Auto-generated method stub
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Role> queryRoleByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return roleMapper.queryRoleByUserId(userId);
	}

	@Override
	public PageInfo<Role> queryUserByPage(RoleDto dto) {
		// TODO Auto-generated method stub
		PageHelper.startPage(dto.getPageNum(), dto.getPageSize());
		List<Role> list = this.query();
		PageInfo<Role> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public Role queryByName(String roleYwy) {
		RoleExample example = new RoleExample();
		example.createCriteria().andRoleNameEqualTo(roleYwy);
		List<Role> role = roleMapper.selectByExample(example);
		if (role != null && role.size() ==1) {
			return role.get(0);
		}
		return null;
	}

	
}
