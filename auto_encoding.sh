#!/bin/bash

# 원본 파일 경로
original_directory="/volume3/wookingwoo_cloud/nas-auto-encoding/원본_영상/"

# 인코딩 파일 저장할 경로
encoding_path="/volume3/wookingwoo_cloud/nas-auto-encoding/인코딩_완료_영상/"

origin_all_files="$original_directory*"

echo

for file_dir in $origin_all_files; do

    # echo "file lists: \"$file_dir\""

    file=${file_dir#$original_directory}
    # echo "file: \"$file\""

    file_name=${file%.*}
    # echo "file_name: \"$file_name\""

    #인코딩 시작
    echo "[인코딩 시작]: \"$file_dir\""
    ffmpeg -i "$file_dir" -vcodec libx264 -acodec copy -b:a 128k -f mp4 -level 4.1 "$encoding_path$file_name.mp4" </dev/null >>$encoding_path$file_name.log 2>&1

    echo "[인코딩 완료]: \"$file\""

    # 원본파일 삭제 (생략 가능)
    # rm -r $file_dir
    # echo "[삭제 완료]: \"$file\""

done
echo

exit 0
