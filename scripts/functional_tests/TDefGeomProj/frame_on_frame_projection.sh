rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'myframe1'
type: 'frame'
frame_id: 'gripper_r_base'
visible: true
color: [0, 0, 0, 1]
parameters: [0, 0, 0.1, 0, 0, 0, 1]"

rosservice call /yumi/hiqp_joint_velocity_controller/set_primitive \
"name: 'myframe2'
type: 'frame'
frame_id: 'gripper_l_base'
visible: true
color: [0, 0, 0, 1]
parameters: [0, 0, 0.1, 0, 0, 0, 1]"

sleep 1.0

rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'task_frameonframe'
priority: 3
visible: 1
active: 1
monitored: 1
def_params: ['TDefGeomProj', 'frame', 'frame', 'myframe1 = myframe2']
dyn_params: ['TDynLinear', '1.0']"