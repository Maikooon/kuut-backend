class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

require 'database_cleaner'

class ActiveSupport::TestCase
  setup do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end
end
