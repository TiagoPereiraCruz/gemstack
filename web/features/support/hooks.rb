require "report_builder"

After do
  temp_shot = page.save_screenshot("log/temp_shot.png")
  file_shot = File.open(temp_shot, "rb").read
  final_shot = Base64.encode64(file_shot)
  embed(final_shot, "image/png", "Screenshot")
end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report"
    config.report_types = [:html]
    config.color = "indigo"
    config.report_title = "Spotlab - Regression Testes"
    config.compress_images = true
  end
  ReportBuilder.build_report
end
