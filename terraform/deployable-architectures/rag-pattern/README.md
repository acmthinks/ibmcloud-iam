
# IBM Cloud Identity and Access Management (IAM) - Retrieval Augmented Generation (RAG) Pattern
To successfully run the IBM Cloud deployable architecture for the [Retrieval Augmented Generation (RAG) Pattern](https://cloud.ibm.com/catalog/7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3/architecture/Retrieval_Augmented_Generation_Pattern-5fdd0045-30fc-4013-a8bc-6db9d5447a52-global), there are specific Access Groups, Access Group Policies, and base services that need to be present PRIOR to provisioning the deployable architecture (DA).

The intent of these automation assets is to provision the IBM Cloud IAM and base services to prepare an IBM Cloud account for the RAG Pattern DA.

All IBM Cloud deployable architectures must have the conditions met set forth by [Using IBM Cloud deployable architectures to build a deployable architecture](https://cloud.ibm.com/docs/secure-enterprise?topic=secure-enterprise-basic-custom#basic-custom-prereqs)


## What you need to get started
1. An [IBM Cloud account](https://cloud.ibm.com/registration)
2. The [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started), installed on your local machine
3. A [GitHub](https://github.com/signup) account
4. [Terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform) installed on your local machine *

### on local
1. Open a terminal and login to the IBM Cloud CLI
```ibmcloud login --apikey <YOUR_API_KEY>```
or
```ibmcloud login --sso```

2. Clone this repo
```git clone https://github.com/acmthinks/ibmcloud-iam```




* for those that are concerned about Hashicorp BSL (licensing), you might give tfswitch, a try
