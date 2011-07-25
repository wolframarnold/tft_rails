module TftRails
  module Generators
    class Chapter10SolutionsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates_10_solutions", __FILE__)

      def copy_app_tree
        directory(self.class.source_root, Rails.root)
      end

      def add_destroy_action_to_users_resource
        dest = File.join(Rails.root,'config','routes.rb')
        insert_into_file(dest, :after => %r{:index,\s*:show}) do
          ", :destroy"
        end
      end

      def add_migration
        found_candidate = Dir.glob(File.join(Rails.root,'db','migrate','*_admin_*')).present?

        if (found_candidate &&
            yes?("We found a migration file containing the word '_admin_'. We think you have the correct migration. Do you still way to copy the solution anyway? (yes/no)", :yellow)) \
            or !found_candidate

          src  = File.expand_path("../snippets_10_solutions/migration_add_admin_to_users.rb", __FILE__)
          dest = File.join(Rails.root,'db','migrate',Time.now.strftime("%Y%m%d%H%M%S")+'_add_admin_to_users.rb')
          copy_file(src,dest)
        end
      end

    end
  end
end
