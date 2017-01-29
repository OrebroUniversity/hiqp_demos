# The HiQP Demos package 

The package is showcasing the use of the hiqp framework with the ABB YuMi robot in simulation via a collection of shellscripts. Dependencies include the hiqp packages (git@github.com:OrebroUniversity/hiqp.git), as well as the yumi_description package (git@github.com:OrebroUniversity/yumi.git) which is also available from APT.

# Structure

- hiqp_demos/launch/yumi_simulation.launch: launch file starting a Gazebo simulation of YuMi and the HiQP control framework
- hiqp_demos/config/yumi.yaml: ros_control parameter configuration for the HiQP control framework
- hiqp_demos/config/yumi_preload.yaml: this file offers the possibility to start the control framework with preloaded tasks for, e.g., limiting joint positions/velocities and obstacle avoidance
- hiqp_demos/scripts: various shell scripts containing exemplary servicealls to add/remove tasks and corresponding geometric primitives

# Usage

Launch hiqp_demos/launch/yumi_simulation.launch to start a Gazebo simulation and the HiQP velocity controller. By uncommenting ```<rosparam file="$(find hiqp_demos)/config/yumi_preload.yaml" command="load"/>``` in the launch file, a set of tasks defined in hiqp_demos/config/yumi_preload.yaml can be pre-loaded at start-up. Due to imperfect joint velocity tracking in Gazebo, the model is prone to drift in velocity control mode. It is therefore recommended to disable gravity in Gazebo via hiqp_demos/scripts/utility/disable_gravity_gazebo.sh. 

HiQP operates on geometric primitives, which can be attached to arbitrary frames, and uses them to formulate the following task classes:

- TDefJntConfig: specifies a desired joint configuration
- TDefJntLimits: specifies joint position/velocity limits
- TDefGeomProj: Expresses distance relationships between primitive geometries which are used for movement generation
- TDefGeomAlign: Expresses orientation relationshps between primitive geometries which are used for moment generation

Each task is assigned a priority. Tasks on lower hierarchy levels are fulfilled as good as possible (in a least-square-sense) in the null-space of higher ranked tasks, i. e., if redundancy is available. 

# Examples

In between examples, running tasks and associated primitive geometries can be removed with the convenience shell script in hiqp_demos/scripts/utility/clear_controller.sh. More detailed comments can be found in the corresponding shellscripts themselves. 

- hiqp_demos/scripts/joint_configuration.sh: achieves a given joint configuration with defined dynamics.
- hiqp_demos/scripts/point_plane_projection.sh: moves an end-effector point anywhere on a given target plane. 
- hiqp_demos/scripts/sphere_plane_avoidance.sh: demonstrates obstacle avoidance in HiQP. The end-effector point is moved towards the target plane as good as possible, such that the defined collision sphere is kept above the specified obstacle plane.
- hiqp_demos/scripts/line_line_alignment.sh: shows how to prallelly align two line primitives attached to the robot's kinematic chain.
- hiqp_demos/scripts/frame_frame_pose.sh: moves a frame attached to one of the robot's wrist to coincide with a predefined target frame.
- hiqp_demos/scripts/reach_to_grasp.sh: encapsulates a simplified version of the set-up used in [1, 2] to generate reach to grasp movements on-the-fly.

[1] ... R. Krug, T. Stoyanov, V. Tincani, H. Andreasson, R. Mosberger, G. Fantoni, and A. J. Lilienthal. The next step in robot commissioning: Autonomous picking and palletizing. IEEE RA-L, 1(1):546–553, 2016.
<br/>
[2] ... T. Stoyanov, R. Krug, R. Muthusamy, and V. Kyrki. Grasp envelopes: Extracting constraints on gripper postures from online reconstructed 3D models. In Proc. IEEE/RSJ IROS, pp. 885–892, 2016.
