# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

Gist.destroy_all
TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

admin = Admin.new(
  first_name: 'John',
  last_name: 'Grut',
  email: 'grut-66@mail.ru',
  password: 'secret66',
  password_confirmation: 'secret66'
)

admin.skip_confirmation!
admin.save!

user = User.new(
  first_name: 'Sarah',
  last_name: 'Lowson',
  email: 'lowie@foobar.com',
  password: 'secret2',
  password_confirmation: 'secret2'
)

user.skip_confirmation!
user.save!

categories = []
['Программирование', 'Операционные системы', 'Сетевые протоколы',
 'Базы данных', 'Алгоритмы']
  .each { |c| categories << Category.create(title: c) }

cat_prog = categories[0]

test_lang, test_gen = Test.create(
  [
    { title: 'Языки', level: 2, category_id: cat_prog.id, user_id: admin.id },
    {
      title: 'Общие вопросы',
      level: 1,
      category_id: cat_prog.id,
      user_id: admin.id
    }
  ]
)

ql1, ql2, ql3, ql4, ql5, qg1, qg2, qg3, qg4, qg5 = Question.create(
  [
    { body: 'Кто создал руби?', test_id: test_lang.id },
    {
      body: 'Какие из перечисленных языков имеют слабую типизацию?',
      test_id: test_lang.id
    },
    {
      body: 'Какой язык программирования создал Деннис Риччи?',
      test_id: test_lang.id
    },
    {
      body: 'Какой язык программирования из перечисленных самый старый?',
      test_id: test_lang.id
    },
    {
      body: 'Какой язык (из незнакомых) Вы должны изучить в следующем году?',
      test_id: test_lang.id
    },
    { body: 'Чистая функция – это функция, которая…', test_id: test_gen.id },
    {
      body: 'Способность операции получать тот же результат, что и предыдущая?',
      test_id: test_gen.id
    },
    { body: 'Лучший backend-фреймворк на свете - …', test_id: test_gen.id },
    { body: 'Кто написал "Совершенный код?"', test_id: test_gen.id },
    {
      body: 'Автор цитаты "Использование Кобола калечит ум. Его преподавание,' \
        ' следовательно, должно рассматриваться как уголовное преступление?"',
      test_id: test_gen.id
    }
  ]
)

Answer.create(
  [
    { body: 'Фитц', question_id: ql1.id },
    { body: 'Матц', question_id: ql1.id, correct: true },
    { body: 'Поц', question_id: ql1.id },
    { body: 'Буч', question_id: ql1.id },
    { body: 'PHP', question_id: ql2.id, correct: true },
    { body: 'Ruby', question_id: ql2.id },
    { body: 'Javascript', question_id: ql2.id, correct: true },
    { body: 'Phyton', question_id: ql2.id },
    { body: 'Objective-С', question_id: ql3.id },
    { body: 'C++', question_id: ql3.id },
    { body: 'С#', question_id: ql3.id },
    { body: 'C$', question_id: ql3.id },
    { body: 'Cobol', question_id: ql4.id },
    { body: 'Pascal', question_id: ql4.id },
    { body: 'Fortran', question_id: ql4.id, correct: true },
    { body: 'C', question_id: ql4.id },
    { body: 'Go', question_id: ql5.id },
    { body: 'Elixir', question_id: ql5.id },
    { body: 'Lisp', question_id: ql5.id, correct: true },
    { body: 'Java', question_id: ql5.id },
    { body: 'не имеет побочных эффектов', question_id: qg1.id, correct: true },
    { body: 'может быть вызвана только один раз', question_id: qg1.id },
    {
      body: 'для одного набора аргументов возвращает одинаковый результат',
      question_id: qg1.id, correct: true
    },
    { body: 'ничего не возвращает', question_id: qg1.id },
    { body: 'персистентность', question_id: qg2.id },
    { body: 'конгруэнтность', question_id: qg2.id },
    { body: 'идемпотентность', question_id: qg2.id, correct: true },
    { body: 'мемоизация', question_id: qg2.id },
    { body: 'Django', question_id: qg3.id },
    { body: 'Lavarel', question_id: qg3.id },
    { body: 'Ruby on Rails', question_id: qg3.id, correct: true },
    { body: 'Phoenix', question_id: qg3.id },
    { body: 'Маклауд', question_id: qg4.id },
    { body: 'МакКоннелл', question_id: qg4.id, correct: true },
    { body: 'МакФлай', question_id: qg4.id },
    { body: 'МакДак', question_id: qg4.id },
    { body: 'Андерс Хейлсберг', question_id: qg5.id },
    { body: 'Бьерн Страуструп', question_id: qg5.id },
    { body: 'Линус Торвальдс', question_id: qg5.id },
    { body: 'Эдсгер Дейкстра', question_id: qg5.id, correct: true }
  ]
)
