# Программа интерпретирует код Brainfuck в слова по кодировке ASCII

class BrainfuckTranslator
  attr_reader :correct_code
  attr_reader :output_values
  
  def initialize
    @correct_code = true
    @output_values = []
  end
  
  def translate(code)
    code_processing(code)
    converter
  end

  private

  def code_processing(code)
  
    index = 0
    cell = 0
    cell_value = 0
    cell_sequence = Array.new(30000,0)
    cycle_start_address = []
    
    while index < code.length && @correct_code == true
      if code[index] == "+"
        cell_value += 1
        cell_sequence[cell] = cell_value
      elsif code[index] == "-"
        cell_value -= 1
        cell_sequence[cell] = cell_value
      elsif code[index] == "."
        @output_values.push(cell_sequence[cell])
      elsif code[index] == ">"
        cell += 1
        cell_value = cell_sequence[cell]
      elsif code[index] == "<"
        cell -= 1
        cell_value = cell_sequence[cell]
      elsif code[index] == ","
        entered_code = gets.chomp
        cell_sequence[cell] = entered_code.to_i
      elsif code[index] == "[" 
        save = index.to_i
        cycle_start_address.push(save)
      elsif code[index] == "]"
        if cell_value > 0
          index = cycle_start_address.last.to_i
        elsif cell_value == 0
          cycle_start_address.pop
        end
      else
        @correct_code = false
      end

      index += 1
    end
  end

  def converter 
    word_null = []
    index = 0

    while index < @output_values.length && @correct_code == true
      if @output_values[index] <= 127 && @output_values[index] >= 0
        word = word_null.push(@output_values[index].chr)
      else
        @correct_code = false
      end

    index += 1
    end

    if @correct_code
      word.join
    elsif @correct_code == false
      puts "Не верно введен код."
    end
  end
end