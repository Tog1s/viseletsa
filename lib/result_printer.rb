class ResultPrinter
  def initialize
    #Считываем рисунки
    @status_image = []
    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7
      file_name = current_path + "/../image/#{counter}.txt"
        if File.exist?(file_name)
          f = File.new(file_name, "r:UTF-8")
          @status_image << f.read
          f.close
        else
          @status_image << "\n [ не найдено ]"
        end
      counter += 1
    end
  end

  def print_status(game)
    cls
    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)

    if game.status == -1
      puts "Вы проиграли :("
      puts "Загаданное слово: " + game.letters.join("")
    elsif game.status == 1
      puts "Поздравляем! Вы выиграли!"
    else
      puts "У вас осталось попыток: " + (7-game.errors).to_s
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""
    for letter in letters do
      if good_letters.include?(letter)
        result += letter + " "
      else
        result += "__ "
      end
    end
      return result
  end

  def cls
    system("cls") || system("clear")
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end
