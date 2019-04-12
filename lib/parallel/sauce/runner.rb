require 'parallel'

module Parallel
  module Sauce
    class Runner
      def initialize(pool_size, jar_runner_path, sauce_key, device = 'iPhone X.*', datacenter = 'EU')
        @pool_size = pool_size
        @jar_runner_path = jar_runner_path
        @sauce_key = sauce_key
        @device = device
        @datacenter = datacenter
      end

      def run(main_app_path, target_paths, result_folder)
        Parallel.map(target_paths, in_threads: pool_size) do |target_path|
          Pair.new(target_path, execute(main_app_path, target_path, result_folder))
        end
      end

      private

      attr_reader :pool_size, :jar_runner_path, :sauce_key, :device, :datacenter

      def execute(app_path, target_path, result_folder)
        system("java -jar #{jar_runner_path} xcuitest "\
                "--test '#{target_path}' "\
                "--app '#{app_path}' "\
                "--apikey #{sauce_key} "\
                "--datacenter #{datacenter} "\
                "--deviceNameQuery '#{device}' "\
                "--xmlFolder '#{result_folder}' "\
                "--testname '#{testname(target_path)}"
        ) || false
      end

      def testname(target_path)
        File.basename(target_path).chomp("-Runner.app")
      end
    end
  end
end
