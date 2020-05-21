class SecretHandshake
  attr_reader :input, :binary, :size
  
  def initialize(input)
    @binary = validate_binary(input)
    @size = @binary.size
  end

  def commands
    commands = []
    
    index = 0
    size.times do |num|
      index -= 1
      next unless binary[index] == '1'
      commands << @@commands[num]
    end
    reverse_if_needed(commands)
    commands
  end

  private

   @@commands = ['wink', 'double blink', 'close your eyes',
                 'jump', 'reverse']
  
  def reverse_if_needed(array)
    return unless array.include?('reverse')
    array.delete('reverse')
    array.reverse!
  end

  def validate_binary(input)
    binary = nil

    if input.is_a?(Integer)
      binary = input.to_s(2)
    elsif input.chars.all? {|l| l =~ /1|0/}  
      binary = input  
    else
      binary = 0
    end
    
    binary
  end
end
