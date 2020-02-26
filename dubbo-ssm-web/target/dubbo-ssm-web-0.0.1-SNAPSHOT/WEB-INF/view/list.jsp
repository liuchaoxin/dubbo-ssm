<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="/resource/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="container form-inline">
	<form action="list" method="post">
			发布日期:<input type="text"  class="form-control"  onclick="WdatePicker()"
				name="startDate" value="${con.startDate}"> --<input
				type="text" onclick="WdatePicker()" class="form-control"
				 name="endDate" value="${con.endDate}">
			排序: <select class="form-control" name="orderName">
				<option value="">请选择排序内容</option>
				<option value="created"
					${con.orderName == 'created' ? 'selected' : '' }>发布时间</option>
				<option value="user_id"
					${con.orderName == 'user_id' ? 'selected' : '' }>作者Id</option>
				<option value="hits"
					${con.orderName == 'hits' ? 'selected' : '' }>点击量</option>
			</select> <select class="form-control" name="orderMethod">
				<option value="">请选择</option>
				<option value="asc" ${con.orderMethod == 'asc' ? 'selected' : '' }>升序</option>
				<option value="desc" ${con.orderMethod == 'desc' ? 'selected' : '' }>倒序</option>
			</select> <input type="submit" value="查询" class="btn btn-primary">
		</form>
	<table class="table table-dark">
			<tr>
				<th>title</th>
				<th>created</th>
				<th>userId</th>
				<th>hot</th>
				<th>hits</th>
			</tr>
			<c:forEach items="${info.list}" var="a">
				<tr>
					<td>${a.title }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${a.created }" /></td>
					<td>${a.userId }</td>
					<td>${a.hot }</td>
					<td>${a.hits }</td>
				</tr>
			</c:forEach>
		</table>
	
	
	<jsp:include page="/WEB-INF/view/common/pages.jsp" />
	</div>
</body>
<script type="text/javascript">
function goPage(pageNum) {
	//var orderMethod='${VO.orderMethod=="desc"?"asc":"desc"}';
	//var orderMethod='${VO.orderMethod}';
	
	var startDate=$("[name=startDate]").val();
	//alert(startDate)
	location.href = "/list?pageNum=" + pageNum+"&startDate="+startDate+"&endDate=${con.endDate}&orderName=${con.orderName}&orderMethod=${con.orderMethod}";
}

</script>
</html>