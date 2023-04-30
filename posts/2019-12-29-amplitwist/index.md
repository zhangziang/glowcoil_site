+++
title = "The amplitwist, the conjugate transpose, and the complex derivative"
date = "2019-12-29"
+++

Complex numbers have a representation as \(2 \times 2\) matrices, which can serve to illuminate some initially non-obvious aspects of how they work. A real number \(a\) can be represented as a multiple of the identity matrix:

\[ aI = \begin{bmatrix} a & 0 \\ 0 & a \end{bmatrix} \]

with addition and multiplication given by the corresponding matrix operations. In order to extend this representation to the complex numbers, we need a matrix \(J\) such that \(J^2 = -I\):

\[ \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix}^2 = \begin{bmatrix} -1 & 0 \\ 0 & -1 \end{bmatrix} \]

We can thus represent any complex number \(a+bi\) as:

\[ aI+bJ = \begin{bmatrix} a & -b \\ b & a \end{bmatrix} \]

It can be verified that addition and multiplication of these matrices is equivalent to addition and multiplication of the complex numbers they represent (meaning that matrices of this form comprise a field isomorphic to \(\mathbb{C}\)).

<!--excerpt-->

# The amplitwist

Just as any complex number \(a+bi\) can be written in polar form \(re^{i\theta}\), a matrix of the above form can be written as a scaled rotation (or an “amplitwist,” as Tristan Needham refers to it in [*Visual Complex Analysis*](http://usf.usfca.edu/vca/)):

\[ \begin{bmatrix} a & -b \\ b & a \end{bmatrix} = r \begin{bmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{bmatrix} \]

(This is a special case of the more general [polar decomposition](https://en.wikipedia.org/wiki/Polar_decomposition) for matrices, by which a square matrix can be written as the product of a symmetric positive-definite matrix and an orthogonal matrix.)

In fact, these matrices act on vectors in the plane in the same way that complex numbers act on one another: by scaling and rotation. So, we can look at complex multiplication as a particular binary operation on vectors in \(\mathbb{R}^2\), or we can look at it as standard matrix multiplication on a particular class of matrices in \(\mathbb{R}^{2 \times 2}\), *or* we can look at it as multiplication of vectors in \(\mathbb{R}^2\) by that particular class of matrices.

# The conjugate transpose

When moving from \(\mathbb{R}\) to \(\mathbb{C}\), the proper generalizations of many constructions from linear algebra involve the complex conjugate \( \overline{a + bi} = a - bi \) and the conjugate transpose \( X^* = \overline{X}^\mathsf{T} \):

- The real inner product \( \langle u, v \rangle = u^\mathsf{T} v \) generalizes to the complex inner product \( \langle u, v \rangle = u^* v \)
- Symmetric matrices \(A = A^\mathsf{T}\) generalize to Hermitian matrices \(A = A^*\)
- Orthogonal matrices \(A^{-1} = A^\mathsf{T}\) generalize to unitary matrices \(A^{-1} = A^*\)

and so on. There are various explanations for this. One that I am fond of involves replacing the individual complex elements in a matrix or vector with their \(2 \times 2\) matrix representations, turning a complex column vector into a \( 2n \times 2 \) real block matrix:

\[ \begin{bmatrix} a+bi \\ \vdots \\ c+di \end{bmatrix}

\Rightarrow

\begin{bmatrix} a & -b \\ b & a \\ \vdots & \vdots \\ c & -d \\ d & c \end{bmatrix}
\]

and a complex matrix into a \( 2m \times 2n \) real block matrix:

\[ \begin{bmatrix} a+bi & \cdots & c+di \\ \vdots & \ddots & \vdots \\ e+fi & \cdots & g+hi \end{bmatrix} \]

\[ \Downarrow \]

\[
\begin{bmatrix}
    a & -b & \cdots & c & -d \\
    b & a & \cdots & d & c \\
    \vdots & \vdots & \ddots & \vdots & \vdots \\
    e & -f & \cdots & g & -h \\
    f & e & \cdots & h & g \end{bmatrix}

\]

Since the transpose of an individual \( 2 \times 2 \) block

\[ \begin{bmatrix} a & -b \\ b & a \end{bmatrix}^\mathsf{T} = \begin{bmatrix} a & b \\ -b & a \end{bmatrix} \]

corresponds to the conjugate of the original complex number, the original notions of inner product, symmetric matrix, orthogonal matrix, and so on give the same results over these block matrices as their complex generalizations do over complex vectors and matrices.

# The complex derivative

A complex function \(\mathbb{C} \to \mathbb{C}\) can be looked at as a function \(\mathbb{R}^2 \to \mathbb{R}^2\). The conditions for continuity are the same. However, the conditions for differentiability are different.

The derivative of a real function \(f(x,y) = (u(x,y), v(x,y))\) at a point \((x, y)\) is the linear function \(\mathbb{R}^2 \to \mathbb{R}^2\) which best locally approximates \(f\) at that point. It can be written as the \(2 \times 2\) Jacobian matrix of \(f\)'s partial derivatives:

\[ df_{(x,y)} = \begin{bmatrix}
    \dfrac{\partial u}{\partial x} & \dfrac{\partial u}{\partial y} \\
    \dfrac{\partial v}{\partial x} & \dfrac{\partial v}{\partial y}
\end{bmatrix} \]

All that is necessary for such a function to be differentiable is for each of these partial derivatives to exist. If \(f\) is instead considered as a complex function \(f(x + yi) = u(x,y) + v(x,y)i\), its derivative at a point \(z = x + yi\) should again be the best local linear approximation, but this time it should be a linear function \(\mathbb{C} \to \mathbb{C}\) of a single complex variable, meaning that it can be expressed as a single complex number to be multiplied by its argument.

Which \(2 \times 2\) Jacobian matrices can we pack into a single complex number? In other words, which \(2 \times 2\) real matrices act on a vector in \(\mathbb{R}^2\) the way complex numbers act on one other? We discovered this above: they are the matrices of the form

\[ \begin{bmatrix} a & -b \\ b & a \end{bmatrix} \]

i.e. scaled rotation matrices or amplitwists. So a function \(f(x + yi) = u(x,y) + v(x,y)i\) is differentiable if and only if the following conditions hold:

\[ \dfrac{\partial u}{\partial x} = \dfrac{\partial v}{\partial y} \]

\[ \dfrac{\partial u}{\partial y} = -\dfrac{\partial v}{\partial x} \]

These are known as the Cauchy-Riemann equations.

Functions with this property are known as holomorphic. This turns out to be a much stronger condition than differentiability over \(\mathbb{R}^2\), with correspondingly much stronger implications:

- Holomorphic functions are [analytic](https://en.wikipedia.org/wiki/Analytic_function), i.e. they are everywhere locally equal to their Taylor series
- Both the real and imaginary parts of a holomorphic function are [harmonic](https://en.wikipedia.org/wiki/Harmonic_function"), i.e. their Laplacian vanishes everywhere
- A holomorphic function is [conformal](https://en.wikipedia.org/wiki/Conformal_map), i.e. it locally preserves angles, as long as its derivative is nonzero everywhere
