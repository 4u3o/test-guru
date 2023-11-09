document.addEventListener('turbolinks:load', () => {
  const SECONDS_IN_MINUTE = 60;
  const timer = document.getElementById('timer');
  const testPassageForm = document.getElementById('test-passage-form');

  if (timer && testPassageForm) {
    let initialSeconds = Number(timer.dataset.time);

    const timerId = setInterval(() => {
      let minutes = Math.floor(initialSeconds / SECONDS_IN_MINUTE);
      let seconds = initialSeconds % SECONDS_IN_MINUTE;

      minutes = toDoubleDigitString(minutes);
      seconds = toDoubleDigitString(seconds);

      timer.textContent = `${minutes}:${seconds}`;

      --initialSeconds;

      if (initialSeconds <= 0) {
        clearInterval(timerId);
        testPassageForm.requestSubmit();
      }
    }, 1000);
  }
});

function toDoubleDigitString(num) {
  return isOneSign(num) ? `0${num}` : `${num}`;
}

function isOneSign(num) {
  return num < 10;
}
