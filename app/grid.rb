class Grid
  def initialize(opts={})
    @sprite_batch = opts[:sprite_batch]

    load_tiles
  end

  def load_tiles
    @tiles = 4.times.map do |row|
      4.times.map do |column|
        Tile.new position: [ column * 64 + 64, row * 64 + 128 ]
      end
    end.flatten

    @tiles.each { |t| @sprite_batch << t.sprite }
  end
end