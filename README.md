# Reproducible research: version control and R

\# INSERT ANSWERS HERE #

Answers to Questions 1, 2 3: 

https://github.com/flamingobadger/logistic_growth

## Q4

### A
* The "random_walk" function in the script produces a dataframe containing x and y coordinates, and time steps. This is used to create data1 and data2 in the script, which are then plotted using the "ggplot" function.
* Below shows two random walks from data1 and data2 plotted next to each other.
* Despite having the same number of steps (500) at a fixed distance (h-0.25),  beginning at the same coordinates (0,0) and at time 0, the two plots show completely different patterns.
* This is because although both walks begin at the same origin, at each new (x,y) coordinate a step is taken in a direction given by a random angle between 0 and 360 degrees (2π), and this is repeated 500 times giving different pattern for each plot.
* Lines connecting each point in the path show a colour gradient from dark to light blue, as the colour of the line represents progression through time.

![image](https://github.com/user-attachments/assets/d838b4b1-f4e0-4dff-8817-6810a688c0c0)


### B
* A random seed is an initial value that is an identifier for a specific sequence of numbers generated by a random number generator (Henkemans & Lee, 2001).
* It can be used to create a sequence of numbers that appears random but is generated algorithmically.
* This makes code reproducible, as when someone runs your code, the random seed will ensure they obtain identical random outputs.

### C

* See the "random_walk.R" script.
* In order to edit the script to make a reproducible simulation of Brownian motion, I used "set.seed" to initialise the random number generator, and make sure that the same sequence of random numbers is drawn every time the code is run. This means the simulation can be repeated again exactly as it was before.
* I used different seeds (15 for data1 and 20 for data2) meaning that my simulations are distinct but reproducible.

### D

![image](https://github.com/user-attachments/assets/1bcc8b49-56e1-41c6-bd5e-7f2e735c9e39)

## Question 5

### A

13 columns and 33 rows

### B

I applied a log transformation in order to fit a linear model to the data. See "Q5_script.R" for the full code or below for the transformation.

```r
#log transforming the data, and creating a new dataset with log values
log_data <- virus_data %>%
  mutate(log_length = log(Genome.length..kb.)) %>%
  mutate(log_volume = log(Virion.volume..nm.nm.nm.))
```

### C

* My linear model in "Q5_script.R" gave an estimate of **1.5152** for the gradient (the exponent), and 7.0748 for the intercept (log(β)).
* My p-value for the intercept was **2.28e-10**, and my p-value for the slope was **6.44e-10**
* Both these p values are statistically significant
* Logarithmically back-transforming the intercept through exp(intercept) = exp(7.0748) which gives **1181.807** which is the scaling factor
* Meanwhile the authors of the paper found the exponent to be 1.52 and the scaling factor to be 1182. When rounded to the same number of significant figures, these are the same values that I obtained

### D

See "Q5_script.R". Here is my figure:

![image](https://github.com/user-attachments/assets/4bfe2596-5ced-41a5-83fc-5ef96bac1aab)
    
### E

* **$`V = \alpha L^{\beta}`$** (allometric equation)
* If L = 300, then therefore: V = 1181.807 * 3001.5152
* Estimated volume for a 300kb dsDNA virus is 6697005.925nm<sup>3</sup>

### Reference List

Henkemans, D & Lee, M. (2001). C++ Programming for the Absolute Beginner. Cengage Learning.

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers (also make sure that your username has been anonymised). All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

6) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
