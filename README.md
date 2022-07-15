# Object Detection in an Urban Environment - Project 1 Submission
**Michael Santoro**

## Project Overview
*This section should contain a brief description of the project and what we are trying to achieve. Why is object detection such an important component of self-driving car systems?*

This project is an introduction to the Waymo Open Dataset explained further in the 'Data' section below. This project also introduces concept of deep nueral networks for machine learning. It introduces the concept of training and optimizing models for optimal results.

### Data

For this project, we will be using data from the [Waymo Open dataset](https://waymo.com/open/).

### Exploritory Data Analysis

In the exploratory data analysis excecise the 10 images were displayed with bounding boxes to represent the labeled data. This exploration only represents data for each image. Next I thought it would be interesting to explore the distribution of labels across the dataset. This way I may be able to determine if there was any sparse labels. Exploring the label_map.pbtxt file I found that there are (3) types of labels in the dataset (veichles, pedestrians, and cyclists). So, my plan was to sample 100 images and create a plot for each of the categories. We can see from the plot that the vast majority of the data is veichles.

![image](https://user-images.githubusercontent.com/74157573/177387214-2fac1053-fd40-4b8e-9df2-4ff7dfe2b0cc.png)

## Set Up
*This section should contain a brief description of the steps to follow to run the code for this repository.*
For each of the steps of the project I used bash script files to assist with long commands with lots of flags required. The bash scripts referenced below are all stored in the scripts folder. I trained my model in the Udacity provided VM. The expriments folder is outlined below. Due to the size constraints I have saved configuration files for each one my experiments in the folder.

### Experiments
The experiments folder will be organized as follows:
```
experiments/
    - exporter_main_v2.py - to create an inference model
    - model_main_tf2.py - to launch training
    - experiment0/ - containing pipeline_new.config for experiment
    - experiment1/ - containing pipeline_new.config for experiment
    - experiment2/ - containing pipeline_new.config for experiment
    - label_map.pbtxt
    ...
```

### Edit the config file

The config file was edited using the python file 'edit_config.py' this required multiple flags so I used the 'edit_config.sh' bash command file.

### Training

The training is initiated by a python file 'model_main_tf2.py' there are multiple flags associated with this script so I created a bash file entitled 'start_training.sh'.

### Improve the performances

Most likely, this initial experiment did not yield optimal results. However, you can make multiple changes to the config file to improve this model. One obvious change consists in improving the data augmentation strategy. The [`preprocessor.proto`](https://github.com/tensorflow/models/blob/master/research/object_detection/protos/preprocessor.proto) file contains the different data augmentation method available in the Tf Object Detection API. To help you visualize these augmentations, we are providing a notebook: `Explore augmentations.ipynb`. Using this notebook, try different data augmentation combinations and select the one you think is optimal for our dataset. Justify your choices in the writeup.

Keep in mind that the following are also available:
* experiment with the optimizer: type of optimizer, learning rate, scheduler etc
* experiment with the architecture. The Tf Object Detection API [model zoo](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/tf2_detection_zoo.md) offers many architectures. Keep in mind that the `pipeline.config` file is unique for each architecture and you will have to edit it.

**Important:** If you are working on the workspace, your storage is limited. You may to delete the checkpoints files after each experiment. You should however keep the `tf.events` files located in the `train` and `eval` folder of your experiments. You can also keep the `saved_model` folder to create your videos.


### Creating an animation
#### Export the trained model
Modify the arguments of the following function to adjust it to your models:

```
python experiments/exporter_main_v2.py --input_type image_tensor --pipeline_config_path experiments/reference/pipeline_new.config --trained_checkpoint_dir experiments/reference/ --output_directory experiments/reference/exported/
```

This should create a new folder `experiments/reference/exported/saved_model`. You can read more about the Tensorflow SavedModel format [here](https://www.tensorflow.org/guide/saved_model).

Finally, you can create a video of your model's inferences for any tf record file. To do so, run the following command (modify it to your files):
```
python inference_video.py --labelmap_path label_map.pbtxt --model_path experiments/reference/exported/saved_model --tf_record_path /data/waymo/testing/segment-12200383401366682847_2552_140_2572_140_with_camera_labels.tfrecord --config_path experiments/reference/pipeline_new.config --output_path animation.gif
```

## Submission Template

### Project overview
This section should contain a brief description of the project and what we are trying to achieve. Why is object detection such an important component of self driving car systems?

### Set up
This section should contain a brief description of the steps to follow to run the code for this repository.

### Dataset
#### Dataset analysis
This section should contain a quantitative and qualitative description of the dataset. It should include images, charts and other visualizations.
#### Cross validation
This section should detail the cross validation strategy and justify your approach.

### Training
#### Reference experiment
This section should detail the results of the reference experiment. It should includes training metrics and a detailed explanation of the algorithm's performances.

#### Improve on the reference
This section should highlight the different strategies you adopted to improve your model. It should contain relevant figures and details of your findings.
