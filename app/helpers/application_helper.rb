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



  def default_text(text)
     onFocusFunction = "field = event.target || event.srcElement; if (field.value=='#{text}') {field.value = '';}else {return false}"
     onBlurFunction = "field = event.target || event.srcElement; if (field.value=='') {field.value = '#{text}';}else {return false}"
     {:value => text, :onfocus => onFocusFunction, :onblur => onBlurFunction} 
  end


def title(page_title)
  content_for(:title) { page_title }
end



end
