rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives "primitives: 
  - 
    name: 'myline1'
    type: 'line'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0, 1, 0, 1]
    parameters: [1, 0, 0, 0, 0, 0.15]
  - 
    name: 'myline2'
    type: 'line'
    frame_id: 'gripper_l_base'
    visible: true
    color: [0, 0, 1, 1]
    parameters: [0, 1, 0, 0, 0, 0.2]"

sleep 1.0

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks "tasks: 
  - 
    name: 'task_lineonline'
    priority: 3
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'line', 'line', 'myline1 = myline2']
    dyn_params: ['TDynLinear', '1.0']"
