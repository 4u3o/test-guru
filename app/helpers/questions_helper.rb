# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('admin.questions.form.header.create', test: question.test.title)
    else
      t('admin.questions.form.header.edit', test: question.test.title)
    end
  end
end
