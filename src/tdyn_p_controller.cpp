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

#include <hiqp/tasks/tdyn_p_controller.h>
#include <pluginlib/class_list_macros.h>

#include <ros/ros.h>

namespace hiqp
{
  namespace tasks
  {

    TDynPController::TDynPController(
      std::shared_ptr<GeometricPrimitiveMap> geom_prim_map,
      std::shared_ptr<Visualizer> visualizer)
    : TaskDynamics(geom_prim_map, visualizer) {}


    int TDynPController::init(const std::vector<std::string>& parameters, RobotStatePtr robot_state, const Eigen::VectorXd& e_initial, const Eigen::VectorXd& e_dot_initial, const Eigen::VectorXd& e_final, const Eigen::VectorXd& e_dot_final) {

      // int size = parameters.size();
      // if (size != 2) {
      //   printHiqpWarning("TDynPController requires 2 parameters, got " 
      //     + std::to_string(size) + "! Initialization failed!");

      //   return -1;
      // }

      // client_NN_ = nh_.serviceClient<grasp_learning::QueryNN>("query_NN",true);


      // lambda_ = std::stod(parameters.at(1));

      // e_dot_star_.resize(e_initial.rows());
      // performance_measures_.resize(e_initial.rows());

      return 0;
    }

    int TDynPController::update(const RobotStatePtr robot_state, const std::shared_ptr< TaskDefinition > def){
      // e_dot_star_.resize(e.size());

      // grasp_learning::QueryNN srv_;

      // std::vector<double> vec(e.data(), e.data() + e.size());
      // srv_.request.task_measures = vec;

      // std::vector<double> sample;
      // if (client_NN_.call(srv_)){
      //   sample = srv_.response.task_dynamics;
      // }
      // else{
      //   std::cout<<"Calling NN server failed"<<std::endl;
      // }
      // // e_dot_star_ = -lambda_ * e;
      // e_dot_star_ = Eigen::VectorXd::Map(sample.data(), sample.size());
      // e_dot_star_ -= lambda_ * e;
      
      return 0;
    }

    int TDynPController::monitor() {
      return 0;
    }

} // namespace tasks

} // namespace hiqp

PLUGINLIB_EXPORT_CLASS(hiqp::tasks::TDynPController,
 hiqp::TaskDynamics)
