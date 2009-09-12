# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_tags(tag_list)
    tags = []
    tag_list.each do |tag|
      tags << link_to(tag, search_path(:search_query => tag))
    end
    tags.join(' ')
  end
  
end
