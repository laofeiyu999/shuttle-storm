#!/usr/bin/env bash
set -euo pipefail
cd "/d/GameDev/shuttle-storm/References/游戏详细参考图与视频/飞羽青春"
FF="/c/Users/OVO/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-8.1.2-full_build/bin/ffmpeg"
echo "[1/2] 操作视角 → 飞羽青春多拍实机玩家对战视频-玩家操作视角-弹道系统参考用​​-1080p.mp4"
"$FF" -y -v warning -stats -i "飞羽青春多拍实机玩家对战视频-玩家操作视角-弹道系统参考用​​.mp4" -vf "scale=-2:1080:flags=lanczos" -c:v libx264 -crf 30 -preset medium -c:a aac -b:a 128k -movflags +faststart "飞羽青春多拍实机玩家对战视频-玩家操作视角-弹道系统参考用​​-1080p.mp4"
echo "[2/2] 侧视角 → 飞羽青春多拍实机玩家对战视频-玩家观战水平侧视角-弹道系统参考用​​-1080p.mp4"
"$FF" -y -v warning -stats -i "飞羽青春多拍实机玩家对战视频-玩家观战水平侧视角-弹道系统参考用​​.mp4" -vf "scale=-2:1080:flags=lanczos" -c:v libx264 -crf 30 -preset medium -c:a aac -b:a 128k -movflags +faststart "飞羽青春多拍实机玩家对战视频-玩家观战水平侧视角-弹道系统参考用​​-1080p.mp4"
ls -lh *.mp4
echo DONE
