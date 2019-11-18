# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

%w[math english biology].each { |c| Category.create(title: c) }

Test.create(
  [
    { title: 'syntax', level: 1, category_id: 2 },
    { title: 'punctuation', level: 2, category_id: 2 },
    { title: 'addition', category_id: 1 },
    { title: 'logarithms', level: 3, category_id: 1 },
    { title: 'DNA', level: 2, category_id: 3 }
  ]
)

Question.create(
  [
    { body: 'question 1', test_id: 1 },
    { body: 'question 1', test_id: 2 },
    { body: 'question 2', test_id: 2 },
    { body: 'question 1', test_id: 3 },
    { body: 'question 2', test_id: 3 },
    { body: 'question 1', test_id: 4 },
    { body: 'question 1', test_id: 5 }
  ]
)

Answer.create(
  [
    { body: 'answer 1', question_id: 1, correct: true },
    { body: 'answer 2', question_id: 1 },
    { body: 'answer 1', question_id: 2 },
    { body: 'answer 1', question_id: 3, correct: true },
    { body: 'answer 2', question_id: 3 },
    { body: 'answer 3', question_id: 3 },
    { body: 'answer 1', question_id: 4, correct: true }
  ]
)

User.create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'doe@foobar.com',
  password_digest: BCrypt::Password.create('secret')
)
