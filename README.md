# batch_executable

All kinds of batch files.
[Click this to view files.](https://github.com/belongtothenight/batch_executable/tree/main/src)

## Requirement

1. FFMPEG(ffmpeg, ffprobe)
2. cmdutils(recycle)

## File Description

| No  | File                          | Description                                                                                                                        |
| --- | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 1   | minecraft_record.bat          | Execute ["time_select_recording.py"](https://github.com/belongtothenight/Minecraft-Scripts/blob/main/src/Time_Select_Recording.py) |
| 2   | node_red.bat                  | Update, launch local node-red, open local node-red webpage.                                                                        |
| 3   | video_remove_frozen_frame.bat | Remove frozen frames in videos.                                                                                                    |
| 4   | video_cut_sample.bat          | Get the first few seconds of video for testing processes like upscaling and add frame.                                             |
| 5   | deploy_batch.bat              | Copy all batch file here to directory where they can be executed with cmd.                                                         |
| 6   | filename_remove_space.bat     | Remove spaces in filenames.                                                                                                        |
| 7   | list_mp4.bat                  | Generate a list of mp4 files stored in specific directory.                                                                         |
| 8   | compress_mp4.bat              | Based on the list generated above, compress all files listed within.                                                               |

## Future idea

1. [Combine videos.](https://videoconverter.wondershare.com/video-merger/ffmpeg-merge-videos.html)
2. [Sharpen videos.](https://ffmpeg.org/ffmpeg-filters.html#sharpen_005fnpp)
3. [Resize videos.](https://democreator.wondershare.com/video-editor/ffmpeg-resize-video.html)
4. [Start application without waiting in a batch file.](https://stackoverflow.com/questions/2937569/how-to-start-an-application-without-waiting-in-a-batch-file)
5. [Probe video encoding.](https://stackoverflow.com/questions/5618363/is-there-a-way-to-use-ffmpeg-to-determine-the-encoding-of-a-file-before-transcod)
6. [Check file size](https://stackoverflow.com/questions/1199645/how-can-i-check-the-size-of-a-file-in-a-windows-batch-script)
7. [Process filepath with chinese characters.](https://www.walkernews.net/2013/05/19/how-to-get-windows-command-prompt-displays-chinese-characters/)