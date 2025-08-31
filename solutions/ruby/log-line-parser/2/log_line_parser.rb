class LogLineParser
  attr_reader :message, :log_level, :reformat
  def initialize(line)
    @message = line.gsub(/\[(INFO|WARNING|ERROR)\]\:/, '').strip
    @log_level = line.split(":")[0].gsub(/\[|\]/, '').downcase
    @reformat = "#{@message} (#{@log_level})"
  end
end
