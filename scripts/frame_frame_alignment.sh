#Add a frame geometric primitive to the gripper which is parametrized by the x/y/z coordinates of the origin and either x/y/z euler angles or the w/x/y/z quaternion describing the orienation relative to 'frame_id'
#Add another frame relative to yumi_base_link
rosservice call /yumi/hiqp_joint_velocity_controller/set_primitives \
"primitives:
- name: 'ee_frame'
  type: 'frame'
  frame_id: 'gripper_r_base'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]   
  parameters: [0.0, 0.0, 0.15, 0.0, 0.0, 0.0]
- name: 'target_frame'
  type: 'frame'
  frame_id: 'yumi_base_link'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.5, -0.15, 0.4, 0.0, 0.0, 1.57]" 

#The alignment task will orient the frames in the same way
#The projection task will co-locate the frame origins
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:
- name: 'frame_frame_alignment'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomAlign', 'frame', 'frame', 'ee_frame = target_frame']
  dyn_params: ['TDynPD', '2.0', '3.0']
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "

