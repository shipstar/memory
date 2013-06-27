class Tile
  TYPES = %w(
    boy gem_blue gem_green gem_orange girl_cat girl_horn
    girl_pink girl_princess heart key ladybug star
  )

  def initialize(opts={})
    @type = opts[:type]
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
    @sprite.setDisplayFrame Joybox::Core::SpriteFrameCache.frames["#{@type}.png"]

    @sprite.run_action Joybox::Actions::Sequence.with(actions: [
      Joybox::Actions::Scale.to(scale: 1.5, duration: 0.2),
      Joybox::Actions::Scale.to(scale: 1.0, duration: 0.2)
    ])
  end

end