class LogLineParser
  attr_reader :message, :log_level, :reformat

  def initialize(line)
    level, msg = line.match(/\[(INFO|WARNING|ERROR)\]\:(.*)/).captures
    @log_level = level.downcase
    @message   = msg.strip
    @reformat  = "#{@message} (#{@log_level})"
  end
end
