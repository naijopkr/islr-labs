1. Describe the null hypotheses to which the p-values given in Table 3.4 correspond.Explain what conclusions you can draw based on these p-values. Your explanation should be phrased in terms of sales , TV , radio , and newspaper , rather than in terms of the coefficients of the linear model.

    > The null hypothesis is based on the premise that there is no relationship between two variables. In terms of sales, TV, radio and newspaper. The null hypothesis states that the changes on advertising budget would not have any impact on the sales.

1. Carefully explain the differences between the KNN classifier and KNN
regression methods.
    > The **KNN regression** is closely related with the KNN classifier. Given a value for K and a prediction point x&#8320;, KNN regression first identifies the K training observations that are closest to x&#8320;, represented by N&#8320;, the value predict to x&#8320; is the mean of the sum of N&#8320;. On the other hand, **KNN Classifier** predict the class of a target point based on the majority class of the K closest training observations.

1. Suppose we have a data set with five predictors:

    | Predictor | Description |
    |:---:|---|
    | X&#8321; | GPA |
    | X&#8322; | IQ |
    | X&#8323; | Gender (1 for Female and 0 for Male) |
    | X&#8324; | Interaction between GPA and IQ |
    | X&#8325; | Interaction between GPA and Gender |

    The response is starting salary after graduation (in thousands of dollars).

    Suppose we use least squares to fit the model, and get

    | Coefficient | Value |
    | :---: | --- |
    | β̂&#8320; | 50 |
    | β̂&#8321; | 20 |
    | β̂&#8322;| 0.07 |
    | β̂&#8323; | 35 |
    | β̂&#8324; | 0.01 |
    | β̂&#8325; | −10 |

    **Part a)** Which answer is correct, and why?
    > (iii) For a fixed value of IQ and GPA, males earn more on average than females provided that the GPA is high enough.

    **Part b)** Predict the salary of a female with IQ of 110 and a GPA of 4.0.
    > y = 50 + 20\*4 + 0.07\*110 + 35 + 0.01\*4.0\*110 - 10*4
    = 50 + 80 + 7.7 + 35 + 4.4 - 40 = **137.1**

    **Part c)** True or false: Since the coefficient for the GPA/IQ interaction term is very small, there is very little evidence of an interaction effect. Justify your answer.
    > False, a small coefficient does not show us nothing about interaction effect, it should be evaluated the p-value for the coefficient. If the p-value is low enough it suggests that there is a impact of the relation in the model and that the interaction term should be in the model. A small coefficient may indicate simply that the scale of IQ is large compared to the response scale.

1. I collect a set of data (n = 100 observations) containing a single predictor and a quantitative response. I then fit a linear regression model to the data, as well as a separate cubic regression, i.e. **Y = β&#8320; + β&#8321;X + β&#8322;X² + β&#8323;X³ + &#120576;.**

    **Part a)** Suppose that the true relationship between X and Y is linear, i.e. **Y = β&#8320; + β&#8321;X + &#120576;.** Consider the training residual sum of squares (RSS) for the linear regression, and also the training RSS for the cubic regression. Would we expect one to be lower than the other, would we expect them to be the same, or is there not enough information to tell? Justify your answer.

    > We would expect the RSS to be lower for the cubic regression, that happens because as we add more predictors the RSS decrease for the training data.

    **Part b)** Answer **Part a** using test rather than training.

    > Using the extra predictor should lead us to overfit the data, hence we should expect a higher RSS for the test.

    **Part c)** Suppose that the true relationship between X and Y is not linear, but we don’t know how far it is from linear. Consider the training RSS for the linear regression, and also the training RSS for the cubic regression. Would we expect one to be lower than the other, would we expect them to be the same, or is there not enough information to tell? Justify your answer.

    > The RSS for the cubic regression is more likely to lower than the RSS for the linear regression, because adding predictor tend to low the training the RSS.

    **Part d)** Answer **Part c** using test rather than training RSS.

    > We should expect a lower RSS as the cubic regression will fit the model better if the true relationship is not linear.

1. Consider the fitted values that result from performing linear regression without an intercept. In this setting, the ith fitted value takes the form

    > &#375;&#7522; = x&#7522;β,

    where

    > β = &#8721;x&#7522;y&#7522; / &#8721;x²&#7522;

    Show that we can write

    > &#375;&#7522; = &#8721;a&#7522;y&#7522;,

    What is a&#7522;?

    > See file ex_05.png

1. Using (3.4), argue that in the case of simple linear regression, the least squares line always passes through the point (x̄, ȳ).

    > When x&#7522; = x̄ and y&#7522; = ȳ, β&#8321; = 0 and β&#8320; = ȳ

1. It is claimed in the text that in the case of simple linear regression of Y onto X, the R 2 statistic (3.17) is equal to the square of the correlation between X and Y (3.18). Prove that this is the case. For simplicity, you may assume that x̄ = ȳ = 0.

    > See file ex_07.png
