module QuestionsHelper
  def question_header(question)
    question.new_record? ?
      t('admin.questions.form.header.create', test: question.test.title) :
      t('admin.questions.form.header.edit', test: question.test.title)
  end
end
