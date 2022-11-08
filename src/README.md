# SRC

This is the detail of each batch files.

## Hyperlink

1. [minecraft_record.bat](#1)
2. [node_red.bat](#2)
3. [video_remove_frozen_frame.bat](#3)
4. [video_get_sample.bat](#4)
5. [deploy_batch.bat](#5)

## <a name="1"></a>minecraft_record.bat

Launch python file to assist recording in Minecraft.

This file executes ["time_select_recording.py"](https://github.com/belongtothenight/Minecraft-Scripts/blob/main/src/Time_Select_Recording.py).

status: finished

## <a name="2"></a>node_red.bat

Launch local node-red.

1. Acquire installed node.js, npm, node-red versions.
2. Ask whether to update.
3. Update node.js, npm, node-red if confirmed.
4. Launch node-red.
5. Go to "http://127.0.0.1:1880/"

status: worked, developing
Not sure whether version info acquired is correct or not, not able to print out tabled version info.

## <a name="3"></a>video_remove_frozen_frame.bat

Remove all frozen frames in videos.

1. Set all parameters.
2. Display all files in folder.
3. Process file if it's MP4 format, and export processing result.

status: finished

## <a name="4"></a>video_cut_sample.bat

Get first few seconds of videos.

1. Set all parameters.
2. Display all files in folder.
3. Process file if it's MP4 format, and export processing result.

status: not started

## <a name="5"></a>deploy_batch.bat

Copy all files in "src" to directory where I can launch with single line of code in cmd.

1. Set all parameters.
2. Display all files in folder.
3. Move all files and export log.

status: finished
