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

  def touched?(touch_location)
    touch_location.x > @sprite.boundingBox.origin.x &&
    touch_location.x < (@sprite.boundingBox.origin.x + @sprite.boundingBox.size.width) &&
    touch_location.y > @sprite.boundingBox.origin.y &&
    touch_location.y < (@sprite.boundingBox.origin.y + @sprite.boundingBox.size.height)
  end
end