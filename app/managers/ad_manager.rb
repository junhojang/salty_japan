class AdManager
  def self.get_ad(ad_type)
    log_model = nil
    log_model = LogCpd if ad_type == 100
    log_model = LogCpdm if ad_type == 200
    log_model = LogCpx if ad_type == 300

    grouped_ad = Advertisement.where('ad_type between ? and ?',ad_type, ad_type+100).group('priority')
    grouped_ad.each do |ad|
      arr_ads.push(Advertisement.where('ad_type >= ? and priority = ? and remain > 0',ad_type,ad.priority))
    end

    ad_to_show = {'log_cnt' => 999999, 'ad' => nil}
    arr_ads.each do |ads|
      ads.each do |ad|
        cnt = log_model.where("ad_id=? and DATEDIFF(created_at,curdate())=0", ad.id).count
        if ad_to_show['log_cnt'] > cnt
          ad_to_show['log_cnt'] = cnt
          ad_to_show['ad'] = ad
        end
      end
    end

    return ad_to_show['ad']
  end

  def self.get_ad_list(ad_type)
    ads  = Advertisement.where('ad_type between ? and ?', ad_type, ad_type+100)
    return ads
  end

  def self.get_root_ad_type(ad_type)
    return (ad_type / 10).floor * 10 # 302 => 300, 370 => 300
  end
end
