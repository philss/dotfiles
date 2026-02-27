function mp4 --description "Transforms a .mov to .mp4 using ffmpeg" -a input output -w ffmpeg
  ffmpeg -i $input -vcodec h264 -acodec mp2 $output
end
