package com.zz.realm;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.SimpleByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.zz.pojo.Role;
import com.zz.pojo.User;
import com.zz.service.IUserService;

public class SecurityRealm extends AuthorizingRealm {

	@Autowired
	private IUserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		User user = (User) principals.getPrimaryPrincipal();
		List<Role> roles = userService.queryRoleByUserId(user.getUserId());
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		if (roles != null && roles.size() !=0) {
			for (Role role : roles) {
				info.addRole(role.getRoleName());
			}
		}
		System.out.println(user.getUserName()+":"+info.getRoles());
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordToken t = (UsernamePasswordToken) token;
		String userName = t.getUsername();
		User user = new User();
		user.setUserName(userName);
		List<User> list = userService.query(user);
		if (list == null || list.size() == 0) {
			return null;
		}
		user = list.get(0);
		return new SimpleAuthenticationInfo(user, user.getPassword(), new SimpleByteSource(user.getU1()), "myRealm");
	}
	
	public static void main(String[] args) {
		Md5Hash md5 = new Md5Hash("1111", "75c32d9c-fb45-457d-b22e-f2deeb514953", 1024);
		System.out.println(md5);
	}

	

}
