class Tournament
  def self.tally(input)
    # Header
    output = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY

    return output if input.strip.empty?

    # Initialize a hash to store team stats
    teams = Hash.new { |h, k| h[k] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }

    # Process each line
    input.lines.each do |line|
      line = line.strip
      next if line.empty?

      team1, team2, result = line.split(";")

      teams[team1][:mp] += 1
      teams[team2][:mp] += 1

      case result
      when "win"
        teams[team1][:w] += 1
        teams[team1][:p] += 3
        teams[team2][:l] += 1
      when "loss"
        teams[team2][:w] += 1
        teams[team2][:p] += 3
        teams[team1][:l] += 1
      when "draw"
        teams[team1][:d] += 1
        teams[team2][:d] += 1
        teams[team1][:p] += 1
        teams[team2][:p] += 1
      end
    end

    # Sort teams numerically by points descending, then alphabetically
    sorted_teams = teams.sort_by { |name, stats| [-stats[:p], name] }

    # Build output with fixed-width numbers (2 spaces) for proper alignment
    sorted_teams.each do |name, stats|
      output += format(
        "%-31s| %2d | %2d | %2d | %2d | %2d\n",
        name,
        stats[:mp],
        stats[:w],
        stats[:d],
        stats[:l],
        stats[:p]
      )
    end

    output
  end
end
