<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<form action="/basicdata/saveAddOrUpdate" method="post">
			<ul class="forminfo">
				<li><input type="hidden" name="baseId" value="${data.baseId }"></li>
				<li><label>名称</label><input name="baseName" type="text" class="dfinput"
				
					value="${data.baseName }" /></li>
				<li><label>分配类别</label>
					<div class="cityright">
						<select class="select2" name="parentId" >
							<option value="-1">--本身为大类--</option>
							<c:forEach items="${parents }" var="p">
								<option value="${p.baseId }" ${data.parentId eq p.baseId?'selected':'' }>${p.baseName }</option>
							</c:forEach>
						</select>
					</div></li>
					<li><label>描述</label><input name="baseDesc" type="text" class="dfinput"
					value="${data.baseDesc }" /></li>

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