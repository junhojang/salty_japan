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
    coupon = Coupon.find_by(ad_id: ad_to_show['ad'].id)
    data = {'ad' => ad_to_show['ad'], 'coupon' => coupon}
    return true,'',data
  end

  def self.get_ad_list(ad_type)
    ads  = Advertisement.where('ad_type between ? and ?', ad_type, ad_type+100)
    coupons = 
    return true,'',ads
  end

  def self.get_coupon_list
    return true,'',Coupon.all
  end

  def self.get_my_coupon_list(params)
    return true,'',MyCoupon.where('user_id = ?',params[:user_id])
  end

  def self.set_cpd_log(params)
    return true,'',LogManager.set_log_cpd(params[:user_id], params[:ad_id], params[:act], 'cpd log')
  end

  def self.set_cpdm_log(params)
    return true,'',LogManager.set_log_cpd(params[:user_id], params[:ad_id], params[:act], 'cpdm log')
  end

  def self.set_cpx_log(params)
    return true,'',LogManager.set_log_cpd(params[:user_id], params[:ad_id], params[:act], 'cpdx log')
  end

  def self.get_survey(params)
   
    survey = Survey.find_by cpx_id: params[:cpx_id]
    questions = SurveyQuestion.where('survey_id = ?',survey.id)
    datas =  {'title' => survey.title, 'questions' => []}

    questions.each do |q|
      answers = SurveyAnswer.where('question_id = ?',q.id).select('answer')
      question = {'question' => q.question,'answers' => answers}
      datas[:questions].add(question)
    end
    return true,'',datas
end
