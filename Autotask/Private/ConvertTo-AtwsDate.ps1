<#

    .COPYRIGHT
    Copyright (c) Office Center Hønefoss AS. All rights reserved. Licensed under the MIT license.
    See https://github.com/officecenter/Autotask/blob/master/LICENSE.md  for license information.

#>

Function ConvertTo-AtwsDate {
  <#
      .SYNOPSIS
      This function converts a datetime object to a string representation of the datetime object that is 
      compatible with the Autotask Web Services API.
      .DESCRIPTION
      There are two challenges with the Autotask Web Services API: There is a single DateTime property type
      that is used for both date fields and datetime fields. This becomes a challenge when you factor in
      that the API always uses the EST timezone, but most users expect DateTime to be treated in their local
      Timezone. This function takes both the DateTime object and the parameter name, because the parameter
      name is the only clue as to whether this property should be treated as a Date or a full DateTime value. 
      .INPUTS
      [DateTime]
      .OUTPUTS
      [String]
      .EXAMPLE
      $Element | ConvertTo-AtwsDate -ParameterName <ParameterName>
      Converts variable $Element with must contain a single DateTime value to a string representation of the 
      Date or the DateTime, based on the parameter name.
      .NOTES
      NAME: ConvertTo-AtwsDate
      
  #>
  [cmdletbinding()]
  Param
  (
    [Parameter(
        Mandatory = $True,
        ValueFromPipeline = $True
    )]
    [DateTime]
    $DateTime,

    [Parameter(
        Mandatory = $True
    )]
    [String]
    $ParameterName
  )

  Begin {
    # Is the clock set?
    $TimePresent = $DateTime.Hour -gt 0 -or $DateTime.Minute -gt 0 -or $DateTime.Second -gt 0 -or $DateTime.Millisecond -gt 0 
  }

  Process {
    If ($ParameterName -like "*DateTime" -or $TimePresent) {
      # Use local time for DateTime
      $OffsetSpan = (Get-TimeZone).BaseUtcOffset
      
      # Create the correct text string                           
      $Offset = '{0:00}:{1:00}' -F $OffsetSpan.Hours, $OffsetSpan.Minutes
      If ($OffsetSpan.Hours -ge 0) {
        $Offset = '+{0}' -F $Offset
      }
      $Value = '{0}{1}' -F $(Get-Date $DateTime -Format s), $Offset
    }
    Else { 
      # Get the date, not the full datetime object, format yyyy-mm-dd
      $Value = Get-Date $DateTime.Date -UFormat "%Y-%m-%d"
    }
  }

  End {
    Return $Value
  }
}