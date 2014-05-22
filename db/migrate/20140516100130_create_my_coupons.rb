class CreateMyCoupons < ActiveRecord::Migration
  def change
    create_table :my_coupons do |t|
      t.integer :user_id
      t.integer :coupon_id

      t.timestamps
    end
  end
end
