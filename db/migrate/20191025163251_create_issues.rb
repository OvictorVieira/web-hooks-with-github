class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.text :issue_id
      t.index :issue_id
      t.string :action
      t.string :title
      t.string :user
      t.string :state
      t.string :url
      t.timestamps
    end
  end
end
