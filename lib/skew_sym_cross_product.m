function ssm = skew_sym_cross_product(a, b)
%skew symmetric cross product to calculate rotation from a to b

a_norm = a/norm(a);
b_norm = b/norm(b);
v = cross(a_norm, b_norm);
ssm = eye(3);
ssm(1,1) = 0;
ssm(1,2) = -v(3);
ssm(1,3) = v(2);
ssm(2,1) = v(3);
ssm(2,2) = 0;
ssm(2,3) = -v(1);
ssm(3,1) = -v(2);
ssm(3,2) = v(1);
ssm(3,3) = 0;
