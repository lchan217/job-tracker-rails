class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.text :url
      t.string :source
      t.timestamps
    end
  end
end
