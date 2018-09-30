[back to Robotics Playground](https://github.com/sandeepgogadi/Robotics-Playground)

[back to Dynamics and Control Matlab](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab)

# Dynamic and kinematic modelling of the Sawyer arm

The Aim of the project was to design a symbolic algorithm in Matlab that that derives the complete equations of motion of a swayer robot arm given the homogenous transformations from base frame to the end effector following DH convention.

1. Forward Kinematics
The forward kinematics of this robot are calculated using RH convention with the assumption of CCW rotation as +.The table of the complete DH parameters from base frame (0) to the wrist joint (frame 7).

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Modeling%20of%20a%20Robot%20Arm/Sawyer.jpg "Sawyer Robot")

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Modeling%20of%20a%20Robot%20Arm/table.jpg "DH table")

The table of parameters shown above are derived based on the current (image) position of the robot. The algorithm goes through each of the parameters per link drives the Homogenous transformation matrices based on the z*d*a*x rule. Each transformation is then multiplied by the previous transformation and the first transformation is assumed as 4 by 4 identity.

2. Angular and linear jacobians

To derive the equation of motions it is necessary to derive the angular and linear jacobians the COM of each link with all other frames. The COM position are assumed to be given with respect to the consecutive frame e.g. the position vector of the COM for link 1 is given with respect to frame 1. Therefore in the next section of the algorithm the position vector for al 7 COMs are calculated w.r.t the base frame (0). The angular jacobians are 3 by 7 matrix, the derivation is based on the assumption that all links up to the specific COM effect the angular velocity of that COM therefore all z component of the rotation of all links up the frame after the specific COM.

3. Inertial matrix and Kinetic energy

After deriving the angular and linear velocity jacobians it is necessary to derive the inertial matrix. To do so it is required know the inertia tensor of each link with respect to the base frame. Any design software like Solidworks can provide this data or a combination of parallel axis theorem and steiner theorem can be used to derive the inertia matrix.

4. Potential Energy

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Modeling%20of%20a%20Robot%20Arm/Potentialenergy.jpg "Potential Energy")

5. Coriolis matrix

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Modeling%20of%20a%20Robot%20Arm/Christoffel.jpg "Coriolis Matrix")

6. Equations of motion

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Modeling%20of%20a%20Robot%20Arm/equation.jpg "Equation of Motion")
