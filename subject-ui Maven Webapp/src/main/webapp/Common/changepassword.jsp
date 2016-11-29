<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" href="dist/css/bootstrap.css">
	<link rel="stylesheet" href="dist/css/font-awesome-4.4.0/font-awesome.min.css">
	<link rel="stylesheet" href="css/AdminLTE.css">
  </head>
  
  <body class="login-page">
	<div class="login-box">
		<div class="loginlogo">
			<i class="fa fa-book"></i>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg login-maintext">学生选课系统</p>
			<form method="post" class="loginform">
				<div class="form-group has-feedback" style="height:30px;">
					<span id="freediv" style="display:none;">123</span>					
				</div>
				<div class="form-group has-feedback">
					<input id="oldpassword" type="password" class="form-control login-inputtext" placeholder="原始密码"> 
					<i class="fa fa-lock form-control-feedback loginfa"></i>
				</div>
				<div class="form-group has-feedback">
					<input id="newpassword1" type="password" class="form-control login-inputtext" placeholder="新密码"> 
					<i class="fa fa-lock form-control-feedback loginfa"></i>
				</div>
				<div class="form-group has-feedback">
					<input id="newpassword2" type="password" class="form-control login-inputtext" placeholder="请再输入新密码"> 
					<i class="fa fa-lock form-control-feedback loginfa"></i>
				</div>
				<div class="row">					
					<div class="col-xs-12">
						<button id="chan" type="submit" class="btn btn-primary btn-block btn-flat loginbutton" 
						style="margin-top:0 !important;" onclick="changePass()">修	改</button>
					</div>
				</div>
				<div align="center" style="margin-top:5px;">
					<a href="Common/login.jsp">返回登录</a>
				</div>
			</form>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<script src="js/app.js"></script>
	<script src="dist/js/jquery-2.2.3.min.js"></script>
	<script src="dist/js/bootstrap.js"></script>
	<!-- <script src="/iCheck/icheck.js"></script> -->

	<script type="text/javascript">
		$("#chan").attr({
			"disabled":"disabled"
		});
	
		function faildInfo() {
			$("#freediv").fadeOut(2000);
		}
	
		function changePass() {			
			if(testoldpass && testnewpass1 &&testnewpass2) {			
				$.ajax({
					url : '/AnalyseSystem/updatePasswordBySelf.do',
					data : {
						newpassword1 : $("#newpassword1").val(),
						newpassword2 : $("#newpassword2").val(),
					},
					type : 'POST',
					dataType : 'text',
					success : function(obj) {
						//alert(obj);
						$(".success").html(obj);
						$.fancybox({
							href : "#success",
							overlayColor : '#000',
							overlayOpacity : 0.5,
							centerOnScroll : false,
							transitionIn : 'fade',
							transitionOut : 'fade',
							scrolling : 'no',
							hideOnOverlayClick : true,
							overlayShow : true,
							showCloseButton : false,
						});
						clear1();
					},
					error : function(obj) {
						//alert("error 修改用户密码失败");
						$("#freediv").html("<i class='icon fa fa-close'></i> 新密码修改失败");
						$("#freediv").show();
						setTimeout(faildInfo, 2000);
					}
				});				
			}
		}				
		
		//对原始密码的验证
		var testoldpass = false;
		$("#oldpassword").blur(function() {
			var oldpass = $("#oldpassword").val();
			if (oldpass != "") {
				$.ajax({
					url : '/AnalyseSystem/queryUserPassword.do',
					data : {
						password : $("#oldpassword").val(),
					},
					type : 'POST',
					dataType : "text",
					success : function(obj) {
						//alert(obj);
						if (obj.indexOf("error") >= 0) {
							//验证失败
							$("#freediv").css("color","#d73925");
							$("#freediv").html("<i class='icon fa fa-close'></i> 原始密码错误，请重新输入!");
							$("#freediv").show();
							setTimeout(faildInfo, 1000);
							testoldpass = false;
						} else {
							//验证成功							
							$("#freediv").css("color","#2BA315");
							$("#freediv").html("<i class='icon fa fa-check'></i> 原始密码验证通过!");
							$("#freediv").show();
							setTimeout(faildInfo, 1000);
							$("#newpassword1").removeAttr("disabled");
							testoldpass = true;							
						}
					},
					error : function(obj) {
						$("#freediv").css("color","#d73925");
						$("#freediv").html("<i class='icon fa fa-close'></i> 服务器异常,请刷新重试!");
						$("#freediv").show();
						setTimeout(faildInfo, 1000);
						testoldpass = false;
					}
				});
			} else {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 原始密码不能为空");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				testoldpass = false;
			}				
		});			
		
		//新密码的检查
		var testnewpass1 = false;
		$("#newpassword1").blur(function() {			
			var newpass = $("#newpassword1").val();
			var regt = /^[0-9]$/;
			if(newpass == "") {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 新密码不能为空");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				testnewpass1 = false;
			} else if( newpass.length != 6 ) {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 新密码长度有误");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				testnewpass1 = false;
			} else  if( !regt.test(newpass) ) {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 新密码由6位数字组成");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				testnewpass1 = false;				
			} else {
				$("#freediv").css("color","#2BA315");
				$("#freediv").html("<i class='icon fa fa-check'></i> 新密码验证通过");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				$("#newpassword2").removeAttr("disabled");
				testnewpass1 = true;
			}
		});
		
		//确认密码的检查
		var testnewpass2 = false;
		$("#newpassword2").blur(function() {				
			var confirmnewpass = $("#newpassword2").val().trim();
			var newpass = $("#newpassword1").val().trim();
			if (confirmnewpass == "") {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 确认密码不能为空");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				$("#u2").attr({
					"disabled" : "disabled"
				});
				testnewpass2 = false;
			} else if (newpass != confirmnewpass) {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 两次密码不匹配,请重新输入");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				$("#u2").attr({
					"disabled" : "disabled"
				});
				testnewpass2 = false;
			} else {
				$("#freediv").css("color","#2BA315");
				$("#freediv").html("<i class='icon fa fa-check'></i> 两次密码匹配成功,请点击保存");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				$("#u2").removeAttr("disabled");
				testnewpass2 = true;
			}
		});
	</script>
  </body>
</html>
