module Taylor
  module Commands
    class Squash
      REQUIRE_REGEX = /^[^#]*require\s+['"](.*)['"].*/

      attr_reader :data

      def self.call(argv, options)
        new(argv, options)
      end

      attr_accessor :options

      def initialize(argv, options)
        setup_options(argv, options)

        if @options[:help]
          display_help
        else
          call
        end
      end

      def display_help
        puts <<~STR
          Taylor #{TAYLOR_VERSION}

          Usage:
            taylor squash [options]

          Options:
            --help\t\t\tDisplays this message
            --stdout\t\t\tPrint the squashed ruby to STDOUT
            --input input\t\t\tWhat is the name of the entrypoint file (defaults to game.rb)
            --load_paths directories\tWhat are your load paths? (defaults to ./,./vendor)
        STR
      end

      def setup_options(argv, options)
        parser = OptParser.new do |opts|
          opts.on(:help, :bool, false)
          opts.on(:stdout, :bool, false)
          opts.on(:input, :string, options.fetch("input", "game.rb"))
          opts.on(:load_paths, :string, options.fetch("load_paths", "./,./vendor"))
        end
        parser.parse(argv, true)

        @options = parser.opts
        @options[:load_paths] = @options[:load_paths].split(",") unless @options[:load_paths].is_a?(Array)
      end

      def call
        @processed_files = []
        @data = ""

        process_file(@options[:input])

        if @options[:stdout]
          puts @data
        else
          File.open("output.rb", "w") { _1.write @data }
        end
      end

      def process_file(file, indent: 0)
        @data << "# Start #{file}\n"
        File.read(file).each_line do |line|
          process_line(line, indent: indent + 1)
        end

        @data << "\n" unless @data[-1] == "\n"
        @data << "# End #{file}\n"
      end

      def process_line(line, indent:)
        required_file_name = required_file_from(line)

        @data << line and return unless required_file_name

        file_name = find_file(required_file_name)

        process_file(file_name, indent: indent) and return if file_name

        @data << line
      end

      def find_file(file_name)
        file_name = "#{file_name}.rb" unless file_name[-3..] == ".rb"
        file_name = file_name.gsub(/[.]+\/+/, "")

        options[:load_paths].each { |dir|
          file = File.join(dir, file_name)

          return file if File.exist?(file)
        }

        raise "No matching file for #{file_name}"
      end

      def required_file_from(line)
        lib = REQUIRE_REGEX.match(line)
        lib[1] if lib && !lib[1].include?('#{')
      end
    end
  end
end
