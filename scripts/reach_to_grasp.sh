####################### GEOMETRIC PRIMITIVES #######################

#End-effector point on the gripper - will be projected onto the grasp cylinder
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'gripper_ee_point'
type: 'point'
frame_id: 'gripper_r_base'
visible: true
color: [0.0, 0.0, 1.0, 1.0]
parameters: [0.0, 0, 0.1]"

#Gripper approach axis will be enforced to intersect the grasp target axis
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'gripper_approach_axis'
type: 'line'
frame_id: 'gripper_r_base'
visible: true
color: [0.0, 0.0, 1.0, 1.0]
parameters: [0, 0, 1, 0, 0, 0.1]"

#Gripper vertical axis is enforced to be parallel to the grasp target axis
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'gripper_vertical_axis'
type: 'line'
frame_id: 'gripper_r_base'
visible: true
color: [0.0, 0.0, 1.0, 1.0]
parameters: [0, -1, 0, 0, 0, 0.1]"

#Axis describing target object alignment
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'grasp_target_axis'
type: 'line'
frame_id: 'yumi_body'
visible: true
color: [0.0, 1.0, 0.0, 1.0]
parameters: [0, 0, 1, 0.5, 0, 0]"

#Grasp cylinder is used to enforce distance from the gripper to the target object
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'grasp_cylinder'
type: 'cylinder'
frame_id: 'yumi_body'
visible: true
color: [0.0, 1.0, 0.0, 0.4]
parameters: [0, 0, 1, 0.5, 0, 0, 0.025, 0.1]"

#Grasp plane is used to enforce gripper altitude
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'grasp_plane'
type: 'plane'
frame_id: 'yumi_body'
visible: true
color: [0.0, 1.0, 0.0, 0.4]
parameters: [0, 0, 1, 0.1]"

####################### TASKS #######################

rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'gripper_ee_point_on_grasp_plane'
priority: 2
visible: 1
active: 1
monitored: 1
def_params: ['TDefGeomProj', 'point', 'plane', 'gripper_ee_point = grasp_plane']
dyn_params: ['TDynLinear', '1.5']"

# rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
# "name: 'gripper_approach_axis_coplanar_grasp_target_axis'
# priority: 2
# visible: 1
# active: 1
# monitored: 1
# def_params: ['TDefGeomProj', 'line', 'line', 'gripper_approach_axis = grasp_target_axis']
# dyn_params: ['TDynLinear', '1.5']"

# rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
# "name: 'gripper_ee_point_on_grasp_cylinder'
# priority: 2
# visible: 1
# active: 1
# monitored: 1
# def_params: ['TDefGeomProj', 'point', 'cylinder', 'gripper_ee_point = grasp_cylinder']
# dyn_params: ['TDynLinear', '1.0']"

# rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
# "name: 'gripper_vertical_axis_parallel_grasp_target_axis'
# priority: 2
# visible: 1
# active: 1
# monitored: 1
# def_params: ['TDefGeomAlign', 'line', 'line', 'gripper_vertical_axis = grasp_target_axis', '0']
# dyn_params: ['TDynLinear', '1.5']"


