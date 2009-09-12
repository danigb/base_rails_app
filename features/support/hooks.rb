Before do
  # Do something before each scenario.
  cleanup_uploaded_content
end

After do
  # Do something before each scenario.
  cleanup_uploaded_content
end

def cleanup_uploaded_content
  FileUtils.rm_rf(File.join(RAILS_ROOT, 'public', 'uploaded_content', 'test'))
  FileUtils.rm_rf(File.join(RAILS_ROOT, 'public', 'uploaded_content', 'cucumber'))
end