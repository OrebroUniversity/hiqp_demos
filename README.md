# The HiQP Demo package 

The package is showcasing the use of the hiqp framework with the ABB YuMi robot in simulation via a collection of shellscripts. Dependencies include the hiqp packages (git@github.com:OrebroUniversity/hiqp.git), as well as the yumi_description package (git@github.com:OrebroUniversity/yumi.git) which is also available from APT.

# Structure

- hiqp_demos/launch/yumi_simulation.launch: launch file starting a Gazebo simulation of YuMi and the HiQP control framework
- hiqp_demos/config/yumi.yaml: ros_control parameter configuration for the hiqp control framework
- hiqp_demos/config/yumi_preload.yaml: this file offers the possibility to start the control framework with preloaded tasks for, e.g., limiting joint positions/velocities and obstacle avoidance
- hiqp_demos/scripts: various shell scripts containing exemplary servicealls to add/remove tasks and corresponding geometric primitives

# Usage

Launch hiqp_demos/launch/yumi_simulation.launch to start a Gazebo simulation and the HiQP velocity controller. By uncommenting <rosparam file="$(find hiqp_demos)/config/yumi_preload.yaml" command="load"/> in the launch file, a set of tasks defined in hiqp_demos/config/yumi_preload.yaml can be pre-loaded at start-up. Due to imperfect joint velocity tracking in Gazebo, the model is prone to drift in velocity control mode. It is therefore recommended to disable gravity in Gazebo via hiqp_demos/scripts/utility/disable_gravity_gazebo.sh. 

[1] ... T. Stoyanov, R. Krug, R. Muthusamy, and V. Kyrki. Grasp envelopes: Extracting constraints on gripper postures from online reconstructed 3D models. In Proc. IEEE/RSJ IROS, pp. 885–892, 2016.
