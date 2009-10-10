class CreateGeoCoordinates < ActiveRecord::Migration
  def self.up
    create_table :geo_coordinates do |t|
      t.string :place
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_coordinates
  end
end
