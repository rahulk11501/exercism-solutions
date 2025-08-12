class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.gsub(/\[(INFO|WARNING|ERROR)\]\:/, '').strip
  end

  def log_level
    @line.split(":")[0].gsub(/\[|\]/, '').downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
