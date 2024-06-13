
x_1_1 = mean(Tag3_1_1.simout.transform.translation.x.Data);
y_1_1 = mean(Tag3_1_1.simout.transform.translation.y.Data);
z_1_1 = mean(Tag3_1_1.simout.transform.translation.z.Data);
x_rot = mean(Tag3_1_1.simout.transform.rotation.x.Data);
y_rot = mean(Tag3_1_1.simout.transform.rotation.y.Data);
z_rot = mean(Tag3_1_1.simout.transform.rotation.z.Data);
A_Tag3_1_mean = [x_1_1; y_1_1; z_1_1];


X_rotated = [1, 0 , 0 ; 0, cos(x_rot), -sin(x_rot) ; 0 , sin(x_rot), cos(x_rot)] * A_Tag3_1_mean;
Y_rotated = [cos(y_rot), 0, sin(y_rot); 0, 1, 0; -sin(y_rot), 0, cos(y_rot)] * X_rotated;
Z_rotated = [cos(z_rot), -sin(z_rot), 0; sin(z_rot), cos(z_rot), 0; 0, 0, 1] * Y_rotated;

X_Tag3_0 = Tag3_0_0.simout.transform.translation.x.Data;
Y_Tag3_0 = Tag3_0_0.simout.transform.translation.y.Data;
Z_Tag3_0 = Tag3_0_0.simout.transform.translation.z.Data;
X_Tag3_0_mean = mean(X_Tag3_0);
Y_Tag3_0_mean = mean(Y_Tag3_0);
Z_Tag3_0_mean = mean(Z_Tag3_0);
A_Tag3_0_mean = [X_Tag3_0_mean; Y_Tag3_0_mean ; Z_Tag3_0_mean];
x_rot_2 = mean(Tag3_0_0.simout.transform.rotation.x.Data);
y_rot_2 = mean(Tag3_0_0.simout.transform.rotation.y.Data);
z_rot_2 = mean(Tag3_0_0.simout.transform.rotation.z.Data);
X_rotated_2 = [1, 0 , 0 ; 0, cos(x_rot_2), -sin(x_rot_2) ; 0 , sin(x_rot_2), cos(x_rot_2)] * A_Tag3_0_mean;
Y_rotated_2 = [cos(y_rot_2), 0, sin(y_rot_2); 0, 1, 0; -sin(y_rot_2), 0, cos(y_rot_2)] * X_rotated_2;
Z_rotated_2 = [cos(z_rot_2), -sin(z_rot_2), 0; sin(z_rot_2), cos(z_rot_2), 0; 0, 0, 1] * Y_rotated_2;
O_Tag3_1_1 = -Z_rotated_2 + Z_rotated