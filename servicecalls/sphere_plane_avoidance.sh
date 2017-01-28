#Add a point geometric primitive attached to the base frame of the right gripper. Color for visualization is parametrized by rgb and alpha value, the point x/y/z coordinates are expressed in 'frame_id'
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'test_point'
type: 'point'
frame_id: 'gripper_r_base'
visible: true
color: [0.0, 0.0, 1.0, 1.0]   
parameters: [0.0, 0.0, 0.15]" 

#Add a sphere geometric primitive attached to the base frame of the right gripper. The sphere is parametrized by center point coordinates x/y/z and radius
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'avoidance_sphere'
type: 'sphere'
frame_id: 'gripper_r_base'
visible: true
color: [1.0, 0.0, 0.0, 0.4]   
parameters: [0.0, 0.0, 0.1, 0.04]" 

#Add a plane primitive relative to the world frame. The plane is expressed as n^T*x-b=0, parameters are nx/ny/nz/b, ||n||=1
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'target_plane'
type: 'plane'
frame_id: 'world'
visible: true
color: [1.0, 0.0, 1.0, 0.6]
parameters: [-1.0, 0.0, 0.0, -0.85]"

#Add another plane primitive
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'avoidance_plane'
type: 'plane'
frame_id: 'world'
visible: true
color: [1.0, 0.0, 0.0, 0.6]
parameters: [-1.0, 0.0, 0.0, -0.65]"

#Add an avoidance task forcing the avoidance sphere to stay in the positive half-space of the avoidance plane
rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'sphere_plane_avoidance'
priority: 1
visible: 1
active: 1
monitored: 1
def_params: ['TDefGeomProj', 'sphere', 'plane', 'avoidance_sphere > avoidance_plane']
dyn_params: ['TDynLinear', '10.0']"


#Add a task constraining the existing primitive test_point to target_plane, the point will converge onto the plane with a normal velocity component governed by the linear first-order dynamics v_n=-1.5*d, where d is the normal distance of target_point to the plane. The task runs on a lower priority level as the avoidance task and thus will only be accomplished as good as possible in the null-space of the higher-ranked task.
rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'point_plane_projection'
priority: 2
visible: 1
active: 1
monitored: 1
def_params: ['TDefGeomProj', 'point', 'plane', 'test_point = target_plane']
dyn_params: ['TDynLinear', '1']"

