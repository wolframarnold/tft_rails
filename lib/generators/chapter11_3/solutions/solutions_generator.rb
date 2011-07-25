module Chapter11_3
  module Generators
    class SolutionsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def add_microposts_resource
        dest = File.join(Rails.root,'config','routes.rb')
        insert_into_file(dest, :after => %r{resources\s+:users.*$}) do
          "\n  resources :microposts, :only => [:create, :destroy]"
        end
      end

      def add_feed_method_to_user
        dest = File.join(Rails.root, 'app', 'models', 'user.rb')
        insert_into_file(dest, :before => /end\s*\Z/) do # insert before end
          <<-CODE.gsub(/^\s+\|/,'  ')
            |def feed
            |  microposts
            |end
          CODE
        end
      end

    end
  end
end
