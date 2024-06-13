# Machine Learning based colored noise minimisation

## Introduction
Ensemble learning is a technique that combines multiple models to improve predictive performance or enhance the robustness of a system. While Independent Component Analysis (ICA), Sparse Component Analysis, and Non-Negative Matrix Factorization (NMF) are often used individually for signal separation tasks, they can also be combined within an ensemble learning framework.

## Technologies Used
Machine Learning, Ensemble Techniques, Python, Matlab Programming, Signal Validation.

## Platform Used
Google-colab Notebook and Matlab

## Project Description
## 1.	Individual Model Training:
-	Train individual models using each signal separation technique (ICA, Sparse Component Analysis, NMF, Xgboost).
-	Each technique aims to extract the desired signal and separate it from the correlated noise based on different assumptions and algorithms.
## 2.	Generating Multiple Outputs:
-	Apply each trained model to the input mixture signal to obtain multiple sets of separated signals.
-	For example, ICA would provide one set of separated signals, Sparse Component Analysis would provide another set, and NMF would provide yet another set and Xgboost another set.
## 3.	Aggregation and Consensus:
-	Combine the outputs from the individual models to generate a consensus or aggregated output.
-	This can be done by averaging the separated signals or by using voting mechanisms to select the most consistent or reliable signals across the different models.
## 4.	Performance Evaluation:
-	Assess the quality of the aggregated output in terms of the separation performance, such as signal-to-noise ratio (SNR), correlation coefficients, or other appropriate metrics.
-	Validate the effectiveness of the ensemble approach by comparing it to the performance of individual models.
## 5.	Iterative Refinement :
-	If the aggregated output does not meet the desired quality, further refinement steps can be applied.
-	For example, the aggregated output can be used as input for additional iterations of the signal separation techniques to refine the separation results.



## RESULTS 
- Addressed data quality degradation in on-site Phasor Measurement Units (PMUs) due to anti-aliasing filters using
ICA, SPCA, and NMF algorithms.
- Engineered an ensemble stacking framework integrating the XgBoost algorithm to tackle colored noise interference,
Improving PMU measurement reliability to over 95% across different data types.
- Led research and implementation efforts, showcasing proficiency in advanced data analysis techniques and machine
learning algorithms for enhanced power system monitoring and control technologies.

 
