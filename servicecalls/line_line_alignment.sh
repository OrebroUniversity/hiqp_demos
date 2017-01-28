#Add a line geometric primitive attached to the base frame of the right gripper. The line is parametrized by the x/y/z coordinates of a unit vector and the x/y/z coordinates of a point, both expressed in 'frame_id'
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'line_r'
type: 'line'
frame_id: 'gripper_r_base'
visible: true
color: [0.0, 0.0, 1.0, 1.0]   
parameters: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0]" 

#Add another line primitive attached to the left primitive
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'line_l'
type: 'line'
frame_id: 'gripper_l_base'
visible: true
color: [0.0, 0.0, 1.0, 1.0]   
parameters: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0]" 

#The alignment tasks will cause the two lines to converge to a parallel state with linear dynamics governed by a gain of -1.0. The last def_param indicates an alignment threshold in radiant.
rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'line_line_alignment'
priority: 2
visible: 1
active: 1
monitored: 1
def_params: ['TDefGeomAlign', 'line', 'line', 'line_r = line_l', '0']
dyn_params: ['TDynLinear', '1.0']"
