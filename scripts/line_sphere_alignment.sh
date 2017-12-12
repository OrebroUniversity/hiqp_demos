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
  frame_id: 'yumi_body'
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [1.4, 0.0, 0.5, 0.15]"

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'line_sphere_alignment'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomAlign', 'line', 'sphere', 'ee_line = target_sphere']
  dyn_params: ['TDynPD', '1.0', '2.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '1.0', '2.0'] "

