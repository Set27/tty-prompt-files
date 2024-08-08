# frozen_string_literal: true

require_relative "files/version"

module TTY
  class Prompt
    def select_element_from_file_system(pattern: "*", path: ".", text: "", options: {})
      elements = get_all_elements_from_path(pattern, path)

      selected_element = self.select(text, elements)

      selected_element.realpath.to_path
    end

    private

    def get_all_elements_from_path(pattern, path)
      Pathname.glob(pattern, base: path)
    end
  end
end
