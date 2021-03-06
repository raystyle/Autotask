﻿#Requires -Version 4.0
<#

.COPYRIGHT
Copyright (c) Office Center Hønefoss AS. All rights reserved. Based on code from Jan Egil Ring (Crayon). Licensed under the MIT license.
See https://github.com/officecenter/Autotask/blob/master/LICENSE.md for license information.

#>
Function Get-AtwsInvoiceTemplate
{


<#
.SYNOPSIS
This function get one or more InvoiceTemplate through the Autotask Web Services API.
.DESCRIPTION
This function creates a query based on any parameters you give and returns any resulting objects from the Autotask Web Services Api. By default the function returns any objects with properties that are Equal (-eq) to the value of the parameter. To give you more flexibility you can modify the operator by using -NotEquals [ParameterName[]], -LessThan [ParameterName[]] and so on.

Possible operators for all parameters are:
 -NotEquals
 -GreaterThan
 -GreaterThanOrEqual
 -LessThan
 -LessThanOrEquals 

Additional operators for [String] parameters are:
 -Like (supports * or % as wildcards)
 -NotLike
 -BeginsWith
 -EndsWith
 -Contains

Properties with picklists are:

GroupBy
 

ItemizeItemsInEachGroup
 

SortBy
 

PageLayout
 

PageNumberFormat
 

DateFormat
 

NumberFormat
 

TimeFormat
 

Entities that have fields that refer to the base entity of this CmdLet:

Account
 Country
 Invoice

.INPUTS
Nothing. This function only takes parameters.
.OUTPUTS
[Autotask.InvoiceTemplate[]]. This function outputs the Autotask.InvoiceTemplate that was returned by the API.
.EXAMPLE
Get-AtwsInvoiceTemplate -Id 0
Returns the object with Id 0, if any.
 .EXAMPLE
Get-AtwsInvoiceTemplate -InvoiceTemplateName SomeName
Returns the object with InvoiceTemplateName 'SomeName', if any.
 .EXAMPLE
Get-AtwsInvoiceTemplate -InvoiceTemplateName 'Some Name'
Returns the object with InvoiceTemplateName 'Some Name', if any.
 .EXAMPLE
Get-AtwsInvoiceTemplate -InvoiceTemplateName 'Some Name' -NotEquals InvoiceTemplateName
Returns any objects with a InvoiceTemplateName that is NOT equal to 'Some Name', if any.
 .EXAMPLE
Get-AtwsInvoiceTemplate -InvoiceTemplateName SomeName* -Like InvoiceTemplateName
Returns any object with a InvoiceTemplateName that matches the simple pattern 'SomeName*'. Supported wildcards are * and %.
 .EXAMPLE
Get-AtwsInvoiceTemplate -InvoiceTemplateName SomeName* -NotLike InvoiceTemplateName
Returns any object with a InvoiceTemplateName that DOES NOT match the simple pattern 'SomeName*'. Supported wildcards are * and %.
 .EXAMPLE
Get-AtwsInvoiceTemplate -GroupBy <PickList Label>
Returns any InvoiceTemplates with property GroupBy equal to the <PickList Label>. '-PickList' is any parameter on .
 .EXAMPLE
Get-AtwsInvoiceTemplate -GroupBy <PickList Label> -NotEquals GroupBy 
Returns any InvoiceTemplates with property GroupBy NOT equal to the <PickList Label>.
 .EXAMPLE
Get-AtwsInvoiceTemplate -GroupBy <PickList Label1>, <PickList Label2>
Returns any InvoiceTemplates with property GroupBy equal to EITHER <PickList Label1> OR <PickList Label2>.
 .EXAMPLE
Get-AtwsInvoiceTemplate -GroupBy <PickList Label1>, <PickList Label2> -NotEquals GroupBy
Returns any InvoiceTemplates with property GroupBy NOT equal to NEITHER <PickList Label1> NOR <PickList Label2>.
 .EXAMPLE
Get-AtwsInvoiceTemplate -Id 1234 -InvoiceTemplateName SomeName* -GroupBy <PickList Label1>, <PickList Label2> -Like InvoiceTemplateName -NotEquals GroupBy -GreaterThan Id
An example of a more complex query. This command returns any InvoiceTemplates with Id GREATER THAN 1234, a InvoiceTemplateName that matches the simple pattern SomeName* AND that has a GroupBy that is NOT equal to NEITHER <PickList Label1> NOR <PickList Label2>.


#>

  [CmdLetBinding(DefaultParameterSetName='Filter', ConfirmImpact='None')]
  Param
  (
# A filter that limits the number of objects that is returned from the API
    [Parameter(
      Mandatory = $true,
      ValueFromRemainingArguments = $true,
      ParameterSetName = 'Filter'
    )]
    [ValidateNotNullOrEmpty()]
    [String[]]
    $Filter,

# Follow this external ID and return any external objects
    [Parameter(
      ParameterSetName = 'Filter'
    )]
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [Alias('GetRef')]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('PaymentTerms')]
    [String]
    $GetReferenceEntityById,

# Return entities of selected type that are referencing to this entity.
    [Parameter(
      ParameterSetName = 'Filter'
    )]
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [Alias('External')]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('Invoice:InvoiceEditorTemplateID', 'Country:InvoiceTemplateID', 'Account:InvoiceTemplateID')]
    [String]
    $GetExternalEntityByThisEntityId,

