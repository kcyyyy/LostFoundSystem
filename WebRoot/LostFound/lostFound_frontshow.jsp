<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.LostFound" %>
<%@ page import="com.chengxusheji.po.Claim" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    LostFound lostFound = (LostFound)request.getAttribute("lostFound");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看失物招领详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li><a href="<%=basePath %>LostFound/frontlist">失物招领信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">招领id:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getLostFoundId()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">标题:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getTitle()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">物品名称:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getGoodsName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">捡得时间:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getPickUpTime()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">拾得地点:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getPickUpPlace()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">描述说明:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getContents()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">联系人:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getConnectPerson()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">联系电话:</div>
		<div class="col-md-10 col-xs-6" id="showPhone">确认认领后显示联系电话</div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">发布时间:</div>
		<div class="col-md-10 col-xs-6"><%=lostFound.getAddTime()%></div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="history.back();" class="btn btn-primary">返回</button>
			<button onclick="ajaxClaimAdd()" class="btn btn-primary">认领</button>
		</div>
	</div>
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";
/*ajax方式提交认领信息信息*/
function ajaxClaimAdd() { 
//提交之前先获取认领信息
<%	
//认领人
String personName=(String)session.getAttribute("realName");
//认领时间
SimpleDateFormat df=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
String claimTime=df.format(new Date());
%>
/*创建FormData对象用作ajax参数*/
var formData=new FormData();
formData.append('claim.lostFoundObj.lostFoundId','<%=lostFound.getLostFoundId()%>');
formData.append('claim.personName',"<%=personName%>");
formData.append('claim.claimTime','<%=claimTime%>');

jQuery.ajax({
	type : "post",
	url : basePath + "Claim/add",
	dataType : "json" , 
	data : formData,
	success : function(obj) {
		if(obj.success){ 
			alert("认领成功！注意保存联系方式！");
			$("#showPhone").html("<%=lostFound.getPhone()%>");
		} else {
			alert(obj.message);
		}
	},
	processData:false, 
	contentType: false, 
});
} 
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
        

 });

 </script> 
</body>
</html>

