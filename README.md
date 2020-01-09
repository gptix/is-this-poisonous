---
layout: page
title: Mushrooms are Great!
subtitle: Some are Poisonous!
---
# Mushrooms are great.

For many reasons, one of which is a succulent, rich flavor.

# But, not all are edible.

Some will make you feel queasy. Some will kill you by severely damaging your internal organs.

By paying attention to the physical characteristics of a mushroom, we can decide whether we might eat it, or whether we should admire its beauty without taking a bite.

This one is easy:

![Picture of Destroying Angel](https://raw.githubusercontent.com/gptix/is-this-poisonous/master/destroying_angel.jpg)

    • White cap
    • Smooth cap
    • White gills
    • White stalk
    • White collar

**VERY POISONOUS!** It is not called **‘Destroying Angel’** for nothing!

# The General Idea

We should make a way to predict whether a particular mushroom is poisonous or edible.

## Classfication vs. Regression

We would be making a **binary classification** ( **edible** or **poisonous**) of observed mushrooms.

A different tool might do something like predict the sale price at a farmers' market of a crop of mushrooms. Unlike a **classification** of an observation into one of a set of separate alternatives, a **regression** outputs a value along some continuous range, like a price.

## Good Data

To build such a classifier, we could use some trusted data to build a function that indicates whether a mushroom should be treated as poisonous or edible.

I used a dataset named the **Mushroom Data Set** from the valuable **University of California Irvine Machine Learning Repository**, at [https://archive.ics.uci.edu/ml/datasets/Mushroom](https://archive.ics.uci.edu/ml/datasets/Mushroom).

## Workflow

My work on this is available on github, at [https://github.com/gptix/is-this-poisonous](https://github.com/gptix/is-this-poisonous)

## Get Data

I downloaded data from UCI, then imported it into a Pandas dataframe, and did some initial checking of the data.  This dataset is very well structured and documented.

I then split the data into the target (poisonousness) and features (the facts noticed, used to predict toxicity).

I also split the data into three sets: one for training models, one for validating trained models, and a third for final testing after validaation.

## Baseline

To see whether a classifier (or regression)  model is particularly useful, we can establish a baseline by seeing how often we would be correct if we simply make the same 'guess' every time.

Using the data from the UCI Mushroom set, we will be right a little over 53% of the time if we 'guess' that every mushroom is **edible**.

Here is a histogram showing the split of **edible** vs. **poisonous** in the dataset.

![Histogram of edible vs. poisonous](https://raw.githubusercontent.com/gptix/gptix.github.io/master/histogram.png)

## Different Models

### Linear Regression

I built a linear regression model using SciKit Learn's sklearn.LinearRegression. I got a validation accuracy of a little over 96%, a marked improvement over guessing.

### Decision Tree

I built a decision tree classifier using SciKit Learn's sklearn.DecisionTreeClassifier. I got a validation accuracy of almost 99%.  Big if true.

Here is the tree:

![Deision Tree diagram](https://raw.githubusercontent.com/gptix/gptix.github.io/master/tree.png)

### Should we try to be Accurate?

We should **not** try to be accurate.

**Accuracy** is a measure of the fraction of all measurements (or predictions, or classifications) that we get right. With our classifier, this would be 

('we guess poisonous and it's poisonous' + 'we guess edible and it's edible')

divided by 

all guesses.

But, I want to make really sure I identify **every** poisonous mushroom, even if this entails mis-classifying some edible mushrooms as poisonous.

**Recall** is a metric to use for this. it would be 

('we predicted poisonous') 

divided by

('really is poisonous' - which is the same as ['guessed poisonous correctly' plus 'guessed edible **incorrectly**']).

I want this really close to one.

So, **recall** is our choice of metric.

### Recall Scores on Decision Tree

I got a recall score, on my **validation set**, of **99.5%**. Finally, I calculated the recall score on my (reserved) **test** set of **98.8%**.

Both of these scores are good, but I have further work to do, like trying different models to see if they get better recall scores. I am also interested in why my recall score using test data is lower than using my validation data. Perhaps this is not significant.

# **PLEASE NOTE:** 

This is work for studies I am doing at Lambda School, in the Data Science curriculum, cohort DS10 (*go* **Laser Sharks** *!* ). 

**I am not a mycologist.**

**DO NOT USE THIS CLASSIFIER TO DECIDE WHETHER TO EAT ANY MUSHROOM.**

If you are interested in finding a variety of succulent mushrooms, and some inedible but fascinating mushrooms and other fungi, please join me at the [Mushroom Club of Georgia](http://www.gamushroomclub.org).

* The dataset actually includes inedible mushrooms in the ‘poisonous’ category, although some mushrooms are neither edible nor poisonous.
