require "thor"
require "thor/group"

class Squareone::Generator < Thor::Group
  include Thor::Actions
  desc "Create an Gulp automated Jekyll project"

  # Declare source files directory
  def self.source_root
    File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib", "templates"))
  end

  # Copy files in folders
  def copy_folders
    %w{_includes _layouts _posts _sass assets}.each do |dir|
      directory dir
    end
  end

  # Create git files
  def create_git_files
    %w{assets/javascripts/.gitkeep assets/images/.gitkeep}.each do |file|
      create_file file
    end
    copy_file ".gitignore"
  end

  # Copy files in the root directory
  def copy_files
    %w{_config.yml about.md feed.xml index.html}
  end
end
