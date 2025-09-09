class LogLineParser
  # @return {String}
  attr_reader :message

  # @return {String}
  attr_reader :log_level

  # @return {String}
  attr_reader :reformat

  # @param {String} line
  # @return {void}
  def initialize(line)
    @message = line.gsub(/\[(INFO|WARNING|ERROR)\]\:/, '').strip
    @log_level = line.split(":")[0].gsub(/\[|\]/, '').downcase
    @reformat = "#{@message} (#{@log_level})"
  end
end
