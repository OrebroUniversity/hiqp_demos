rosservice call /yumi/hiqp_joint_velocity_controller/set_task \
"name: 'task_jntlimits'
priority: 3
visible: 1
active: 1
monitored: 1
def_params: ['TDefJntLimits', 'yumi_link_3_r', '-0.01', '0.01']
dyn_params: ['TDynJntLimits', '0.01', '1.0']"
