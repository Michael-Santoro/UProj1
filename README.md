# Object Detection in an Urban Environment - Project 1 Submission
**Michael Santoro**

## Project Overview

This project is an introduction to Computer Vision. By demonstrating the ability to take an existing machine learning model architecture, then training the model while evaluating the training metrics to find optimal pipeline parameters, to get optimal model results. The Waymo Open Dataset explained further in the 'Data' section below will be used the input data. This project also introduces concept of deep nueral networks for machine learning. It introduces the concept of training and optimizing models for optimal results.

Object Detection is important to self-driving cars due to the need for cars to understand their enviroment. So detecting objects in images such as cyclists, cars, and people. Information such as location of these objects can be extracted of these images. This information could be passed to the controls of the car to avoid a collision. Thus Object Detection is necessary for Self-Driving cars.

### Data

For this project, we will be using data from the [Waymo Open dataset](https://waymo.com/open/).

### Exploritory Data Analysis

In the exploratory data analysis excecise the 10 images were displayed with bounding boxes to represent the labeled data. This exploration only represents data for each image. Next I thought it would be interesting to explore the distribution of labels across the dataset. This way I may be able to determine if there was any sparse labels. Exploring the label_map.pbtxt file I found that there are (3) types of labels in the dataset (veichles, pedestrians, and cyclists). So, my plan was to sample 100 images and create a plot for each of the categories. We can see from the plot that the vast majority of the data is veichles.

![image](https://user-images.githubusercontent.com/74157573/177387214-2fac1053-fd40-4b8e-9df2-4ff7dfe2b0cc.png)

## Set Up
For each of the steps of the project I used bash script files to assist with long commands with lots of flags required. The bash scripts referenced below are all stored in the scripts folder. I trained my model in the Udacity provided VM. The expriments folder is outlined below. Due to the size constraints I have saved configuration files for each one my experiments in the folder.

### Experiments
The experiments folder will be organized as follows:
```
experiments/
    - exporter_main_v2.py - to create an inference model
    - model_main_tf2.py - to launch training
    - experiment0/ - containing pipeline_new.config for experiment, traing_run bash script, and launch evalueation bash script
    - experiment1/ - containing pipeline_new.config for experiment, traing_run bash script, and launch evalueation bash script
    - experiment2/ - containing pipeline_new.config for experiment, traing_run bash script, and launch evalueation bash script
    - label_map.pbtxt
    ...
```

### Edit the config file

The config file was edited using the python file 'edit_config.py' this required multiple flags so I used the 'edit_config.sh' bash command file.

## Training

The training is initiated by a python file 'model_main_tf2.py' there are multiple flags associated with this script so I created a bash file entitled 'start_training.sh'.

#### Reference experiment
*This section should detail the results of the reference experiment. It should includes training metrics and a detailed explanation of the algorithm's performances.*
The initial experiment provided some interesting results starting with the classification_loss and localization_loss graphs. Shown below:
![image](https://user-images.githubusercontent.com/74157573/179364402-05518990-21cb-40be-8162-f4a6104cafe5.png)

The 'classification_loss' is a measure of the accuracy of the actual classification meaning did the model find the correct label for the bounding box, we are looking for values close zero. The 'localization_loss' is a measure of bounding box location accuracy. These initial results for both of these measures indicate that the learning rate is too high this can be seen by the instability of these plots. Further reviewing this initial experiment we can view the learning rate.

![image](https://user-images.githubusercontent.com/74157573/179365333-d7c7ffdd-f517-48f1-baff-163c6ae455dc.png)

The learning schedule of the pipeline in the initial experiment was set to .0133 then was scheduled to increase .04 we can see in the early stages of the loss plots this initial learning rate is stabalizing the performance (less bouncing around).


#### Improve on the reference
*This section should highlight the different strategies you adopted to improve your model. It should contain relevant figures and details of your findings.*

##### Experiment 0 -> Expermient 1: Reduced Learning Rate

![image](https://user-images.githubusercontent.com/74157573/179365645-2ae83b55-96e0-4f35-bdb5-be91d606f0e4.png)

Reviewing the plot we can see a significant improvement in stability although the localization loss still could be improved.

##### Experiment 1 to Experiment 2 -> Changed the learning rate to exponential decay
The initial learning rate algorithim was a cosine_decay_learning_rate this particular method was causing the learning rate to increase initially which is what I think was causing some instability. So I changeed to 'exponential_decay_learning_rate'.

![image](https://user-images.githubusercontent.com/74157573/179365986-74bcd6bd-63c1-4abb-bee1-7da1e46e5d44.png)

This did not yield much results.

##### Experiment 2 to Experiment 3 -> Increase the batch size 8 to create more variance in data, adjust brightness, contrast, hue, color, saturation
The thought here was to increase the variability in the data to tray and get the model to get unstuck. We seam to approach a loss plateau.

![image](https://user-images.githubusercontent.com/74157573/179368766-a8955c06-df2a-419a-9bd8-1d5666151d53.png)


## Evaluation

