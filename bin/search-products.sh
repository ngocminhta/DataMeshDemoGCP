#!/usr/bin/env bash
#
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

SEARCH_TERMS=$1

set -e
set -u

PRODUCT_TAG_TEMPLATE_ID="${TF_VAR_central_catalog_project_id}.${TF_VAR_tag_template_name_product}"

ORG_ID=${TF_VAR_org_id}

set -x
gcloud data-catalog search --format json \
 --billing-project ${TF_VAR_consumer_project_id} \
 --include-organization-ids=${ORG_ID} \
 "tag=${PRODUCT_TAG_TEMPLATE_ID} ${SEARCH_TERMS}"

