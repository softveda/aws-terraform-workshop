### Lab03 - Sentinel Policy as Code

Duration: 10 minutes

In this Lab we will continue to use your Organization we setup in lab02. Using Sentinel policy-as-code framework we will restrict the AWS EC2 instance type being deployed.
- The Sentinel policy code is included in lab03 directory: [restrict-aws-instance-type.sentinel](restrict-aws-instance-type.sentinel).
- You can view [example Sentinel policies on AWS](https://github.com/hashicorp/terraform-guides/tree/master/governance/aws) in terraform-guides repo.

**Tasks:**
- Task 1: Add Sentinel policy to Organization
- Task 2: Queue a Plan
- Task 3: View Sentinel policy failure and Override
- Task 4: Destroy provisioned infrastructure

### Terraform Enterprise

### Task 1: Add Sentinel policy to Organization

**Steps 1.1: Create a Policy **
- Go to your Organization URL, which is in the format: `https://app.terraform.io/app/<your-organization-name>`
- Click on Settings at the top
- Click on "Sentinel policies" from the Organization Settings menu on the left
- Click "Add New Policy"
  - Set "POLICY NAME" to `restrict-aws-instance-type`
  - Set "ENFORCEMENT MODE" to soft-mandatory (can override)
  - In "POLICY CODE", add the contents of [restrict-aws-instance-type.sentinel](restrict-aws-instance-type.sentinel).

- Click "Create policy" and provide a name such as "Global-policies"

**Steps 1.2: Create Policy Set**
- Click on "Policy Sets" and "Create a New Policy Set"
- Choose "SCOPE OF POLICIES" to be "Policies enforced on all workspaces"
- Under "Policies" please choose "restrict-aws-instance-type" and click "Add policy"
- Click on "Create Policy Set" to save the policy


### Task 2: Queue a plan

**Steps:**
- Click on "Workspaces" from the top, and click on the Workspace you used for lab02.
- Click on "Queue plan" from the top.

### Task 3: View Sentinel policy failure and Override

**Steps:**
- The Run should show a Policy failure. View the Allowed EC2 instance types in Sentinel Policy code. You will see `instance_type` is restricted to `t2.small`.
- The server module [main.tf](lab01/server/main.tf) is using an `instance_type` of `t2.medium` which is causing the Policy to fail.
- Since you are the owner of the Organization, you are able to Override this Policy failure.
  - Click on "Override & Continue" button Optionally adding some comments
  - Click on "Confirm and Apply" button to allow the Run to complete.

### Task 4: Destroy provisioned infrastructure
**Steps:**
- Use the same steps as Lab02 to Destroy provisioned infrastructure
