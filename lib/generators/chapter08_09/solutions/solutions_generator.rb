module Chapter08_09
  module Generators
    class SolutionsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

    end
  end
end
