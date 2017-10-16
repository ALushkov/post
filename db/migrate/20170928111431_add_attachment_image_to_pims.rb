class AddAttachmentImageToPims < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pims do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pims, :image
  end
end
