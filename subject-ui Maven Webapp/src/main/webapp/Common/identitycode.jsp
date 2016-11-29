<%@ page language="java" import="java.util.*,java.awt.*,java.awt.image.BufferedImage,javax.imageio.ImageIO" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%!                      //产生随机颜色函数 getRandColor
 	public Color getRandColor(int fc, int bc) {
    	Random r = new Random();
    	if (fc > 255)
      		fc = 255;
    	if (bc > 255)
      		bc = 255;
    	int red = fc + r.nextInt(bc - fc); //红
    	int green = fc + r.nextInt(bc - fc); //绿
    	int blue = fc + r.nextInt(bc - fc);
    	return new Color(red, green, blue);
  	}
	%>
    <%    
    	response.setHeader("Cache-Control", "no-cache");
    	//在内存中创建图像
    	int width=150,height=45;
    	BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
    	//获取画笔
    	Graphics g=image.getGraphics();
    	//设置背景色
    	g.setColor(new Color(255,255,255)); //new Color(200,200,200)
    	g.fillRect(0, 0, width, height);
    	
    	g.setColor(new Color(0,0,0));
    	g.drawRect(0, 0, width-1, height-1);
    	//画边框 上面
    	Random rnd=new Random();
    	int randNum=rnd.nextInt(899999)+100000;
    	String randStr=String.valueOf(randNum);
    	//取随机产生的验证码
    	session.setAttribute("randStr", randStr);
    	//将验证码存入session中
    	g.setColor(getRandColor(50,150));
    	g.setFont(new Font("",Font.PLAIN,36));
    	g.drawString(randStr, 13, 35);//横纵坐标
    	//随机产生200个干扰点,使图像中的验证码不易被其他程序探测到
    	for(int i=0;i<300;i++){
    		int x=rnd.nextInt(width);
    		int y=rnd.nextInt(height);
    		g.drawOval(x, y, 1, 1);
    	}
    	//输出图像到页面
    	ImageIO.write(image, "JPEG", response.getOutputStream());
    	out.clear();
    	out=pageContext.pushBody();
    %>
  </body>
</html>
