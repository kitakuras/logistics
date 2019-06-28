<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="/js/select-ui.min.js"></script>


</head>
<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
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

		<form action="/customer/saveAddOrUpdate" method="post">
			<ul class="forminfo">
				<li><input name="customerId" type="hidden"
					value="${dto.customer.customerId }" /></li>
				<li><label>客户姓名</label><input name="customerName" type="text"
					class="dfinput" value="${dto.customer.customerName }" /><i></i></li>
				<li><label>地址</label><input name="address" type="text"
					class="dfinput" value="${dto.customer.address }" /><i></i></li>
				<li><label>性别</label> <input name="cSex" type="radio" value="1"
					${dto.customer.cSex ?"checked":"" } />男 <input name="cSex"
					type="radio" value="0" ${dto.customer.cSex ?"":"checked" } />女 <i></i></li>
				<li><label>邮箱</label><input name="email" type="text"
					class="dfinput" value="${dto.customer.email }" /><i></i></li>
				<li><label>身份证号</label><input name="idCard" type="text"
					class="dfinput" value="${dto.customer.idCard }" /><i></i></li>
				<li><label>联系方式</label><input name="mobilePhone" type="text"
					class="dfinput" value="${dto.customer.mobilePhone }" /><i></i></li>
				<li><label>备注</label><input name="remark" type="text"
					class="dfinput" value="${dto.customer.remark }" /><i></i></li>
				<li><label>常用区间</label>
					<div class="cityright">
						<select class="select2" name="baseId">
							<c:forEach items="${commons }" var="c">
								<option value="${c.baseId }"
									${c.baseId eq dto.customer.baseId?"checked":"" }>${c.baseName }</option>
							</c:forEach>
						</select>
					</div></li>
				<li><label>业务员</label>
					<div class="cityright">
						<shiro:hasRole name="管理员">
							<select class="select2" name="userId">
								<c:forEach items="${users }" var="u">
									<option value="${u.userId }"
										${u.userId eq dto.customer.userId?"checked":"" }>${u.realName }</option>
								</c:forEach>
							</select>
						</shiro:hasRole>
						<shiro:hasAnyRoles name="操作员,业务员">
							<label>${dto.realName }</label>
						</shiro:hasAnyRoles>
					</div></li>
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