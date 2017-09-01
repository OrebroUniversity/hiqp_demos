rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_frame'
  type: 'frame'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.15, 0.0, 0.0, 0.0]
- name: 'target_frame'
  type: 'frame'
  frame_id: 'world'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.5, -0.15, 0.4, -1.57, 0.0, 1.57]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'frame_frame_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'frame', 'frame', 'target_frame = ee_frame', '0.05', '0.5']
  dyn_params: ['TDynPD', '10.0', '10.0', '10.0', '2.0', '2.0', '2.0', '7.0', '7.0', '7.0', '3.0', '3.0', '3.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "


