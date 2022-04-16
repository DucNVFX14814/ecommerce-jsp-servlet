const btnRegister = document.querySelector("#btn-register");

btnRegister.onclick = function() {
	const userName = document.querySelector("#user-name").value;
	const email = document.querySelector("#email").value;
	const password = document.querySelector("#password").value;
	const repeatPassword = document.querySelector("#repeat-password").value;
	const address = document.querySelector("#address").value;
	const phone = document.querySelector("#phone").value;
	const usernameError = document.querySelector("#username-error");
	const emailError = document.querySelector("#email-error");
	const passwordError = document.querySelector("#password-error");
	const repeatPasswordError = document.querySelector("#repeat-password-error");
	const addressError = document.querySelector("#address-error");
	const phoneError = document.querySelector("#phone-error");
	let validated = true;

	if (userName.trim() == "" || userName == null) {
		usernameError.innerText = "*No user name set";
		usernameError.style.display = "block";
		validated = false;
     } else {
		usernameError.style.display = "none";
	}

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

    if (repeatPassword != password) {
		repeatPasswordError.innerText = "*Password don't match";
		repeatPasswordError.style.display = "block";
		validated = false;
	} else {
		passwordError.style.display = "none";
	}

    if (address.trim() == "" || address == null) {
		addressError.innerText = "*No address set";
		addressError.style.display = "block";
		validated = false;
     } else {
		addressError.style.display = "none";
	}

    if (phone.trim() == "" || phone == null) {
		phoneError.innerText = "*No phone set";
		phoneError.style.display = "block";
		validated = false;
     } else {
		phoneError.style.display = "none";
	}


	if (validated) {
		btnRegister.setAttribute("type", "submit");
	}
}

