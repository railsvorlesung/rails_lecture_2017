class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :article
      t.string :title
      t.attachment :file

      t.timestamps
    end
  end
end
