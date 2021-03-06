if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tmpdir'
require 'pathname'
require 'squareone'

RSpec.configure do |config|

  config.before(:each) do
    $0 = "squareone"                             # Pretend we're running as 'squareone'
    ARGV.clear                                   # Make sure no args are passed to the commands.
    @directory = Dir.mktmpdir('squareone-spec-') # Create a temp directory to work in.
    @orig_directory = Dir.pwd                    # Save the original directory.
    Dir.chdir(@directory)                        # Change to it. pwd() is the temp directory in the examples.
  end

  config.after(:each) do
    Dir.chdir(@orig_directory)                 # Change back to the origin directory.
    FileUtils.rmtree(@directory)               # Remove the temp directory.
  end

  # Captures the output for analysis later
  #
  # @example Capture `$stderr`
  #
  #     output = capture(:stderr) { $stderr.puts "this is captured" }
  #
  # @param [Symbol] stream `:stdout` or `:stderr`
  # @yield The block to capture stdout/stderr for.
  # @return [String] The contents of $stdout or $stderr
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end

  # Silences the output stream
  #
  # @example Silence `$stdout`
  #
  #     silence(:stdout) { $stdout.puts "hi" }
  #
  # @param [IO] stream The stream to use such as $stderr or $stdout
  # @return [nil]
  alias :silence :capture

end

# EXAMPLES_DIR = Pathname.new(__FILE__).dirname + 'examples'
