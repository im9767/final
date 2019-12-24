/**
 * 메인이미지 타이머 활용
 */
function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "http://code.jquery.com/jquery-3.2.1.min.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}
loadJQuery();
var ctx=getContextPath();
function getContextPath(){
	return sessionStorage.getItem("contextpath");
}
var imgArr=new Array();
imgArr[0]=ctx+"/resources/images/slider1.jpg";
imgArr[1]=ctx+"/resources/images/slider6.jpg";
imgArr[2]=ctx+"/resources/images/slider3.jpg";
imgArr[3]=ctx+"/resources/images/slider5.jpg";

var index=1;
var main_slider=document.getElementById("main_slider");

setInterval(function(){
	$("#main_slider").stop().fadeOut(500,function(){
		main_slider.style.backgroundImage="url("+imgArr[index++]+")";
		$("#main_slider").fadeIn(500);
		if(index==4){
			index=0;
		}
	});
},3000);
	
	
	
	
	
	
	
	