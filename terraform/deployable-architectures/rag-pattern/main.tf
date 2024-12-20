/**
 * @author Andrea C. Crawford
 * @email acm@us.ibm.com
 * @create date 2024-12-10
 * @modify date 2023-12-12
 * @desc Terraform that provisions the initial IAM (access groups, access group policies) that are needed to execute
 * the "Retrival Augmented Generation (RAG) Pattern", an IBM Cloud deployable architecture.
 */


###############################################################################
## Retrieval Augmented Generation (RAG) Pattern
##
## Solution Library: "Gen AI Pattern for Watsonx on IBM Cloud"
## https://cloud.ibm.com/docs/pattern-genai-rag?topic=pattern-genai-rag-genai-pattern
##
## IBM Cloud Catalog: Retrieval Augmented Generation (RAG) Pattern
## https://cloud.ibm.com/catalog/7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3/architecture/Retrieval_Augmented_Generation_Pattern-5fdd0045-30fc-4013-a8bc-6db9d5447a52-global?kind=terraform&format=stack&version=db620c1b-e060-481a-bda4-84fa36ab2354-global
###############################################################################


###############################################################################
## Create an Access Group and Policies to run a specific pattern
###############################################################################

#create an Access Group
resource "ibm_iam_access_group" "rag_pattern_da_ag" {
  name = "rag-pattern-da-ag"
  description = "Access Group for DA \"Retrieval Augmented Generation (RAG) Pattern\""
}


###############################################################################
## Create an Access Group Policies to run the pattern
###############################################################################

###############################################################################
# Service: atracker
# Resource: All
# Role(s): Administrator (Platform), Standard member (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "activity_tracker_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator", "Standard member"]

    resources {
        service = "logdnaat"
    }
}

###############################################################################
# Service: iam-groups
# Resource: All
# Role(s): Administrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "iam_groups_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator"]

    resources {
        service = "iam-groups"
    }
}

###############################################################################
# Service: iam-identity
# Resource: All
# Role(s): Administrator (Platform), User API key creator (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "iam_identity_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator", "User API key creator"]

    resources {
        service = "iam-identity"
    }
}


#######
# NEW #
###############################################################################
# Service: IAM Access Management Service
# Resource: All
# Role(s): Administrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "iam_access_management_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator"]

    resources {
        service = "iam-access-management"
    }
}

#######
# NEW #
###############################################################################
# Service: IBM Cloud Metrics Routing
# Resource: All
# Role(s): Administrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "cloud_metrics_routing_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator"]

    resources {
        service = "metrics-router"
    }
}

#######
# NEW #
###############################################################################
# Service: Cloud Logs
# Resource: All
# Role(s): Administrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "cloud_logs_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator", "Manager"]

    resources {
        service = "logs"
    }
}

#######
# NEW #
###############################################################################
# Service: Cloud Monitoring
# Resource: All
# Role(s): Administrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "cloud_monitoring_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator", "Manager"]

    resources {
        service = "sysdig-monitor"
    }
}

#######
# NEW #
###############################################################################
# Service: Secrets Manager
# Resource: All
# Role(s): Admnistrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "secrets_manager_policy" {
    access_group_id = ibm_iam_access_group.deployable_architectures_ag.id
    roles   = ["Administrator"]

    resources {
        service = "secrets-manager"
    }
}

#######
# NEW #
###############################################################################
# Service: Toolchain
# Resource: All
# Role(s): Admnistrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "toolchain_policy" {
    access_group_id = ibm_iam_access_group.deployable_architectures_ag.id
    roles   = ["Administrator"]

    resources {
        service = "toolchain"
    }
}

#######
# NEW #
###############################################################################
# Service: Continuous Delivery
# Resource: All
# Role(s): Admnistrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "toolchain_policy" {
    access_group_id = ibm_iam_access_group.deployable_architectures_ag.id
    roles   = ["Administrator"]

    resources {
        service = "continuous-delivery"
    }
}

#######
# NEW #
###############################################################################
# Service: Container Registry
# Resource: All
# Role(s): Admnistrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "container_registry_policy" {
    access_group_id = ibm_iam_access_group.deployable_architectures_ag.id
    roles   = ["Administrator", "Manager"]

    resources {
        service = "container-registry"
    }
}

