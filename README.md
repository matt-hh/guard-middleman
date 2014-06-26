# guard-middleman

Guard gem for Middleman

## Install

Install gem:

    gem install guard-middleman

Add guard definition:

    guard init middleman

## Options

* `verbose`: verbose output, default = false
* `run_on_start`: whether or not to build middleman on start of guard, default = false
* `clean`: erase the build directory before run, default = false
* `no-clean`: never erase the build directory, default = false
* `glob`: specify a subset of the project to build, need to pass a string representing the subset. e.g. `glob: 'source/about_pages/*'`
* `instrument`: Print instrument messages
* `profile`: Generate profiling report for the build, default = false

## Links

[Guard](https://github.com/guard/guard#readme)
