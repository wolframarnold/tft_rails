module TftRails
  module Generators
    class Chapter07SolutionsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates_07_solutions", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def add_help_route

        dest = File.join(Rails.root,'config','routes.rb')
        insert_into_file(dest, :after => %r{/about.*:to.*pages#about.*$}) do
          "\n  match '/help',    :to => 'pages#help'"
        end
      end

      def remove_static_index_html_file
        remove_file(File.join(Rails.root, 'public', 'index.html'))
      end
    end
  end
end
