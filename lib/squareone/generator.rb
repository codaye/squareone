require "thor"
require "thor/group"

class Squareone::Generator < Thor::Group
  include Thor::Actions

  desc "Create a Gulp automated Jekyll project"
  argument :name, type: :string, desc: "Name of the project"

  # Setup generator
  def setup
    @project_name = name.downcase

    raise Thor::Error, set_color("ERROR: #{@project_name} already exist.", :red) if File.exist?(@project_name)

    @project_title = name.split(/[- _]/).map(&:capitalize).join(' ')
    self.destination_root = File.expand_path(@project_name)
  end

  # Declare source files directory
  def self.source_root
    File.expand_path("../templates", File.dirname(__FILE__))
  end

  # Copy files in folders
  def copy_folders
    %w{_includes _layouts _posts _sass assets}.each do |dir|
      directory dir
    end
  end

  # Create git files
  def create_git_files
    %w{assets/images/.gitkeep assets/stylesheets/.gitkeep}.each do |file|
      create_file file
    end
    copy_file ".gitignore"
  end

  # Generate files with template variables
  def generate_from_templates
    %w{package.json _config.yml}.each do |file|
      template file
    end
  end

  # Copy files in the root directory
  def copy_files
    %w{_config.dev.yml about.md feed.xml gulpfile.js index.html}.each do |file|
      copy_file file
    end
  end

  def success_message
    message = <<-MSG
    =============================================
    Project #{@project_name} created successfully.

    1. Move into the project directory.
      $ cd #{@project_name}
    
    2. Install project dependencies.
      $ npm install

    3. Start local server with gulp watching for changes.
      $ npm start
    ===========================================
    MSG

    say message
  end
end
