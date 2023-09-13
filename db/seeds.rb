5.times do
  Category.create(
    title: Faker::ProgrammingLanguage.unique.name,
  )
end

categories_ids = Category.pluck(:id)
author = User.create(login: 'author')

10.times do
  Test.create(
    title: Faker::Lorem.unique.sentence,
    level: Faker::Number.between(from: 0, to: 4),
    category_id: categories_ids.sample,
    author_id: author.id
  )
end

tests_ids = Test.pluck(:id)

50.times do
  Question.create(
    body: Faker::Lorem.unique.question,
    test_id: tests_ids.sample
  )
end

questions = Question.all

questions.each do |question|
  4.times do
    corrects = [true, false, false, false]

    Answer.create(
      body: Faker::Lorem.sentence(word_count: 1, random_words_to_add: 1),
      question_id: question.id,
      correct: corrects.delete(corrects.sample)
    )
  end
end

3.times do
  User.create(
    name: Faker::Name.name,
    login: Faker::Color.unique.color_name
  )
end

User.all.second.tests << Test.all.sample(5)

