class AddCurrentQuestionCorrectQuestionsToTestsUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests_users, :current_question, null: false, foreign_key: {to_table: :questions}
    add_column :tests_users, :correct_questions, :integer, default: 0
    rename_table :tests_users, :test_passages
  end
end
