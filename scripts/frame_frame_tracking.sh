rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_frame'
  type: 'frame'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.15, 1.0, 0.0, 0.0, 0.0]
- name: 'target_frame'
  type: 'frame'
  frame_id: 'world'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.3, -0.3, 0.6, 1.0, 0.0, 0.0, 0.0]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'frame_frame_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'frame', 'frame', 'ee_frame = target_frame', '0.04']
  dyn_params: ['TDynPD', '9.0', '6.0'] 
- name: 'full_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "


