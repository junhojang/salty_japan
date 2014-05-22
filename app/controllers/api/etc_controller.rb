class Api::EtcController < ApplicationController

  def get_help_list
    @status, @msg, @data = EtcValidator.get_help_list
    @status, @msg, @data = EtcManager.get_help_list if @status
  end

  # notice notice_type = 0(board) , 1 = (main)
  def get_notice_list
    @status, @msg, @data = EtcValidator.get_noitce_list
    @status, @msg, @data = EtcManager.get_notice_list if @status
  end

  def get_main_notice_list
    @status, @msg, @data = EtcValidator.get_main_notice_list
    @status, @msg, @data = EtcManager.get_main_notice_list if @status
  end

  def get_board_notice_list
    @status, @msg, @data = EtcValidator.get_board_notice_list
    @status, @msg, @data = EtcManager.get_board_notice_list if @status
  end
  

  def get_app_info
    @status, @msg, @data = EtcValidator.get_app_info
    @status, @msg, @data = EtcManager.get_app_info if @status
  end

  def get_prize_list
    @status, @msg, @data = EtcValidator.get_prize_list
    @status, @msg, @data = EtcManager.get_prize_list if @status
  end

  def attendance
  end
  
  def get_cacao_ment
  end

end
