window.onload = function(){
	bind(ele("deptno"),"blur",function(){
		validateDeptno();
	});
	bind(ele("dname"),"blur",function(){
		validateDname();
	});
	bind(ele("loc"),"blur",function(){
		validateLoc();
	});
	bind(ele("deptAddForm"),"submit",function(e){
		if(validateForm()){
			this.submit();
		} else {
			formStop(e);
		}
	});
}
function validateDeptno(){
	return validateRegex("deptno",/^\d{2}$/);
}
function validateDname(){
	return validateEmpty("dname");
}
function validateLoc(){
	return validateEmpty("loc");
}
function validateForm(){
	return validateDeptno() & validateDname() & validateLoc();
}