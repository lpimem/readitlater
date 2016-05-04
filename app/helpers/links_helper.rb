# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  url         :string
#  title       :string
#  description :string
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer
#

module LinksHelper
  LINKS_PER_PAGE = 5
  def set_page
    if params.key?(:p)
      @page = params[:p].to_i
      if @page < 0
        @page = 1
      end
    else
      @page = 1
    end
  end
  def sort_links
    if @links
      @links = @links.sort_by{|link| link.created_at}.reverse
    end
  end

  def update_page_states
    @pages = (@links.count / (page_limit * 1.0)).ceil
    if @page > @pages
      @page = @pages
    end
    if @links.any?
      @links = @links[(@page-1)*page_limit, page_limit]
    end
    @full_path = request.original_fullpath
    if @full_path.include?("p")
      @full_path = @full_path.gsub(/[?&]p=\d+/, "")
    end
  end

  def page_limit
    LINKS_PER_PAGE
  end
end
