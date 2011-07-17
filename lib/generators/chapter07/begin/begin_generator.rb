module Chapter07
  module Generators
    class BeginGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root, :force => true)
      end

      def augment_gemfile
        gem 'devise', '~> 1.3.4'
        gem 'gravatar_image_tag', '~> 1.0.0'
        gem 'rspec-rails', :version => '~> 2.6.0', :group => :development
        gem 'rspec', :version => '~> 2.6.0', :group => :test
        gem 'webrat', :version => '~> 0.7.3', :group => :test
        gem 'factory_girl_rails', :version => '~> 1.0', :group => :test
      end

      def generate_instructions
        require 'rdiscount'
        
        instr_md = File.expand_path('../instructions.md',self.class.source_root)
        dest = File.join(Rails.root,'doc','chapter07.html')
        copy_file(instr_md, dest, :force => true) do |content|
          RDiscount.new(content).to_html
        end
        say_status('Note',"Now open file://#{dest} in your web browser for instructions", :cyan)
      end

    end
  end
end
