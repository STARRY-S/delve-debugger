include versions

#IMAGE_NAME=ghcr.io/moio/delve-debugger
IMAGE_NAME=dlv

K3D_IMPORT_CLUSTER=upstream

build:
	docker build --build-arg GO_VERSION=$(GO_VERSION) --build-arg DLV_VERSION=$(DLV_VERSION) --tag $(IMAGE_NAME) package/

import: build
	k3d image import --mode direct --cluster $(K3D_IMPORT_CLUSTER) $(IMAGE_NAME):$(DLV_VERSION)-$(DELVE_DEBUGGER_VERSION)
