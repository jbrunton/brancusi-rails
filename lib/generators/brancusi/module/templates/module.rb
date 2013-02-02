class Application.Modules.<%= class_name %>Module extends Brancusi.ApplicationModule
<% actions.each do |action| -%>

  <%= action %>: ->
<% end -%>
