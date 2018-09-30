[back to Robotics Playground](https://github.com/sandeepgogadi/Robotics-Playground)

[back to Dynamics and Control Matlab](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab)

# Control and Trajectory Following for a Mobile Robot

The main aim of this project was to analyse the effect of a nonlinear controller on the performance of a nonholonomic mobile robot in following a figure 8 trajectory.

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Control%20and%20Trajectory%20Following%20for%20a%20Mobile%20Robot/robotmobile.jpg "Mobile Robot")

1. State space model

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Control%20and%20Trajectory%20Following%20for%20a%20Mobile%20Robot/SS.jpg "State Space")

2. Nonlinear controller

Due to the nonlinear nature of the state space model to controller the trajectory of the robot it is better to evaluate the performance of a nonlinear controller. To derive the controller, initially we find the relative degree of the system. That is the the degree of differential where the output of the system y gains dependency on the inputs v and w.

3. Desired Trajectories

To define a figure 8 trajectory we can use a time dependent equation as such:

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Control%20and%20Trajectory%20Following%20for%20a%20Mobile%20Robot/trajeq.jpg "Trajectory Equation")

which t = 0 to 18 results in trajectory of:

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Control%20and%20Trajectory%20Following%20for%20a%20Mobile%20Robot/trajmob.jpg "Trajectory Desired")

As described in step 3 to develop the controller, feedback data from the differentiated desired position is required as a feedforward term. This is easily derived from the x and y equations for the trajectories.
The results of the simulation show a trajectory following within 0.15m.

![alt text](https://github.com/sandeepgogadi/Dynamics-and-Control-Matlab/blob/master/Control%20and%20Trajectory%20Following%20for%20a%20Mobile%20Robot/trajres.jpg "Trajectory Result")
