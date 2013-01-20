class Application.Controllers.<%= class_name %>Controller extends brancusi.ApplicationController
<% actions.each do |action| -%>

  <%= action %>: ->
    @render()
<% end -%>
