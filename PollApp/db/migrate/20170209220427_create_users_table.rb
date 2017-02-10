class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.timestamps
    end
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
      t.timestamps
    end

    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.text :body, null: false
      t.timestamps
    end

    create_table :choices do |t|
      t.integer :question_id, null: false
      t.text :answer_choice, null: false
      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :choice_id, null: false
      t.timestamps
    end

    add_index :users, :name, unique: true
    add_index :polls, :author_id
    add_index :questions, :poll_id
    add_index :choices, :question_id
    add_index :responses, :user_id
    add_index :responses, :choice_id
  end
end
