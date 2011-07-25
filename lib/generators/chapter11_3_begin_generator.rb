module TftRails
  module Generators
    class Chapter11_3BeginGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates_11_3_begin", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def generate_instructions
        require 'rdiscount'
        
        instr_md = File.expand_path('../instructions_11_3.md',self.class.source_root)
        return unless File.exists?(instr_md)
        dest = File.join(Rails.root,'doc','chapter11_3.html')
        copy_file(instr_md, dest, :force => true) do |content|
          RDiscount.new(content).to_html
        end
        say_status('Note',"Now open file://#{dest} in your web browser for instructions", :cyan)
      end

    end
  end
end
