#! /bin/bash

./vulkan/bin/glslc ./shaders/shader.vert -o ./bin/vert.spv
./vulkan/bin/glslc ./shaders/shader.frag -o ./bin/frag.spv
