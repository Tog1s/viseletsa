require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'
require 'unicode_utils/downcase'

current_path = File.dirname(__FILE__)

printer = ResultPrinter.new

reader = WordReader.new

if ARGV[0].nil?
  slovo = reader.read_from_file(current_path + "/data/words.txt")
else
  slovo = reader.read_from_args
end

game = Game.new(slovo)

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
