sudo docker run -it \
    -v $(pwd):/workspace \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /workspace \
    --privileged \
    --entrypoint=/bin/bash \
    gcr.io/bazel-public/bazel:latest \
    -c "bazel clean --expunge"

rm -rf tarball.tar