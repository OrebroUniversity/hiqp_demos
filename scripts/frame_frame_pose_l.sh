#Add a frame geometric primitive to the gripper which is parametrized by the x/y/z coordinates of the origin and either x/y/z euler angles or the w/x/y/z quaternion describing the orienation relative to 'frame_id'
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives "primitives: 
  -
    name: 'test_frame_l'
    type: 'frame'
    frame_id: 'gripper_l_base'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]   
    parameters: [0.0, 0.0, 0.1, 0.0, 0.0, 0.0]
  -
    name: 'target_frame_2'
    type: 'frame'
    frame_id: 'world'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]   
    parameters: [0.298, 0.151, 0.131, 1.70, 1.7, 0.00]" 

#The alignment task will orient the frames in the same way
#The projection task will co-locate the frame origins

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks "tasks: 
  -
    name: 'frame_frame_alignment_l'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomAlign', 'frame', 'frame', 'test_frame_l = target_frame_2', '0']
    dyn_params: ['TDynLinear', '1.0']
  -    
    name: 'frame_frame_projection_l'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'frame', 'frame', 'test_frame_l = target_frame_2']
    dyn_params: ['TDynLinear', '1.0']"

