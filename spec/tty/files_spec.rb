# frozen_string_literal: true

RSpec.describe TTY::Files do
  it "has a version number" do
    expect(TTY::Files::VERSION).not_to be nil
  end

  describe "simulate file selection from test folder" do
    let(:prompt) { TTY::Prompt::Test.new }
    let(:input) { StringIO.new }
    let(:output) { StringIO.new }
    let(:press_down) { "\e[B" }
    let(:press_enter) { "\r" }

    let(:test_folder_relative_path) { "spec/test" }

    let(:file_txt_pathname) { Pathname.new(test_folder_relative_path + "/" + "file.txt") }
    let(:file_pdf_pathname) { Pathname.new(test_folder_relative_path + "/" + "file.pdf") }

    let(:file_txt_abosolute_path) { file_txt_pathname.realpath.to_s }
    let(:file_pdf_abosolute_path) { file_pdf_pathname.realpath.to_s }

    before do
      allow(Pathname).to receive(:glob).and_return([file_txt_pathname, file_pdf_pathname])
    end

    it "return file_txt absolute path" do
      prompt.input << press_enter
      prompt.input.rewind

      result = prompt.select_element_from_file_system(path: test_folder_relative_path)

      expect(result).to eq(file_txt_abosolute_path)
    end

    it "return file_pdf absolute path" do
      prompt.input << press_down << press_enter
      prompt.input.rewind

      result = prompt.select_element_from_file_system(path: test_folder_relative_path)

      expect(result).to eq(file_pdf_abosolute_path)
    end
  end
end
