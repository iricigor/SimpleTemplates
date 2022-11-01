using System;
using System.IO;
using System.Management.Automation;
using System.Management.Automation.Runspaces;

namespace SimpleTemplates
{

    public static class Util {

        public static string CurrentDirectory(this PSCmdlet cmdlet) {
            return cmdlet.GetUnresolvedProviderPathFromPSPath(cmdlet.SessionState.Path.CurrentFileSystemLocation.ToString());
            // using GetUnresolved... creates unexpected output in Verbose stream, but it is required in File IO operations
        }

        public static void CreateFileFromTemplate(this PSCmdlet cmdlet, string TemplateFileName, string FunctionName) {
            string FileName = Path.Combine(cmdlet.CurrentDirectory(),$"{FunctionName}.ps1");
            if (File.Exists(FileName)) {
                cmdlet.WriteWarning($"File {FileName} exists");
            } else {
                cmdlet.WriteVerbose($"Creating file {FileName}...");
                File.Create(FileName).Dispose();
                cmdlet.WriteVerbose($"Created {FileName}");
                foreach (string line in File.ReadLines(TemplateFileName)) {
                    File.AppendAllText(FileName, line.Replace("$1", FunctionName) + Environment.NewLine);
                }
            }
        }
    }


}
