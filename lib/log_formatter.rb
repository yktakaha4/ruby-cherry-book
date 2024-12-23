require 'net/http'
require 'json'

module LogFormatter
  def self.format_log
    base_path = File.expand_path(File.dirname(__FILE__))
    file_path = "#{base_path}/access-log.json"
    json = File.open(file_path, 'r') do |file|
      file.read
    end
    log_data = JSON.parse(json, symbolize_names: true)
    log_data.map do |log|
      case log
      in {request_id:, path:, status: 404 | 500 => status, error:}
        "[ERROR] request_id=#{request_id}, path=#{path}, status=#{status}, error=#{error}"
      in {request_id:, path:, duration: 1000.. => duration}
        "[WARN] request_id=#{request_id}, path=#{path}, duration=#{duration}"
      in {request_id:, path:}
        "[OK] request id=#{request_id}, path=#{path}"
      end
    end.join("\n")
  end
end
