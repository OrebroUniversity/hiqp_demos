#disable gravity in Gazebo - useful to avoid drifting due to imperfect velocity tracking control
rosservice call /gazebo/set_physics_properties '{time_step: 0.001, max_update_rate: 1000, gravity: [0.0, 0.0, 0.0], ode_config: {auto_disable_bodies: false, sor_pgs_precon_iters: 0, sor_pgs_iters: 50, sor_pgs_w: 1.3, sor_pgs_rms_error_tol: 0.0, contact_surface_layer: 0.001, contact_max_correcting_vel: 100.0, cfm: 0.0, erp: 0.2,  max_contacts: 20} }'

#Add a point geometric primitive attached to the base frame of the right gripper. Color for visualization is parametrized by rgb and alpha value, the point x/y/z coordinates are expressed in 'frame_id'
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'test_point'
type: 'point'
frame_id: 'gripper_r_base'
visible: true
color: [1.0, 0.0, 0.0, 1.0]   
parameters: [0.0, 0.0, 0.15]" 

#Add a plane primitive relative to the world frame. The plane is expressed as n^T*x-b=0, parameters are nx/ny/nz/b, ||n||=1
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'target_plane'
type: 'plane'
frame_id: 'world'
visible: true
color: [1.0, 0.0, 1.0, 0.6]
parameters: [0.0, 0.0, 1.0, 0.2]"

#add a task constraining the existing primitive test_point to target_plane, the point will converge onto the plane with a normal velocity component governed by the linear first-order dynamics v_n=-1.5*d, where d is the normal distance of target_point to the plane
rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'point plane projection'
priority: 2
visible: 1
active: 1
def_params: ['TDefGeomProj', 'point', 'plane', 'test_point = target_plane']
dyn_params: ['TDynLinear', '1.5']"

