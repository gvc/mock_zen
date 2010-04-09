desc "Erases the doc folder and recreates the RDoc"
task :doc do
  doc_dir = File.join(File.dirname(__FILE__), "doc")
  FileUtils.rm_r(doc_dir) if File.exists?(doc_dir)
  `rdoc -x test`
end

desc "Runs all tests"
task :test do
  test_dir = File.join(File.dirname(__FILE__), "test")
  run_tests_in_directory(test_dir)
end

def run_tests_in_directory(path)
  Dir.open(path) do |dir|
    dir.each do |filename|
      file_path = File.join(path, filename)
      next if /^\.(\.)?$/ =~ filename
      
      if /.*_test.rb$/ =~ file_path
        puts "Running #{filename}"
        puts `ruby #{file_path}`
      elsif File.directory? file_path
        run_tests_in_directory(file_path)
      end
    end
  end
end