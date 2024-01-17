class CreateRecommendedRings < ActiveRecord::Migration[7.0]
  def change
    create_table :recommended_rings do |t|
      t.string :ring_type
      
      t.timestamps
    end
  end
end
