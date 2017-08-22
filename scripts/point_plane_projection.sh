rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_point'
  type: 'point'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.15]
- name: 'target_plane'
  type: 'plane'
  frame_id: 'world'
  visible: true
  color: [1.0, 0.0, 1.0, 0.6]   
  parameters: [0.0, 0.0, 1.0, 0.1]" 

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'point_plane_projection'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'plane', 'ee_point = target_plane']
  dyn_params: ['TDynPD', '5.0', '6.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '1.0', '3.0'] "



