<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script
	src="https://cdn.bootcss.com/jquery.serializeJSON/2.6.2/jquery.serializejson.js"></script>
<style type="text/css">
.tablelist1 {
	border: solid 1px #cbcbcb;
	width: 90%;
	clear: both;
	margin: 10px;
}

.tablelist1 td {
	height: 35px;
	line-height: 35px;
	text-indent: 11px;
	border: solid 1px #3B3B3B;
	padding-right: 5px;
}

table .td1 {
	text-align: right;
	background-color: #F1F1F1;
	font-weight: bold;
}

table .td2 {
	text-align: center;
	background-color: #F1F1F1;
	font-weight: bold;
}

table select {
	width: 100px;
	border: 1px solid #3B3B3B;
	height: 23px;
}

table input {
	width: 150px;
	border: 1px solid #3B3B3B;
	height: 23px;
	padding-left: 5px;
	padding-top: 2px;
	padding-bottom: 2px;
}
</style>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="/">首页</a></li>
			<li><a href="/user/query">订单管理</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>新增订单</span>
		</div>
		<div style="border: 0px red solid;">
			<form action="/order/save" method="post" id="myform">
				<table class="tablelist1">
					<tr>
						<input type="hidden" name="orderId" value="${order.orderId }">
						<td class="td1">订单编号:</td>
						<td><span>${order.orderId }</span></td>
						<td class="td1">业务员:</td>
						<td><span>${user.realName }</span></td>
						<td class="td1">客户:</td>
						<td><span>${order.shippingName }</span></td>
					</tr>
					<tr>
						<td class="td1">到达国家:</td>
						<td><span>${destArea.baseName }</span></td>
						<td class="td1">收货地址:</td>
						<td><span>${order.takeAddress }</span></td>
						<td class="td1">收货人:</td>
						<td><span>${order.takeName }</span></td>
					</tr>
					<tr>
						<td class="td1">联系电话:</td>
						<td><span>${order.shippingPhone }</span></td>
						<td class="td1">付款方式:</td>
						<td><span>${paymentMethod.baseName }</span></td>
						<td class="td1">货运方式:</td>
						<td><span>${transMethod.baseName }</span></td>
					</tr>
					<tr>
						<td class="td1">取件方式:</td>
						<td><span>${takeMethod.baseName }</span></td>
						<td class="td1">取件费用:</td>
						<td><input type="text" name="">元</td>
						<td class="td1">入库人:</td>
						<td><input type="text" value="${use.realName }"
							disabled="disabled"></td>
					</tr>
					<tr>
						<td class="td1">体积费率:</td>
						<td><input type="text" name="">元/立方</td>
						<td class="td1">重量费率:</td>
						<td><input type="text" name="">元/千克</td>
						<td class="td1">入库选择:</td>
						<td><select name="">
								<c:forEach items="${warehouse }" var="war">
									<option value="${war.baseId }">${war.baseName }</option>
								</c:forEach>
						</select></td>
					</tr>

				</table>
				<table class="tablelist1" id="orderDetailID">
					<tr>
						<td class="td2">货物名称</td>
						<td class="td2">数量</td>
						<td class="td2">单位</td>
						<td class="td2">长（mm）</td>
						<td class="td2">宽（mm）</td>
						<td class="td2">高（mm）</td>
						<td class="td2">核算体积（立方）</td>
						<td class="td2">核算重量（千克）</td>
					</tr>

					<c:forEach items="${orderDetails }" var="od">
						<tr class="mytr">
							<td align="center"><span>${od.goodsName }</span></td>
							<td align="center"><span>${od.goodsNumber }</span></td>
							<td align="center"><span> <c:forEach
										items="${basicdata }" var="b">
										<c:if test="${b.baseId eq od.goodsUnit }">
								${b.baseName }
							</c:if>
									</c:forEach></span></td>
							<td align="center"><input type="text" class="goodsUnitPrice"
								style="width: 50px;" name="" onblur="calculateTotalPrice(this)"></td>
							<td align="center"><input type="text" class="goodsUnitPrice"
								style="width: 50px;" name="" onblur="calculateTotalPrice(this)"></td>
							<td align="center"><input type="text" class="goodsUnitPrice"
								style="width: 50px;" name="" onblur="calculateTotalPrice(this)"></td>
							<td align="center"><input type="text" class="goodsUnitPrice"
								style="width: 50px;" name="" onblur="calculateTotalPrice(this)"></td>
							<td align="center"><input type="text" class="goodsUnitPrice"
								style="width: 50px;" name="" onblur="calculateTotalPrice(this)"></td>
						</tr>
					</c:forEach>
				</table>

				<div style="width: 100%; text-align: center; margin: 20px;">

					<input type="button" value="提交" onclick="submitForm();"
						style="width: 200px; height: 40px; font-size: 24px; background-color: #41A8C6; color: #ffffff;">

				</div>
			</form>
		</div>

		<script type="text/javascript">
			// 单价按钮触发计算总价
			function calculateTotalPrice(ct) {
				// 单价
				var price = $(ct).val();
				var tr = $(ct).parent().parent();
				// 数量
				var number = tr.find(".goodsNumber").val();
				// 设置总价
				tr.find(".goodsTotal1").val(price * number);
				tr.find(".goodsTotal2").val(price * number);

			}
			// 数量按钮触发计算总价
			function calculateTotalNumber(ct) {
				// 数量
				var number = $(ct).val();
				var tr = $(ct).parent().parent();
				// 单价
				var price = tr.find(".goodsUnitPrice").val();
				// 设置总价
				tr.find(".goodsTotal1").val(price * number);
				tr.find(".goodsTotal2").val(price * number);

			}
			// 删除详情选项
			function removeTr(mytr) {
				$(mytr).parent().parent().remove();
			}
			// 默认区间调整
			function changeInterval(customerId) {
				// 获取客户对应的baseId
				$.get("/customer/queryBaseIdByCustomerId", {
					"customerId" : customerId
				}, function(baseId) {
					// 设置区间的默认选项
					console.log($("#destAreaId"));
					var opts = $("#destAreaId").get(0).options;
					for (var i = 0; i < opts.length; i++) {
						var opt = opts[i];
						if (opt.value == baseId) {
							$(opt).attr("selected", "selected");
						}
					}
				});
			}

			/**
			 * 提交表单
			 */
			function submitForm() {
				$.ajax({
					type : "POST",
					url : "/warehouse/save",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify($("#myform").serializeJSON()),
					success : function(msg) {
						if (msg == "success") {
							window.location.href = "/warehouse/query";
						} else {
							alert("---》 " + msg);
						}

					}
				});
			}
		</script>


	</div>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
