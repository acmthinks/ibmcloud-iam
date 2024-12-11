/**
 * @author Andrea C. Crawford
 * @email acm@us.ibm.com
 * @create date 2024-12-10
 * @modify date 2023-12-12
 * @desc Terraform that provisions the initial IAM (access groups, access group policies) that are needed to execute an IBM Cloud deployable architecture.
 * This is a pre-conditional step to running an IBM Cloud deployable architecture
 */


###############################################################################
## Create a base Access Group & Policies to run IBM Cloud deployable architecures
## https://cloud.ibm.com/docs/secure-enterprise?topic=secure-enterprise-basic-custom#basic-custom-prereqs
###############################################################################
#create an Access Group
resource "ibm_iam_access_group" "deployable_architecture_ag" {
  name = "deployable-architecture-ag"
  description = "Access Group with base permissions for running any IBM Cloud deployable architectures"
}

###############################################################################
## Create base Access Group Policies to run IBM Cloud deployable architectures
###############################################################################

###############################################################################
# Service: All Account Management services
# Resource: All
# Role(s): Administrator (Platform)
# https://cloud.ibm.com/docs/account?topic=account-account-services&interface=terraform#account-management-actions-roles-terra
###############################################################################
resource "ibm_iam_access_group_policy" "account_management_services_policy" {
    access_group_id = ibm_iam_access_group.deployable_architecture_ag.id
    roles = ["Administrator"]
    account_management = "true"
}

###############################################################################
# Service: All Identity and Access enabled services
# Resource: All
# Role(s): Administrator (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "iam_services_policy" {
    access_group_id = ibm_iam_access_group.deployable_architecture_ag.id
    roles   = ["Administrator"]

    resources {
        service = "service"
    }
}

###############################################################################
# Service: Catalog Management
# Resource: All
# Role(s): Editor (Platform)
###############################################################################
resource "ibm_iam_access_group_policy" "catalog_management_policy" {
    access_group_id = ibm_iam_access_group.deployable_architecture_ag.id
    roles   = ["Editor"]

    resources {
        service = "globalcatalog-collection"
    }
}

###############################################################################
# Service: Schematics
# Resource: All
# Role(s): Manager (Service)
###############################################################################
resource "ibm_iam_access_group_policy" "schematics_policy" {
    access_group_id = ibm_iam_access_group.deployable_architecture_ag.id
    roles   = ["Manager"]

    resources {
        service = "schematics"
    }
}





###############################################################################
# Add users to Access Group
###############################################################################
resource "ibm_iam_access_group_members" "da_ag_members" {
  access_group_id = ibm_iam_access_group.deployable_architecture_ag.id
  ibm_ids = ["acm@us.ibm.com"]
}
