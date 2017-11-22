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

#pragma once

#include <string>
#include <vector>

#include <hiqp/task_definition.h>
#include <kdl/treefksolverpos_recursive.hpp>
#include <kdl/treejnttojacsolver.hpp>
#include <pluginlib/class_loader.h>
#include <ros/ros.h>

namespace hiqp {
namespace tasks {

//==============================================================================================
/*! \brief A task definition that maps from scalar Cartesian x-axis space to
 * joint space
 *  \author Robert Krug */
class TDefXAxis : public TaskDefinition {
public:
  inline TDefXAxis() : TaskDefinition() {}

  TDefXAxis(std::shared_ptr<GeometricPrimitiveMap> geom_prim_map,
            std::shared_ptr<Visualizer> visualizer);
  ~TDefXAxis() noexcept;

  int init(const std::vector<std::string> &parameters,
           RobotStatePtr robot_state);

  int update(RobotStatePtr robot_state);

  int monitor();

protected:
  /* std::shared_ptr<PrimitiveA> primitive_a_; */
  /* std::shared_ptr<PrimitiveB> primitive_b_; */

private:
  TDefXAxis(const TDefXAxis &other) = delete;
  TDefXAxis(TDefXAxis &&other) = delete;
  TDefXAxis &operator=(const TDefXAxis &other) = delete;
  TDefXAxis &operator=(TDefXAxis &&other) noexcept = delete;

  /* int project(std::shared_ptr<PrimitiveA> first, */
  /* 		  std::shared_ptr<PrimitiveB> second, */
  /* 		  const RobotStatePtr robot_state); */

  /* /// \brief This sets jacobian columns corresponding to non-writable joints
   * to */
  /* /// 0 */
  /* void maskJacobian(RobotStatePtr robot_state); */
  /* void maskJacobianDerivative(RobotStatePtr robot_state);   */

  std::shared_ptr<KDL::TreeFkSolverPos_recursive> fk_solver_pos_;
  std::shared_ptr<KDL::TreeJntToJacSolver> fk_solver_jac_;
  std::string ee_frame_;
  /* KDL::Frame pose_a_; */
  /* KDL::Jacobian jacobian_a_; ///< tree jacobian w.r.t. the center of the
   * frame TDefXAxis::pose_a_  */
  /* KDL::Jacobian jacobian_dot_a_;   */

  /* KDL::Frame pose_b_;  */
  /* KDL::Jacobian jacobian_b_; ///< tree jacobian w.r.t. the center of the
   * frame TDefXAxis::pose_b_ */
  /* KDL::Jacobian jacobian_dot_b_; */
};

} // namespace tasks

} // namespace hiqp
