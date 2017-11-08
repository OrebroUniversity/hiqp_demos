
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks: 
- name: 'yumi_jntconfig'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefJntConfig', 'yumi_link_7_r', '-0.5']
  dyn_params: ['TDynPController', '2.0']"

