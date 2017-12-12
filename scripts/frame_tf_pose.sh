#Add a frame geometric primitive to the gripper which is parametrized by the x/y/z coordinates of the origin and either x/y/z euler angles or the w/x/y/z quaternion describing the orienation relative to 'frame_id'
#Add another frame relative to yumi_body by publishin to tf
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'test_frame'
  type: 'frame'
  frame_id: 'gripper_r_base'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.0, 0.0, 0.1, 0.0, 0.0, 0.0]" 

rosrun tf static_transform_publisher 0.2, 0, 0.3, 0, 0, 0 yumi_body target_frame 100 &

sleep 2
#The tracking task will co-locate the frames
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:
- name: 'frame_frame_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'frame', 'frame', 'target_frame = test_frame', '0.05', '0.5']
  dyn_params: ['TDynPD', '1.0', '2.0']"
