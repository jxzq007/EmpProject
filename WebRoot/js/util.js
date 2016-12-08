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
function handleSelectAll(eleId,status){
	var obj = document.all(eleId);
	if(obj.length == undefined){
		obj.checked = status;
	} else {
		for(var x = 0 ; x < obj.length ; x ++) {
			obj[x].checked = status ;
		}
	}
}
function handleDeleteAll(eleId,url){
	var obj = document.all(eleId);
	var ids = "";//保存删除的ID
	if(obj.length == undefined){
		if(obj.checked) {
			ids += obj.values + "|";
		}
	} else {
		for(var x = 0 ; x < obj.length ; x ++) {
			if(obj[x].checked){
				ids += obj[x].value + "|";
			}
		}
	}
	if(ids == "") {
		window.alert("您还未选择任何数据");
	}else {
		if(window.confirm("确定要删除所选数据？")) {
			window.location = url + "&ids=" + ids;
		}
	}
}