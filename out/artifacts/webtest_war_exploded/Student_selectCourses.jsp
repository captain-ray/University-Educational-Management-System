<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>选课</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="Student_include.jsp"%>
<style type="text/css">
#mainContent {
	margin-left: 200px;
}
</style>
</head>
</head>
<body>
	<div id="mainContent">
	<!-- 在这里编辑我的代码 -->

		<h1 id="test">选课</h1>
		<table border="1" class="table table-striped">
			<tr>

				<th>课程代号</th>
				<th>课程名称</th>
				<th>任课教师</th>
				<th>上课地点</th>
				<th>上课时间</th>
				<th>剩余人数</th>
				<th>点击选课</th>


			</tr>
			<c:forEach var="lesson" items="${sessionScope.classes}">
				<tr>
					<td>${lesson.id}</td>
					<td>${lesson.name}</td>
					<td>${lesson.teacher_name }</td>
					<td>${lesson.building}---${lesson.room_number}</td>
					<td>${lesson.day}-${lesson.time}</td>
					<td>${30-lesson.number}</td>
					<td><input id="selectCourse"  onclick="selectCourse(${lesson.id},${lesson.day_code},${lesson.time_code},${30-lesson.number})" type="button" class="btn btn-info btn-block btn-sm" value="点我选课"></td>
					</tr>
			</c:forEach>


		</table>
	
	</div>

	<script type="text/javascript">
		function selectCourse(course_id,day_code,time_code,remain_number) {

		    if(remain_number<=0){ //选课人数不能超过30人
		        alert("已满");
		        return;
			}
            $.get("ajax.do?operation=selectCourse&course_id="+course_id+"&day_code="+day_code+"&time_code="+time_code,
                function(data, textStatus, req) {
                    var rec=data.toString();
						alert(rec);

					if(rec=="选课成功!"){
					    location.reload();
					}
                }
            );
}

	</script>

	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>