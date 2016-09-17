require "spec_helper"

describe Squareone::Generator do
  let(:generator) { Squareone::Generator.new(["my-Website"]) }
  let(:dir) { Pathname.pwd + "my-website" }
  
  describe "new my-Website" do
    context "with name" do
      it "should have name attribute" do
        expect(generator.instance_variable_get(:@name)).to eq("my-Website")
      end
    end

    context "without name" do
      it "should raise Thor::RequiredArgumentMissingError" do
        expect {
          Squareone::Generator.new
        }.to raise_error Thor::RequiredArgumentMissingError
      end
    end
  end

  context "Generator setup" do
    before :each do
      silence(:stdout) { generator.invoke_all }
    end

    describe "#setup" do
      it "sets generator variables" do
        expect(generator.instance_variable_get(:@project_name)).to eq("my-website")
        expect(generator.instance_variable_get(:@project_title)).to eq("My Website")
        expect(generator.destination_root).to eq(File.expand_path("my-website"))
      end

      it "sets source_root correctly" do
        expect(Squareone::Generator.source_root).to eq(File.expand_path("../../lib/templates", File.dirname(__FILE__)))
      end
    end

    describe "Generates files" do
      it "copies template folders" do
        %w{_includes _layouts _posts _sass assets}.each do |directory|
          expect(dir + directory).to be_directory
        end
      end

      it "create git files" do
        %w{assets/images/.gitkeep assets/stylesheets/.gitkeep .gitignore}.each do |file|
          expect(dir + file).to be_file
        end
      end

      it "generates files from templates" do
        %w{package.json _config.yml}.each do |file|
          expect(dir + file).to be_file
        end
      end

      it "copy files" do
        %w{_config.dev.yml about.md feed.xml gulpfile.js index.html}.each do |file|
          expect(dir + file).to be_file
        end
      end
    end
  end
end
