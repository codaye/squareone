require "thor/group"

class Squareone::Cli < Thor
  desc "-v", "Dispaly Squareone version"
  map %w[-v --version] => :version

  # Display gem version
  def version
    say "squareone #{Squareone::VERSION}"
  end

  # Create a new project
  # USAGE: squareone new new-project
  desc "new NAME", "Create a new project"
  def new(path)
    project_root = File.expand_path(path)
    raise Error, set_color("ERROR: #{path} already exists.", :red) if File.exist?(path)

    say set_color("Creating project #{path}...", :green)

    generator = Squareone::Generator.new
    generator.destination_root = project_root
    generator.invoke_all
  end

  def self.exit_on_failure?
    true
  end
end
