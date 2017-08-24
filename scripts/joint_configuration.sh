#Task makes the joint angles converge with linear dynamics (gain -1.0) to the specified values - joint order follows the one in /config/yumi.yaml 
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:  
- name: 'joint_configuration'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '-0.42', '-1.48', '1.21', '0.75', '-0.8', '0.45', '0.21', '0.42', '-1.48', '-1.21', '0.75', '0.8', '0.45', '1.21']
  dyn_params: ['TDynPD', '2.0', '3.0'] "
