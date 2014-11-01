class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :meta_title
      t.string :meta_description
      t.string :content

      t.timestamps
    end
  end
end
