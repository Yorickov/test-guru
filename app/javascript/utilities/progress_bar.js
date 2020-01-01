const progressBarHandler = (currentProgress) => {
  const progress = document.querySelector('.test-progress > .progress-bar');
  progress.setAttribute('style', 'width:' + currentProgress + '%');
};

export default () => {
  const form = document.querySelector('.form-test-passage');
  if (form) {
    const currentProgress = form.dataset.currentProgress;
    progressBarHandler(currentProgress);
  }
};
