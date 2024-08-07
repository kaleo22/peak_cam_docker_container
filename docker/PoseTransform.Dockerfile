FROM osrf/ros:foxy-desktop

ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]

# Install build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-pip\
    git

# Clone repository
RUN git clone https://github.com/kaleo22/pose_transform.git

# Initialize rosdep
RUN rosdep update

# Install dependencies
RUN cd pose_transform \
    && rosdep update \
    && rosdep install --from-paths . --ignore-src -r -y --rosdistro=foxy \
    && pip install scipy \
    && pip install numpy

RUN curl -s https://install.husarnet.com/install.sh | sudo bash \
	&& RELEASE="v1.3.5" \
	&& ARCH="amd64" \
	&& sudo curl -L https://github.com/husarnet/husarnet-dds/releases/download/$RELEASE/husarnet-dds-linux-$ARCH -o /usr/local/bin/husarnet-dds \
	&& sudo chmod +x /usr/local/bin/husarnet-dds


# Build the workspace
RUN source /opt/ros/foxy/setup.bash \
    && cd pose_transform \
    && colcon build

# Set up the entrypoint
COPY ./docker/entrypoint_PoseTransform.sh /
ENTRYPOINT [ "/entrypoint_PoseTransform.sh" ]
CMD [ "bash" ]

