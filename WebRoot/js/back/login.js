window.onload = function() {
	bind(ele("mid"), "blur", function() {
		validateMid();
	});
	bind(ele("password"), "blur", function() {
		validatePassword();
	});
	bind(ele("code"), "blur", function() {
		validateCode();
	});
	bind(ele("myform"), "submit", function(e) {
		if (validateForm()) {
			this.submit();
		} else {
			formStop(e);
		}
	});
}
function validateMid() {
	return validateEmpty("mid");
}
function validatePassword() {
	return validateEmpty("password");
}
function validateCode() {
	return validateRegex("code",/^[a-zA-Z0-9]{4}$/);
}
function validateForm() {
	return validateMid() & validatePassword()& validateCode();
}