Configuration InstallJDK8
{
    param (
        [string]$JavaVersion = "8",
        [string]$JavaInstallPath = "C:\Program Files\Java"
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node localhost
    {
        # Ensure the Java directory exists
        File JavaFolder {
            DestinationPath = $JavaInstallPath
            Type            = "Directory"
            Ensure          = "Present"
        }

        # Download JDK 8 installer
        Script DownloadJDK {
            GetScript  = {
                @{
                    Result = Test-Path "$using:JavaInstallPath\jdk$using:JavaVersion"
                }
            }
            SetScript  = {
                Invoke-WebRequest -Uri "https://download.oracle.com/otn/java/jdk/8u351-b10/jdk-8u351-windows-x64.exe" `
                    -OutFile "$using:JavaInstallPath\jdk-8u351-windows-x64.exe"
            }
            TestScript = {
                Test-Path "$using:JavaInstallPath\jdk-8u351-windows-x64.exe"
            }
            DependsOn  = "[File]JavaFolder"
        }

        # Install JDK 8
        Script InstallJDK {
            GetScript  = {
                @{
                    Result = Test-Path "$using:JavaInstallPath\jdk$using:JavaVersion"
                }
            }
            SetScript  = {
                Start-Process -FilePath "$using:JavaInstallPath\jdk-8u351-windows-x64.exe" `
                    -ArgumentList "/s" -Wait
            }
            TestScript = {
                Test-Path "$using:JavaInstallPath\jdk$using:JavaVersion"
            }
            DependsOn  = "[Script]DownloadJDK"
        }
    }
}