#######
# NEW #
###############################################################################
# Service: Cloud Monitoring
# Resource: All
# Role(s): Admnistrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "cloud_monitoring_policy" {
    access_group_id = ibm_iam_access_group.deployable_architectures_ag.id
    roles   = ["Administrator", "Manager"]

    resources {
        service = "sysdig-monitor"
    }
}

###############################################################################
# Service: Cloud Object Storage
# Resource: All
# Role(s): Administrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "cos_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator","Manager"]

    resources {
        service = "cloud-object-storage"
    }
}

###############################################################################
# Service: Code Engine
# Resource: All
# Role(s): Editor (Platform), Writer (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "code_engine_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor", "Writer"]

    resources {
        service = "codeengine"
    }
}

###############################################################################
# Service: Kubernetes Service
# Resource: All
# Role(s): Administrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "iks_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator", "Manager"]

    resources {
        service = "containers-kubernetes"
    }
}

###############################################################################
# Service: VPC Infrastructure Service
# Resource: All
# Role(s): Administrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "vpc_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator"]

    resources {
        service = "is"
    }
}

###############################################################################
# Service: Databases for Elasticsearch
# Resource: All
# Role(s): Editor (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "db_elasticsearch_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor"]

    resources {
        service = "databases-for-elasticsearch"
    }
}

###############################################################################
# Service: Event Notifications
# Resource: All
# Role(s): Administrator (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "event_notifications_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Administrator", "Manager"]

    resources {
        service = "event-notifications"
    }
}


###############################################################################
# Service: Key Protect
# Resource: All
# Role(s): Editor (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "key_protect_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor", "Manager"]

    resources {
        service = "kms"
    }
}

###############################################################################
# Service: Security and Compliance Center
# Resource: All
# Role(s): Editor (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "scc_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor", "Manager"]

    resources {
        service = "compliance"
    }
}

###############################################################################
# Service: Watson Discovery
# Resource: All
# Role(s): Editor (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "watson_discovery_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor"]

    resources {
        service = "discovery"
    }
}

###############################################################################
# Service: watsonx Assistant
# Resource: All
# Role(s): Editor (Platform), Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "watsonx_assistant_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor", "Manager"]

    resources {
        service = "conversation"
    }
}

###############################################################################
# Service: watsonx.ai Runtime
# Resource: All
# Role(s): Editor (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "watsonx_ai_runtime_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor"]

    resources {
        service = "pm-20"
    }
}

###############################################################################
# Service: watsonx.ai Studio
# Resource: All
# Role(s): Editor (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "watsonx_ai_studio_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor"]

    resources {
        service = "data-science-experience"
    }
}

###############################################################################
# Service: watsonx.governance
# Resource: All
# Role(s): Editor (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "watsonx_governance_policy" {
    access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
    roles = ["Editor"]

    resources {
        service = "aiopenscale"
    }
}



###############################################################################
# Add users to Access Group
###############################################################################
resource "ibm_iam_access_group_members" "rag_pattern_da_members" {
  access_group_id = ibm_iam_access_group.rag_pattern_da_ag.id
  ibm_ids = [var.account_admin_email]
}



###############################################################################
# Retrieve Resource Group where all shared DA resources are provisioned
###############################################################################
data "ibm_resource_group" "deployable_architectures_rg" {
    name = "deployable-architectures-rg"
}


###############################################################################
# Retrieve Secrets Manager service
###############################################################################
data "ibm_resource_instance" "secrets_manager" {
    name = "deployable-architectures-sm"
    service = "secrets-manager"
    location = var.region
    resource_group_id = data.ibm_resource_group.deployable_architectures_rg.id
}

## create an API Key to run the DA
resource "ibm_iam_api_key" "iam_rag_pattern_api_key" {
  name = "rag-pattern-da-api-key"
}


resource "ibm_sm_arbitrary_secret" "sm_arbitrary_secret" {
  name          = "rag-pattern-secret"
  instance_id   = data.ibm_resource_instance.secrets_manager.guid
  region        = var.region
  custom_metadata = {"pattern":"rag", "user":"${var.account_admin_email}"}
  description = "Arbitrary secret used to configure the RAG pattern deployable architecture"
  labels = ["rag-pattern-da-secret"]
  payload = ibm_iam_api_key.iam_rag_pattern_api_key.apikey
}
