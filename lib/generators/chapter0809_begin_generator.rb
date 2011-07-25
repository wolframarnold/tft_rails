module TftRails
  module Generators
    class Chapter0809BeginGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates_0809_begin", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def insert_css
        src  = File.expand_path("../snippets_0809_begin/custom.css", __FILE__)
        dest = File.join(Rails.root,'public','stylesheets','custom.css')
        insert_into_file(dest, File.binread(src), :before => /\Z/) # insert before end
      end

      def generate_instructions
        require 'rdiscount'
        
        instr_md = File.expand_path('../instructions_0809.md',self.class.source_root)
        dest = File.join(Rails.root,'doc','chapter08_09.html')
        copy_file(instr_md, dest, :force => true) do |content|
          RDiscount.new(content).to_html
        end
        say_status('Note',"Now open file://#{dest} in your web browser for instructions", :cyan)
      end

    end
  end
end
