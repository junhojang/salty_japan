class Api::AdvertisementController < ApplicationController
  def get_cpd
  end
  # priority
  # 100 200 300
  def get_ad(ad_type)
    ad_type = (ad_type / 10).floor * 10 # 302 => 300, 370 => 300
    @arr_ads = []   
    log_model = nil
    log_model = LogCpd if ad_type == 100
    log_model = LogCpdm if ad_type == 200
    log_model = LogCpx if ad_type ==300

    @grouped_ad = Advertisement.where('ad_type >= ?',ad_type).group('priority')
    @grouped_ad.each do |ad|
      @arr_ads.push(Advertisement.where('ad_type >= ? and priority = ? and remain > 0',ad_type,ad.priority))
    end

    @ad_to_show = {'log_cnt' => 999999, 'ad' => nil}
    @arr_ads.each do |ads|
      ads.each do |ad|
        cnt = log_model.where("ad_id=? and DATEDIFF(created_at,curdate())=0", ad.id).count
        if @ad_to_show['log_cnt'] > cnt
          @ad_to_show['log_cnt'] = cnt
          @ad_to_show['ad'] = ad
        end
      end
    end

    return true, 'test', @ad_to_show['ad']
  end

  def get_cpd
    @status, @msg, @data = get_ad(100)
  end

  def get_cpdm
    @status, @msg, @data = get_ad(200)
  end

  def get_cpx
    @status, @msg, @data = get_ad(300)
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
