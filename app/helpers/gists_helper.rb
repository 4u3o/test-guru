module GistsHelper
  def gist_link(gist)
    link_to gist.url_hash,
            "https://gist.github.com/4u3o/#{gist.url_hash}",
            target: "_blank",
            rel: "noopener noreferrer"
  end
end
