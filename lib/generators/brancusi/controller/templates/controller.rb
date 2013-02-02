class Application.Controllers.<%= class_name %>Controller extends Brancusi.ApplicationController
<% actions.each do |action| -%>

  <%= action %>: ->
    @render()
<% end -%>
