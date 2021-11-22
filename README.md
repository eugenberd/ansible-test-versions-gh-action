# ansible-test-versions-gh-action for setting up job matrix in Ansible Collection repositories

GitHub Action for setting up job matrix based on expected ansible, python and
docker image support for Ansible Collections.

## Usage

To use the action add the following step to your workflow file (e.g.
`.github/workflows/ansible-test.yml`), example for sanity tests:

```yaml
steps:
  - name: Get the job matrix parameters for ansible-test as JSON
    uses: data-bene/ansible-test-versions-gh-action@release/v1
    id: default-matrix
    with:
      python-version: '[ "3.9" ]'
strategy:
    fail-fast: ${{ inputs.fail-fast }}
    matrix:
      ansible-core-version: ${{ fromJSON(define-matrix.outputs.ansible-core-version) }}
      python-version: ${{ fromJSON(define-matrix.outputs.python-version) }}
      target-python-version: ${{ fromJSON(define-matrix.outputs.target-python-version) }}
      exclude: ${{ fromJSON(define-matrix.outputs.target-python-exclude) }}
```

And for integration tests:

```yaml
steps:
  - name: Get the job matrix parameters for ansible-test as JSON
    uses: data-bene/ansible-test-versions-gh-action@release/v1
    id: default-matrix
    with:
      docker-image: '[ "ubuntu2004" ]'
      docker-include: '[]'
strategy:
    fail-fast: ${{ inputs.fail-fast }}
    matrix:
      ansible-core-version: ${{ fromJSON(define-matrix.outputs.ansible-core-version) }}
      python-version: ${{ fromJSON(define-matrix.outputs.python-version) }}
      docker-image: ${{ fromJSON(define-matrix.outputs.docker-image) }}
      exclude: ${{ fromJSON(define-matrix.outputs.docker-exclude) }}
      include: ${{ fromJSON(define-matrix.outputs.docker-include) }}

```


> **Pro tip**: instead of using branch pointers, like `main`, pin
versions of Actions that you use to tagged versions or SHA-1 commit
identifiers. This will make your workflows more secure and better
reproducible, saving you from sudden and unpleasant surprises.

## inputs

When set the inputs replace the default values, inputs MUST be JSON.

* `ansible-core-version`: Array of ansible versions (required: false)
* `docker-exclude`: Array of matrix excludes for docker (required: false)
* `docker-image`: Array of docker images (required: false)
* `docker-include`: Array of matrix includes for docker (required: false)
* `python-version`: Array of python versions (controler) (required: false)
* `target-python-exclude`: Array of excludes target python versions (required: false)
* `target-python-version`: Array of target python versions (managed) (required: false)

## outputs

JSON outputs:

* `ansible-core-version`: Array of ansible versions
* `docker-exclude`: Array of matrix excludes for docker
* `docker-image`: Array of docker images
* `docker-include`: Array of matrix includes for docker
* `python-version`: Array of python versions (controler)
* `target-python-exclude`: Array of excludes target python versions
* `target-python-version`: Array of target python versions (managed)

# Developed and Sponsored by

[Data Bene](https://data-bene.io)