# Return all objects in one query
    [Parameter(
      ParameterSetName = 'Get_all'
    )]
    [Switch]
    $All,

# Do not add descriptions for all picklist attributes with values
    [Parameter(
      ParameterSetName = 'Filter'
    )]
    [Parameter(
      ParameterSetName = 'Get_all'
    )]
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [Switch]
    $NoPickListLabel,

# Invoice Template ID
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [long[]]
    $id,

# Display Tax Category
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $DisplayTaxCategory,

# Display Tax Category Superscripts
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $DisplayTaxCategorySuperscripts,

# Display Separate Line Item For Each Tax
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $DisplaySeparateLineItemForEachTax,

# Group By
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $GroupBy,

# Itemize Items In Each Group
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $ItemizeItemsInEachGroup,

# Sort By
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $SortBy,

# Itemize Services And Bundles
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $ItemizeServicesAndBundles,

# Display Zero Amount Recurring Services And Bundles
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $DisplayZeroAmountRecurringServicesAndBundles,

# Display Labor Associated With Recurring Service Contracts
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $DisplayRecurringServiceContractLabor,

# Display Labor Associated With Fixed Price Contracts
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $DisplayFixedPriceContractLabor,

# Rate Cost Expression
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateLength(1,50)]
    [string[]]
    $RateCostExpression,

# Covered By Recurring Service Fixed Price Per Ticket Contract Label
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateLength(1,50)]
    [string[]]
    $CoveredByRecurringServiceFixedPricePerTicketContractLabel,

# Covered By Block Retainer Contract Label
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateLength(1,50)]
    [string[]]
    $CoveredByBlockRetainerContractLabel,

# Non Billable Labor Label
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateLength(1,50)]
    [string[]]
    $NonBillableLaborLabel,

# Page Layout
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $PageLayout,

# Payment Terms
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $PaymentTerms,

# Display Page Number Format
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $PageNumberFormat,

# Date Format
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $DateFormat,

# Number Format
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $NumberFormat,

# Time Format
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int[]]
    $TimeFormat,

# Name
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(1,50)]
    [string[]]
    $Name,

# Show Grid Header
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $ShowGridHeader,

# Show Vertical Grid Lines
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [boolean[]]
    $ShowVerticalGridLines,

# Currency Positive Pattern
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(1,10)]
    [string[]]
    $CurrencyPositiveFormat,

