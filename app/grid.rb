class Grid
  def initialize(opts={})
    @sprite_batch = opts[:sprite_batch]

    @sprite_batch << Joybox::Core::Sprite.new(
      frame_name: 'boy.png',
      position: [Joybox::Common::Screen.half_width, Joybox::Common::Screen.half_height]
    )
  end
end