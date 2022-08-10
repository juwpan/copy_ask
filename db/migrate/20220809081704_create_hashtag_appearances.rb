class CreateHashtagAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtag_appearances do |t|
      t.references :question, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
