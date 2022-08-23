class CreateNights < ActiveRecord::Migration[6.0]
  def change
    create_table   :nights do |t|
      t.string     :title,         null: false
      t.text       :explain,       null: false
      t.integer    :genre_id,      null: false
      t.integer    :state_id,      null: false
      t.references :user,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
