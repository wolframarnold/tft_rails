module Chapter10
  module Generators
    class BeginGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def augment_gemfile
        gem 'faker',         '~> 0.9.5'
        gem 'will_paginate', '~> 3.0.pre2'
      end

      def insert_css
        src  = File.expand_path("../snippets/custom.css", __FILE__)
        dest = File.join(Rails.root,'public','stylesheets','custom.css')
        insert_into_file(dest, File.binread(src), :before => /\Z/) # insert before end
      end

      def insert_factories
        src  = File.expand_path("../snippets/factories.rb", __FILE__)
        dest = File.join(Rails.root,'spec','factories.rb')
        insert_into_file(dest, File.binread(src), :before => /\Z/) # insert before end
      end

      def generate_instructions
        require 'rdiscount'
        
        instr_md = File.expand_path('../instructions.md',self.class.source_root)
        return unless File.exists?(instr_md)
        dest = File.join(Rails.root,'doc','chapter10.html')
        copy_file(instr_md, dest, :force => true) do |content|
          RDiscount.new(content).to_html
        end
        say_status('Note',"Now open file://#{dest} in your web browser for instructions", :cyan)
      end

    end
  end
end
