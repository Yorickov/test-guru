import sorting from './sorting';
import validation from './validation';
import formInline from './form_inline';


export default () => {
  document.addEventListener('turbolinks:load', () => {
    sorting();
    validation();
    formInline();
  });
}
