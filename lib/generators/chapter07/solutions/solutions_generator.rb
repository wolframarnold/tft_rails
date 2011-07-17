module Chapter07
  module Generators
    class FinishGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def remove_static_index_html_file
        remove_file(File.join(Rails.root, 'public', 'index.html'))
      end
    end
  end
end
