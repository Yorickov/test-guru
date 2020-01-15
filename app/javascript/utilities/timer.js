const timerHandler = (url, timerStep, timerEnd, timeLimit, progress, timer) => {
  const timeLeft = timerEnd - Math.round(Date.now() / 1000);
  let rateLeft = timeLeft / timeLimit * 100;

  const timeId = setInterval(() => {
    if (rateLeft <= 0) {
      clearInterval(timeId);
      location.href = url;
    }

    progress.setAttribute('style', 'height:' + rateLeft + '%');
    timer.setAttribute('value', rateLeft);

    rateLeft -= 1;
  }, timerStep);
};

export default () => {
  const form = document.querySelector('.form-test-passage');
  const progress = document.querySelector('.test-timer > .progress-bar');

  if (form && progress) {
    const url = form.dataset.url;
    const timerStep = form.dataset.timerStep;
    const timerEnd = form.dataset.timerEnd;
    const timeLimit = form.dataset.timeLimit;
    const timer = form.elements.timer;

    timerHandler(url, timerStep, timerEnd, timeLimit, progress, timer);
  }
};
