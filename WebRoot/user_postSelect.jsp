<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ page import="com.chengxusheji.po.Area" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>选择发布类别</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
  <style>
.showImg{
      position: absolute;
      top:300px;
      height: 200px;
      width:1000px;
}
.myfooter{
     position:absolute;
     bottom: 0px;
     left: 0px;
     width:100%;
}
.imgPosition{
    margin-right: 50px;

}
</style>
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">选择发布类别</li>
	</ul>
		<div class="showImg"> 
		  <a href="#"><img alt="请选择类别" class="imgPosition" src="<%=basePath %>images/select/select1.png"></a>
		  <a  href="<%=basePath %>LookingFor/lookingFor_frontAdd.jsp"><img alt="选择发布寻物启事" class="imgPosition" src="<%=basePath %>images/select/select2.png"></a>
		  <a href="<%=basePath %>LostFound/lostFound_frontAdd.jsp"><img alt="选择发布招领启事" class="imgPosition" src="<%=basePath %>images/select/select3.png"></a>
		  <a href="<%=basePath %>Praise/praise_frontAdd.jsp"><img alt="选择发布感谢信" class="imgPosition" src="<%=basePath %>images/select/select4.png"></a>
      </div>
   </div>
</div>

<div class="myfooter"><jsp:include page="footer.jsp"></jsp:include></div>

<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
</body>
</html>

