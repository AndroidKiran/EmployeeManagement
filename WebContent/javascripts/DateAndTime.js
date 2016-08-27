function setAll()
{
var d=new Date();
var w=new Array(7);
w[0]="sunday";
w[1]="moday";
w[2]="Tuesday";
w[3]="Wednesday";
w[4]="Thursday";
w[5]="Friday";
w[6]="Saturday";
//document.write("Today is::"+w[d.getDay()]);
return w[d.getDay()];
}

setInterval("setTime()", 100);
function setTime()
{
v1=new Date;
sec=v1.getSeconds();
min=v1.getMinutes();
hour=v1.getHours();

 	if(hour>12)
 	{
	hour=hour-12;
	}
 	
 	if(min>60)
 	{
 		min=min-60;
 		hour=hour+1;
 	}
 	
 	if(sec>60)
 	{
 		sec=sec-60;
 		min=min+1;
 		
 	}
 	return [v1.getHours()+":"+v1.getMinutes()+":"+v1.getSeconds()];
}