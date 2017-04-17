#Add a frame geometric primitive to the gripper which is parametrized by the x/y/z coordinates of the origin and either x/y/z euler angles or the w/x/y/z quaternion describing the orienation relative to 'frame_id'
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives "primitives: 
  -
    name: 'gripper_r_frame'
    type: 'frame'
    frame_id: 'yumi_link_tool_r'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]   
    parameters: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
  -
    name: 'target_frame'
    type: 'frame'
    frame_id: 'world'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]   
    parameters: [0.45, -0.250, 0.170, 0.0, 0.0, 0.0]" 

#The alignment task will orient the frames in the same way
#The projection task will co-locate the frame origins

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks "tasks: 
  -
    name: 'frame_frame_alignment'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomAlign', 'frame', 'frame', 'gripper_r_frame = target_frame', '0']
    dyn_params: ['TDynLinear', '0.7']
  -    
    name: 'frame_frame_projection'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'frame', 'frame', 'gripper_r_frame = target_frame']
    dyn_params: ['TDynLinear', '0.7']"

