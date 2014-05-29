class MsgMaker
  # ex) MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'signup')  
  # =>  success to signup

  # ex) MsgMaker.make_msg(MsgMaker.TYPE_FAILED, 'signup', MsgMaker.LACK_OF_PARAMS)
  # =>  failed to signup. lack of params

  TYPE_SUCCESS = 'success to'
  TYPE_FAILED = 'failed to'

  LACK_OF_PARAMS = 'lack of params' 
  NOT_EXIST = 'not exist'
  NOT_ENOUGH = 'not enough'

  def self.make_msg(msg_type,function,reason='',param='') # param is used for NOT_EXIST reason
    return msg_type + ' ' + function + '. ' + reason + ' ' + param
  end

end
