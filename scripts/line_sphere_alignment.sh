rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_line'
  type: 'line'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0]
- name: 'target_sphere'
  type: 'sphere'
  frame_id: 'world'
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [1.4, 0.0, 0.5, 0.15] 
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
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.3, -0.4, 0.25]" 


rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'line_sphere_alignment'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomAlign', 'line', 'sphere', 'ee_line = target_sphere']
  dyn_params: ['TDynPD', '9.0', '6.0']
- name: 'point_point_projection'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'point', 'ee_point = target_point']
  dyn_params: ['TDynPD', '9.0', '6.0'] 
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "

