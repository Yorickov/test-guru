import sorting from './sorting';
import validation from './validation';
import formInline from './form_inline';
import progressBar from './progress_bar';
import timer from './timer';


export default () => {
  document.addEventListener('turbolinks:load', () => {
    sorting();
    validation();
    formInline();
    progressBar();
    timer();
  });
}
