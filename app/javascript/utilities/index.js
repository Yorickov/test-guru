import sorting from './sorting';
import validation from './validation';

export default () => {
  document.addEventListener('turbolinks:load', () => {
    sorting();
    validation();
  });
}
