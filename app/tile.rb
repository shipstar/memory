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

  def flip
    @sprite.run_action Joybox::Actions::Sequence.with(actions: [
      Joybox::Actions::Scale.to(scale: 1.5, duration: 0.2),
      Joybox::Actions::Scale.to(scale: 1.0, duration: 0.2)
    ])
  end

end