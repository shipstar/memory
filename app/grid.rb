class Grid
  TILE_SIZE = 64
  LEFT_GUTTER = 64
  BOTTOM_GUTTER = 128

  def initialize(opts={})
    @sprite_batch = opts[:sprite_batch]

    load_tiles
  end

  def load_tiles
    types = 8.times.map { Tile::TYPES.sample } * 2

    @tiles = 4.times.map do |row|
      4.times.map do |column|
        Tile.new type: types.shift, position: [
          column * TILE_SIZE + LEFT_GUTTER,
          row * TILE_SIZE + BOTTOM_GUTTER
        ]
      end
    end.flatten

    @tiles.each { |t| @sprite_batch << t.sprite }
  end

  def tile_to_flip(touch_location)
    @tiles.detect { |t| t.touched?(touch_location) }
  end
end