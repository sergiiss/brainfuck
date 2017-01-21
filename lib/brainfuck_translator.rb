class BrainfuckTranslator
  attr_reader :code

  def initialize(code)
    @code                 = code
    
    @cell_sequence        = Array.new(30000,0)
    @index                = 0
    @correct_code         = true
    @output_values        = []
    @cycle_start_address  = []
    @cell                 = 0
    @cell_value           = 0
    @word                 = []
  end
  
  def convert_code
    receive_sequence_of_characters
    process_code
    convert_numbers_to_characters
  end

  private
  
  attr_reader :correct_code, :output_values, :cell_sequence,
              :cycle_start_address, :cell, :cell_value, :word, :index
  
  def receive_sequence_of_characters
    @code = code.chars
  end

  def process_code
    while index < code.length && correct_code == true
      case code[index]
      when "+"
        increase_the_value_of_a_cell
      when "-"
        reduce_the_value_of_the_cell
      when "."
        print_the_value_of_the_cell
      when ">"
        go_to_the_cell_forward
      when "<"
        go_back_to_the_cell
      when ","
        get_the_value_entered
      when "[" 
        start_the_cycle
      when "]"
        finish_the_cycle
      else
        @correct_code = false
      end

      @index += 1
    end
  end
  
  def increase_the_value_of_a_cell
    @cell_value += 1
    @cell_sequence[cell] = cell_value
  end
  
  def reduce_the_value_of_the_cell
    @cell_value -= 1
    @cell_sequence[cell] = cell_value
  end
  
  def print_the_value_of_the_cell
    @output_values.push(cell_sequence[cell])
  end
  
  def go_to_the_cell_forward
    @cell += 1
    @cell_value = cell_sequence[cell]
  end
  
  def go_back_to_the_cell
    @cell -= 1
    @cell_value = cell_sequence[cell]
  end
  
  def get_the_value_entered
    entered_code = gets.chomp
    @cell_sequence[cell] = entered_code.to_i
  end
  
  def start_the_cycle
    @cycle_start_address.push(index)
  end
  
  def finish_the_cycle
    if cell_value > 0
      @index = cycle_start_address.last
    elsif cell_value == 0
      @cycle_start_address.pop
    end
  end

  def convert_numbers_to_characters
    output_values.each do |character|
      break if correct_code == false
      check_the_code_correctly(character)
    end

    get_the_value_of_the_output
  end
  
  def check_the_code_correctly(character)
    if character <= 127 && character >= 0
      @word = word.push(character.chr)
    else
      @correct_code = false
    end
  end
  
  def get_the_value_of_the_output
    if correct_code
      word.join
    elsif correct_code == false
      puts "Не верно введен код."
    end
  end
end
