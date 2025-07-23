#set heading(numbering: "1.")

= STAB52 Week 11 - Limit Theorems

== Definition.

Consider a sequence RVs $X_1, ..., X_n$. Then, their average is defined as

$
  macron(X)_n = 1/n (X_1 + ... + X_n)
$

== Example. The Mean of an Average

Let $X_1, ..., X_n$ be an independent sequence of RVs with common mean $mu$ and variance $sigma^2$. The mean of their average is given as:

$
  E(macron(X)_n) & = E(1/n (X_1 + ... X_n))                     \
                 & = 1/n (E(X_1) + ... E(X_n))                  \
                 & = 1/n underbrace((mu + ... + mu), n "times") \
                 & = 1/n n mu                                   \
                 & = mu
$

== Example. The Variance of an Average

Let $X_1, ..., X_n$ be an independent sequence of RVs with common mean $mu$ and variance $sigma^2$. The variance of their average is given as:

$
  V(macron(X)_n) & = V(1/n (X_1 + ... X_n)) \
  & = (1/n)^2 V(X_1 + ... X_n) \
  & = (1/n)^2 (V(X_1) + ... + V(X_n) + underbrace(sum_(i < j)"Cov"(X_i, X_j), = 0", by independence")) \
  & = (1/n)^2 underbrace((sigma^2 + ... + sigma^2), n "times") \
  & = (1/n)^2 n sigma^2 \
  & = sigma^2/n
$

== Theorem. Weak Law of Large Numbers

Let $X_1, ..., X_n$ be an independent sequence of RVs with common mean $mu$ and finite variance $sigma^2$. Then, their average "converges" to their common mean $mu$.

$
  forall epsilon > 0, "as" n arrow infinity, P(|macron(X)_n - mu| >= epsilon) arrow 0
$

The Weak Law of Large Numbers (WLLN) has important applications:

- In statistics, we can estimate the mean $mu = E(X)$ of an unknown distribution by averaging random values (a.k.a samples) $X_1, X_2, ...$

$
  macron(X)_n = 1/n sum_(i = 1)^n X_i arrow mu", as" n arrow infinity
$

- In simulation, we can approximate the probability of an event $A$ by repeating an experiment and counting the average number of times an event occurs

$
  macron(P)_n = 1/n sum_(i = 1)^n I_i (A) arrow P(A)", as" n arrow infinity
$

=== Proof. (of WLLN)

Let $epsilon > 0$ be arbitrary.

By Chebyshev's Inequality,

$
  P(|macron(X)_n - mu| >= epsilon) & <= sigma^2 / (epsilon^2 n)    \
                                   & <= (sigma^2 \/ epsilon^2) / n
$

Observe that as $n arrow infinity$, $(sigma^2 \/ epsilon^2) / n arrow 0$. Since $P(|macron(X)_n - mu| >= epsilon) >= 0$, by the squeeze theorem, we have $P(|macron(X)_n - mu| >= epsilon) arrow 0$, as needed. $qed$

== Example.

For $X_1, ..., X_n ~^("iid") "N"(0, 1)$, we have: $macron(X)_n ~ "N"(0, 1/n)$

== Example.

Consider two dependent RVs X1, X2 with mean 0 & variance 1, and apply Chebyshev’s inequality to their average when

+ RVs are perfectly positively correlated (i.e. $X_1 = X_2$)
+ RVs are perfectly negatively correlated (i.e. $X_1 = −X_2$)

=== Solution.

For 1.,

$
  V(macron(X)_2) & = V(1/2 (X_1 + X_2))                       \
                 & = 1/4 (V(X_1) + V(X_2) + 2"Cov"(X_1, X_2)) \
                 & = 1/4 (1 + 1 + 2 dot 1)                    \
                 & = 1
$

For 2.,

$
  V(macron(X)_2) & = V(1/2 (X_1 + X_2))                       \
                 & = 1/4 (V(X_1) + V(X_2) + 2"Cov"(X_1, X_2)) \
                 & = 1/4 (1 + 1 + 2 dot (-1))                 \
                 & = 0
$

== Definition.

Consider a sequence of continuous RVs $X_1, X_2, ...$ and RV $Y$. We say that $X_n$ converges in probability to $Y$, as $n arrow infinity$ (denoted $X_n attach(arrow, tr: P) Y$) if

$
  forall epsilon > 0, lim_(n arrow infinity) P(|X_n - Y| >= epsilon) = 0
$

== Definition.

Consider a sequence of continuous RVs $X_1, X_2, ...$ and RV $Y$. We say that $X_n$ converges in distribution to $Y$, as $n arrow infinity$ (denoted $X_n attach(arrow, tr: D) Y$) if

$
  forall x in RR, lim_(x arrow infinity) P(X_n <= x) = P(Y <= x)
$

== Definition.

Consider a sequence of independent RVs $X_1, ..., X_n$ with common mean $mu$ and variance $sigma^2$. Then, their standardized average is defined as:

$
  Z_n = ((macron(X)_n - mu) / (sigma \/ sqrt(n))) = sqrt(n) ((macron(X)_n - mu) / sigma)
$
