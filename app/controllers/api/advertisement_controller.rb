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
    @status, @msg, @data = AdManager.get_ad_list(300) if @status
  end

  
  def get_coupon_list
    @status, @msg, @data = AdManager.get_coupon_list
  end

  def get_my_coupon_list
    @status, @msg, @data = AdValidator.get_my_coupon_list(params)
    @status, @msg, @data = AdManager.get_my_coupon_list(params) if @status
  end

  def set_cpd_log
    @status, @msg, @data = AdValidator.set_cpd_log(params)
    @status, @msg, @data = AdManager.set_cpd_log(params) if @status
  end

  def set_cpdm_log
    @status, @msg, @data = AdValidator.set_cpdm_log(params)
    @status, @msg, @data = AdManager.set_cpdm_log(params) if @status
  end

  def set_cpx_log
    @status, @msg, @data = AdValidator.set_cpx_log(params)
    @status, @msg, @data = AdManager.set_cpx_log(params) if @status
  end

  def get_survey
    @status, @msg, @data = AdValidator.get_survey(params)
    @status, @msg, @data = AdManager.get_survey(params) if @status
  end

  def set_survey_result
    @status, @msg, @data = AdValidator.set_survey_result(params)
    @status, @msg, @data = AdManager.set_survey_result(params) if @status
  end

end
