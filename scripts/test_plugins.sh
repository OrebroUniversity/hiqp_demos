rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks: 
- name: 'yumi_plugin_test'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefXAxis', 'gripper_r_base']
  dyn_params: ['TDynPDController', '1.0', '2.0']"

