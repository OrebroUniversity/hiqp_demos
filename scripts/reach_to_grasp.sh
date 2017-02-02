####################### GEOMETRIC PRIMITIVES #######################

#End-effector point on the gripper - will be projected onto the grasp cylinder
#Gripper approach axis will be enforced to intersect the grasp target axis
#Gripper vertical axis is enforced to be parallel to the grasp target axis
#Axis describing target object alignment
#Grasp cylinder is used to enforce distance from the gripper to the target object
#Grasp plane is used to enforce gripper altitude

rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives "primitives: 
  - 
    name: 'gripper_ee_point'
    type: 'point'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]
    parameters: [0.0, 0, 0.1]
  - 
    name: 'gripper_approach_axis'
    type: 'line'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]
    parameters: [0, 0, 1, 0, 0, 0.1]
  - 
    name: 'gripper_vertical_axis'
    type: 'line'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]
    parameters: [0, -1, 0, 0, 0, 0.1]
  - 
    name: 'grasp_target_axis'
    type: 'line'
    frame_id: 'world'
    visible: true
    color: [0.0, 1.0, 0.0, 1.0]
    parameters: [0, 0, 1, 0.45, 0, 0.115]

  - name: 'grasp_cylinder'
    type: 'cylinder'
    frame_id: 'world'
    visible: true
    color: [0.0, 1.0, 0.0, 0.4]
    parameters: [0, 0, 1, 0.45, 0, 0.115, 0.025, 0.1]
    
  - name: 'grasp_plane'
    type: 'plane'
    frame_id: 'world'
    visible: true
    color: [0.0, 1.0, 0.0, 0.4]
    parameters: [0, 0, 1, 0.16]"
    

####################### TASKS #######################

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks "tasks:
  -  
    name: 'gripper_ee_point_on_grasp_plane'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'point', 'plane', 'gripper_ee_point = grasp_plane']
    dyn_params: ['TDynLinear', '1.5']
  -  
    name: 'gripper_approach_axis_coplanar_grasp_target_axis'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'line', 'line', 'gripper_approach_axis = grasp_target_axis']
    dyn_params: ['TDynLinear', '1.5']
  -  
    name: 'gripper_ee_point_on_grasp_cylinder'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'point', 'cylinder', 'gripper_ee_point = grasp_cylinder']
    dyn_params: ['TDynLinear', '1.0']
  -  
    name: 'gripper_vertical_axis_parallel_grasp_target_axis'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomAlign', 'line', 'line', 'gripper_vertical_axis = grasp_target_axis', '0']
    dyn_params: ['TDynLinear', '1.5']"


