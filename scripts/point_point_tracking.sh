rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_point'
  type: 'point'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.15]
- name: 'target_point'
  type: 'point'
  frame_id: 'world'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.3, -0.3, 0.6]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'point_point_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'point', 'point', 'ee_point = target_point', '0.04']
  dyn_params: ['TDynPD', '81.0', '9.0'] 
- name: 'full_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "


