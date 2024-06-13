X_Tag3 = Tag3_2x_1y.simout.transform.translation.y.Data;
Y_Tag3 = Tag3_2x_1y.simout.transform.translation.x.Data;
Z_Tag3 = Tag3_2x_1y.simout.transform.translation.z.Data;

X_mean = mean(X_Tag3);
Y_mean = mean(Y_Tag3);
Z_mean = mean(Z_Tag3);

A_Tag3 = [X_Tag3 , Y_Tag3 , Z_Tag3];
B = [1.5 ; 1.5 ; 2.57];
A_Tag3_mean = [X_mean ; Y_mean ; Z_mean];
norm(A_Tag3_mean);

% lq = lsqr(A_Tag3_mean, B)
% Real_P = A_Tag3_mean * lq

x_rot = mean(Tag3_2x_1y.simout.transform.rotation.x.Data);
y_rot = mean(Tag3_2x_1y.simout.transform.rotation.y.Data);
z_rot = mean(Tag3_2x_1y.simout.transform.rotation.z.Data);

X_rotated = [1, 0 , 0 ; 0, cos(x_rot), -sin(x_rot) ; 0 , sin(x_rot), cos(x_rot)] * A_Tag3_mean;
Y_rotated = [cos(y_rot), 0, sin(y_rot); 0, 1, 0; -sin(y_rot), 0, cos(y_rot)] * X_rotated;
Z_rotated = [cos(z_rot), -sin(z_rot), 0; sin(z_rot), cos(z_rot), 0; 0, 0, 1] * Y_rotated;

X_Tag3_0 = Tag_Mitte.simout.transform.translation.x.Data;
Y_Tag3_0 = Tag_Mitte.simout.transform.translation.y.Data;
Z_Tag3_0 = Tag_Mitte.simout.transform.translation.z.Data;
X_Tag3_0_mean = mean(X_Tag3_0);
Y_Tag3_0_mean = mean(Y_Tag3_0);
Z_Tag3_0_mean = mean(Z_Tag3_0);
A_Tag3_0_mean = [X_Tag3_0_mean; Y_Tag3_0_mean ; Z_Tag3_0_mean];
x_rot_2 = mean(Tag3_0x_0y.simout.transform.rotation.x.Data);
y_rot_2 = mean(Tag3_0x_0y.simout.transform.rotation.y.Data);
z_rot_2 = mean(Tag3_0x_0y.simout.transform.rotation.z.Data);
X_rotated_2 = [1, 0 , 0 ; 0, cos(x_rot_2), -sin(x_rot_2) ; 0 , sin(x_rot_2), cos(x_rot_2)] * A_Tag3_0_mean;
Y_rotated_2 = [cos(y_rot_2), 0, sin(y_rot_2); 0, 1, 0; -sin(y_rot_2), 0, cos(y_rot_2)] * X_rotated_2;
Z_rotated_2 = [cos(z_rot_2), -sin(z_rot_2), 0; sin(z_rot_2), cos(z_rot_2), 0; 0, 0, 1] * Y_rotated_2;
O_Tag3_2x_1y = Z_rotated + Z_rotated_2;

Pixeldichte = 333.33
f = 4 * Pixeldichte % in cm
x_0_0 = mean(Tag_Mitte.simout.transform.translation.x.Data);
y_0_0 = mean(Tag_Mitte.simout.transform.translation.y.Data);
z_0_0 = mean(Tag_Mitte.simout.transform.translation.z.Data);
Cx = (985-f*x_0_0)/z_0_0
Cy = (632-f*y_0_0)/z_0_0

lq = lsqr(O_Tag3_2x_1y, B);
Real_P = O_Tag3_2x_1y * lq;
P = [f, 0, 960, 0; 0 , f,  600, 0; 0, 0, 1, 0]

C_0 = [x_0_0; y_0_0 ; z_0_0; 1]
B_0 = P * C_0
x_1_1 = mean(Tag3_1x_1y.simout.transform.translation.x.Data);
y_1_1 = mean(Tag3_1x_1y.simout.transform.translation.y.Data);
z_1_1 = mean(Tag3_1x_1y.simout.transform.translation.z.Data);
C_1 = [x_1_1; y_1_1; z_1_1; 1]
B_1 = P * C_1


