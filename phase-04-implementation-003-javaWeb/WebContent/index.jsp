<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.background1 {
	background-image: url(/static/imgs/123.jpg);
	background-color: #000000;
	background-size:cover;                         //设置背景图片拉伸
}                                 
</style>
<script>
    function pageLoad()
    {
    	$("#firstline").fadeIn("slow");
    }
    
	function run(clickedObj) {
		$("#firstline").fadeOut('slow');
		$('#intr')[0].pause();
		$('#poem')[0].play();
		$('#poem-txt').fadeIn('slow');
		$(clickedObj).animate({
			width : '10px',
			opacity : '0.2',
			left : '1200px',
			top : '20px'
		}, 30000);
		$("#moviebox").show('slow');
		$("#movie")[0].play();
		//$('#intr')[0].fadeOut('slow');
		$('#intr').fadeOut('slow');//视频开始播放，音频播放控件消失
	}
	
	function onVideoEnd(){
		$("#firstline").fadeOut('slow');
		$("#moviebox").fadeOut('slow');
		$("#hornor").fadeIn('slow');
		$("#hornor").animate({
			fontSize : '30px',
		    top:  '25%',
		    left: '50px'
		}, 3000);
		$('#poem-txt').fadeOut('slow');
		$('#poem-txt').animate({
			bottom : '500px',
			right : '100px',
			left : '1200px',
			top : '500px'
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
    <p align="center">
	<audio id="intr" controls="controls"
		src="/static/audio/introduction.mp3" autoplay="autoplay" ></audio></p>
		<input type="button" onclick="javascript:window.location.reload()" value="刷新页面" style="position:absolute;left: 1100px;top: 500px">
        <input type="button" onclick="onVideoEnd();" value="结束视频播放" style="position:absolute;left: 1100px;top: 530px">	
	<audio id="poem" src="/static/audio/wanderingEarch-poem.mp3"
		preload="auto"></audio>
    <span id="firstline" style="font-size: 22px; color: white">大家好，我与这学期学习“软件工程导论”的学生们准备设计和实现一个“<span
		style="font-size: 38px; color: red"><a href="https://baike.baidu.com/item/%E6%B5%81%E6%B5%AA%E5%9C%B0%E7%90%83/16278407?fr=aladdin">流浪地球</a></span>”的模拟工程！ 欢迎大家观赏,谢谢！点击屏幕左下角的地球，可以开始悲壮的流浪！！
	</span>
	<audio id="waiting" src="/static/audio/waiting.mp3" preload="auto" onended="onWaitingAudioEnd();"></audio>
	<div id="poem-txt"
		style="display: none; font-size: 18px; color: orange; position:absolute; left :10px;top:65px" >
		《诗词版"流浪地球"》<br /> <span style="font-size: 18px; color: grey">
			-郭鹏 </span><br /> <br /> 西风吹皱东方河，万年地球白发多。 <br /> 流浪星际家何去，满船清梦出银河。
	</div>
	
	<div id="world" style="display:none; font-size:18px; color:red; position:absolute; left:1000px; top:200px">
	</div>
	
	<img src="/static/imgs/earth.jpg"
		style="position: absolute; left: 10px; bottom: 10px; width: 150px"
		onclick="run(this);return false" 
		title="点击后，开始流浪 ！"
		/>
	<div id="moviebox" style="margin-top: 100px; display: none"
		align="center">
		<video id="movie" height="300px" controls="controls"
			src="/static/video/movie.mp4" onended="onVideoEnd();" />
	</div>
	<div id="hornor" style="display:none;position:absolute;left:10x; bottom:10px;color:white;font-size:24px" align="center">2019年发生了很多大事，谨以此向<span style="color:red"><a href="https://baike.baidu.com/item/%E6%B5%81%E6%B5%AA%E5%9C%B0%E7%90%83/16278407?fr=aladdin">《流浪地球》</a></span>和<span style="color:orange"><a href="https://www.huawei.com/cn/">华为公司</a></span>表示致敬 !  <br/>本网页未来将放在以下网站 sdlc.huaku-2019.xyz (华为公司的云服务器) <br/> huaku-2019, 2019 年，《流浪地球》 和华为很酷！ <br/>也许华为的崛起意味着，在人类未来需要流浪地球时，东方大国将作出巨大的贡献 ！</div>
</body>
</html>