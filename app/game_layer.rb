class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    Joybox::Core::SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = Joybox::Core::SpriteBatch.new file_name: "sprites.png"
    self << @sprite_batch

    @sprite_batch << Sprite.new(frame_name: 'boy.png', position: [Screen.half_width, Screen.half_height])
    @sprite_batch << Sprite.new(frame_name: 'girl_cat.png', position: [0, 0])
    @sprite_batch << Sprite.new(frame_name: 'girl_cat.png', position: [Screen.width, Screen.height])
  end
end