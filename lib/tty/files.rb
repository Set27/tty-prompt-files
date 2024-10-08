# frozen_string_literal: true

require_relative "files/version"

module TTY
  class Prompt
    def select_element_from_file_system(text: "", pattern: "*", path: ".", multi_select: false, **options)
      pathnames = get_pathnames_from_path(pattern, path)

      file_names = pathnames.map do |pathname|
        pathname.basename.to_s
      end

      unless multi_select
        selected_element = self.select(text, file_names, **options)

        return get_selected_element_full_path(pathnames, selected_element)
      end

      selected_elements = self.multi_select(text, file_names, **options)

      selected_elements.map do |selected_element|
        get_selected_element_full_path(pathnames, selected_element)
      end
    end

    private

    def get_pathnames_from_path(pattern, path)
      if path[-1] != "/"
        pathnames = Pathname.glob(path + "/" + pattern)
      else
        pathnames = Pathname.glob(path + pattern)
      end

      pathnames.map(&:realpath)
    end

    def get_selected_element_full_path(pathnames, selected_element)
      selected_element_pathname = pathnames.find { |pathname| pathname.basename.to_s == selected_element }

      selected_element_pathname.realpath.to_s
    end
  end
end
