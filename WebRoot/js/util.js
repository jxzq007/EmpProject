function ele(eleId) {
	return document.getElementById(eleId);
}
function bind(obj, event, fun) {
	obj.addEventListener(event, fun, false);
}
function validateEmpty(eleId){
	var obj = ele(eleId);
	if(obj != null) {
		if(obj.value == "") {
			setFailureStyle(obj);
			return false ;
		} else {
			setSuccessStyle(obj);
			return true;
		}
	}
	return false ;
}
function validateRegex(eleId,regex){
	if(validateEmpty(eleId)){
		var obj = ele(eleId);
		if(!regex.test(obj.value)){
			setFailureStyle(obj);
			return false ;
		} else {
			setSuccessStyle(obj);
			return true;
		}
	}
	return false;
}
function setSuccessStyle(obj){
	obj.className = "success";
	var objSpan = ele(obj.id + "Span");
	if(objSpan != null) {
		objSpan.innerHTML = "<font color='green'>√</font>";
	}
}
function setFailureStyle(obj){
	obj.className = "failure";
	var objSpan = ele(obj.id + "Span");
	if(objSpan != null) {
		objSpan.innerHTML = "<font color='red'>×</font>";
	}
}
function formStop(e){
	if (e && e.preventDefault) {	// 现在是在W3C标准下执行
		e.preventDefault() ;	// 阻止浏览器的动作
	} else {	// 专门针对于IE浏览器的处理
		window.event.returnValue = false ;
	}
}