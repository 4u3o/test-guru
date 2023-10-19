# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
  end

  def call
    result = client.create_gist(gist_params)
    success? ? result : nil
  end

  private

  CREATED = 201
  FILE_NAME = 'test-guru-question.txt'

  attr_reader :test, :client, :question

  def gist_content
    content = [question.body]
    content += question.answers.pluck(:body)
    content.join("\n")
  end

  def gist_params
    {
      description: I18n.t('.description', test_title: test.title),
      files: {
        FILE_NAME => {
          content: gist_content
        }
      }
    }
  end

  def success?
    client.last_response.status == CREATED
  end
end
