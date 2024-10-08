# TTY::Prompt::Files

TTY-Prompt-files is extension for [tty-prompt](https://github.com/piotrmurach/tty-prompt) gem that allow interactive selection elements from file system and get absolute path.

## Note!

Be careful to use library before first major version. It does not support backward compatibility.

## Usage

```rb
require 'tty-prompt-files'

prompt = TTY::Prompt.new

prompt.select_element_from_file_system
```

After element is selected, output will be a element full path.

`select_element_from_file_system` has 5 parameters:

```rb
prompt.select_element_from_file_system(text: "", pattern: "*", path: ".", multi_select: false, **options)
```

`text` is text user will see along with elements. By default: `""`.\
`pattern` is determining for what file will be output based on matching the pattern. If you want to display hidden files, use `"{.[^\.]*,*}"` pattern. By default: `"*"`.\
`path` is determining path of the directory, can be relative or absolute. By default: `"."`.\
`multi_select` refers to original [API](https://github.com/piotrmurach/tty-prompt?tab=readme-ov-file#263-multi_select). By default: `false`.
`**options` you can add any params from original [API](https://github.com/piotrmurach/tty-prompt?tab=readme-ov-file#2621-cycle). No default value.\

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tty-prompt-files. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/tty-prompt-files/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TTY::Prompt::Files project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tty-prompt-files/blob/master/CODE_OF_CONDUCT.md).
