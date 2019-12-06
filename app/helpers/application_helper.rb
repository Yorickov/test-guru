module ApplicationHelper
  def current_year
    Date.current.in_time_zone.year
  end

  def github_url(author, repo, options = {})
    author_name = options[:name] || author
    link_to author_name,
            "https://github.com/#{author}/#{repo}",
            target: '_blank',
            **options
  end

  def show_flash
    flash.each do |type, msg|
      return content_tag :p, msg, class: "alert alert-#{type}", role: 'alert'
    end
  end
end
