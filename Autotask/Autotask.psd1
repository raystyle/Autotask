#
# Module manifest for module 'Autotask'
#
# Generated by: Hugo Klemmestad
#
# Generated on: 29.03.2019
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Autotask.psm1'

# Version number of this module.
ModuleVersion = '1.6.1.9'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'abd8b426-797b-4702-b66d-5f871d0701dc'

# Author of this module
Author = 'Hugo Klemmestad'

# Company or vendor of this module
CompanyName = 'Office Center Hønefoss AS'

# Copyright statement for this module
Copyright = 'Copyright (c) Office Center Honefoss AS. All rights reserved. Licensed under the MIT license.
See https://github.com/officecenter/Autotask/blob/master/LICENSE.md for license information.'

# Description of the functionality provided by this module
Description = 'This module connects to the Autotask web services API. It downloads information about entities and fields and generates Powershell functions with parameter validation to support Intellisense script editing. To download first all entities and then detailed information about all fields and selection lists is quite time consuming. To speed up module load time and get to coding faster the module caches both script functions and the field info cache to disk.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Connect-AtwsWebAPI', 'Get-AtwsAccount', 'Get-AtwsAccountAlert', 
               'Get-AtwsAccountLocation', 'Get-AtwsAccountNote', 
               'Get-AtwsAccountPhysicalLocation', 'Get-AtwsAccountTeam', 
               'Get-AtwsAccountToDo', 'Get-AtwsActionType', 
               'Get-AtwsAdditionalInvoiceFieldValue', 'Get-AtwsAllocationCode', 
               'Get-AtwsAppointment', 'Get-AtwsAttachmentInfo', 
               'Get-AtwsBillingItem', 'Get-AtwsBillingItemApprovalLevel', 
               'Get-AtwsBusinessDivision', 'Get-AtwsBusinessDivisionSubdivision', 
               'Get-AtwsBusinessDivisionSubdivisionResource', 
               'Get-AtwsBusinessLocation', 'Get-AtwsBusinessSubdivision', 
               'Get-AtwsChangeRequestLink', 'Get-AtwsClassificationIcon', 
               'Get-AtwsClientPortalUser', 'Get-AtwsContact', 'Get-AtwsContactGroup', 
               'Get-AtwsContactGroupContact', 'Get-AtwsContract', 
               'Get-AtwsContractBlock', 'Get-AtwsContractCost', 
               'Get-AtwsContractExclusionAllocationCode', 
               'Get-AtwsContractExclusionRole', 'Get-AtwsContractFactor', 
               'Get-AtwsContractMilestone', 'Get-AtwsContractNote', 
               'Get-AtwsContractRate', 'Get-AtwsContractRetainer', 
               'Get-AtwsContractRoleCost', 'Get-AtwsContractService', 
               'Get-AtwsContractServiceBundle', 
               'Get-AtwsContractServiceBundleUnit', 'Get-AtwsContractServiceUnit', 
               'Get-AtwsContractTicketPurchase', 'Get-AtwsCountry', 
               'Get-AtwsCurrency', 'Get-AtwsDepartment', 'Get-AtwsExpenseItem', 
               'Get-AtwsExpenseReport', 'Get-AtwsFieldInfo', 'Get-AtwsHoliday', 
               'Get-AtwsHolidaySet', 'Get-AtwsInstalledProduct', 
               'Get-AtwsInstalledProductType', 
               'Get-AtwsInstalledProductTypeUdfAssociation', 
               'Get-AtwsInternalLocation', 'Get-AtwsInventoryItem', 
               'Get-AtwsInventoryItemSerialNumber', 'Get-AtwsInventoryLocation', 
               'Get-AtwsInventoryTransfer', 'Get-AtwsInvoice', 'Get-AtwsInvoiceInfo', 
               'Get-AtwsInvoiceTemplate', 'Get-AtwsNotificationHistory', 
               'Get-AtwsOpportunity', 'Get-AtwsPaymentTerm', 'Get-AtwsPhase', 
               'Get-AtwsPriceListMaterialCode', 'Get-AtwsPriceListProduct', 
               'Get-AtwsPriceListRole', 'Get-AtwsPriceListService', 
               'Get-AtwsPriceListServiceBundle', 
               'Get-AtwsPriceListWorkTypeModifier', 'Get-AtwsProduct', 
               'Get-AtwsProductVendor', 'Get-AtwsProject', 'Get-AtwsProjectCost', 
               'Get-AtwsProjectNote', 'Get-AtwsPurchaseApproval', 
               'Get-AtwsPurchaseOrder', 'Get-AtwsPurchaseOrderItem', 
               'Get-AtwsPurchaseOrderReceive', 'Get-AtwsQuote', 'Get-AtwsQuoteItem', 
               'Get-AtwsQuoteLocation', 'Get-AtwsQuoteTemplate', 'Get-AtwsResource', 
               'Get-AtwsResourceRole', 'Get-AtwsResourceRoleDepartment', 
               'Get-AtwsResourceRoleQueue', 'Get-AtwsResourceServiceDeskRole', 
               'Get-AtwsResourceSkill', 'Get-AtwsRole', 'Get-AtwsSalesOrder', 
               'Get-AtwsService', 'Get-AtwsServiceBundle', 
               'Get-AtwsServiceBundleService', 'Get-AtwsServiceCall', 
               'Get-AtwsServiceCallTask', 'Get-AtwsServiceCallTaskResource', 
               'Get-AtwsServiceCallTicket', 'Get-AtwsServiceCallTicketResource', 
               'Get-AtwsServiceLevelAgreementResults', 'Get-AtwsShippingType', 
               'Get-AtwsSkill', 'Get-AtwsSubscription', 'Get-AtwsSubscriptionPeriod', 
               'Get-AtwsSurvey', 'Get-AtwsSurveyResults', 'Get-AtwsTask', 
               'Get-AtwsTaskNote', 'Get-AtwsTaskPredecessor', 
               'Get-AtwsTaskSecondaryResource', 'Get-AtwsTax', 'Get-AtwsTaxCategory', 
               'Get-AtwsTaxRegion', 'Get-AtwsTicket', 
               'Get-AtwsTicketAdditionalContact', 
               'Get-AtwsTicketAdditionalInstalledProduct', 
               'Get-AtwsTicketCategory', 'Get-AtwsTicketCategoryFieldDefaults', 
               'Get-AtwsTicketChangeRequestApproval', 
               'Get-AtwsTicketChecklistItem', 'Get-AtwsTicketCost', 
               'Get-AtwsTicketHistory', 'Get-AtwsTicketNote', 
               'Get-AtwsTicketSecondaryResource', 'Get-AtwsTimeEntry', 
               'Get-AtwsUserDefinedFieldDefinition', 
               'Get-AtwsUserDefinedFieldListItem', 'Get-AtwsWorkTypeModifier', 
               'New-AtwsAccount', 'New-AtwsAccountAlert', 'New-AtwsAccountNote', 
               'New-AtwsAccountPhysicalLocation', 'New-AtwsAccountTeam', 
               'New-AtwsAccountToDo', 'New-AtwsActionType', 'New-AtwsAppointment', 
               'New-AtwsBillingItemApprovalLevel', 'New-AtwsBusinessDivision', 
               'New-AtwsBusinessDivisionSubdivision', 'New-AtwsBusinessLocation', 
               'New-AtwsBusinessSubdivision', 'New-AtwsChangeRequestLink', 
               'New-AtwsClientPortalUser', 'New-AtwsContact', 'New-AtwsContactGroup', 
               'New-AtwsContactGroupContact', 'New-AtwsContract', 
               'New-AtwsContractBlock', 'New-AtwsContractCost', 
               'New-AtwsContractExclusionAllocationCode', 
               'New-AtwsContractExclusionRole', 'New-AtwsContractFactor', 
               'New-AtwsContractMilestone', 'New-AtwsContractNote', 
               'New-AtwsContractRate', 'New-AtwsContractRetainer', 
               'New-AtwsContractRoleCost', 'New-AtwsContractService', 
               'New-AtwsContractServiceAdjustment', 
               'New-AtwsContractServiceBundle', 
               'New-AtwsContractServiceBundleAdjustment', 
               'New-AtwsContractTicketPurchase', 'New-AtwsDepartment', 
               'New-AtwsExpenseItem', 'New-AtwsExpenseReport', 'New-AtwsHoliday', 
               'New-AtwsHolidaySet', 'New-AtwsInstalledProduct', 
               'New-AtwsInstalledProductType', 
               'New-AtwsInstalledProductTypeUdfAssociation', 
               'New-AtwsInventoryItem', 'New-AtwsInventoryItemSerialNumber', 
               'New-AtwsInventoryLocation', 'New-AtwsInventoryTransfer', 
               'New-AtwsOpportunity', 'New-AtwsPaymentTerm', 'New-AtwsPhase', 
               'New-AtwsProduct', 'New-AtwsProductVendor', 'New-AtwsProject', 
               'New-AtwsProjectCost', 'New-AtwsProjectNote', 'New-AtwsPurchaseOrder', 
               'New-AtwsPurchaseOrderItem', 'New-AtwsPurchaseOrderReceive', 
               'New-AtwsQuote', 'New-AtwsQuoteItem', 'New-AtwsQuoteLocation', 
               'New-AtwsResourceRoleDepartment', 'New-AtwsResourceRoleQueue', 
               'New-AtwsResourceServiceDeskRole', 'New-AtwsRole', 'New-AtwsService', 
               'New-AtwsServiceBundle', 'New-AtwsServiceBundleService', 
               'New-AtwsServiceCall', 'New-AtwsServiceCallTask', 
               'New-AtwsServiceCallTaskResource', 'New-AtwsServiceCallTicket', 
               'New-AtwsServiceCallTicketResource', 'New-AtwsSubscription', 
               'New-AtwsTask', 'New-AtwsTaskNote', 'New-AtwsTaskPredecessor', 
               'New-AtwsTaskSecondaryResource', 'New-AtwsTax', 'New-AtwsTaxCategory', 
               'New-AtwsTaxRegion', 'New-AtwsTicket', 
               'New-AtwsTicketAdditionalContact', 
               'New-AtwsTicketAdditionalInstalledProduct', 
               'New-AtwsTicketChangeRequestApproval', 
               'New-AtwsTicketChecklistItem', 'New-AtwsTicketCost', 
               'New-AtwsTicketNote', 'New-AtwsTicketSecondaryResource', 
               'New-AtwsTimeEntry', 'New-AtwsUserDefinedFieldDefinition', 
               'New-AtwsUserDefinedFieldListItem', 
               'Remove-AtwsAccountPhysicalLocation', 'Remove-AtwsAccountTeam', 
               'Remove-AtwsAccountToDo', 'Remove-AtwsActionType', 
               'Remove-AtwsAppointment', 'Remove-AtwsChangeRequestLink', 
               'Remove-AtwsContactGroup', 'Remove-AtwsContactGroupContact', 
               'Remove-AtwsContractCost', 
               'Remove-AtwsContractExclusionAllocationCode', 
               'Remove-AtwsContractExclusionRole', 'Remove-AtwsHoliday', 
               'Remove-AtwsHolidaySet', 'Remove-AtwsInstalledProductType', 
               'Remove-AtwsInstalledProductTypeUdfAssociation', 
               'Remove-AtwsProjectCost', 'Remove-AtwsQuoteItem', 
               'Remove-AtwsServiceBundle', 'Remove-AtwsServiceBundleService', 
               'Remove-AtwsServiceCall', 'Remove-AtwsServiceCallTask', 
               'Remove-AtwsServiceCallTaskResource', 
               'Remove-AtwsServiceCallTicket', 
               'Remove-AtwsServiceCallTicketResource', 'Remove-AtwsSubscription', 
               'Remove-AtwsTaskPredecessor', 'Remove-AtwsTaskSecondaryResource', 
               'Remove-AtwsTicketAdditionalContact', 
               'Remove-AtwsTicketAdditionalInstalledProduct', 
               'Remove-AtwsTicketChangeRequestApproval', 
               'Remove-AtwsTicketChecklistItem', 'Remove-AtwsTicketCost', 
               'Remove-AtwsTicketSecondaryResource', 'Set-AtwsAccount', 
               'Set-AtwsAccountAlert', 'Set-AtwsAccountLocation', 
               'Set-AtwsAccountNote', 'Set-AtwsAccountPhysicalLocation', 
               'Set-AtwsAccountToDo', 'Set-AtwsActionType', 'Set-AtwsAppointment', 
               'Set-AtwsBillingItem', 'Set-AtwsBusinessDivision', 
               'Set-AtwsBusinessDivisionSubdivision', 'Set-AtwsBusinessLocation', 
               'Set-AtwsBusinessSubdivision', 'Set-AtwsClientPortalUser', 
               'Set-AtwsContact', 'Set-AtwsContactGroup', 'Set-AtwsContract', 
               'Set-AtwsContractBlock', 'Set-AtwsContractCost', 
               'Set-AtwsContractFactor', 'Set-AtwsContractMilestone', 
               'Set-AtwsContractNote', 'Set-AtwsContractRate', 
               'Set-AtwsContractRetainer', 'Set-AtwsContractRoleCost', 
               'Set-AtwsContractService', 'Set-AtwsContractServiceBundle', 
               'Set-AtwsContractTicketPurchase', 'Set-AtwsCountry', 
               'Set-AtwsCurrency', 'Set-AtwsDepartment', 'Set-AtwsExpenseItem', 
               'Set-AtwsExpenseReport', 'Set-AtwsHoliday', 'Set-AtwsHolidaySet', 
               'Set-AtwsInstalledProduct', 'Set-AtwsInstalledProductType', 
               'Set-AtwsInstalledProductTypeUdfAssociation', 
               'Set-AtwsInventoryItem', 'Set-AtwsInventoryItemSerialNumber', 
               'Set-AtwsInventoryLocation', 'Set-AtwsInvoice', 'Set-AtwsOpportunity', 
               'Set-AtwsPaymentTerm', 'Set-AtwsPhase', 
               'Set-AtwsPriceListMaterialCode', 'Set-AtwsPriceListProduct', 
               'Set-AtwsPriceListRole', 'Set-AtwsPriceListService', 
               'Set-AtwsPriceListServiceBundle', 
               'Set-AtwsPriceListWorkTypeModifier', 'Set-AtwsProduct', 
               'Set-AtwsProductVendor', 'Set-AtwsProject', 'Set-AtwsProjectCost', 
               'Set-AtwsProjectNote', 'Set-AtwsPurchaseApproval', 
               'Set-AtwsPurchaseOrder', 'Set-AtwsPurchaseOrderItem', 'Set-AtwsQuote', 
               'Set-AtwsQuoteItem', 'Set-AtwsQuoteLocation', 'Set-AtwsResource', 
               'Set-AtwsResourceRoleDepartment', 'Set-AtwsResourceRoleQueue', 
               'Set-AtwsResourceServiceDeskRole', 'Set-AtwsResourceSkill', 
               'Set-AtwsRole', 'Set-AtwsSalesOrder', 'Set-AtwsService', 
               'Set-AtwsServiceBundle', 'Set-AtwsServiceCall', 
               'Set-AtwsSubscription', 'Set-AtwsTask', 'Set-AtwsTaskNote', 
               'Set-AtwsTaskPredecessor', 'Set-AtwsTax', 'Set-AtwsTaxCategory', 
               'Set-AtwsTaxRegion', 'Set-AtwsTicket', 'Set-AtwsTicketCategory', 
               'Set-AtwsTicketChecklistItem', 'Set-AtwsTicketCost', 
               'Set-AtwsTicketNote', 'Set-AtwsTimeEntry', 
               'Set-AtwsUserDefinedFieldDefinition', 
               'Set-AtwsUserDefinedFieldListItem', 'Set-AtwsWorkTypeModifier', 
               'Uninstall-AtwsOldModuleVersion', 'Update-AtwsDiskCache', 
               'Update-AtwsFunctions', 'Update-AtwsManifest'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Autotask', 'Function', 'SOAP'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/officecenter/Autotask/blob/master/LICENSE.md'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/officecenter/Autotask'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = 'https://github.com/officecenter/Autotask/blob/master/README.md'

    } # End of PSData hashtable


} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

