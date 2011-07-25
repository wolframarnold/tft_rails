module TftRails
  module Generators
    class Chapter0809SolutionsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates_0809_solutions", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

    end
  end
end
