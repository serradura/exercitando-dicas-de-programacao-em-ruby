require 'spec_helper'

RSpec.describe 'game.rb', type: :aruba do
  context 'the player starts the game' do
    it 'shows the winner' do
      setup_aruba

      run_command("ruby #{File.join(File.realpath('.'), 'game.rb')}")

      type 'me'
      9.times { type '10' }

      stop_all_commands

      lines = last_command_started.output.split("\n")

      expect(lines[0]).to match(/==========================================/)
      expect(lines[1]).to match(/Let\'s take turns counting using numbers from 1 to 10./)
      expect(lines[2]).to match(/Who goes first\? You or me\? Okay, you go first/)
      expect(lines[3]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[4]).to match(/==========================================/)
      expect(lines[5]).to match(/I choose the number \d{1,2}/)
      expect(lines[6]).to match(/The sum is now \d{1,2}/)
      expect(lines[7]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[8]).to match(/==========================================/)
      expect(lines[9]).to match(/I choose the number \d{1,2}/)
      expect(lines[10]).to match(/The sum is now \d{1,2}/)
      expect(lines[11]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[12]).to match(/==========================================/)
      expect(lines[13]).to match(/I choose the number \d{1,2}/)
      expect(lines[14]).to match(/The sum is now \d{1,2}/)
      expect(lines[15]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[16]).to match(/==========================================/)
      expect(lines[17]).to match(/I choose the number \d{1,2}/)
      expect(lines[18]).to match(/The sum is now \d{1,2}/)
      expect(lines[19]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[20]).to match(/==========================================/)
      expect(lines[21]).to match(/I choose the number \d{1,2}/)
      expect(lines[22]).to match(/The sum is now \d{1,2}/)
      expect(lines[23]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[24]).to match(/==========================================/)
      expect(lines[25]).to match(/I choose the number \d{1,2}/)
      expect(lines[26]).to match(/The sum is now \d{1,2}/)
      expect(lines[27]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[28]).to match(/==========================================/)
      expect(lines[29]).to match(/I choose the number \d{1,2}/)
      expect(lines[30]).to match(/The sum is now \d{1,2}/)
      expect(lines[31]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[32]).to match(/==========================================/)
      expect(lines[33]).to match(/I choose the number \d{1,2}/)
      expect(lines[34]).to match(/The sum is now \d{1,2}/)
      expect(lines[35]).to match(/Your turn, pick a number from 1 to 10: The sum is now \d{2}/)
      expect(lines[36]).to match(/==========================================/)
      expect(lines[37]).to match(/I choose the number \d{1,2}/)
      expect(lines[38]).to match(/The sum is now 100/)
      expect(lines[39]).to match(/You lose!!! \\o\//)
    end
  end
end
