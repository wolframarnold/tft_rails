module TftRails
  module Generators
    class Chapter11_1SolutionsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates_11_1_solutions", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def add_migration
        found_candidate = Dir.glob(File.join(Rails.root,'db','migrate','*create_micropost*')).present?

        if (found_candidate &&
            yes?("We found a migration file containing the word '_admin_'. We think you have the correct migration. Do you still way to copy the solution anyway? (yes/no)", :yellow)) \
            or !found_candidate

          src  = File.expand_path("../snippets_11_1_solutions/migration_create_microposts.rb", __FILE__)
          dest = File.join(Rails.root,'db','migrate',Time.now.strftime("%Y%m%d%H%M%S")+'_create_microposts.rb')
          copy_file(src,dest)
        end
      end

    end
  end
end
