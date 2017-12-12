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

#include <limits>
#include <random>

#include <hiqp/utilities.h>

#include <hiqp/tasks/tdyn_pd_controller.h>
#include <pluginlib/class_list_macros.h>

#include <ros/ros.h>

namespace hiqp {
namespace tasks {

TDynPDController::TDynPDController(
    std::shared_ptr<GeometricPrimitiveMap> geom_prim_map,
    std::shared_ptr<Visualizer> visualizer)
    : TaskDynamics(geom_prim_map, visualizer) {}

int TDynPDController::init(const std::vector<std::string> &parameters,
                          RobotStatePtr robot_state,
                          const Eigen::VectorXd &e_initial,
                          const Eigen::VectorXd &e_dot_initial,
                          const Eigen::VectorXd &e_final,
                          const Eigen::VectorXd &e_dot_final) {

  int dim = e_initial.rows();   ///< number of controlled dimensions
  int size = parameters.size(); ///< number of given parameters

  // ensure consistency
  assert((e_dot_initial.rows() == dim) && (e_final.rows() == dim) &&
         (e_dot_final.rows() == dim));

  // ensure that valid parameters are given - the first one is the Controller
  // type, the second the controller gain
  if (size != 3) {
    printHiqpWarning("TDynPDController requires three parameters, got " +
                     std::to_string(size) + "! Initialization failed!");
    return -1;
  }

  if (dim != 1) {
    printHiqpWarning(
        "TDynPDController is a scalar controller valid for one dimension, got " +
        std::to_string(dim) + "! Initialization failed!");
    return -1;
  }

  // read the proportional gain
  k_p_ = std::stod(parameters.at(1));

  // read the derivative gain
  k_d_ = std::stod(parameters.at(2));  

  // initialize the controller
  e_ddot_star_ = -k_p_ * e_initial -k_d_ * e_dot_initial; // we control the error in acceleration
  performance_measures_.resize(dim); // custom performance measures (need not be implemented)

  return 0;
}

int TDynPDController::update(const RobotStatePtr robot_state,
                            const std::shared_ptr<TaskDefinition> def) {

  // P control law
  e_ddot_star_ = -k_p_ * def->getTaskValue() -k_d_ * def->getTaskDerivative(); // def->getTaskValue() gives the
                                              // error, def->getTaskDerivative()
                                              // the error velocity
  return 0;
}

int TDynPDController::monitor() { return 0; }

} // namespace tasks

} // namespace hiqp

PLUGINLIB_EXPORT_CLASS(hiqp::tasks::TDynPDController, hiqp::TaskDynamics)
