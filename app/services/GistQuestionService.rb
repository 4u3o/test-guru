class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    # боюсь что кто-то может вклиниться с вызовом между call и success?
    result = client.create_gist(gist_params)
    success? ? result : nil
  end

  def success?
    client.last_response.status == CREATED
  end

  private

  FILE_NAME = 'test-guru-question.txt'
  CREATED = 201

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