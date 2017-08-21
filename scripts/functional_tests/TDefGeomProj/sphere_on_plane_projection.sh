rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives "primitives:
  - 
    name: 'mypoint1'
    type: 'point'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0.0, 0.0, 1.0, 0.9]
    parameters: [0, 0, 0.2]
  - 
    name: 'mysphere1'
    type: 'sphere'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0.0, 0.0, 1.0, 0.5]
    parameters: [0, 0, 0.2, 0.1]
  - 
    name: 'myplane2'
    type: 'plane'
    frame_id: 'yumi_body'
    visible: true
    color: [0.0, 1.0, 0.0, 0.9]
    parameters: [0.0, 0, 1, 0.3]"

sleep 1.0
    
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks "tasks:
  - 
    name: 'task_test_sphere_avoid_plane1'
    priority: 3
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'sphere', 'plane', 'mysphere1 > myplane2']
    dyn_params: ['TDynLinear', '1.0']
  -  
    name: 'task_test_sphere_avoid_plane2'
    priority: 4
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'point', 'plane', 'mypoint1 = myplane2']
    dyn_params: ['TDynLinear', '1.0']"
