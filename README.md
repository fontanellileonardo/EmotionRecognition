# Emotion Recognition Project
This repository contains the files and the documentation for the didactical project for the Intelligent Systems course.

## Assignment
The aim of this project is to design and develop an intelligent system that measures a person’s affective state on the basis of various biomedical signals that are recorded by sensors. 
In general, an affective state (or emotion) can be described by two terms: valence and arousal. Valence means positive or negative affectivity, whereas arousal measures how calming or exciting the affective state is. For example, the reactions that occurred the last time you saw a scary movie or just before an important exam are the mark of high-arousal emotions. On the other hand, valence only codes emotional events as positive or negative.
### Dataset
A total of 32 participants took part in an experiment where their biomedical signals were continuously recorded while they were watching a series of 40 oneminute long excerpts of music videos. At the end of each video, each participant rated the emotion felt throughout the video, in terms of valence and arousal levels. 
These levels were expressed by using the Self-Assessment Manikin (SAM). SAM is a non-verbal pictorial assessment technique that makes it easy to express the valence and arousal associated with a person’s affective state. Participants rated valence and arousal on a continuous 9-point scale by moving a cursor on a slider under the manikins.
The following is the table of the recorded signals: the first 32 rows of the table contain the electroencephalography, i.e. 32 EEG signals, each coming from an electrode that is placed on the skin of the participant’s head. EOG signals refer to electrooculography, which measures the eye movements. EMG denotes the electromyography signals, which measure the muscle contraction. GSR stands for galvanic skin response, which measures the electrical conductivity of the skin (it increases in proportion to a person’s sweating level). The respiration belt measures the breath fre- quency. The plethysmograph detects the changes in blood volume that occur in the microvascular bed of tissue, which are caused by the pressure pulse. Finally, the temperature is measured on the surface of the little finger.
![Table of signals](/images/table.png)
The dataset is made up of 32 files, one per partecipant. Each file contains two arrays, data and labels.
### Estimating valence and arousal with neural networks
The aim of this part of the project is to design and develop two multi-layer perceptron (MLP) artificial neural networks that accurately estimate a person’s valence and arousal levels, respectively, on the basis of the sensor data.
The MLPs take as input a set of features that are extracted and/or selected from the sensor data, and return the corresponding valence and arousal levels, respectively.
For each participant-video pair, the dataset contains 40 signals. All the signals are useful to estimate the valence and arousal levels.
Once the search for the best set of features is completed, the next step is to find the best architecture for both ANNs.
The last step of this part of the project is to design and train two radial basis function (RBF) networks that do the same thing as the MLPs developed before.
## Code
The [code](/code) in this repository refers to the **MatLab** code which has been the principal tool for extracting feature and training the MLP and RBF.
## Documentation
The documentation that presents the results of this project can be consulted [here](/docs/documentation.pdf).
## Credits
F. Fornaini, G. Alvaro, R. Polini, L. Fontanelli
