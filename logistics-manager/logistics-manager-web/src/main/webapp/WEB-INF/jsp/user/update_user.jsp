<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">表单</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>基本信息</span>
		</div>

		<form action="/user/saveAddOrUpdate" method="post">
			<ul class="forminfo">
			<li><input name="user.userId" type="hidden" value="${dto.user.userId }"/></li>
			<li><label>账号</label><input name="user.userName" type="text"
				class="dfinput" value="${dto.user.userName }" /><i></i></li>
			<li><label>姓名</label><input name="user.realName" type="text"
				class="dfinput" value="${dto.user.realName }"/><i></i></li>
			<c:if test="${dto eq null}">
			<li><label>密码</label><input name="user.password" type="password"
				class="dfinput" value=""/><i></i></li>
			</c:if>
			<li><label>邮箱</label><input name="user.email" type="text"
				class="dfinput" value="${dto.user.email }"/><i></i></li>
			<li><label>电话</label><input name="user.phone" type="text"
				class="dfinput" value="${dto.user.phone }"/><i></i></li>
			<li><label>分配角色</label> <c:forEach items="${roles }" var="role">
				<c:set var="flag" value="false"></c:set>
				<c:forEach items="${dto.roles }" var="r">
					<c:if test="${r.roleId eq role.roleId }">
						<c:set var="flag" value="true"></c:set>
					</c:if>
				</c:forEach>
					<input name="roleIds" type="checkbox" ${flag?"checked":"" } value="${role.roleId }" />${role.roleName }&nbsp;&nbsp; <i></i>
				</c:forEach></li>
			<li>
			<label>&nbsp;</label><input name="" type="submit" class="btn" value="提交"></li>
			</ul>
		</form>


	</div>


	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>