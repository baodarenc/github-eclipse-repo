<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="sdlc.*"%>
<%
    /* No.1 :  Java代码藏于 JSP 中，与 html混合，这是JSP的特征，实验 1， 我们将一些字符串赋予java变量，然后看下面如何应用   Line 65*/
    String title="流浪地球";
    /* No.2 :  Java代码藏于 JSP 中，与 html混合，这是JSP的特征，实验 1， 我们将一些字符串从本project的一个Javaclass中获取后，赋予一个java变量，然后看下面如何应用 Line 70   */
	HelloWorldWeb poem=new HelloWorldWeb();
    String poemText=poem.getPoemContent();
    // No.4 : 获取JSP的URL里参数
    String go=request.getParameter("go");
    if (go!=null&&  "HelloEarth".equalsIgnoreCase(go)){
    	// 跳转到 /HelloEarth, 这是一个 servlet
    	request.getRequestDispatcher("/"+go).forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
<head>
<style>
.background1 {
	background-image: url(/static/imgs/pic008.jpg);
	background-color: #000000;
}
</style>
<script>
	function run(clickedObj) {
		$("#firstline").fadeOut('slow');
		$('#intr')[0].pause();
		$('#poem')[0].play();
		$('#poem-txt').fadeIn('slow');
		$(clickedObj).animate({
			width : '10px',
			opacity : '0.2',
			left : '1800px',
			top : '100px'
		}, 30000);
		//$('#waiting')[0].play();
		$("#moviebox").show('slow');
		$("#movie")[0].play();
	}
	function onVideoEnd(){
		
		$("#moviebox").fadeOut('slow');
		
		$("#hornor").fadeIn('slow');
		
		$('#poem-txt').fadeOut('slow');
		
		$('#poem-txt').animate({
			bottom : '100px',
			right : '100px'
		}, 18000);
		
		$('#waiting')[0].play();
	}
	function onWaitingAudioEnd(){
		$('#intr')[0].play();	
	}
</script>
<meta charset="UTF-8">
<title>The Wandering Earth</title>
<script src="/static/jquery.min.js"></script>
</head>
<body class="background1">
	<audio id="intr" controls="controls"
		src="/static/audio/introduction.mp3" autoplay="autoplay"></audio>
    <a href="/" style="font-size:30px" >回到主页</a>
	<audio id="poem" src="/static/audio/wanderingEarch-poem.mp3"
		preload="auto"></audio>
	<span id="firstline" style="font-size: 22px; color: white">大家好，我是这学期学习“软件工程导论”的学生们准备设计和实现一个“<span
		style="font-size: 38px; color: red"><%=title %></span>”的模拟工程！ 欢迎大家观赏,谢谢！点击屏幕左下角的地球，可以开始悲壮的流浪！！
	</span>
	<audio id="waiting" src="/static/audio/waiting.mp3" preload="auto" onended="onWaitingAudioEnd();"></audio>
	<div id="poem-txt"
		style="display: none; font-size: 22px; color: orange; position:absolute; left :10px;top:50px" >
		<%=poemText%>
	</div>
	<img src="/static/imgs/earth.png"
		style="position: absolute; left: 10px; bottom: 10px; width: 200px"
		onclick="run(this);return false" 
		title="点击后，开始流浪 ！"
		/>
	<div id="moviebox" style="margin-top: 100px; display: none"
		align="center">
		<video id="movie" height="500px" controls="controls"
			src="/static/video/movie.mp4" onended="onVideoEnd();" />

	</div>
	<div id="hornor" style="display:none;position:absolute;left:300px; bottom:10px;color:white;font-size:24px" align="center">谨以此向今年的电影《流浪地球》和华为公司在 2019 年发生的事表示致敬 !  本网页将放在以下网站 sdlc.huaku-2019.xyz (华为公司的云服务器) </div>
</body>
</html>