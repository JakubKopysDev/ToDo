class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string      :name
      t.text        :desc
      t.belongs_to  :user, foreign_key: true

      t.timestamps
    end

    add_index :boards, :name, unique: true
  end
end
