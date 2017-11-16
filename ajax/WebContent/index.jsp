<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AJAX分页显示代码</title>

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
/**/
//显示所有的数据
  $(function(){
	   //完成ajax请求 获取json数据并显示
	   $.get("EmpServlet",{"page":1,"pageSize":8,"pename":""},function(pd,status){

		   //遍历pd中data  
		  showData(pd,status);
		   /* console.log("总页数: "+pd.totalPage); */
	   });
	   
	   
 }); 
/*
点击分页部分 页码的时候，进行分页操作的事件绑定
我们以前操作按钮 链接事件
$("对象").click(function(){
	
	
});

此时的语法 大家要注意
*/
$(document).on("click",".pageNoAjax",function(){

//注意参数的传递 json格式
$.get("EmpServlet",{"page":$(this).text(),"pageSize":8,"pename":$("#pename").val()},function (pd,status){
	//调用showData(pd,satus)
	showData(pd,status);
});
});



//上一页的内容
$(document).on("click",".before",function(){
	var i=$(".now").text();
	if (i<=1) {
		i=1;
	}else{
		i=i-1;
	}
	//注意参数的传递 json格式
	$.get("EmpServlet",{"page":i,"pageSize":8,"pename":""},function (pd,status){
		//调用showData(pd,satus)
		
		showData(pd,status);
	});
	});

//下一页的内容
$(document).on("click",".after",function(){
	var i=parseInt($(".now").text());
	var s=${sessionScope.pageSize};
	if (i<s) {
		i=i+1;
	}else{
		i=s

	}
	//注意参数的传递 json格式
	$.get("EmpServlet",{"page":i,"pageSize":8,"pename":""},function (pd,status){
		//调用showData(pd,satus)
		
		showData(pd,status);
	});
	});



function showData(pd,status){
	//清除 ul中分页有关的部分
	$("ul li").remove();
	$("tbody tr").remove();
	 $.each(pd.data,function(index,emp){
		  $("tbody").append("<tr><td>"+emp.EMPNO+"</td><td>"+emp.ENAME+"</td><td>"+emp.JOB+"</td><td>"+emp.SAL+"</td><td>"+emp.DEPTNO+"</td></tr>")
		   
	   });
	 $("ul").append("<li><a href='#'  class='before'>Prev</a></li>");
	//循环显示页码
	for(var i=1; i<=pd.totalPage;i++)
		{
		    if(pd.page == i)
		    	{
		    	 $("ul").append("<li class='active now'><a class='pageNoAjax'>"+i+"</a></li>");
		    	
		    	}
		    else
		    	{
		    	 $("ul").append("<li class=''><a class='pageNoAjax'>"+i+"</a></li>");
		    	
		    	}
		  
		}


	$("ul").append("<li><a href='#' class='after'>Next</a></li>");

	/*偶数行和奇数行背景色变化*/
	$("tr:even").not(":first").attr("class", "info");
	$("tr:odd").attr("class", "su	ccess");
}
	
</script>

</head>
<body>

<div class="container">

<h1>emp列表</h1>
<div class="row clearfix">


<div class="col-md-4 column"></div>
</div>



<div class="table-responsive">
<table class="table table-bordered table-hover ">
	<thead>
		<tr>
			<!-- <th><input type="checkbox" id="all" name="all" /></th> -->
			<th>员工编号</th>
			<th>员工姓名</th>
			<th>职位</th>
			<th>员工工资</th>
			<th>员工所在部门编号</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</div>
</div>
<!--  分页开始 -->
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4">
			<ul class="pagination">
               <!-- 分页的代码 需要使用jquery来完成 -->
			</ul>
		</div>
		
</div>
<!--  分页结束 -->

</div>
</div>
</div>
</body>
</html>