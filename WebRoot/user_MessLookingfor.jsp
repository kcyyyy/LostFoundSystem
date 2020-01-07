<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.LookingFor" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<LookingFor> lookingForList = (List<LookingFor>)request.getAttribute("lookingForList");
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>个人寻物启事</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>user_MessSelect">选择信息类别</a></li>
  			<li class="active">个人寻物启事显示</li>
		</ul>
		<div class="row">
			<%
				/*遍历记录*/
				for(int i=0;i<lookingForList.size();i++) {
            		LookingFor lookingFor = lookingForList.get(i); //获取到寻物启事对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>LookingFor/<%=lookingFor.getLookingForId() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=lookingFor.getGoodsPhoto()%>" /></a>
			     <div class="showFields">
			     	<div class="field">
	            		寻物id:<%=lookingFor.getLookingForId() %>
			     	</div>
			     	<div class="field">
	            		标题:<%=lookingFor.getTitle() %>
			     	</div>
			     	<div class="field">
	            		丢失物品:<%=lookingFor.getGoodsName() %>
			     	</div>
			     	<div class="field">
	            		丢失时间:<%=lookingFor.getLostTime() %>
			     	</div>
			     	<div class="field">
	            		丢失地点:<%=lookingFor.getLostPlace() %>
			     	</div>
			     	<div class="field">
	            		报酬:<%=lookingFor.getReward() %>
			     	</div>
			     	<div class="field">
	            		联系电话:<%=lookingFor.getTelephone() %>
			     	</div>
			     	<div class="field">
	            		发布时间:<%=lookingFor.getAddTime() %>
			     	</div>
			        <a class="btn btn-primary top5" href="<%=basePath %>LookingFor/<%=lookingFor.getLookingForId() %>/frontshow">详情</a>
			        <a class="btn btn-primary top5" onclick="lookingForEdit('<%=lookingFor.getLookingForId() %>');" >修改</a>
			        <a class="btn btn-primary top5" onclick="lookingForDelete('<%=lookingFor.getLookingForId() %>');">删除</a>
			        </div>
			</div>
			<%  } %>
		</div>
	</div>

</div>


<div id="lookingForEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;寻物启事信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="lookingForEditForm" id="lookingForEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="lookingFor_lookingForId_edit" class="col-md-3 text-right">寻物id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="lookingFor_lookingForId_edit" name="lookingFor.lookingForId" class="form-control" placeholder="请输入寻物id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="lookingFor_title_edit" class="col-md-3 text-right">标题:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="lookingFor_title_edit" name="lookingFor.title" class="form-control" placeholder="请输入标题">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_goodsName_edit" class="col-md-3 text-right">丢失物品:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="lookingFor_goodsName_edit" name="lookingFor.goodsName" class="form-control" placeholder="请输入丢失物品">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_goodsPhoto_edit" class="col-md-3 text-right">物品照片:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="lookingFor_goodsPhotoImg" border="0px"/><br/>
			    <input type="hidden" id="lookingFor_goodsPhoto" name="lookingFor.goodsPhoto"/>
			    <input id="goodsPhotoFile" name="goodsPhotoFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_lostTime_edit" class="col-md-3 text-right">丢失时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date lookingFor_lostTime_edit col-md-12" data-link-field="lookingFor_lostTime_edit">
                    <input class="form-control" id="lookingFor_lostTime_edit" name="lookingFor.lostTime" size="16" type="text" value="" placeholder="请选择丢失时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_lostPlace_edit" class="col-md-3 text-right">丢失地点:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="lookingFor_lostPlace_edit" name="lookingFor.lostPlace" class="form-control" placeholder="请输入丢失地点">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_goodDesc_edit" class="col-md-3 text-right">物品描述:</label>
		  	 <div class="col-md-9">
			    <textarea id="lookingFor_goodDesc_edit" name="lookingFor.goodDesc" rows="8" class="form-control" placeholder="请输入物品描述"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_reward_edit" class="col-md-3 text-right">报酬:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="lookingFor_reward_edit" name="lookingFor.reward" class="form-control" placeholder="请输入报酬">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_telephone_edit" class="col-md-3 text-right">联系电话:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="lookingFor_telephone_edit" name="lookingFor.telephone" class="form-control" placeholder="请输入联系电话">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_userObj_user_name_edit" class="col-md-3 text-right">学生:</label>
		  	 <div class="col-md-9">
			    <select id="lookingFor_userObj_user_name_edit" name="lookingFor.userObj.user_name" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="lookingFor_addTime_edit" class="col-md-3 text-right">发布时间:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="lookingFor_addTime_edit" name="lookingFor.addTime" class="form-control" placeholder="请输入发布时间">
			 </div>
		  </div>
		</form> 
	    <style>#lookingForEditForm .form-group {margin-bottom:5px;}</style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxLookingForModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";

/*弹出修改寻物启事界面并初始化数据*/
function lookingForEdit(lookingForId) {
	$.ajax({
		url :  basePath + "LookingFor/" + lookingForId + "/update",
		type : "get",
		dataType: "json",
		success : function (lookingFor, response, status) {
			if (lookingFor) {
				$("#lookingFor_lookingForId_edit").val(lookingFor.lookingForId);
				$("#lookingFor_title_edit").val(lookingFor.title);
				$("#lookingFor_goodsName_edit").val(lookingFor.goodsName);
				$("#lookingFor_goodsPhoto").val(lookingFor.goodsPhoto);
				$("#lookingFor_goodsPhotoImg").attr("src", basePath +lookingFor.goodsPhoto);
				$("#lookingFor_lostTime_edit").val(lookingFor.lostTime);
				$("#lookingFor_lostPlace_edit").val(lookingFor.lostPlace);
				$("#lookingFor_goodDesc_edit").val(lookingFor.goodDesc);
				$("#lookingFor_reward_edit").val(lookingFor.reward);
				$("#lookingFor_telephone_edit").val(lookingFor.telephone);
				$.ajax({
					url: basePath + "UserInfo/listAll",
					type: "get",
					success: function(userInfos,response,status) { 
						$("#lookingFor_userObj_user_name_edit").empty();
						var html="";
		        		$(userInfos).each(function(i,userInfo){
		        			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
		        		});
		        		$("#lookingFor_userObj_user_name_edit").html(html);
		        		$("#lookingFor_userObj_user_name_edit").val(lookingFor.userObjPri);
					}
				});
				$("#lookingFor_addTime_edit").val(lookingFor.addTime);
				$('#lookingForEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除寻物启事信息*/
function lookingForDelete(lookingForId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "LookingFor/deletes",
			data : {
				lookingForIds : lookingForId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#lookingForQueryForm").submit();
					//location.href= basePath + "LookingFor/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交寻物启事信息表单给服务器端修改*/
function ajaxLookingForModify() {
	$.ajax({
		url :  basePath + "LookingFor/" + $("#lookingFor_lookingForId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#lookingForEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                $("#lookingForQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();

    /*丢失时间组件*/
    $('.lookingFor_lostTime_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd hh:ii:ss',
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
})
</script>
</body>
</html>

