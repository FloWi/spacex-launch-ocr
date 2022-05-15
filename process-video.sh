ffmpeg -ss 00:12:57 -i Starlink\ Mission.mp4 -vf "crop=118:34:108:967" "stage1-speed.mp4"
ffmpeg -ss 00:12:57 -i Starlink\ Mission.mp4 -vf "crop=118:34:265:967" "stage1-altitude.mp4"
ffmpeg -ss 00:12:57 -i Starlink\ Mission.mp4 -vf "crop=118:34:1529:967" "stage2-speed.mp4"
ffmpeg -ss 00:12:57 -i Starlink\ Mission.mp4 -vf "crop=118:34:1687:967" "stage2-altitude.mp4"

# downsample
ffmpeg -i stage1-speed.mp4 -filter:v fps=5 stage1-speed-fps5.mp4
ffmpeg -i stage1-altitude.mp4 -filter:v fps=5 stage1-altitude-fps5.mp4
ffmpeg -i stage2-speed.mp4 -filter:v fps=5 stage2-speed-fps5.mp4
ffmpeg -i stage2-altitude.mp4 -filter:v fps=5 stage2-altitude-fps5.mp4

# ocr
ffmpeg -i stage1-speed-fps5.mp4 -vf "ocr=language=eng:whitelist=0123456789.,metadata=mode=print:file=stage1-speed.txt:direct=1" -f null /dev/null
ffmpeg -i stage1-altitude-fps5.mp4 -vf "ocr=language=eng:whitelist=0123456789.,metadata=mode=print:file=stage1-altitude.txt:direct=1" -f null /dev/null
ffmpeg -i stage2-speed-fps5.mp4 -vf "ocr=language=eng:whitelist=0123456789.,metadata=mode=print:file=stage2-speed.txt:direct=1" -f null /dev/null
ffmpeg -i stage2-altitude-fps5.mp4 -vf "ocr=language=eng:whitelist=0123456789.,metadata=mode=print:file=stage2-altitude.txt:direct=1" -f null /dev/null