# Currency Negative Pattern
    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(1,10)]
    [string[]]
    $CurrencyNegativeFormat,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'DisplayTaxCategory', 'DisplayTaxCategorySuperscripts', 'DisplaySeparateLineItemForEachTax', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'ItemizeServicesAndBundles', 'DisplayZeroAmountRecurringServicesAndBundles', 'DisplayRecurringServiceContractLabor', 'DisplayFixedPriceContractLabor', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'ShowGridHeader', 'ShowVerticalGridLines', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $NotEquals,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'DisplayTaxCategory', 'DisplayTaxCategorySuperscripts', 'DisplaySeparateLineItemForEachTax', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'ItemizeServicesAndBundles', 'DisplayZeroAmountRecurringServicesAndBundles', 'DisplayRecurringServiceContractLabor', 'DisplayFixedPriceContractLabor', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'ShowGridHeader', 'ShowVerticalGridLines', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $IsNull,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'DisplayTaxCategory', 'DisplayTaxCategorySuperscripts', 'DisplaySeparateLineItemForEachTax', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'ItemizeServicesAndBundles', 'DisplayZeroAmountRecurringServicesAndBundles', 'DisplayRecurringServiceContractLabor', 'DisplayFixedPriceContractLabor', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'ShowGridHeader', 'ShowVerticalGridLines', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $IsNotNull,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $GreaterThan,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $GreaterThanOrEquals,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $LessThan,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('id', 'GroupBy', 'ItemizeItemsInEachGroup', 'SortBy', 'RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'PageLayout', 'PaymentTerms', 'PageNumberFormat', 'DateFormat', 'NumberFormat', 'TimeFormat', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $LessThanOrEquals,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $Like,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $NotLike,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $BeginsWith,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $EndsWith,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [ValidateSet('RateCostExpression', 'CoveredByRecurringServiceFixedPricePerTicketContractLabel', 'CoveredByBlockRetainerContractLabel', 'NonBillableLaborLabel', 'Name', 'CurrencyPositiveFormat', 'CurrencyNegativeFormat')]
    [String[]]
    $Contains,

    [Parameter(
      ParameterSetName = 'By_parameters'
    )]
    [String[]]
    $IsThisDay
  )

  Begin
  { 
    $EntityName = 'InvoiceTemplate'
    
    # Enable modern -Debug behavior
    If ($PSCmdlet.MyInvocation.BoundParameters['Debug'].IsPresent) {$DebugPreference = 'Continue'}
    
    Write-Debug ('{0}: Begin of function' -F $MyInvocation.MyCommand.Name)
        
    # Set up TimeZone offset handling
    If (-not($script:ESTzone)) {
      $script:ESTzone = [System.TimeZoneInfo]::FindSystemTimeZoneById("Eastern Standard Time")
    }
    
    If (-not($script:ESToffset)) {
      $Now = Get-Date
      $ESTtime = [System.TimeZoneInfo]::ConvertTimeFromUtc($Now.ToUniversalTime(), $ESTzone)

      $script:ESToffset = (New-TimeSpan -Start $ESTtime -End $Now).TotalHours
    }
  }


  Process
  {
    If ($PSCmdlet.ParameterSetName -eq 'Get_all')
    { 
      $Filter = @('id', '-ge', 0)
    }
    ElseIf (-not ($Filter)) {
    
      Write-Debug ('{0}: Query based on parameters, parsing' -F $MyInvocation.MyCommand.Name)
      
      # Convert named parameters to a filter definition that can be parsed to QueryXML
      $Filter = ConvertTo-AtwsFilter -BoundParameters $PSBoundParameters -EntityName $EntityName
    }
    Else {
      
      Write-Debug ('{0}: Query based on manual filter, parsing' -F $MyInvocation.MyCommand.Name)
              
      # $Filter is usually passed as a flat string. Convert it to an array.
      If ($Filter.Count -eq 1 -and $Filter -match ' ' )
      { 
        # First, make sure it is a single string and replace parenthesis with our special operator
        $Filter = $Filter -join ' ' -replace '\(',' -begin ' -replace '\)', ' -end '
    
        # Removing double possible spaces we may have introduced
        Do {$Filter = $Filter -replace '  ',' '}
        While ($Filter -match '  ')

        # Split back in to array, respecting quotes
        $Words = $Filter.Trim().Split(' ')
        [String[]]$Filter = @()
        $Temp = @()
        Foreach ($Word in $Words)
        {
          If ($Temp.Count -eq 0 -and $Word -match '^[\"\'']')
          {
            $Temp += $Word.TrimStart('"''')
          }
          ElseIf ($Temp.Count -gt 0 -and $Word -match "[\'\""]$")
          {
            $Temp += $Word.TrimEnd("'""")
            $Filter += $Temp -join ' '
            $Temp = @()
          }
          ElseIf ($Temp.Count -gt 0)
          {
            $Temp += $Word
          }
          Else
          {
            $Filter += $Word
          }
        }
      }
      
      Write-Debug ('{0}: Checking query for variables that have survived as string' -F $MyInvocation.MyCommand.Name)
      
      $NewFilter = @()
      Foreach ($Word in $Filter)
      {
        $Value = $Word
        # Is it a variable name?
        If ($Word -match '^\$\{?(\w+:)?(\w+)\}?(\.\w[\.\w]+)?$')
        {
          # If present, first group is SCOPE. In the context of this function, the only possible scope
          # is Global; Script = the module, local is internal to this function.
          $Scope = 'Global' # or numbered scope 2
        
          # The variable name MUST be present
          $VariableName = $Matches[2]

          # A property tail CAN be present
          $PropertyTail = $Matches[3]
        
          # Check that the variable exists
          $Variable = Try
          { Get-Variable -Name $VariableName -Scope $Scope -ValueOnly -ErrorAction Stop }
          Catch
          {
            Write-Error ('{0}: Could not find any variable called ${1}. Is it misspelled or has it not been set yet?' -f $MyInvocation.MyCommand.Name, $VariableName)
            # Force stop of calling script, because this will completely break the query
            Return
          }

          # Test if the variable "Variable" has been set
          If (Test-Path Variable:Variable) {
            Write-Debug ('{0}: Substituting {1} for its value' -F $MyInvocation.MyCommand.Name, $Word)
            If ($PropertyTail) {
              # Add properties back 
              $Expression = '$Variable{0}' -F $PropertyTail
  
              # Invoke-Expression is considered risky from an SQL injection kind of perspective. But by only
              # permitting a .dot separated string of [a-zA-Z0-9_] we are PROBABLY safe...
              $Value = Invoke-Expression -Command $Expression
            }
            Else {
              $Value = $Variable
            }
            If ($Value -eq $Null) {
              Write-Error ('{0}: Could not find any variable called {1}. Is it misspelled or has it not been set yet?' -F $MyInvocation.MyCommand.Name, $Expression)
              # Force stop of calling script, because this will completely break the query
              Return
            }
            Else { 
              # Normalize dates. Important to avoid QueryXML problems
              If ($Value.GetType().Name -eq 'DateTime')
              {[String]$Value = ConvertTo-AtwsDate -ParameterName $NewFilter[-2] -DateTime $Value}
            }
          }
        }
        $NewFilter += $Value
      }
    } 

    $Result = Get-AtwsData -Entity $EntityName -Filter $Filter

    Write-Verbose ('{0}: Number of entities returned by base query: {1}' -F $MyInvocation.MyCommand.Name, $Result.Count)
    
    # Datetimeparameters
    $DateTimeParams = $Fields.Where({$_.Type -eq 'datetime'}).Name
    
    # Expand UDFs by default
    Foreach ($Item in $Result)
    {
      # Any userdefined fields?
      If ($Item.UserDefinedFields.Count -gt 0)
      { 
        # Expand User defined fields for easy filtering of collections and readability
        Foreach ($UDF in $Item.UserDefinedFields)
        {
          # Make names you HAVE TO escape...
          $UDFName = '#{0}' -F $UDF.Name
          Add-Member -InputObject $Item -MemberType NoteProperty -Name $UDFName -Value $UDF.Value
        }  
      }
      
      # Adjust TimeZone on all DateTime properties
      Foreach ($DateTimeParam in $DateTimeParams) {
      
        # Get the datetime value
        $ParameterValue = $Item.$DateTimeParam
                
        # Skip if parameter is empty
        If (-not ($ParameterValue)) {
          Continue
        }
        
        $TimePresent = $ParameterValue.Hour -gt 0 -or $ParameterValue.Minute -gt 0 -or $ParameterValue.Second -gt 0 -or $ParameterValue.Millisecond -gt 0 
                
        # If this is a DATE it should not be touched
        If ($DateTimeParam -like "*DateTime" -or $TimePresent) {

          # This is DATETIME 
          # We need to adjust the timezone difference 

          # Yes, you really have to ADD the difference
          $ParameterValue = $ParameterValue.AddHours($script:ESToffset)
            
          # Store the value back to the object (not the API!)
          $Item.$DateTimeParam = $ParameterValue
        }
      }
    }
    
    # Should we return an indirect object?
    if ( ($Result) -and ($GetReferenceEntityById))
    {
      Write-Debug ('{0}: User has asked for external reference objects by {1}' -F $MyInvocation.MyCommand.Name, $GetReferenceEntityById)
      
      $Field = $Fields.Where({$_.Name -eq $GetReferenceEntityById})
      $ResultValues = $Result | Where-Object {$null -ne $_.$GetReferenceEntityById}
      If ($ResultValues.Count -lt $Result.Count)
      {
        Write-Warning ('{0}: Only {1} of the {2}s in the primary query had a value in the property {3}.' -F $MyInvocation.MyCommand.Name, 
          $ResultValues.Count,
          $EntityName,
        $GetReferenceEntityById) -WarningAction Continue
      }
      $Filter = 'id -eq {0}' -F $($ResultValues.$GetReferenceEntityById -join ' -or id -eq ')
      $Result = Get-Atwsdata -Entity $Field.ReferenceEntityType -Filter $Filter
    }
    ElseIf ( ($Result) -and ($GetExternalEntityByThisEntityId))
    {
      Write-Debug ('{0}: User has asked for {1} that are referencing this result' -F $MyInvocation.MyCommand.Name, $GetExternalEntityByThisEntityId)
      $ReferenceInfo = $GetExternalEntityByThisEntityId -Split ':'
      $Filter = '{0} -eq {1}' -F $ReferenceInfo[1], $($Result.id -join (' -or {0}id -eq ' -F $ReferenceInfo[1]))
      $Result = Get-Atwsdata -Entity $ReferenceInfo[0] -Filter $Filter
     }
    # Do the user want labels along with index values for Picklists?
    ElseIf ( ($Result) -and -not ($NoPickListLabel))
    {
      Foreach ($Field in $Fields.Where{$_.IsPickList})
      {
        $FieldName = '{0}Label' -F $Field.Name
        Foreach ($Item in $Result)
        {
          $Value = ($Field.PickListValues.Where{$_.Value -eq $Item.$($Field.Name)}).Label
          Add-Member -InputObject $Item -MemberType NoteProperty -Name $FieldName -Value $Value -Force
          
        }
      }
    }
  }

  End
  {
    Write-Debug ('{0}: End of function' -F $MyInvocation.MyCommand.Name)
    If ($Result)
    {
      Return $Result
    }
  }


}
