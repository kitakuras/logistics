package com.zz.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zz.dto.UserDto;
import com.zz.pojo.Role;
import com.zz.pojo.User;

public interface IUserService {

	public List<User> query(User user);
	
	public Integer addUser(User user);
	
	public Integer updateUser(User user);
	
	public Integer deleteUser(Integer id);
	
	public User queryById(Integer id);

	public List<Role> queryRole();

	public Integer saveUserAndRole(UserDto dto);

	public List<Role> queryRoleByUserId(Integer userId);

	public UserDto getUpdateInfo(Integer userId);

	public void updateUserAndRole(UserDto dto);

	public PageInfo<User> queryUserByPage(UserDto dto);

	public List<User> queryRole(String roleYwy);



}
