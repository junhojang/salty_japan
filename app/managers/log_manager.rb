#defined for get and set logs
class LogManager
  def self.set_log_user_login(user_id, dsc)
    log = LogUserLogin.new
    log.user_id = user_id
    log.dsc = dsc
    log.save
    return log
  end
  
  def self.set_log_reward(user_id, reward_type, amount, dsc)
    log = LogReward.new
    log.user_id = user_id
    log.reward_type = reward_type
    log.amount = amount
    log.dsc = dsc
    log.save
    return log
  end

  def self.set_log_point(user_id, point_type, amount, dsc)
    log = LogPoint.new
    log.user_id = user_id
    log.point_type = point_type
    log.amount = amount
    log.dsc = dsc
    log.save
    return log

  end
  
  def self.set_log_test(user_id, test_type, category, stage, level, medal_num, score, reward, point, dsc, is_first)
    log = LogTest.new
    log.user_id = user_id
    log.test_type = test_type
    log.category = category
    log.stage = stage
    log.level = level
    log.medal_num = medal_num
    log.score = score
    log.reward = reward
    log.point = point
    log.dsc = dsc
    log.is_first = is_first
    log.save
    return log
  end

  def self.set_log_signup(user_id,signup_type, dsc)
    log = LogSignup.new
    log.user_id = user_id 
    log.signup_type = signup_type
    log.dsc = dsc
    log.save
    return log
  end

  def self.set_log_cpd(user_id, ad_id, act, dsc)
    log = LogCpd.new
    log.user_id = user_id
    log.cpd_id = cpd_id
    log.act = act
    log.dsc = dsc
    log.save
    return log
  end

  def self.set_log_cpdm(user_id, ad_id, act, view_time, dsc)
    log = LogCpdm.new
    log.user_id = user_id
    log.cpdm_id = cpdm_id
    log.act = act
    log.view_time = view_time
    log.dsc = dsc
    log.save
    return log
  end

  def self.set_log_cpx(user_id, ad_id, act, dsc)
    log = LogCpx.new
    log.user_id = user_id
    log.cpx_id = cpx_id
    log.act = act
    log.dsc = dsc
    log.save
    return log
  end

  def self.set_log_fb_sharing(user_id, info_id, dsc)
    log = LogFbSharing.new
    log.user_id = user_id
    log.info_id = info_id
    log.dsc = dsc
    log.save
    return log
  end

end
