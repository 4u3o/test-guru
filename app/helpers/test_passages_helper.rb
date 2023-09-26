module TestPassagesHelper
  def answer_number(test_passage)
    test_passage.test.questions.ids.index(test_passage.current_question_id).next
  end

  def show_result(test_passage)
    result_in_percentage = number_to_percentage(test_passage.result * 100, precision: 0)

    klass, message = test_passage.result >= 0.85 ?
                       ['result-success', 'Тест успешно пройден'] :
                       ['result-fail', 'Тест не пройден']

    "<span class=#{klass}>#{result_in_percentage}</span> #{message}".html_safe
  end
end
