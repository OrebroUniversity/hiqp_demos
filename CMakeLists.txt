# The HiQP Control Framework, an optimal control framework targeted at robotics
# Copyright (C) 2016-2017 Marcus A. Johansson
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 2.8.6)
project(hiqp_demos)

set(CMAKE_BUILD_TYPE RelWithDebinfo)
set(CMAKE_CXX_STANDARD 11)

set(GUROBI_INCLUDE_DIR "$ENV{GUROBI_HOME}/include")
set(GUROBI_LIB_DIR "$ENV{GUROBI_HOME}/lib")
include_directories(${GUROBI_INCLUDE_DIR})
link_directories(${GUROBI_LIB_DIR})

find_package(Eigen3 REQUIRED)
find_package(catkin REQUIRED COMPONENTS
  hiqp_core
  pluginlib
)

# find_package(Boost REQUIRED COMPONENTS system)
catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS hiqp_core pluginlib 
#  DEPENDS system_lib
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIR}
)

add_library(hiqp_demos_plugins src/tdyn_p_controller.cpp)
add_dependencies(hiqp_demos_plugins ${catkin_EXPORTED_TARGETS})
target_link_libraries(hiqp_demos_plugins ${catkin_LIBRARIES})

