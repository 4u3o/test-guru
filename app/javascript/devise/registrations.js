document.addEventListener('turbolinks:load', () => {
  const confirmInput = document.getElementById('user_password_confirmation');
  const passwordInput = document.getElementById('user_password');

  if (passwordInput && confirmInput) {
    passwordInput.addEventListener('input', checkValidity);
  }
  if (confirmInput) {
    confirmInput.addEventListener('input', comparePasswords);
  }
});

function checkValidity() {
  if (this.value && this.checkValidity()) {
    this.classList.add('is-valid');
    this.classList.remove('is-invalid');
  } else {
    this.classList.remove('is-valid');
    this.classList.add('is-invalid');
  }
}

function comparePasswords() {
  const passwordInput = document.getElementById('user_password');

  if (this.value && passwordInput.value) {
    if (this.value != passwordInput.value) {
      this.classList.remove('is-valid');
      this.classList.add('is-invalid');
    } else {
      this.classList.remove('is-invalid');
      this.classList.add('is-valid');
    }
  }
}
