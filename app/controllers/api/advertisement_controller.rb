class Api::AdvertisementController < ApplicationController
  def get_cpd
  end
  # priority
  def get_cpdm
    @grouped_cpdm = Advertisement.where('ad_type >= 200').group('priority')
    @data = @grouped_cpdm
    return
    @arr_cpdms = []    
    # grouped cpdms 
    @grouped_cpdm.each do |cpdm|
      @arr_cpdms.push(Advertisement.where('ad_type >= 200 and priority = ? and remain > 0',cpdm.priority))
    end
    
    @cpdm_to_show = {'log_cnt' => -1, 'cpdm' => nil}
    @arr_cpdms.each do |cpdms|
      #cpdm grouped by priority
      cpdms.each do |cpdm|
        cnt = LogCpdm.where("ad_id=? and DATEDIFF(created_at,curdate())", cpdm.id).count
        if @cpdm_to_show['log_cnt'] < cnt
          @cpdm_to_show['log_cnt'] = cnt
          @cpdm_to_show['cpdm'] = cpdm
        end
      end
    end

    @status = true
    @msg = true
    @data = @cpdm_to_show['cpdm']

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
