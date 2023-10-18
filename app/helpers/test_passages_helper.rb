module TestPassagesHelper
  def colorize_result(test_passage)
    result_in_percentage = number_to_percentage(test_passage.result * 100, precision: 0)

    klass, message = test_passage.success? ?
                       ['text-success', 'Тест успешно пройден'] :
                       ['text-danger', 'Тест не пройден']

    "<span class=#{klass}>#{result_in_percentage}</span> #{message}".html_safe
  end
end
