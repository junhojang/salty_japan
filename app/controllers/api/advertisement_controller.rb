class Api::AdvertisementController < ApplicationController
  require_relative '../../managers/ad_manager'
  require_relative '../../validators/ad_validator'
  def get_cpd
    @status, @msg, @data = AdValidator.get_ad(params)
    @status, @msg, @data = AdManager.get_ad(100) if @status
  end 

  def get_cpdm
    @status, @msg, @data = AdValidator.get_ad(params)
    @status, @msg, @data = AdManager.get_ad(200) if @status
  end

  def get_cpx
    @status, @msg, @data = AdValidator.get_ad(params)
    @status, @msg, @data = AdManager.get_ad(300) if @status
  end


  def get_cpd_list
    @status, @msg, @data = AdValidator.get_ad_list(params)
    @status, @msg, @data = AdManager.get_ad_list(100) if @status
  end

  def get_cpdm_list
    @status, @msg, @data = AdValidator.get_ad_list(params)
    @status, @msg, @data = AdManager.get_ad_list(200) if @status
  end

  def get_cpx_list
    @status, @msg, @data = AdValidator.get_ad_list(params)
    @status, 2msg, @data = AdManager.get_ad_list(300) if @status
  end

  
  def get_coupon_list
  end
  def get_my_copun_list
  end

  def set_cpd_log
  end
  def set_cpdm_log
  end
  def set_cpdx
  end

  def cpa_receiever
  end

  

end
