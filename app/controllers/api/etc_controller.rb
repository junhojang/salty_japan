class Api::EtcController < ApplicationController

  def get_helps
        
  end

  def get_notices
    
  end

  def get_infos
    if @infos = AppInfo.first
      @status = true
      @msg = 'success to get infos'
    else
      @msg = 'there is no app infos in DB'
    end
  end

  def get_prizes

  end

end
