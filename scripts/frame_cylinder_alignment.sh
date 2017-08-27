#Add a frame geometric primitive to the gripper which is parametrized by the x/y/z coordinates of the origin and either x/y/z euler angles or the w/x/y/z quaternion describing the orienation relative to 'frame_id'
#Add another frame relative to world
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
  frame_id: 'world'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]   
  parameters: [0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 0.1, 1.0]
- name: 'target_point'
  type: 'point'
  frame_id: 'world'
  visible: true
  color: [1.0, 0.0, 1.0, 1.0]   
  parameters: [0.3, -0.3, 0.6]"  

#The alignment task will orient the frames in the same way
#The projection task will co-locate the frame origins
rosservice call /yumi/hiqp_joint_velocity_controller/set_tasks \
"tasks:
- name: 'frame_cylinder_alignment'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomAlign', 'frame', 'cylinder', 'test_frame = target_cylinder']
  dyn_params: ['TDynPD', '2.0', '3.0']
- name: 'point_point_tracking'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefTracking', 'point', 'frame', 'target_point = test_frame']
  dyn_params: ['TDynPD', '2.0', '3.0'] 
- name: 'neutral_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose']
  dyn_params: ['TDynPD', '2.0', '3.0'] "

