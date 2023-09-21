module QuestionsHelper
  def question_header(question)
    test_title_question = "#{question.test.title} question"
    {'new' => "Create #{test_title_question}",
     'edit' => "Edit #{test_title_question}"}[action_name]
  end
end
