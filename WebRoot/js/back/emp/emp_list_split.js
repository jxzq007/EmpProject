window.onload = function(){
	bind(ele("selAll"),"click",function(){
		handleSelectAll("empno",this.checked);
	});
	bind(ele("delAll"),"click",function(){
		handleDeleteAll("empno","pages/back/admin/emp/emp_rm_do.jsp?a=a&retUrl=pages/back/admin/emp/emp_list_split.jsp");
	});
}