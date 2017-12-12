#Aligns the z-axis of a target frame with a given cylinder's axis while intersecting the x-axis of the target frame with the cylinder's axis
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'test_frame'
  type: 'frame'
  frame_id: 'gripper_r_base'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.0, 0.0, 0.1, -1.55, 0, -1.55]
- name: 'target_cylinder'
  type: 'cylinder'
  frame_id: 'yumi_base_link'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 0.1, 0.5]"

rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:
- name: 'frame_cylinder_alignment'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomAlign', 'frame', 'cylinder', 'test_frame = target_cylinder', '0.5']
  dyn_params: ['TDynPD', '2.0', '3.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "

