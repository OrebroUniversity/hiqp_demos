rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_frame'
  type: 'frame'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
- name: 'target_frame'
  type: 'frame'
  frame_id: 'yumi_base_link'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.45, -0.3, 0.3, 0.0, 1.57, 1.57]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'frame_frame_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'frame', 'frame', 'target_frame = ee_frame', '0.05', '0.5']
  dyn_params: ['TDynPD', '30.0', '30.0', '30.0', '3.0', '3.0', '3.0', '12.0', '12.0', '12.0', '4.0', '4.0', '4.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '-1.0', '-1.4', '1.7', '-0.2', '0.0', '1.0', '1.0', '1.0', '-1.4', '-1.7', '-0.2', '0.0', '1.0', '-1.0']
  dyn_params: ['TDynPD', '1.0', '2.0'] "


