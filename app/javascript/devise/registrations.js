document.addEventListener('turbolinks:load', () => {
  const confirmInput = document.getElementById('user_password_confirmation');

  if (confirmInput) {
    confirmInput.addEventListener('input', comparePasswords);
  }
});

function comparePasswords() {
  const passwordInput = document.getElementById('user_password');

  if (!this.value) {
    this.classList.remove('is-invalid');
  } else if (passwordInput.checkValidity() && this.value === passwordInput.value) {
    this.classList.remove('is-invalid');
    this.classList.add('is-valid');
  } else {
    this.classList.remove('is-valid');
    this.classList.add('is-invalid');
  }
}
