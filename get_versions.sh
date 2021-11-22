#! /usr/bin/env bash

[[ ! -e "$1" ]] && echo "::error file=$1::NOT FOUND" && exit 1

verions_file="$1"

ansible_core_version=$(yq eval -o=json --indent 0 --no-colors --no-doc '.ansible-core-version' "${verions_file}")
docker_exclude=$(yq eval -o=json --indent 0 --no-colors --no-doc '.docker-exclude' "${verions_file}")
docker_image=$(yq eval -o=json --indent 0 --no-colors --no-doc '.docker-image' "${verions_file}")
docker_include=$(yq eval -o=json --indent 0 --no-colors --no-doc '.docker-include' "${verions_file}")
python_version=$(yq eval -o=json --indent 0 --no-colors --no-doc '.python-version' "${verions_file}")
target_python_exclude=$(yq eval -o=json --indent 0 --no-colors --no-doc '.target-python-exclude' "${verions_file}")
target_python_version=$(yq eval -o=json --indent 0 --no-colors --no-doc '.target-python-version' "${verions_file}")

echo "::debug::ansible-core-version=${ansible_core_version}"
echo "::debug::docker-exclude=${docker_exclude}"
echo "::debug::docker-image=${docker_image}"
echo "::debug::docker-include=${docker_include}"
echo "::debug::target-python-exclude=${target_python_exclude}"
echo "::debug::target-python-version=${target_python_version}"
echo "::debug::python-version=${python_version}"

echo "::set-output name=ansible-core-version::${ansible_core_version}"
echo "::set-output name=docker-exclude::${docker_exclude}"
echo "::set-output name=docker-image::${docker_image}"
echo "::set-output name=docker-include::${docker_include}"
echo "::set-output name=python-version::${python_version}"
echo "::set-output name=target-python-exclude::${target_python_exclude}"
echo "::set-output name=target-python-version::${target_python_version}"
