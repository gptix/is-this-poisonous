# Mushrooms are great.

For many reasons, one of which is a succulent, rich flavor.

# But, not all are edible.

By paying attention to the physical characteristics of a mushroom, we can decide whether we might eat it, or whether we should admire its beauty without taking a bite.

This one is easy:

![Picture of Destroying Angel](https://raw.githubusercontent.com/gptix/is-this-poisonous/master/destroying_angel.jpg)

<picture of destroying angel>

    • White cap
    • Smooth cap
    • White gills
    • White stalk
    • White collar

**VERY POISONOUS!** It is not called **‘Destroying Angel’** for nothing!

We should devise a way to use information available to predict whether a particular mushroom is poisonous or edible.

### Classfication vs. Regression

We would be making a **binary classification* ( **edible** or **poisonous**) of observed mushrooms.

A different device might do something like predict the sale price at a farmers' market of a crop of mushrooms. Unlike a **classification** of an observrtion into one of a set of separate alternatives, a **regression** outputs a value along some continuous range, such as a price within a range.

### Good Data

To build such a classifier, we could use some trusted data to build a function that indicates whether a mushroom should be treated as poisonous or edible.

I used a dataset named the **Mushroom Data Set** from the valuable **University of California Irvine Machine Learning Repository**, at https://archive.ics.uci.edu/ml/datasets/Mushroom.

### Foo

I imported the data into a Pandas dataframe.

### Baseline

To see whether a classifier model is particularly useful, we can establish a baseline by seeing how often we would be correct if we simply make the same 'guess' every time.

Using the data from the UCI Mushroom set, we will be right a little over 53% of the time if we 'guess' that every mushroom is **edible**.

### Should we try to be Accurate?

We should not try to be accurate.

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


**PLEASE NOTE:** This is work for studies I am doing at Lambda School, in the Data Science curriculum, cohort DS10 (go Laser Sharks!). I am not a mycologist.

**DO NOT USE THIS CLASSIFIER TO DECIDE WHETHER TO EAT ANY MUSHROOM.**

If you are interested in finding a variety of succulent mushrooms, and some inedible but fascinating mushrooms and other fungi, please join me at the Mushroom Club of Georgia (http://www.gamushroomclub.org).

To improve on this, I have fit a Random Forest model to a subset of the data, then validated the model using a separate subset. After a number of changes, I tested the model on a third, carefully segregated subset of the data.

My model could predict, using values for features of observations of mushrooms, correctly a little over xx percent of the time.

Code and documentation for my project is available at https://github.com/gptix/is-this-poisonous

* The dataset actually includes inedible mushrooms in the ‘poisonous’ category, although some mushrooms are neither edible nor poisonous.
