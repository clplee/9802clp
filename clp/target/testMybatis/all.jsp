<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
#div1{
   width:200px,
   display:none
}
</style>
<script type="text/javascript">
	function show(id){
		$(".dfinput").val('');
		
		$(".tips_").html("&nbsp;   &nbsp; &nbsp; &nbsp;");
		$('#detail_'+id).show('slow');
		
	}
</script>
</head>
<body>
<table  class="tablelist">
<thead>
				<tr>
					<th>序号 </th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
</thead>
<tbody>
<c:forEach items="${users }" var="user">
  <tr>
  <td>${user.id }</td>
  <td>${user.name }</td>
  <td><a href="/clp/userController/delete.do?id=${user.id }">删除</a>
  <a href=""javascript:void(0);" onclick="show(${user.id})">添加</a>
  <div id="div1"></div>
  </td>
  </tr> 
  <div id="detail_${id }" class="tail">
						<div class="tailtop">
							<span>处理结果</span><a onclick="$('.tail').fadeOut(100);"></a>
						</div>
						<div class="tailinfo1">
							<br> &nbsp; &nbsp; &nbsp; &nbsp; 请输入处理结果： <br /> &nbsp;
							&nbsp; &nbsp; &nbsp;
							<textarea rows="50" cols="10" maxlength="100"
								placeholder="请输入处理结果限制在100个字符以内" id="t${id}"
								style="height: 150px;width:410px;" class="dfinput"></textarea>

							&nbsp; &nbsp; &nbsp; &nbsp;
							<div class='tips_' style='color:red;'>&nbsp; &nbsp; &nbsp;
								&nbsp;</div>
						</div>
						<div class="tailbtn">
							<input name="" type="button" class="sure" value="确定"
								onclick="javascript:sure('${id}');" />&nbsp; <input name=""
								type="button" class="cancel" value="取消"
								onclick="$('.tail').fadeOut(100);" />
						</div>
					</div>
</c:forEach>
</tbody>
</table>

</body>
</html>