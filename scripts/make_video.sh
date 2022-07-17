python /home/workspace/inference_video.py \
--labelmap_path /home/workspace/label_map.pbtxt \
--model_path /home/workspace/experiments/experiment4/saved_model \
--tf_record_path data/test/segment-12200383401366682847_2552_140_2572_140_with_camera_labels.tfrecord \
--config_path /home/workspace/UProj1/experiments/experiment4/pipeline_new.config \
--output_path /home/workspace/UProj1/animation.gif