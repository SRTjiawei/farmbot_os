require 'spec_helper'
require './lib/messaging/messagehandler_emergencystop.rb'
require './lib/status.rb'
require './lib/messaging/messaging.rb'
require './lib/messaging/messaging_test.rb'

describe MessageHandler do

  before do
    #$db_write_sync = Mutex.new
    #$dbaccess = DbAccess.new('development')
    #@msg = MessageHandler.new

    $db_write_sync = Mutex.new
    $bot_dbaccess = DbAccess.new('development')
    $dbaccess = $bot_dbaccess
    $dbaccess.disable_log_to_screen()

    $status = Status.new

    $messaging = MessagingTest.new
    $messaging.reset

    @handler = MessageHandlerEmergencyStop.new
    @main_handler = MessageHandler.new
  end

  ## messaging

  
  it "message handler emergency stop" do
    message = MessageHandlerMessage.new
    message.handled = false
    message.handler = @main_handler

#    $messaging.emergency_stop(message)

    @handler.emergency_stop(message)
#             emergency_stop(message)
#puts $message.message
    expect(1).to eq(1)
  end



  it "message handler emergency stop reset" do
    expect(1).to eq(1)
  end




#  it "create new command" do
#    crop_id        = rand(9999999).to_i    
#    scheduled_time = Time.now
#
#    @db.create_new_command(scheduled_time, crop_id)
#
#    cmd = Command.where("scheduled_time = ?",scheduled_time).first
#
#    expect(cmd.crop_id).to eq(crop_id)
#  end

end
