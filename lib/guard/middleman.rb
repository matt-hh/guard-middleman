require 'guard'
require 'guard/guard'

module Guard
  class Middleman < Guard

    def initialize(watchers=[], options={})
      super
      # init stuff here, thx!
      @options = HashWithIndifferentAccess.new(
        {:bundler => File.exist?("#{Dir.pwd}/Gemfile")}.merge(options)
      )
    end

    def bundler?
      @options[:bundler]
    end

    # =================
    # = Guard methods =
    # =================

    # If one of those methods raise an exception, the Guard::GuardName instance
    # will be removed from the active guards.

    # Called once when Guard starts
    # Please override initialize method to init stuff
    def start
      true
    end

    # Called on Ctrl-C signal (when Guard quits)
    def stop
      true
    end

    # Called on Ctrl-Z signal
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    def reload
      true
    end

    # Called on Ctrl-\ signal
    # This method should be principally used for long action like running all specs/tests/...
    def run_all
      system(build_command)
    end

    # Called on file(s) modifications
    def run_on_change(paths)
      system(build_command)
    end

    private
      def build_command
        cmd = []
        cmd << "bundle exec" if bundler?
        cmd << "middleman build"
        cmd << '--verbose' if @options[:verbose]
        cmd << '--clean' if @options[:clean]
        cmd << '--no-clean' if @options[:no_clean] || @options['no-clean']
        cmd << "--glob=#{@options[:glob]}" if @options[:glob]
        cmd << "--instrument=#{@options[:instrument]}" if @options[:instrument]
        cmd << '--profile' if @options[:profile]

        cmd.join(' ')
      end

  end
end
