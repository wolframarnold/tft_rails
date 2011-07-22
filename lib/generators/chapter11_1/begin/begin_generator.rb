module Chapter11_1
  module Generators
    class BeginGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def generate_instructions
        require 'rdiscount'
        
        instr_md = File.expand_path('../instructions.md',self.class.source_root)
        return unless File.exists?(instr_md)
        dest = File.join(Rails.root,'doc','chapter11_1.html')
        copy_file(instr_md, dest, :force => true) do |content|
          RDiscount.new(content).to_html
        end
        say_status('Note',"Now open file://#{dest} in your web browser for instructions", :cyan)
      end

    end
  end
end
