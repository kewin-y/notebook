#set heading(numbering: "1.")

= STAB52 Week 10

== Definition.

The $r$th moment of an RV $X$ is defined as $E(X^r)$. In particular, the 1st moment is the mean: $E(X) = mu_x$.

== Definition.

The $r$th central moment of an RV $X$ is defined as $E[(X - mu_x)^r]$. In particular, the 2nd central moment is the variance: $E[(X - mu_x)^2] = V(X) = sigma_X^2$.

The moments of a RV $X$ describe its different properties. For example:

- The 1st moment (mean) describes the center of an RV
- The 1st central moment (variance) describes the spread of an RV
- The 3rd central moment (skewness) describes the asymmetry of an RV
  - If a distribution is symmetrical, then its skewness is zero. Note that the converse is not necessarily true
- The 4th central moment (kurtosis) describes the tail behavour of an RV

== Definition.

The moment generating function (MGF) of RV $X$ is given by: $ m(t) = E(e^(t X)) $

== Theorem.

The MGF allows for calculation for all moments of X: $ E(X^k) = m^((k))(0) = lr(d^k/(d t^k) m(t)|)_(t=0) $

=== Naive Proof/Intuition.

We have:

$
  m(t) &= E(e^(t X)) \
  &= integral_(-infinity)^infinity e^(t X) f_X (x)d x \
  &= integral_(-infinity)^infinity sum_(i = 0)^(infinity) (t^i x^i) / i! f_X (x)d x", note: this step is permissible only in certain conditions"\
  &= sum_(i = 0)^(infinity) integral_(-infinity)^infinity (t^i x^i) / i! f_X (x)d x \
  &= sum_(i = 0)^(infinity) t^i / i! integral_(-infinity)^infinity x^i f_X (x)d x \
  &= sum_(i = 0)^(infinity) t^i/i! mu_i", where "mu_i" is the "i"th moment"
$

Notice that $m^((k))(0) = mu_k$, for all $k$.

== Example

Find the MGF of $X ~ "Exponential"(lambda)$ and verify that $E(X) = 1\/lambda$.

=== Solution.

We have:

$
  m(t) &= E[e^(t X)] \
  &= integral_(-infinity)^(infinity)e^(t x) f_X(x) d x \
  &= integral_(-infinity)^(infinity)e^(t x) lambda e^(-lambda x) d x \
  &= integral_(-infinity)^(infinity)lambda e^(-(lambda - t) x) d x \
  &= lambda / (lambda - t)integral_(-infinity)^(infinity)(lambda - t)e^(-(lambda - t) x) d x \
  &= lambda / (lambda - t)", for "t < lambda
$

Then,

$
  m'(0) & = lr(d / (d t) lambda / (lambda - t)|)_(t = 0) \
        & = lr(lambda / (lambda - t)^2|)_(t = 0)         \
        & = 1 / lambda,
$

which is what we wanted to verify.

== Theorem. Unique Characterization of MGF

For RVs $X, Y$ with MGFs $m_X (t), m_Y (t)$,

$
  m_X (t) = m_Y (t) <=> X ~ Y
$

where $X ~ Y$ stands for "$X$ is distributed the same as $Y$".

== Theorem. MGF Method

Let $Y = a_1 X_1 + a_2 X_2 + ... + a_n X_n$, where $X_1, X_2, ... X_n$ are independent with MGF $m_X_i, forall i = 1, 2, ..., n$. Then, $m_Y (t) = product_(i = 1)^n m_X_i (a_i t)$

=== Proof.

We have:
$
  m_Y (t) & = E[e^(t Y)]                                            \
          & = E[e^(t (a_1 X_1 + a_2 X_2 + ... + a_n X_n))]          \
          & = E[product_(i = 1)^n e^(t a_i X_i)]                    \
          & = product_(i = 1)^n E[e^(t a_i X_i)]", by independence" \
          & = product_(i = 1)^n m_X_i (a_i t)", by definition,"
$

As wanted. $qed$

== Example.

Find the MGF of the $"Gamma"(n, lambda)$ distribution.

=== Solution.

Let $Y ~ "Gamma"(n, lambda)$. We need to find $m_Y (t)$. By definition,

$
  m_Y (t) &= E[e^(t Y)] \
  &= integral_(-infinity)^(infinity) e^(t y) f_Y (y) d y \
  &= integral_(0)^(infinity) e^(t y) lambda^n / Gamma(n) y^(n - 1) e^(-lambda y)d y \
  &= lambda^n / Gamma(n) integral_(0)^(infinity) e^(t y) y^(n - 1) e^(-lambda y)d y \
  &= lambda^n / Gamma(n) integral_(0)^(infinity) y^(n - 1) e^(-y (lambda - t))d y \
  &= lambda^n / Gamma(n) integral_(0)^(infinity) (u / (lambda - t) )^(n-1) e^u (d u) / (lambda - t)", substituing "u = (lambda - t)y"" \
  &= lambda^n / (Gamma(n) (lambda - t)^n) integral_(0)^(infinity) u^(n - 1) e^u d u", by definition of the Gamma function" \
  &= (lambda^n Gamma(n)) / (Gamma(n) (lambda - t)^n) \
  &= (lambda / (lambda - t))^n \
  &= ((lambda - t) / lambda)^(-n) \
  &= (1 - t / lambda)^(-n)", for "t < lambda \
