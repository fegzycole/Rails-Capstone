class CreateRetweets < ActiveRecord::Migration[6.0]
  def change
    create_table :retweets do |t|
      t.integer :UserId
      t.integer :OpinionId

      t.timestamps
    end
  end
end
