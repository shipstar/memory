class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    load_sprite_sheet
    @sprite_batch << Sprite.new(frame_name: 'boy.png', position: [Screen.half_width, Screen.half_height])
  end

  def load_sprite_sheet
    Joybox::Core::SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = Joybox::Core::SpriteBatch.new file_name: "sprites.png"
    self << @sprite_batch
  end
end