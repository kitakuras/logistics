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
<script type="text/javascript" src="/js/jquery.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		/* $(".click").click(function() {
			$(".tip").fadeIn(200);
		}); */

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script>


</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">数据表</a></li>
			<li><a href="#">基本内容</a></li>
		</ul>
	</div>

	<div class="rightinfo">
		<%--
		<div class="tools">

		 	<ul class="toolbar">
				<shiro:hasAnyRoles name="操作员,业务员">
				<li class="click"><a href="/customer/goAddOrUpdate"><span><img
							src="/images/t01.png" /></span>添加</a></li>
				</shiro:hasAnyRoles>
				<li class="click"><span><img src="/images/t02.png" /></span>修改</li>
				<li><span><img src="/images/t03.png" /></span>删除</li>
				<li><span><img src="/images/t04.png" /></span>统计</li>
			</ul> 


			<ul class="toolbar1">
				<li><span><img src="/images/t05.png" /></span>设置</li>
			</ul>

		</div>--%>


		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>订单编号<i class="sort"><img src="/images/px.gif" /></i></th>
					<th>业务员</th>
					<th>客户姓名</th>
					<th>客户电话</th>
					<th>收货地址</th>
					<th>收货人</th>
					<th>收货人电话</th>
					<th>到达国家</th>
					<th>付款方式</th>
					<th>货运方式</th>
					<th>是否入库</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list }" var="c">
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>${c.orderId }</td>
						<td>${c.userId }</td>
						<td>${c.shippingName }</td>
						<td>${c.shippingPhone }</td>
						<td>${c.takeAddress }</td>
						<td>${c.takeName }</td>
						<td>${c.takePhone }</td>
						<td><c:forEach items="${basicdata }" var="b">
								<c:if test="${b.baseId eq c.destAreaId }">
								${b.baseName }
							</c:if>
							</c:forEach></td>
						<td><c:forEach items="${basicdata }" var="b">
								<c:if test="${b.baseId eq c.paymentMethodId }">
								${b.baseName }
							</c:if>
							</c:forEach></td>
						<td><c:forEach items="${basicdata }" var="b">
								<c:if test="${b.baseId eq c.transMethodId }">
								${b.baseName }
							</c:if>
							</c:forEach></td>
						<td>${c.orderStatus eq 0 ? "未入库":"已入库" }</td>
						<td><c:if test="${c.orderStatus eq 0 }">
								<a href="/warehouse/goAddOrUpdate?orderId=${c.orderId }" class="tablelink">核对订单</a>
							</c:if>
							<c:if test="${c.orderStatus eq 1 }" >
								<a href="/warehouse/see?orderId=${c.orderId }" class="tablelink">查看订单</a>
							</c:if>
							</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>





		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="/images/ticon.png" /></span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>

		</div>




	</div>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>