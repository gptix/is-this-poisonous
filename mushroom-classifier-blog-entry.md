# Mushrooms are great.

For many reasons, one of which is a succulent, rich flavor.

# But, not all are edible.

By paying attention to the physical characteristics of a mushroom, we can decide whether we might eat it, or whether we should admire its beauty without taking a bite.

This one is easy:

<picture of destroying angel>

    • White cap
    • Smooth cap
    • White gills
    • White stalk
    • White collar

**VERY POISONOUS!** It is not called **‘Destroying Angel’** for nothing!

Deciding whether a mushroom is edible or poisonous is an example of ‘classification’. We assign an object to exactly one of some number of categories.  In this case, the categories are ‘edible’ and ‘poisonous’.  Given an ‘observation’, we note values of ‘features’, and decide how to classify the object of observation.

Another type of prediction we could do is ‘regression’, where we might try to predict or decide a value, from a continuous range of values, for a certain aspect of the object. For mushrooms, we might decide or predict a price per pound, given our observation.

I have created a classifier that predicts whether a mushroom is poisonous based on ‘features’ of the mushroom.

**PLEASE NOTE:** This is work for studies I am doing at Lambda School, in the Data Science curriculum, cohort DS10 (go Laser Sharks!). I am not a mycologist.

**DO NOT USE THIS CLASSIFIER TO DECIDE WHETHER TO EAT ANY MUSHROOM.**

If you are interested in finding a variety of succulent mushrooms, and some inedible but fascinating mushrooms and other fungi, please join me at the Mushroom Club of Georgia (http://www.gamushroomclub.org).

I used a dataset named the Mushroom Data Set from the valuable University of California Irvine Machine Learning Repository, at https://archive.ics.uci.edu/ml/datasets/Mushroom.

After importing the dataset into Pandas, I determined that, as a baseline, simply guessing ‘edible’ for a mushroom* would be correct a little over 53% of the time.

To improve on this, I have fit a Random Forest model to a subset of the data, then validated the model using a separate subset. After a number of changes, I tested the model on a third, carefully segregated subset of the data.

My model could predict, using values for features of observations of mushrooms, correctly a little over xx percent of the time.

Code and documentation for my project is available at https://github.com/gptix/is-this-poisonous

* The dataset actually includes inedible mushrooms in the ‘poisonous’ category, although some mushrooms are neither edible nor poisonous.
