class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.belongs_to :page
      t.string :name

      t.timestamps
    end
    add_index :templates, :page_id
  end

end
