class CreateReviews < ActiveRecord::Migration[6.1]
    def change
        create_table :reviews do |t|
            t.string :title
            t.integer :year
            t.integer :rating
            t.string :content
            t.belongs_to :user, foreign_key: true
        end
    end
end