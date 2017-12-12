rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_line'
  type: 'line'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
- name: 'target_line'
  type: 'line'
  frame_id: 'yumi_base_link'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.0, 0.0, 1.0, 0.5, 1.0, 0.0]
- name: 'ee_point'
  type: 'point'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.15]
- name: 'target_point'
  type: 'point'
  frame_id: 'yumi_base_link'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.0, 0.8, 2.0]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'line_line_alignment'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomAlign', 'line', 'line', 'ee_line = target_line']
  dyn_params: ['TDynPD', '2.0', '3.0']
#- name: 'point_point_projection'
#  priority: 2
#  visible: 1
#  active: 1
#  monitored: 1
#  def_params: ['TDefGeomProj', 'point', 'point', 'ee_point = target_point']
#  dyn_params: ['TDynPD', '2.0', '3.0'] 
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '1.0', '3.0'] "

