<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function show(id){
		$(".dfinput").val('');
		$(".tips_").html("&nbsp;   &nbsp; &nbsp; &nbsp;");
		$('#detail_'+id).show('slow');
		
	}
</script>
</head>
<body>
	<table class="tablelist">
		<thead>
			<tr>
				<th>序号</th>
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
						<a href="javascript:void(0);" onclick="show(${user.id})">添加</a>
						</td>
				</tr>
				<div id="detail_${user.id }" class="tail">
					<div class="tailinfo1">
						<br> &nbsp; &nbsp; &nbsp; &nbsp; 请输入ID： <br /> &nbsp; &nbsp;
						&nbsp; &nbsp;
						<textarea rows="50" cols="10" maxlength="100" placeholder="请输入ID"
							id="i${user.id}" style="height: 50px; width: 410px;"
							class="dfinput"></textarea>

						&nbsp; &nbsp; &nbsp; &nbsp;
						<div class='tips_' style='color: red;'>&nbsp; &nbsp; &nbsp;
							&nbsp;</div>
					</div>
					<div class="tailinfo1">
						<br> &nbsp; &nbsp; &nbsp; &nbsp; 请输入姓名： <br /> &nbsp; &nbsp;
						&nbsp; &nbsp;
						<textarea rows="50" cols="10" maxlength="100" placeholder="请输入姓名"
							id="t${user.id}" style="height: 150px; width: 410px;"
							class="dfinput"></textarea>

						&nbsp; &nbsp; &nbsp; &nbsp;
						<div class="tailbtn">
							<input name="" type="button" value="确定"
								onclick="javascript:sure('${user.id}');" />&nbsp; <input
								name="" type="button" class="cancel" value="取消"
								onclick="$('.tail').fadeOut(100);" />
						</div>
					</div>
			</c:forEach>
		</tbody>
	</table>
	
<script type="text/javascript">
	function sure(id){
	$(".tips_").html("&nbsp;   &nbsp; &nbsp; &nbsp;");
	    deleteCompanyaccount(id);
	}						
	function  deleteCompanyaccount(id){
	$(".tips_").html("");
	if($("#t"+id).val()==null||$("#t"+id).val()=='' ){
		$(".tips_").html("&nbsp;   &nbsp; &nbsp; &nbsp;&nbsp;请输入姓名");
		
	}
	else {
		$('.tail').fadeOut(100);
		$(".tips_").html("&nbsp;   &nbsp; &nbsp; &nbsp;");
				 $.post('/clp/userController/add.do',{'complaintId':id,'id':$("#i"+id).val().trim(),'name':$("#t"+id).val().trim()}, 
			function(data){
	     	var message = eval( "(" + data + ")" );
			if (message.msg=="4000") {
	        window.location.href = "${pageContext.request.contextPath}/clp/userController/getall";
         	} 
	     });
		
	}
	}
	</script>
</body>
</html>