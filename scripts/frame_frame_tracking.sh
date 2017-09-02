rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_frame'
  type: 'frame'
  frame_id: 'gripper_l_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
- name: 'target_frame'
  type: 'frame'
  frame_id: 'yumi_base_link'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.355, 0.3, 0.3, 1.57, 1.57, 0.0]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'frame_frame_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'frame', 'frame', 'target_frame = ee_frame', '0.05', '0.5']
  dyn_params: ['TDynPD', '3.0', '4.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '-0.42', '-1.48', '1.21', '0.75', '-0.8', '0.45', '0.21', '0.42', '-1.48', '-1.21', '0.75', '0.8', '0.45', '1.21']
  dyn_params: ['TDynPD', '0.05', '0.5'] "


