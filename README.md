# Movie Revenue and Production Cost Analysis

This project applies econometric techniques to analyze how **production budgets** and **audience scores** influence **box office revenues** using a dataset of 250 movies. The analysis combines **descriptive statistics, hypothesis testing, and regression modelling** to generate insights relevant to business investment decisions in the movie industry.

---

## 1. Dataset Description

The dataset `movie_data.csv` contains information on 250 movies worldwide, with the following variables:

| Variable | Description |
|----------|-------------|
| **box_office_revenue** | Total revenue generated at theaters (in millions of dollars). |
| **movie_budget** | Production budget for the movie (in millions of dollars). |
| **audience_score** | Average audience rating on Rotten Tomatoes (0–100 scale). |

The primary objective is to understand whether **higher production budgets** and **better audience reception** translate into higher box office revenue.

---

## 2. Project Overview

The analysis is designed to answer the following questions:

1. **How are movie revenue, production budgets, and audience scores distributed?**  
   - What are their means, medians, and variability?
2. **Do higher budgets consistently lead to higher revenues?**  
   - Does the effect differ for high-budget and low-budget films?
3. **How important is audience reception compared to budget in determining revenue?**
4. **If a studio has an extra $1 million to invest, should it go to a high-budget or low-budget movie?**

The study applies:
- **Descriptive statistics and confidence intervals**  
- **Density estimation and skewness analysis**  
- **Difference-in-means hypothesis testing**  
- **Single and multiple linear regression modelling**

---

## 3. Key Methods

- **Software:** R (all scripts included in this repository).  
- **Statistical techniques:**  
  - Summary statistics and confidence intervals  
  - Hypothesis testing for difference in means  
  - Ordinary Least Squares (OLS) regression  
  - Subsample analysis for high-budget vs low-budget films

---

## 4. Main Findings

### 4.1 Descriptive Statistics

| Variable | Mean | Median | Std. Dev. | IQR | Skewness |
|----------|------|--------|-----------|-----|----------|
| **Box Office Revenue** | $201.96m | $187.05m | $137.08m | $226.00m | **Positive** |
| **Movie Budget** | $81.00m | $84.77m | $35.28m | $47.28m | **Slightly Negative** |
| **Audience Score** | 64.02/100 | 62.99/100 | 16.69 | 24.61 | **Positive** |

**Interpretation:**  
- Movie revenues are **right-skewed** because while many movies earn moderate revenues, blockbusters generate disproportionately high earnings.  
- Budgets are slightly **left-skewed**, as a few very low-budget films pull the mean below the median.  
- Audience scores are moderately **right-skewed**, as most films cluster around mid-to-high ratings.

---

### 4.2 High-Budget vs Low-Budget Films

- **Mean revenue (High budget):** $235.7m  
- **Mean revenue (Low budget):** $168.2m  
- **Difference:** $67.5m (**40% higher revenue for high-budget films**)  
- **Statistical test:** p-value < 0.001 → significant difference.

**Economic Insight:** High-budget films likely invest in **recognizable actors, better production quality, and marketing**, increasing reach and revenue.

---

### 4.3 Regression Analysis

#### **Single Regressions**

| Regression | β1 (slope) | Interpretation |
|------------|------------|---------------|
| **Box Office vs Budget** | **1.30** | Each additional $1m in budget predicts ~$1.30m extra revenue. |
| **Box Office vs Audience Score** | **2.45** | Each additional 1-point audience score predicts ~$2.45m extra revenue. |

Both slopes are significant at the 5% level.

#### **Multiple Regression (Budget + Audience Score)**

| Variable | Coefficient | Significance |
|----------|-------------|--------------|
| **Movie Budget** | **0.94** | p < 0.01 |
| **Audience Score** | **1.26** | p < 0.05 |

The budget coefficient drops from **1.30 → 0.94** after adding audience score, indicating **omitted variable bias** in the single regression (high-budget films also tend to have higher audience scores).

---

### 4.4 Investment Decision

Using multiple regressions for **separate subsamples**:

| Subsample | β1 (Budget) | Interpretation |
|-----------|-------------|----------------|
| **Low-Budget Films** | 0.89 | Each extra $1m → ~$0.89m additional revenue (**not profitable**) |
| **High-Budget Films** | 1.52 | Each extra $1m → ~$1.52m additional revenue (**profitable**) |

**Recommendation:** Allocate additional funds to **high-budget films**, as they yield a higher return on investment.

---

## 5. Files in Repository

- **`movie_data.csv`** – Dataset used for analysis.  
- **`analysis.R`** – R script containing all statistical analysis and plots.  
- **`report.pdf`** – Full analytical report with detailed tables, regression outputs, and plots.  
- **`README.md`** – Project overview and key findings.

---

## 6. Conclusion

This study demonstrates that **movie budgets and audience scores are strong predictors of revenue**, with high-budget films achieving significantly higher box office performance. For studios with limited additional funding, investing in high-budget films provides a greater expected return compared to allocating funds to low-budget films.

---

*Author: [Your Name]*  
*Date: [Submission Date]*  
*Course: [Course Name]*  
