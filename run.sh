sudo docker run -it \
    -v $(pwd):/workspace \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /workspace \
    --privileged \
    --entrypoint=/bin/bash \
    gcr.io/bazel-public/bazel:latest \
    -c "cd unitycatalog && bazel clean --expunge && bazel build //:unity_catalog_image_tar && mv ./bazel-bin/unity_catalog_image_tar/tarball.tar ./"

sudo docker load < $(pwd)/unitycatalog/tarball.tar 

sudo docker run -p 8080:8080 -p 3000:3000 unitycatalog:latest