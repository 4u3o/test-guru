class RemoveNotNullConstrantOnCurrentQuestionInTestPassage < ActiveRecord::Migration[6.1]
  change_column_null :test_passages, :current_question_id, true
end
