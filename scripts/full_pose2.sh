rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:
- name: 'full_pose'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '1.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '-1.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0']
  dyn_params: ['TDynPD', '1.0', '3.0'] "

