class CreateCrazyStuffs < ActiveRecord::Migration
  def self.up
    create_table :crazy_stuffs do |t|
      t.string   :which_1
      t.string   :op
      t.boolean  :conflicted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :crazy_stuffs
  end
end
