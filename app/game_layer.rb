class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    load_sprite_sheet
    handle_touches

    @grid = Grid.new(sprite_batch: @sprite_batch)
  end

  def load_sprite_sheet
    SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = SpriteBatch.new file_name: "sprites.png"
    self << @sprite_batch
  end

  def handle_touches
    @active_tiles = []

    on_touches_ended do |touches, event|
      break if @active_tiles.size == 2
      touch = touches.any_object

      if tile = @grid.tile_to_flip(touch.location)
        tile.flip

        @active_tiles << tile if @active_tiles.size < 2

        if @active_tiles.size == 2
          self.runAction Sequence.with(actions: [
            CCDelayTime.actionWithDuration(1),
            CCCallFunc.actionWithTarget(self, selector: :handle_active_tiles)
          ])
        end
      end
    end
  end

  def handle_active_tiles
    if @active_tiles.map { |t| t.type }.uniq.size == 1
      @active_tiles.each(&:freeze)
    else
      @active_tiles.each(&:flip)
    end
    @active_tiles = []
  end
end