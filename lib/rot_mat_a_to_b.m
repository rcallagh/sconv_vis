function R = rot_mat_a_to_b(a, b)
%Returns the rotation matrix to take vector a to align with vector b
a_norm = a/norm(a);
b_norm = b/norm(b);
c = dot(a_norm, b_norm);

mat = skew_sym_cross_product(a, b);

R = eye(3);
R = R +  mat + mat * mat * (1 / (1 + c + eps));
