This repo is a testing ground for GitHub Actions to evaluate it in comparison
to the CircleCI setup we're currently using for lcdb-wf.

Notes on testing:

- building the envs is a constant ~8mins per env (env and env-r)

- github cache has a 5 GB limit across all files in the cache. The environments
  as-is are too big (3.8 GB and 4.8 GB for non-r and r respectively). So the
  workaround here is to run conda-pack and cache *that* instead of the full env
  directories.

- docker takes 3m30s to pull an image no matter what

- once envs are created (both packed and in docker containers), the timings are
  1m51s for conda and 3m42s for docker

- might be able to tag docker containers based on hash of requirements files and dockerfile?

- what about using docker ADD to include the unpacked tarballs from the cache,
  followed by a conda-unpack? Then there will always be a docker container
  named after the branch that can be pulled by users. That is, the container is
  not used for testing -- it's built for later use.

- artifacts from each build then become the conda env tarball(s) and a Docker
  image containing them.
