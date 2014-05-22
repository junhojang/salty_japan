class Api::StoreController < ApplicationController
  def get_qpcon_list
    @status, @msg, @data = StoreValidator.get_qpcon_list(params)
    @status, @msg, @data = StoreManager.get_qpcon_list(params) if @status
  end

  def order_qpcon_product
    # @status, @msg, @data = StoreValidator.order_qpcon_product(params)
    # @data = StoreManager.order_qpcon_product if @status
  end

  def request_to_exchange_rewawrd
    @status, @msg, @data = StoreValidator.request_to_exchange_reward(params)
    @status, @msg, @data = StoreManager.request_to_exchange_reward(params) if @status
  end
end
