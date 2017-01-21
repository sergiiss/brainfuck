require_relative "brainfuck_translator"

class Printer
  attr_reader :condition

  def initialize
    @condition = "Yes"
  end
  
  def print
    puts "Как твое имя?" 
    name = gets.chomp
    
    puts "Приветствую тебя, #{name}!"
    
    while condition == "Yes" || condition == "yes"
      puts "Введи код языка Brainfuck и я его интерпретирую"
      code = gets.chomp
      
      translator = BrainfuckTranslator.new(code)
      puts translator.convert_code
          
      puts "Если хотите продолжить, напишите 'Yes', если нет, то 'No'"
      @condition = gets.chomp
    end
  end
end

printer = Printer.new
printer.print
