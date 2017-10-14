class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.date :completed_at

      t.timestamps
    end
  end
end
