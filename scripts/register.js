
var siteRulesAgreedTo = false;

var checkUsername = function() {
	if ($("#username").val() == "") {
		$("#username-info-box").show();
		alert("Please enter a valid user name!");
		return false;
	} else {
		return true;
	}
};

var checkPassword = function() {
	var pass = $("#password").val();
	if ( pass == "" || pass.length < 6) {
		$("#password-info-box").show();
		alert("Please enter a password of at least 6 characters or more!");
		return false;
	} else {
		return true;
	}
};

var checkEmail = function() {
	var email = $("#email").val();
	var email_exp = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
	if ( !email_exp.test(email) && email.length > 1 ) {
		alert('Email must be in the form of something@domain.com');
		return false;
	} else if (email == "") { 
		return true;
	} else {
		return true;
	}
};

var checkSiteRulesAgreedTo = function() {
	if ($("#site_rules_i_agree:checked").length > 0) {
		siteRulesAgreedTo = true;
		return true;
	} else {
		alert("You must agree to the site rules!");
		return false;
	}
};

$(document).ready(function() {
	$("#username-info-box").hide();
	$("#password-info-box").hide();

	$("#site_rules_i_agree").click(
		function() {
			siteRulesAgreedTo = true;
		}
	);
	
	$("#register-form").submit(function() {
		return (function() {	
			if ((siteRulesAgreedTo || checkSiteRulesAgreedTo()) && checkUsername() && checkPassword() && checkEmail() ) {
				return true;
			} else {
				return false;
			}
		})();
	});
});
