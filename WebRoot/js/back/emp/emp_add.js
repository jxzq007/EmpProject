window.onload = function() {
	bind(ele("empno"), "blur", function() {
		validateEmpno();
	});
	bind(ele("ename"), "blur", function() {
		validateEname();
	});
	bind(ele("job"), "blur", function() {
		validateJob();
	});
	bind(ele("hiredate"), "blur", function() {
		validateHiredate();
	});
	bind(ele("sal"), "blur", function() {
		validateSal();
	});
	bind(ele("comm"), "blur", function() {
		validateComm();
	});
	bind(ele("empAddForm"), "submit", function(e) {
		if (validateForm()) {
			this.submit();
		} else {
			formStop(e);
		}
	});
}
function validateEmpno() {
	return validateRegex("empno", /^\d{4}$/);
}
function validateEname() {
	return validateEmpty("ename");
}
function validateJob() {
	return validateEmpty("job");
}
function validateHiredate() {
	return validateEmpty("hiredate");
}
function validateSal() {
	return validateRegex("sal", /^\d{1,5}(\.\d{1,2})?$/);
}
function validateComm() {
	return validateRegex("comm", /^\d{1,5}(\.\d{1,2})?$/);
}
function validateForm() {
	return validateEmpno() & validateEname() & validateJob() & validateHiredate() & validateSal() & validateComm();
}