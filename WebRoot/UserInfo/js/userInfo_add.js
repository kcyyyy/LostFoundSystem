$(function () {
	$("#userInfo_user_name").validatebox({
		required : true, 
		missingMessage : '请输入学号',
		validType: 'num'
	});

	$("#userInfo_password").validatebox({
		required : true, 
		missingMessage : '请输入登录密码',
	});

	$("#userInfo_areaObj_areaId").combobox({
	    url:'Area/listAll',
	    valueField: "areaId",
	    textField: "areaName",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#userInfo_areaObj_areaId").combobox("getData"); 
            if (data.length > 0) {
                $("#userInfo_areaObj_areaId").combobox("select", data[0].areaId);
            }
        }
	});
	$("#userInfo_name").validatebox({
		required : true, 
		missingMessage : '请输入姓名',
	});
	var data = [
		{'sex' : '男', 'value' : '男' },
		{'sex' : '女', 'value' : '女' },
	];
	$('#userInfo_sex').combobox({
		textField: 'sex',
		valueField: 'value',
		panelHeight: 'auto',
		required : true,
		data: data,
	});
	// $("#userInfo_sex").validatebox({
	// 	required : true, 
	// 	missingMessage : '请输入性别',
	// });

	$("#userInfo_birthday").datebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	$("#userInfo_telephone").validatebox({
		required : true, 
		missingMessage : '请输入联系电话',
		validType: 'mobile',
	});

	$("#userInfo_address").validatebox({
		required : false, 
		//missingMessage : '请输入家庭地址',
	});

	//单击添加按钮
	$("#userInfoAddButton").click(function () {
		//验证表单 
		if(!$("#userInfoAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#userInfoAddForm").form({
			    url:"UserInfo/add",
			    onSubmit: function(){
					if($("#userInfoAddForm").form("validate"))  { 
	                	$.messager.progress({
							text : "正在提交数据中...",
						}); 
	                	return true;
	                } else {
	                    return false;
	                }
			    },
			    success:function(data){
			    	$.messager.progress("close");
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $(".messager-window").css("z-index",10000);
                        $("#userInfoAddForm").form("clear");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#userInfoAddForm").submit();
		}
	});

	//单击清空按钮
	$("#userInfoClearButton").click(function () { 
		$("#userInfoAddForm").form("clear"); 
	});
	//扩展自定义验证
	$.extend($.fn.validatebox.defaults.rules, {
		num:{
			validator: function(value) {
				return /^\d{12}$/i.test(value);
			},
			message: '学号必须为12位数字'
		},
		mobile: {// 验证手机号码
            validator: function (value) {
                return /^(13|15|18)\d{9}$/i.test(value);
            },
            message: '手机号码格式不正确'
        }
	});
});
