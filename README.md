# EAP_Gels_as_Computational_Moore_Reservoir_Automaton_Supplementary_Information

This repository contains all code and data used within the experiments described in the paper “Electroactive Polymer Gels as Probabilistic Reservoir Automata for Computation”. All data analysis was performed using code written in the Matlab environment, using Matlab packages, and datasets constructed in Matlab. This repository is available on Zenodo.
This repository is organised into folders according to the section of the paper, labelled as “Experiment \_1-Memory \_Mechanics \_Through \_Ion \_Migration \_and \_Voltage \_Potential \_Measurement”, "Experiment \_2-Applying \_EAP \_gel \_to \_a \_Moore \_Machine \_Automata", and “Experiment \_3-Applying \_Moore \_Reservoir \_Hybrid \_to \_Collected \_Data”. The specific functions and datasets are detailed below broken down by folder.

## "Experiment \_1-Memory \_Mechanics \_Through \_Ion \_Migration \_and \_Voltage \_Potential \_Measurement"
* “data.mat” This data file holds the tables of data that record the voltage potential and current over time with different input sequences, the columns respond to Shunt Voltage (V), Bus Voltage (V), Current (mA), Load Voltage (V), Power (mW), Record Time (s) respectively. The data is stored as 8 separate data-sets for each of the different input sequences -1,-1,-1,1; 1,-1,1,-1; -1,1,1,1; 1,1,-1,-1; 1,-1,-1,1; 1,1,1,-1; -1,-1,1,1; -1,1,-1,1 as "Data1" through "Data8" respectively. This data is also stored as a single data-set "Data" along the third axis of the matrix, this data-set is used by the currentAnalysis function to plot the data.
* “currentAnalysis” This function plots the current and voltage potential dataset as a separate plot for each input sequence, showing how they vary over time with different input sequences.

## "Experiment \_2-Applying \_EAP \_gel \_to \_a \_Moore \_Machine \_Automata"
* “full data.mat” This data file holds 5 datasets; data\_gain: contains the angle data for all gels after the gain value is applied organized into a tree, fullData: contains the angle data for all gels organized into a tree, gainParams: contains each of the gain values applied to the gels, nodesOut: contains the calculated probability distributions for the state tree, Reservoir: contains each reservoir as a cell stored corresponding to their threshold values.
* "allProbDist" Generates histograms of probabilities for the given node tree data.
* "calcDeviation" Calculates the standard deviation in output sequences.
* "calcProb" Calculates the predictability of the automaton, probability of output sequences being consistent between runs.
* "calcUniq" Calculates the number of unique output sequences.
* "DataGain" Calculates the gain values for each of the gel runs and shows the variance reduction.
* "nodeTreeGen" Generates the state tree of outcomes for the given node tree data.
* "probDist" Generates the probability distribution histogram for the given node tree data and the given input sequence.
* "probTree" Generates the state tree and probability distribution histograms.
* "probTreeGen" Generates the tree probability data from the raw data and threshold values.
* "rearrange2to1" Rearranges the data from an excel layout to that needed for Matlab analysis.
* "runProbTree" Runs through the node tree data using the input sequence to generate an output sequence.
* "threshProb" Generates the graphs of predictability, unique sequences, and standard deviation to find the most divers threshold values.

## “Experiment \_3-Applying \_Moore \_Reservoir \_Hybrid \_to \_Collected \_Data”
* "allcomb" Returns all combinations of elements in the given array.
* "dispProbSurf" Generates heat map scatter plot of the probability tree for the given reservoir at given thresholds.
* "dispResoviours" Displays a 3D surface plot of the error of fitting a polynomial to the mapping functions generated from each threshold pair in the given reservoir for the given degree.
* "getFitResoviour" Finds the best fitting polynomial, of the given polynomial degree, for the mapping function located at the given threshold values for the given reservoir.
* "getResoviour" Generates the reservoir from the dataset of gel angles by applying all threshold combinations and storing resultant probability tree in a cell array.
* "resFitAnalysis" Generates a 3D surface plot of fitting error data for various degree polynomials in a single figure.
* "resoviourPredicability" Generates heat map for predictability of the given reservoir.
