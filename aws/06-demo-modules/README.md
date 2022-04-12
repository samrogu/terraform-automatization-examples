# Terraform workspaces
### Check that no workspace other than the default one 
### exists using the command.
```
terraform workspace list
```
### Create a new workspace named test using the command
```
 terraform workspace new test
```
# Create the infraestructure
```
 terraform init
 terraform plan
 terraform apply
```
# Show to states of workspace
```
 terraform state list
```

# Change of workspaces

```
terraform workspace select default
```
# Selected workspace to destroy
```
terraform destroy --auto-approve
```

# For delete workspaces 
```
terraform workspace delete test
```