<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--导航开始-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="<%=basePath %>index.jsp" class="navbar-brand">校园失物招领系统</a>
        </div>        
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="<%=basePath %>index.jsp">首页</a></li>
                 <li><a href="<%=basePath %>UserInfo/frontlist">用户</a></li>
                <li><a href="<%=basePath %>Area/frontlist">学院</a></li>
                <li><a href="<%=basePath %>LookingFor/frontlist">寻物启事</a></li>
                <li><a href="<%=basePath %>LostFound/frontlist"  id="findLost">失物招领</a></li>
                <li><a href="<%=basePath %>Claim/frontlist">认领</a></li>
                <li><a href="<%=basePath %>Praise/frontlist">表扬</a></li>
                <li><a href="<%=basePath %>Notice/frontlist">站内通知</a></li>
              
 
            </ul>
            
             <ul class="nav navbar-nav navbar-right">
             	<%
				  	String user_name = (String)session.getAttribute("user_name");
				    if(user_name==null){
	  			%> 
	  			<li><a href="#" onclick="register();"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;注册</a></li>
                <li><a href="#" onclick="login();"><i class="fa fa-user"></i>&nbsp;&nbsp;登录</a></li>
                
                <% } else { %>
                
                
                <!--huang: 添加个图片组件，显示头像  -->
                 <li><img src=" <%=basePath %><%=session.getAttribute("photo")%>" style="width: 50px;height: 50px;border-radius: 50%;margin-top: 10px"/><li/>             
                <li class="dropdown">
                 
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%=session.getAttribute("user_name") %>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="<%=basePath %>index.jsp"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;首页</a></li>
                        <li><a href="<%=basePath %>user_postSelect.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;发布信息</a></li>
                        <li><a href="<%=basePath %>user_MessSelect.jsp"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;我发布的信息</a></li>
                        <li><a href="<%=basePath %>UserInfo/userInfo_frontModify.jsp"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;修改个人资料</a></li>
                        <li><a href="<%=basePath %>index.jsp"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的收藏</a></li>
                    </ul>
                </li>
                <li><a href="<%=basePath %>logout.jsp"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
                
                <% } %> 
            </ul>
            
        </div>
        <!--导航--> 
    </div>
</nav>
<!--导航结束--> 


<div id="loginDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-key"></i>&nbsp;系统登录</h4>
      </div>
      <div class="modal-body">
      	<form class="form-horizontal" name="loginForm" id="loginForm" enctype="multipart/form-data" method="post"  class="mar_t15">
      	  
      	  <div class="form-group">
			 <label for="userName" class="col-md-3 text-right">学号:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="userName" name="userName" class="form-control" placeholder="请输入学号">
			 </div>
		  </div> 
		  
      	  <div class="form-group">
		  	 <label for="password" class="col-md-3 text-right">密码:</label>
		  	 <div class="col-md-9">
			    <input type="password" id="password" name="password" class="form-control" placeholder="登录密码">
			 </div>
		  </div> 
		  
		</form> 
	    <style>#bookTypeAddForm .form-group {margin-bottom:10px;}  </style>
      </div>
      <div class="modal-footer"> 
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="button" class="btn btn-primary" onclick="ajaxLogin();">登录</button> 
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




 <!--  huang  ：实现注册功能 -->
<div id="registerDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-sign-in"></i>&nbsp;用户注册</h4>
      </div>
      <div class="modal-body">
      	<form class="form-horizontal" name="registerForm" id="registerForm" enctype="multipart/form-data" method="post"  class="mar_t15">
       	<div class="form-group">
			 <label for="register_userName" class="col-md-3 text-right">学号:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="register_userName" name="userInfo.user_name" class="form-control" placeholder="请输入学号">
			 </div>
		  </div> 
		  
      	  <div class="form-group">
		  	 <label for="register_password" class="col-md-3 text-right">登录密码:</label>
		  	 <div class="col-md-9">
			    <input type="password" id="register_password" name="userInfo.password" class="form-control" placeholder="请输入登录密码">
			 </div>
		  </div> 
      	  <div class="form-group">
		  	 <label for="sure_password" class="col-md-3 text-right">确认密码:</label>
		  	 <div class="col-md-9">
			    <input type="password" id="sure_password" name="sure_password" class="form-control" placeholder="请再次输入密码">
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="register_area" class="col-md-3 text-right">所在学院:</label>
		  	 <div class="col-md-9">		  
                 <input class="form-control" type="text" id="register_area" name="userInfo.areaObj.areaId" style="width: auto"/>
			 </div>
		  </div> 
      	  <div class="form-group">
		  	 <label for="regiest_name" class="col-md-3 text-right">姓名:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="regiest_name" name="userInfo.name" class="form-control" placeholder="请输入你的姓名">
			 </div>
		  </div>
      	  <div class="form-group">
		  	 <label for="regiest_gender" class="col-md-3 text-right">性别:</label>
		  	 <div class="col-md-9">			    
			    <select name="userInfo.sex">
			        <option>男</option>
			         <option>女</option>
			    </select>
			 </div>
		  </div>  
      	  <div class="form-group">
		  	 <label for="regiest_photo" class="col-md-3 text-right">学生照片:</label>
		  	 <div class="col-md-9">
			    <input type="file" id="regiest_photo" name="userPhotoFile" class="form-control" size="50" accept="image/*">
			 </div>
		  </div> 
      	  <div class="form-group">
		  	 <label for="regiest_birthday" class="col-md-3 text-right">出生日期:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="regiest_birthday" name="userInfo.birthday" readonly >
			                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			 </div>
		  </div> 
      	  <div class="form-group">
		  	 <label for="regiest_phone" class="col-md-3 text-right">联系电话:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="regiest_phone" name="userInfo.telephone" class="form-control" placeholder="请输入手机号码">
			 </div>
		  </div> 
      	  <div class="form-group">
		  	 <label for="regiest_code" class="col-md-3 text-right">验证码:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="regiest_code" name="regiest_code" class="form-control" placeholder="请输入验证码">
			    <a href="#">获取短信验证码</a>			    
			 </div>
		  </div> 		  		  		  		  		         
		</form> 
	    <style>#bookTypeAddForm .form-group {margin-bottom:10px;}  </style>
      </div>
      <div class="modal-footer"> 
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="button" class="btn btn-primary"  id="userInfoRegister">注册</button> 
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>easyui/locale/easyui-lang-zh_CN.js" ></script>

