rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks: 
- name: 'yumi_link_6_r_jntconfig'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefJntConfig', 'yumi_link_1_r', '1.0']
  dyn_params: ['TDynPD', '1.5', '2.5']"

