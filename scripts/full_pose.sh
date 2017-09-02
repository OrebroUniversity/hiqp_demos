rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:
- name: 'full_pose'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '-0.5', '-1.0', '1.7', '-0.5', '-0.5', '1.5', '0.0', '0.5', '-1.0', '-1.7', '-0.5', '0.5', '1.5', '0.0']
  dyn_params: ['TDynPD', '0.05', '0.5'] "

