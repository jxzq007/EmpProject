window.onload = function(){
	bind(ele("selAll"),"click",function(){
		handleSelectAll("deptno",this.checked);
	});
	bind(ele("delAll"),"click",function(){
		handleDeleteAll("deptno","pages/back/admin/dept/dept_rm_do.jsp?a=a");
	});
}