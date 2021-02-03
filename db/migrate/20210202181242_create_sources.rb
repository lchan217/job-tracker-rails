class CreateSources < ActiveRecord::Migration[6.1]
  def up
    create_table :sources do |t|
      t.string :name
      t.string :rating
      t.string :root_domain
      t.text :logo_file
      t.text :description
      t.timestamps
    end

    Rake::Task['sources:create_sources'].invoke
  end

  def down
    drop_table :sources
  end
end
