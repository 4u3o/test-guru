class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    client.create_gist(gist_params)
  end

  private

  FILE_NAME = 'test-guru-question.txt'

  attr_reader :test, :client, :question

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

  def gist_content
    content = [question.body]
    content += question.answers.pluck(:body)
    content.join("\n")
  end
end