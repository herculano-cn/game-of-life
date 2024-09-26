class CreateBoards < ActiveRecord::Migration[7.2]
  def change
    create_table :boards, id: :uuid do |t|
      t.jsonb :state, default: []
      t.timestamps
    end
  end
end
