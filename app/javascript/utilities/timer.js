const changeHistoryHandler = (time) => {
  history.pushState({ timer: time }, '', '/tests');
  window.addEventListener('popstate', () => {
    location.href = '/tests';
  });
};

const timerHandler = (url, timerStep, timer, progress) => {
  console.log(history.state);
  let time_left = history.state.timer || timer.value;

  const timeId = setInterval(() => {
    time_left -= 1;

    if (time_left <= 0) {
      clearInterval(timeId);
      location.href = url + '?value=' + time_left;
    }

    progress.setAttribute('style', 'height:' + time_left + '%');
    timer.setAttribute('value', time_left);

  }, timerStep);
};

export default () => {
  const form = document.querySelector('.form-test-passage');
  const progress = document.querySelector('.test-timer > .progress-bar');

  if (form && progress) {
    const url = form.dataset.url;
    const timerStep = form.dataset.timerStep;
    const timer = form.elements.timer;

    changeHistoryHandler(timer.value);
    timerHandler(url, timerStep, timer, progress);
  }
};
