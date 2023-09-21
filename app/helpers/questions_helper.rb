module QuestionsHelper
  def question_header(question)
    test_title_question = "#{question.test.title} question"
    question.new_record? ?
      "Create #{test_title_question}" : "Edit #{test_title_question}"
  end
end
