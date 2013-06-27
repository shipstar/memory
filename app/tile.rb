class Tile
  TYPES = %w(
    boy gem_blue gem_green gem_orange girl_cat girl_horn
    girl_pink girl_princess heart key ladybug star
  )

  attr_reader :type

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
    return if @frozen

    touch_location.x > @sprite.boundingBox.origin.x &&
    touch_location.x < (@sprite.boundingBox.origin.x + @sprite.boundingBox.size.width) &&
    touch_location.y > @sprite.boundingBox.origin.y &&
    touch_location.y < (@sprite.boundingBox.origin.y + @sprite.boundingBox.size.height)
  end

  def flip
    if is_showing?("hidden.png")
      show "#{@type}.png"
    else
      show "hidden.png"
    end

    @sprite.run_action Joybox::Actions::Sequence.with(actions: [
      Joybox::Actions::Scale.to(scale: 1.5, duration: 0.2),
      Joybox::Actions::Scale.to(scale: 1.0, duration: 0.2)
    ])
  end

  def freeze
    @frozen = true
  end

  def show(frame_name)
    @sprite.setDisplayFrame Joybox::Core::SpriteFrameCache.frames[frame_name]
  end

  def is_showing?(frame_name)
    @sprite.isFrameDisplayed Joybox::Core::SpriteFrameCache.frames[frame_name]
  end

end