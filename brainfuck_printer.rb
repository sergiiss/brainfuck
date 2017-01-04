# Написать переводчик языка Brainfuck и вывод данных в файл.
#
# (c) Dostankius Sergeus


require_relative "brainfuck_translator"

class Printer 
  def print
    puts "Как твое имя?" 
    name = gets.chomp
    condition = "Yes"
    puts "Приветствую тебя, #{name}!"
    
	while condition == "Yes" or condition == "yes"
	  puts "Введи код языка Brainfuck и я его интерпретирую"
      code = gets.chomp.chars
    
      translator = BrainfuckTranslator.new
	  puts "#{translator.translate(code)}"
      	
	  puts "Если хотите продолжить, напишите 'Yes', если нет, то 'No'"
	  condition = gets.chomp
	end
  end
end

printer = Printer.new
printer.print


