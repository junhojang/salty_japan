class Api::AdvertisementController < ApplicationController
  def get_cpd
  end
  # priority
  def get_cpdm
    @grouped_cpdm = Advertisement.where('ad_type >= 200').group('priority')
    @cpdms = []    

    # grouped cpdms 
    @grouped_cpdm.each do |cpdm|
      @cpdms.push(Advertisement.where('ad_type >= 200 and priority = ? and remain > 0',cpdm.priority))
    end
    @status = true
    @msg = true
    @data = DateTime.now.to_s(:date) 

  end
  def get_cpx
  end

  def get_cpd_list
  end
  def get_cpdm_list
  end
  def get_cpx_list
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
