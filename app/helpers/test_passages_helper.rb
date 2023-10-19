# frozen_string_literal: true

module TestPassagesHelper
  def colorize_result(test_passage)
    result_in_percentage = number_to_percentage(test_passage.result * 100, precision: 0)

    klass, message = if test_passage.success?
                       ['text-success', 'Тест успешно пройден']
                     else
                       ['text-danger', 'Тест не пройден']
                     end

    "<span class=#{klass}>#{result_in_percentage}</span> #{message}".html_safe
  end
end
