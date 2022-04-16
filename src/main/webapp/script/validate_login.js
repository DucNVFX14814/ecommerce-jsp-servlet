const btnLogIn = document.querySelector("#btn-login");

btnLogIn.onclick = function() {
	const email = document.querySelector("#email").value;
	const password = document.querySelector("#password").value;
	const emailError = document.querySelector("#email-error");
	const passwordError = document.querySelector("#password-error");
	let validated = true;

	if (email.trim() == "" || email == null) {
		emailError.innerText = "*No email set";
		emailError.style.display = "block";
		validated = false;
	} else if (!email.match("\\w+@\\w+\\.\\w+")) {
		emailError.innerText = "*Invalid email address";
		emailError.style.display = "block";
		validated = false;
	} else {
		emailError.style.display = "none";
	}

	if (password.trim() == "" || password == null) {
		passwordError.innerText = "*No password set";
		passwordError.style.display = "block";
		validated = false;
	} else if (password.match("\\w*\\s+\\w*")) {
		passwordError.innerText = "*Password cannot contain space";
		passwordError.style.display = "block";
		validated = false;
	} else if (password.length < 8) {
		passwordError.innerText = "*Password must be at least 8 characters";
		passwordError.style.display = "block";
		validated = false;
	} else {
		passwordError.style.display = "none";
	}


	if (validated) {
		btnLogIn.setAttribute("type", "submit");
	}
}

