python edit_config.py \
--train_dir /home/workspace/data/train/ \
--eval_dir /home/workspace/data/val/ \
--batch_size 2 \
--checkpoint /home/workspace/experiments/pretrained_model/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8/checkpoint/ckpt-0 
--label_map /home/workspace/UProj1/experiments/label_map.pbtxt