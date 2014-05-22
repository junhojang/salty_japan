class CreateFbSharingInfos < ActiveRecord::Migration
  def change
    create_table :fb_sharing_infos do |t|
      t.integer :ad_id
      t.integer :reward
      t.integer :point
      t.string :link_url

      t.timestamps
    end
  end
end
