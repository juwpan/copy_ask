class AddDefaultUserColor < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :color, default: '#370617'
  end
end
