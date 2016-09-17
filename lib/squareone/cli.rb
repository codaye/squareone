require "thor/group"

class Squareone::Cli < Thor
  
  # USAGE: squareone -v
  desc "-v", "Dispaly Squareone version"
  map %w[-v --version] => :version
  def version
    say "squareone #{Squareone::VERSION}"
  end

  # Create a new project
  # USAGE: squareone new new-project
  register Squareone::Generator, "new", "new APP_PATH", "Creates a new project"

  def self.exit_on_failure?
    true
  end
end
