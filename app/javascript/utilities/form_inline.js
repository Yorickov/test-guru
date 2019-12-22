const formInlineHandler = (testId) => {
  const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
  const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
  const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

  const oldName = link.dataset.oldName;
  const newName = link.dataset.newName;

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide');
    formInline.classList.remove('hide');
    link.textContent = newName;
  } else {
    testTitle.classList.remove('hide');
    formInline.classList.add('hide');
    link.textContent = oldName;
  }
};

const formInlineLinkHandler = (e) => {
  e.preventDefault();
  const target = e.currentTarget;

  // getAttribute if data-* not supported
  const testId = target.dataset.testId;
  formInlineHandler(testId);
};

export default () => {
  const controls = document.querySelectorAll('.form-inline-link');
  if (controls.length) {
    controls.forEach(control => control.addEventListener(
      'click',
      formInlineLinkHandler.bind(this),
    ));
  }

  const errors = document.querySelector('.resource-errors');
  if (errors) {
    const resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
};
