require 'unicode_utils/downcase'
require_relative '../lib/game.rb'

describe Game do
  it 'should do ok for status win' do
    game = Game.new('загадка')
    game.next_step('з')
    game.next_step('а')
    game.next_step('г')
    game.next_step('д')
    game.next_step('к')

    expect(game.status).to eq(1)
  end


  it 'should do ok for status lose' do
    game = Game.new('загадка')
    game.next_step('з')
    game.next_step('а')
    game.next_step('г')
    game.next_step('ж')
    game.next_step('к')
    game.next_step('а')
    game.next_step('х')

    expect(game.status).to eq(0)
  end
end
