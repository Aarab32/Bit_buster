// Select the form and input elements
const form = document.querySelector("form");
const nameInput = document.getElementById("name");
const addressInput = document.getElementById("address");
const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");
const subjectSelect = document.getElementById("subject");
const agreeCheckbox = document.getElementById("agree");
const errorMessages = {
    name: document.getElementById("name-error"),
    address: document.getElementById("address-error"),
    email: document.getElementById("email-error"),
    password: document.getElementById("password-error"),
    subject: document.getElementById("subject-error"),
    agree: document.getElementById("agree-error"),
};

// Clear error messages
function clearErrors() {
    for (const key in errorMessages) {
        errorMessages[key].textContent = "";
    }
}

// Validate the form
function validateForm() {
    clearErrors();
    let isValid = true;

    // Name validation
    if (nameInput.value.trim() === "" || /\d/.test(nameInput.value)) {
        errorMessages.name.textContent = "Please enter a valid name.";
        isValid = false;
    }

    // Address validation
    if (addressInput.value.trim() === "") {
        errorMessages.address.textContent = "Please enter your address.";
        isValid = false;
    }

    // Email validation
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (emailInput.value.trim() === "" || !emailPattern.test(emailInput.value)) {
        errorMessages.email.textContent = "Please enter a valid email address.";
        isValid = false;
    }

    // Password validation
    if (passwordInput.value.length < 6) {
        errorMessages.password.textContent = "Password must be at least 6 characters long.";
        isValid = false;
    }

    // Subject selection validation
    if (subjectSelect.value === "") {
        errorMessages.subject.textContent = "Please select a course.";
        isValid = false;
    }

    // Agreement checkbox validation
    if (!agreeCheckbox.checked) {
        errorMessages.agree.textContent = "You must agree to the terms.";
        isValid = false;
    }

    return isValid;
}

// Handle form submission
form.addEventListener("submit", function (event) {
    event.preventDefault(); // Prevent default form submission
    if (validateForm()) {
        alert("Form submitted successfully!");
        form.reset(); // Reset the form
    }
});
