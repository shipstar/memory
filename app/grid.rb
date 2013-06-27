class Grid
  TILE_SIZE = 64
  LEFT_GUTTER = 64
  BOTTOM_GUTTER = 128

  def initialize(opts={})
    @sprite_batch = opts[:sprite_batch]

    load_tiles
  end

  def load_tiles
    @tiles = 4.times.map do |row|
      4.times.map do |column|
        Tile.new position: [
          column * TILE_SIZE + LEFT_GUTTER,
          row * TILE_SIZE + BOTTOM_GUTTER
        ]
      end
    end.flatten

    @tiles.each { |t| @sprite_batch << t.sprite }
  end
end