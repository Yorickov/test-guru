const validatePassword = (password, password_confirmation) => {
  const invalid = document.querySelector('.octicon-thumbsdown');
  const valid = document.querySelector('.octicon-thumbsup');

  if (password_confirmation.value === '') {
    valid.classList.add('hide');
    invalid.classList.add('hide');
    return;
  };

  if (password.value === password_confirmation.value) {
    valid.classList.remove('hide');
    invalid.classList.add('hide');
  }

  if (password.value !== password_confirmation.value) {
    invalid.classList.remove('hide');
    valid.classList.add('hide');
  }
};

export default () => {
  const password = document.getElementById('user_password');
  const password_confirmation = document.getElementById('user_password_confirmation');

  if (password && password_confirmation) {
    [password, password_confirmation]
      .forEach(input => input.addEventListener(
        'input',
        validatePassword.bind(this, password, password_confirmation),
      ));
  }
};
