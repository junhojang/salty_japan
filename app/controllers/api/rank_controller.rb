class Api::RankController < ApplicationController

  def get_my_rank
    @status, @msg, @data = RankValidator.get_my_rank(params)
    @status, @msg, @data = RankManager.get_my_rank(params) if @status
  end

  def get_rank_list
    @status, @msg, @data = RankValidator.get_rank_list(params)
    @status, @msg, @data = RankManager.get_rank_list(params) if @status
  end
end