<!-- 日期样式 -->
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- bootstrapvalidator表单验证 -->
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>

<script src="${pageContext.request.contextPath}/UserInfo/js/userInfo_add.js"></script> 
<script>
$(function () {
	
/*表单验证*/
	$('#registerForm').bootstrapValidator({
		message:'输入的数据有误',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"userInfo.user_name": {
				validators: {
					notEmpty: {
						message: "学号不能为空",
					},
					regexp: {
                        regexp: /^\d{12}$/,
                        message: '学号必须是12位数字'
                    }
				}
			},
			"userInfo.password": {
				validators: {
					notEmpty: {
						message: "登录密码不能为空",
					}
				}
			},
			"sure_password": {
				validators: {
					notEmpty: {
						message: "确认密码不能为空",
					}，
					identical: {
						field: 'userInfo.password',
						message: '两次密码不一致'
					}
				}
			},
			"userInfo.name": {
				validators: {
					notEmpty: {
						message: "姓名不能为空",
					}
				}
			},
			"userInfo.sex": {
				validators: {
					notEmpty: {
						message: "性别不能为空",
					}
				}
			},
			"userInfo.birthday": {
				validators: {
					notEmpty: {
						message: "出生日期不能为空",
					}
				}
			},
			"userInfo.telephone": {
				validators: {
					notEmpty: {
						message: "联系电话不能为空",
					},
					 regexp: {
                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                         message: '请输入正确的联系电话'
                     }
				}
			},

		}
	}); 



	
    /*出生日期组件*/
    $('#regiest_birthday').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
//创建学院的选择下拉框
	$("#register_area").combobox({
	    url:'Area/listAll',
	    valueField: "areaId",
	    textField: "areaName",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#register_area").combobox("getData"); 
            if (data.length > 0) {
                $("#register_area").combobox("select", data[0].areaId);
            }
        }
	});
//注册验证
	$("#userInfoRegister").click(function () {
		//验证表单
		if(!$("#regiesterForm").form("validate")){
			alert("触发了！1");
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			return false;
		}
		else{
			$("#registerForm").form({
				url:"UserInfo/add",
			    onSubmit:function(){
			    	if ($("#registerForm").form("validate")) {
			    		$.messager.progress({
			    			text:"正在提交数据中...",
			    		});
						return true;
					}else{
						return false;
					}
			    },
			    success:function(data){
			    	$.messager.progress("close");
			    	var obj=jQuery.parseJSON(data);
			    	if(obj.success){
			    		$.messager.alert("消息","注册成功！");
			    		$('#registerDialog').modal('hide');
			    	}
			    	else{
			    		$.messager.alert("消息",obj.message);
			    	}
			    }
			});
			$("#registerForm").submit();//提交表单
		}
	});
	/*用户不登陆无法查看失物招领*/	
	$("#findLost").click(function () {
		if(<%=user_name%>==null){
			alert("登录后才能查看失物招领！");
		    $("#findLost").removeAttr('href');
		}
		else{
			$("#findLost").attr('href','<%=basePath %>LostFound/frontlist');
		}
	});

});
function register() {
	/*清空表单中的值*/
	$("#registerDialog input").val("");
	$("#registerDialog textarea").val("");
	$('#registerDialog').modal('show');
}

function ajaxRegister() {
	$("#registerForm").data('bootstrapValidator').validate();
	if(!$("#registerForm").data('bootstrapValidator').isValid()){
		return;
	}
   
	jQuery.ajax({
		type : "post" , 
		url : basePath + "UserInfo/add",
		dataType : "json" , 
		data: new FormData($("#registerForm")[0]),
		success : function(obj) { 
			if(obj.success){ 
                alert("注册成功！");
                $("#registerForm").find("input").val("");
                $("#registerForm").find("textarea").val("");
            }else{
                alert(obj.message);
            }
		},
		processData: false,  
	    contentType: false, 
	});
}


function login() {
	$("#loginDialog input").val("");
	$('#loginDialog').modal('show');
}
function ajaxLogin() {
	$.ajax({
		url : "<%=basePath%>frontLogin",
		type : 'post',
		dataType: "json",
		data : {
			"userName" : $('#userName').val(),
			"password" : $('#password').val(),
		}, 
		success : function (obj, response, status) {
			if (obj.success) {
				
				location.href = "<%=basePath%>index.jsp";
			} else {
				alert(obj.msg);
			}
		}
	});
}
</script> 
