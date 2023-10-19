module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_link(author, repo)
    link_to repo.split('-').each(&:capitalize!).join,
            "https://github.com/#{author}/#{repo}",
            target: "_blank",
            rel: "noopener noreferrer"
  end
end
