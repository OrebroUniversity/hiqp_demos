// The HiQP Control Framework, an optimal control framework targeted at robotics
// Copyright (C) 2017 Marcus A Johansson
// Copyright (C) 2017 Robert Krug
// Copyright (C) 2017 Chittaranjan Srinivas Swaminathan
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <hiqp/tasks/tdef_x_axis.h>
#include <pluginlib/class_list_macros.h>

namespace hiqp {
namespace tasks {
//==================================================================================
TDefXAxis::TDefXAxis(std::shared_ptr<GeometricPrimitiveMap> geom_prim_map,
                     std::shared_ptr<Visualizer> visualizer)
  : TaskDefinition(geom_prim_map, visualizer) {}
//==================================================================================
TDefXAxis::~TDefXAxis() noexcept {}
//==================================================================================

int TDefXAxis::init(const std::vector<std::string> &parameters,
                    RobotStatePtr robot_state) {

  //make sure dimensions are correct (the first parameter is the task definition name)
  int size = parameters.size();
  if (size != 2) {
    printHiqpWarning("TDefXAxis requires 2 parameters, got " +
                     std::to_string(size) + "! Initialization failed!");
    return -1;
  }
  ee_frame_ = parameters.at(1); //read the ee frame id 
  
  task_signs_.insert(task_signs_.begin(), 1, 0); //equality task (0)
  performance_measures_.resize(0);  //no custom performance measure needed

  unsigned int n_joints = robot_state->getNumJoints();
  //Our operational space is the scalar along the x-axis, therefore task error/error derivative are scalar and the Jacobian/Jacobian derivative are in \mathbb{R}^{1 \times n}
  e_=Eigen::VectorXd::Zero(1);  
  e_dot_=Eigen::VectorXd::Zero(1);
  J_=Eigen::MatrixXd::Zero(1,n_joints);      
  J_dot_=Eigen::MatrixXd::Zero(1,n_joints);
  f_=Eigen::VectorXd::Zero(1); //f is a possible exogeneous task quantity, e.g., for external force

  //set up forward kinematics and Jacobian solvers using the kinematic tree read from the urdf file
      fk_solver_pos_ =
	std::make_shared<KDL::TreeFkSolverPos_recursive>(robot_state->kdl_tree_);
      fk_solver_jac_ =
	std::make_shared<KDL::TreeJntToJacSolver>(robot_state->kdl_tree_);
  
  return 0; //returning 0 indicates success
}
//==================================================================================
int TDefXAxis::update(RobotStatePtr robot_state) {
     int retval = 0;
     KDL::Frame ee_pose;
     KDL::Jacobian ee_jac;
     KDL::Jacobian ee_jac_dot;     
     
   //compute forward kinematics to get the current position of the end effector
      retval = fk_solver_pos_->JntToCart(robot_state->kdl_jnt_array_vel_.q, ee_pose,
					 ee_frame_);
      if (retval != 0) {
	std::cerr << "In TDefXAxis::update : Can't solve position "
		  << "of link '" << ee_frame_ << "'"
		  << " in the "
		  << "KDL tree! KDL::TreeFkSolverPos_recursive::JntToCart return "
		  << "error code '" << retval << "'\n";
	return -1;
      }

      //compute the end effector Jacobian
    ee_jac.resize(robot_state->kdl_jnt_array_vel_.q.rows());
      retval = fk_solver_jac_->JntToJac(robot_state->kdl_jnt_array_vel_.q,
					ee_jac, ee_frame_);
      if (retval != 0) {
	std::cerr << "In TDefXAxis::update : Can't solve Jacobian "
		  << "of link '" << ee_frame_ << "'"
		  << " in the "
		  << "KDL tree! KDL::TreeJntToJacSolver return error code "
		  << "'" << retval << "'\n";
	return -2;
      }

      //compute the end effector Jacobian derivative
     ee_jac_dot.resize(robot_state->kdl_jnt_array_vel_.q.rows());
      retval = treeJntToJacDot(robot_state->kdl_tree_, ee_jac, robot_state->kdl_jnt_array_vel_,
			       ee_jac_dot, ee_frame_);
      if (retval != 0) {
	std::cerr << "In TDefGeometricProjection::update : Can't solve Jacobian derivative "
		  << "of link '" << ee_frame_ << "'"
		  << " in the "
		  << "KDL tree! treeJntToJacDot return error code "
		  << "'" << retval << "'\n";
	return -3;
      }

      Eigen::Vector3d x(1,0,0);
      
      e_(0)=ee_pose.p.x(); //task error is the pose x value
      J_=x.transpose()*ee_jac.data.topRows<3>(); //task Jacobian is the projection of the ee Jacobian onto the x axis
      J_dot_=x.transpose()*ee_jac_dot.data.topRows<3>();
      e_dot_=J_*robot_state->kdl_jnt_array_vel_.qdot.data; 
      
      return 0;
}
//==================================================================================
int TDefXAxis::monitor() { return 0; }
//==================================================================================
} // namespace tasks

} // namespace hiqp

PLUGINLIB_EXPORT_CLASS(hiqp::tasks::TDefXAxis, hiqp::TaskDefinition) //export the new task definition
