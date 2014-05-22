class MsgMaker
  # 'failed to ?, ?', function, reason
  TYPE_SUCCESS = 'success to'
  TYPE_FAILED = 'failed to'

  LACK_OF_PARAMS = 'lack of params'
  NOT_EXIST_USER_ID = 'not exist user'
  def self.make_msg(msg_type,function,reason='')
    return msg_type + ' ' + function + '.' + reason    
  end
end
