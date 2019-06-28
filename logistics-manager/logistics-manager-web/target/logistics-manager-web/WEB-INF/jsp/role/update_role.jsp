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

		<form action="/role/saveAddOrUpdate" method="post">
			<ul class="forminfo">
				<li><input name="roleId" type="hidden"
					value="${role.roleId }" /></li>
				<li><label>角色名称</label><input name="roleName" type="text"
					class="dfinput" value="${role.roleName }" /><i></i></li>
				<li><label>备注说明</label><input name="roleDesc" type="text"
					class="dfinput" value="${role.roleDesc }" /><i></i></li>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="btn" value="提交"></li>
			</ul>
		</form>


	</div>


	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>