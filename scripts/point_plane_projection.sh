#Add a point geometric primitive attached to the base frame of the right gripper. Color for visualization is parametrized by rgb and alpha value, the point x/y/z coordinates are expressed in 'frame_id'

#Add a plane primitive relative to the world frame. The plane is expressed as n^T*x-b=0, parameters are nx/ny/nz/b, ||n||=1

rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives "primitives: 
  -
    name: 'test_point'
    type: 'point'
    frame_id: 'gripper_r_base'
    visible: true
    color: [0.0, 0.0, 1.0, 1.0]   
    parameters: [0.0, 0.0, 0.15]
  -  
    name: 'target_plane'
    type: 'plane'
    frame_id: 'world'
    visible: true
    color: [1.0, 0.0, 1.0, 0.6]
    parameters: [0.0, 0.0, 1.0, 0.1]"
    
#Add a task constraining the existing primitive test_point to target_plane, the point will converge onto the plane with a normal velocity component governed by the linear first-order dynamics v_n=-1.5*d, where d is the normal distance of target_point to the plane
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks "tasks: 
  -
    name: 'point_plane_projection'
    priority: 2
    visible: 1
    active: 1
    monitored: 1
    def_params: ['TDefGeomProj', 'point', 'plane', 'test_point = target_plane']
    dyn_params: ['TDynLinear', '1.5']"

