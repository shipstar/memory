class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    Joybox::Core::SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = Joybox::Core::SpriteBatch.new file_name: "sprites.png"
    self << @sprite_batch

    @sprite_batch << Sprite.new(frame_name: 'boy.png', position: [Screen.half_width, Screen.half_height])
  end
end