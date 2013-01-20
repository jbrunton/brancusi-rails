class Application.Modules.<%= class_name %>Module extends brancusi.ApplicationModule
<% actions.each do |action| -%>

  <%= action %>: ->
<% end -%>
