Package showcasing the use of the hiqp framework with the ABB YuMi robot in simulation

- hiqp_demos/launch/yumi_simulation.launch: launch file starting a Gazebo simulation of YuMi and the hiqp control framework
- hiqp_demos/config/yumi.yaml: ros_control parameter configuration for the hiqp control framework
- hiqp_demos/config/yumi_preload.yaml: this file offers the possibility to start the control framework with preloaded tasks for, e.g., limiting joint positions/velocities and obstacle avoidance
- hiqp_demos/servicecalls: various shell scripts containing exemplary servicealls to add/remove tasks and corresponding geometric primitives
