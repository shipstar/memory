class Tile
  def initialize(opts={})
    @position = opts[:position]
  end

  def sprite
    @sprite ||= Joybox::Core::Sprite.new(
      frame_name: 'hidden.png',
      position: @position
    )
  end
end