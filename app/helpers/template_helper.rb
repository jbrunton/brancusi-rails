module BrancusiRails
  module TemplateHelper
    def render_templates
      templates = load_templates.collect do |t|
        "<script type='text/template' id='#{t[:id]}'>#{t[:content]}</script>"
      end
      raw(templates.join)
    end

  private
    def load_templates
      templates = []
      Dir.glob("app/views/templates/**/*.*").each do |file_name|
        puts "*** scanning: #{file_name}"
        matches = /app\/views\/templates\/(.*?)_([\w\.]+)\.html\.(haml|erb)/.match file_name
        if matches
          puts "*** matched: #{file_name}"
          tmpl_name = "#{matches[1]}#{matches[2]}"
          tmpl_content = render :partial => "templates/#{tmpl_name}"
          templates << { :id => "template:#{tmpl_name}", :content => tmpl_content }
        end
      end
      templates
    end
  end
end
