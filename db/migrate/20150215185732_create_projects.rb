class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :title
      t.text :desc, :limit => nil
      t.text :img, :limit => nil
      t.timestamps
    end
  end
end
