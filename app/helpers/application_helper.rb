module ApplicationHelper
require "uri"
  
  def full_title(page_name = "")
    base_title = "Sample"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
   def description_url_to_link(description)
    URI.extract(description, ["http", "https"]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      description.gsub!(url, sub_text)
     end
    description
   end

end