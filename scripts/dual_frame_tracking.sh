rosservice call /yumi/hiqp_joint_velocity_controller/remove_tasks "names:
- 'neutral_pose'" 

rosservice call /yumi/hiqp_joint_velocity_controller/remove_tasks "names:
- 'pre_grasp_r_track'" 

rosservice call /yumi/hiqp_joint_velocity_controller/remove_tasks "names:
- 'pre_grasp_l_track'" 

rosservice call /yumi/hiqp_joint_velocity_controller/remove_all_primitives 

rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: gripper_r_frame
  type: frame 
  frame_id: gripper_r_base
  visible: true
  color: [0.0, 0.5, 0.0, 1.0]
  parameters: [0.0245, 0.0, 0.14, 0.0, 0.0, 0.0]
- name: gripper_l_frame
  type: frame 
  frame_id: gripper_l_base
  visible: true
  color: [0.0, 0.5, 0.0, 1.0]
  parameters: [-0.0245, 0.0, 0.14, 0.0, 0.0, 0.0]
- name: pre_grasp_r_frame
  type: frame 
  frame_id: yumi_base_link
  visible: true
  color: [0.0, 0.5, 0.0, 1.0]
  parameters: [0.35, -0.15, 0.06, -1.57, 0.0, 1.57]
- name: pre_grasp_l_frame
  type: frame 
  frame_id: yumi_base_link
  visible: true
  color: [0.0, 0.5, 0.0, 1.0]
  parameters: [0.35, 0.15, 0.06, 1.57, 0.0, 1.57]"

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: pre_grasp_r_track
  priority: 2
  visible: true
  active: true
  monitored: true
  def_params: ['TDefTracking', 'frame', 'frame', 'gripper_r_frame = pre_grasp_r_frame', '0.1']
  dyn_params: ['TDynPD', '0.5', '1.5']
- name: pre_grasp_l_track
  priority: 2
  visible: true
  active: true
  monitored: true
  def_params: ['TDefTracking', 'frame', 'frame', 'gripper_l_frame = pre_grasp_l_frame', '0.1']
  dyn_params: ['TDynPD', '0.5', '1.5']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '-1.0', '-1.4', '1.7', '-0.2', '0.0', '1.0', '1.0', '1.0', '-1.4', '-1.7', '-0.2', '0.0', '1.0', '-1.0']
  dyn_params: ['TDynPD', '0.05', '0.5'] "



