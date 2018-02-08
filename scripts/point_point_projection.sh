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
  frame_id: 'yumi_body'
  visible: true
  color: [1.0, 0.0, 1.0, 0.6]   
  parameters: [0.4, -0.4, 0.0]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'point_point_projection'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'point', 'ee_point = target_point']
  dyn_params: ['TDynPD', '2.0', '4.0']"



