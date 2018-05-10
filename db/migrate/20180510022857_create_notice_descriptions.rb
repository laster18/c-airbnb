class CreateNoticeDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :notice_descriptions do |t|
      t.text :content
      t.timestamps
    end
  end
end
