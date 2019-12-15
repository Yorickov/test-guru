# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

admin = Admin.new(
  first_name: 'John',
  last_name: 'Doe',
  email: 'doe@foobar.com',
  password: 'secret1',
  password_confirmation: 'secret1'
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
%w[math english biology].each { |c| categories << Category.create(title: c) }
cat_mat, cat_en, cat_bio = categories

test_syn, test_pun, test_add = Test.create(
  [
    { title: 'syntax', level: 1, category_id: cat_en.id, user_id: admin.id },
    { title: 'punctuation', level: 2, category_id: cat_en.id, user_id: admin.id },
    { title: 'addition', category_id: cat_mat.id, user_id: admin.id }
  ]
)

qs1, qs2, qp1, qp2, qa1, qa2 = Question.create(
  [
    { body: 'question 1', test_id: test_syn.id },
    { body: 'question 2', test_id: test_syn.id },
    { body: 'question 1', test_id: test_pun.id },
    { body: 'question 2', test_id: test_pun.id },
    { body: 'question 1', test_id: test_add.id },
    { body: 'question 2', test_id: test_add.id }
  ]
)

Answer.create(
  [
    { body: 'answer 1', question_id: qs1.id, correct: true },
    { body: 'answer 2', question_id: qs1.id },
    { body: 'answer 1', question_id: qs2.id },
    { body: 'answer 2', question_id: qs2.id, correct: true },
    { body: 'answer 1', question_id: qp1.id },
    { body: 'answer 2', question_id: qp1.id, correct: true },
    { body: 'answer 1', question_id: qp2.id },
    { body: 'answer 2', question_id: qp2.id },
    { body: 'answer 1', question_id: qa1.id, correct: true },
    { body: 'answer 2', question_id: qa2.id }
  ]
)
