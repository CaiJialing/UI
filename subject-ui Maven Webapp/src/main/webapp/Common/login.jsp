<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
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
					<input type="text" class="form-control login-inputtext" placeholder="学号" id="loadid">
					<i class="fa fa-user form-control-feedback loginfa"></i>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control login-inputtext" placeholder="选课密码" id="password"> 
						<i class="fa fa-lock form-control-feedback loginfa"></i>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="col-xs-4" style="padding: 0;">
							<input type="text" class="form-control login-inputtext" placeholder="验证码" id="checknum">
						</div>
						<div class="col-xs-8" style="padding-right: 0; height: 45px;">
							<img id="img" border="0" src="Common/identitycode.jsp" /> 
							<a class="btn refresha" data-toggle="tooltip" title="看不清 ?换一张" href="javascript:refresh()"> 
								<i class="fa fa-refresh form-control-feedback loginfa"></i>
							</a>
						</div>
					</div>
					<div class="col-xs-12">
						<button id="sub" type="submit" class="btn btn-primary btn-block btn-flat loginbutton" onclick="submit()">登	录</button>
					</div>
				</div>
				<div align="center" style="margin-top:5px;">
					<a href="Common/changepassword.jsp">修改密码</a>
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
		$("#sub").attr({
			"disabled":"disabled"
		});
	
		//获取新的验证码			
		function refresh() {
			document.getElementById("img").src = "Common/identitycode.jsp?"
					+ Math.random();
		}
		
		function freeOut(){
			$("#freediv").fadeOut(2000);
		}
		
		//对登录账号进行验证
		var testid = false;
		$("#loadid").blur(function() {
			var loadid = $("#loadid").val();
			if(loadid == "") {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='fa fa-close'></i> 学号不能为空");
				$("#freediv").show();
				setTimeout(freeOut,1000);
			} else {
				$.ajax({
					type:'post',
					url:'/TCourse/textloadid',
					data:{
						loadid : $("#loadid").val()
					},
					success:function(obj){
						/* if(obj == false) {
							$("#freediv").css("color","#d73925");
							$("#freediv").html("<i class='fa fa-close'></i> 学号不存在,请重新输入");
							$("#freediv").show();
							setTimeout(freeOut,1000);
						}
						if(obj == true) { */
							$("#freediv").css("color","#2BA315");
							$("#freediv").html("<i class='fa fa-close'></i> 学号验证通过");
							$("#freediv").show();
							setTimeout(freeOut,1000);
						//}
					},
					error:function(obj) {alert(obj)
						/* $("#freediv").css("color","#d73925");
						$("#freediv").html("<i class='fa fa-close'></i> 系统错误,请重试");
						$("#freediv").show();
						setTimeout(freeOut,1000); */						
						$("#freediv").css("color","#d73925");
						$("#freediv").html("<i class='fa fa-close'></i> 学号不存在,请重新输入");
						$("#freediv").show();
						setTimeout(freeOut,1000);
					}
				});
			}
		});
		
		//对选课密码的验证
		var testpass = false;
		$("#password").blur(function() {			
			var pass = $("#password").val();
			if(pass == "") {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='fa fa-close'></i> 选课密码不能为空");
				$("#freediv").show();
				setTimeout(freeOut,1000);
			} else {
				$.ajax({
					type:'post',
					url:'/TCourse/userlogin.action',
					data:{
						pass : $("#password").val()
					},
					success:function(obj){
						if(obj == false) {
							$("#freediv").css("color","#d73925");
							$("#freediv").html("<i class='fa fa-close'></i> 选课密码错误,请重新输入");
							$("#freediv").show();
							setTimeout(freeOut,1000);
						}
						if(obj == true) {
							$("#freediv").css("color","#2BA315");
							$("#freediv").html("<i class='fa fa-close'></i> 选课密码验证通过");
							$("#freediv").show();
							setTimeout(freeOut,1000);
						}
					},
					error:function() {
						$("#freediv").css("color","#d73925");
						$("#freediv").html("<i class='fa fa-close'></i> 系统错误,请重试");
						$("#freediv").show();
						setTimeout(freeOut,1000);
					}
				});
			}
		});
		
		//验证码的检查
		var testchecknum = false;
		$("#checknum").blur(function() {				
			var cnum = $("#checknum").val();
			if (cnum == "") {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 验证码不能为空");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				testnewpass2 = false;
			} else if (newpass != confirmnewpass) {
				$("#freediv").css("color","#d73925");
				$("#freediv").html("<i class='icon fa fa-close'></i> 验证码错误,请重新输入");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				testnewpass2 = false;
			} else {
				$("#freediv").css("color","#2BA315");
				$("#freediv").html("<i class='icon fa fa-check'></i> 验证码验证通过");
				$("#freediv").show();
				setTimeout(faildInfo, 1000);
				$("#u2").removeAttr("disabled");
				testnewpass2 = true;
			}
		});
	</script>
  </body>
</html>
