# AVAudioPlayerSoundPractice

# AVAudioPlayerで音を鳴らす

使用する音声ファイルをプロジェクトに導入します。今回はSoundsディレクトリを作成し、その中に入れました。

<img width="262" alt="スクリーンショット 2021-10-04 21 10 38" src="https://user-images.githubusercontent.com/72326299/135849011-7241b481-b763-46bf-ac6f-36f0128c9a74.png">

音声ファイルのパスを作成します。

　`        guard let soundFilePath = Bundle.main.path(forResource: "BellSound", ofType: "mp3") else { return }
   `


　prepareToPlay()を呼んで準備完了

　`audioPlayer?.prepareToPlay()`

呼び出す時、currentTimeを０にしておくことで、ボタンが押されるたびに初めから再生できます。

　`audioPlayer?.currentTime = 0`

# バックグラウンドでも音を鳴らしたい！

https://developer.apple.com/documentation/avfoundation/media_playback_and_selection/creating_a_basic_video_player_ios_and_tvos/enabling_background_audio

再生時にバックグラウンドに行っても再生できるドキュメント
https://developer.apple.com/documentation/avfaudio/avaudiosession

https://developer.apple.com/documentation/avfoundation/media_playback_and_selection/creating_a_basic_video_player_ios_and_tvos/playing_audio_from_a_video_asset_in_the_background
