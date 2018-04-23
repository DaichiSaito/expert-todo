class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :location
      t.tasks :references

      t.timestamps
    end
  end
end
