singular_val_decomposition <- svd(A)

#output - The output $d gives the diagonal entries
singular_val_decomposition$d # 3.4142136 2.0000000 0.5857864

#output - Each column of $u gives the left singular vectors
singular_val_decomposition$u
#           [,1]          [,2]      [,3]
#[1,] -0.5000000 -7.071068e-01 0.5000000
#[2,]  0.7071068 -1.665335e-16 0.7071068
#[3,] -0.5000000  7.071068e-01 0.5000000

#output - Each column of $v gives the right singular vectors.
singular_val_decomposition$v
#           [,1]          [,2]      [,3]
#[1,] -0.5000000 -7.071068e-01 0.5000000
#[2,]  0.7071068  1.110223e-16 0.7071068
#[3,] -0.5000000  7.071068e-01 0.5000000
