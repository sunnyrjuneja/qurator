class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.text :link
      t.references :deck, index: true

      t.timestamps
    end
  end
end