$

== Example.

For i.i.d. $"Exponential"(lambda)$ RVs $X_1, ..., X_n$, verify that $Y = X_1+...+X_n$ follows $"Gamma"(n, lambda)$.

=== Proof.

Note that $m(t) = lambda / (lambda - t)$ is the MGF for each $X_1, ..., X_n$.

By the MGF method,

$
  m_Y (t) & = product_(i = 1)^n m(t)    \
          & = m(t)^n                    \
          & = (lambda / (lambda - t))^n \
$

Notice that the MGF for a Gamma-distributed RV $Z~"Gamma"(n, lambda)$ is $m_Z (t) = (lambda / (lambda - t))^n$. Thus, $Y ~ Z$. i.e., $Y ~ "Gamma"(n, lambda)$. $qed$


== Theorem. Markov Inequality

For any nonnegative RV $X >= 0$, the right tail-end probability is bounded by the mean: $ P(X >= a) <= E(X) / a $

=== Proof. (Continuous Case)

We have

$
  E(X) &= integral_(-infinity)^(infinity) x f_X (x) d x \
  &= integral_(0)^(infinity) x f_X (x) d x", since "X >= 0 \
  &= integral_(0)^(a) x f_X (x) d x + integral_(a)^(infinity) x f_X (x) d x \
  &>= 0 + a integral_(a)^(infinity) x f_X (x) d x \
  &= a P(X >= a) \
  => P(X >= a) &<= E(X) / a", "
$

as wanted. $qed$

== Example.

Your commute time $X$ has a mean of 30min and a standard deviation of 4min. Find a bound for the probability that your commute takes more than 1hr.

=== Solution.

By the Markov Inequality,

$ P(X >= 60) <= E(X) / 60 = 30 / 60 = 1/2, $

so the probability of the commute taking more than 1 hour is less than or equal to 50%.

Intuitively, this can be thought of the probability of taking more than 1 hour in the worst-case scenario (i.e., the probability given the worst-case probability distribution).

== Theorem. Chebyshev Inequality

For any RV $X$, the probability of both tail-ends is bounded by the variance:

$ P(|X - mu| >= a) <= V(X) / a^2 $

=== Proof.

We apply Markov's Inequality to the following transformation: $g(X) = (X - mu)^2 >= 0$. Thus,

$
            P(g(X) >= a^2) & <= E((X - mu)^2) / a^2 \
  <=> P((X - mu)^2 >= a^2) & <= E((X - mu)^2) / a^2 \
      <=> P(|X - mu| >= a) & <= E((X - mu)^2) / a^2 \
                           & = V(X) / a^2,
$

as wanted. $qed$

== Example.

Your commute time X has a mean of 30min and a standard deviation of 4min. Find a bound for the probability that your commute takes more than 1hr.

=== Solution.

By the Chebyshev Inequality,

$
  P(X >= 60) & <= P({X >= 60} union {X <= 0}) \
             & = P(|X - 30| >= 30)            \
             & <= (4 / 30)^2                  \
             & approx 1.77%
$

== Theorem. Jensen Inequality

For any RV $X$ and function $g$, we have:

$
  cases(
    E(g(X)) >= g(E(X))", if "g" is convex (concave up)",
    E(g(X)) <= g(E(X))", if "g" is concave (concave down)",
  )
$

And equality if and only if $g$ is a linear function.

== Example.

For RV $X$, find relationship of $E(X)$ to $E(X^2)$

=== Solution.

Take $g(x) = x^2$ and observe $g(X) = X^2$. Note that $g$ is concave up. By Jensen's Inequality,

$
               E(X^2) & >= E(X)^2 \
  <=> E(X^2) - E(X)^2 & >= 0      \
             <=> V(X) & >= 0
$

== Theorem. Cauchy-Schwarz Inequality

For any RVs $X, Y$, the expectation of their product is bounded by the geometric average of their 2nd moments. That is,

$ |E(X Y)| <= sqrt(E(X^2)E(Y^2)) $

== Corollary.

By applying the Cauchy-Schwarz Inequality to RVs $(X - mu_X)^2$ and $(Y - mu_Y)^2$, we can see that:

$ |"Cov"(X, Y)| <= sqrt(V(X)V(Y)), $

== Example.

A machine produces rectangles with random (possibly dependent) sides that follow $"Uniform"(0,1)$ marginal distributions. Find an upper bound on the expected area of the rectangles.

=== Solution.

Let $X, Y ~ "Uniform"(0, 1)$ be the length and width of the rectangle respectively. Note that the area is given by RV $X Y$. Thus,

$
   |E(X Y)| & <= sqrt(E(X^2)E(Y^2))                                            \
            & = sqrt(1/3 dot 1/3)                                              \
            & = 1/3                                                            \
  => E(X Y) & <= 1/3", since "E(X Y) >= 0" i.e., the area must be nonnegative"
$
