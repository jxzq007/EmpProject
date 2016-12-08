window.onload = function(){
	bind(ele("dname"),"blur",function(){
		validateDname();
	});
	bind(ele("loc"),"blur",function(){
		validateLoc();
	});
	bind(ele("deptEditForm"),"submit",function(e){
		if(validateForm()){
			this.submit();
		} else {
			formStop(e);
		}
	});
}
function validateDname(){
	return validateEmpty("dname");
}
function validateLoc(){
	return validateEmpty("loc");
}
function validateForm(){
	return validateDname() & validateLoc();
}