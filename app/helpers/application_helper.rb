module ApplicationHelper

# Methods added to this helper will be available to all templates in the application.
  def checklist(name, collection, value_method, display_method, selected)
    selected ||= []
    
    ERB.new(%{
    <div class="checklist" style="border:1px solid #666; width:20em; height:5em; overflow:auto">
      <% for item in collection %>
        <%= check_box_tag name, item.send(value_method), selected.include?(item.send(value_method)) %> <%=h item.send(display_method) %><br />
      <% end %>
    </div>}).result(binding)
  end



def time_tag(date_or_time, *args)
  options  = args.extract_options!
  format   = options.delete(:format) || :long
  content  = args.first || I18n.l(date_or_time, :format => format)
  datetime = date_or_time.acts_like?(:time) ? date_or_time.xmlschema : date_or_time.rfc3339

  content_tag(:time, content, options.reverse_merge(:datetime => datetime))
end

def title(page_title)
  content_for(:title) { page_title }
end



end
