class WinLayer < Joybox::Core::Layer
  scene

  def on_enter
    title = Label.new text: "You Win!", font_size: 48,
      position: [Screen.half_width, Screen.half_height + 50]
    self << title

    audio_effect = AudioEffect.new
    audio_effect[:win] = 'hooray.wav'
    audio_effect.play :win
  end
end