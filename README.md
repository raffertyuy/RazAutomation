# RazAutomation
This repository contains Azure functions (Powershell, Windows OS) for Azure subscription automation/management.

As recommended by Microsoft SFI, this Azure function uses `WEBSITE_RUN_FROM_PACKAGE = URL`, which requires deployment to be taken care of manually.
Client tooling that relies on `WEBSITE_RUN_FROM_PACKAGE = 1` will not work.
- You cannot use Core Tools' `func azure functionapp publish ...` command.
- You cannot use AZ CLI's `az functionapp deployment source config-zip ...` command.
- You cannot use VS or VS Code's UI to deploy.
- You'll have to use AZ commands instead of the ADO Task, `AzureFunctionApp@1/2`.
- You'll have to use AZ commands instead of the GH Action, `Azure/functions-actions@v1`.