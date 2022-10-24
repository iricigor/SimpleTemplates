using System;
using System.IO;
using System.Management.Automation;
using System.Management.Automation.Runspaces;

namespace SimpleTemplates
{
    [Cmdlet(VerbsCommon.New, "STAdvancedFunction" )]
    [OutputType(typeof(string))]
    public class NewSTAdvancedFunction : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string[] FunctionName { get; set; }
        private const string  TemplateFileName = "templates/AdvancedFunction.ps1t";

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
            // check if template file exists
            if (!(File.Exists(TemplateFileName))) {
                throw new FileNotFoundException("Template file not found", TemplateFileName);
            }
            WriteVerbose($"Using template file {TemplateFileName}");
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            string FileName;
            foreach (string F1 in FunctionName) {
                FileName = $"{F1}.ps1";
                if (File.Exists(FileName)) {
                    WriteWarning($"File {FileName} exists");
                    continue;
                }
                WriteVerbose($"Creating file {FileName}...");
                File.Create(FileName).Dispose();
                WriteVerbose($"Created {FileName}");
                foreach (string line in File.ReadLines(TemplateFileName)) {
                    File.AppendAllText(FileName, line.Replace("$1", F1) + Environment.NewLine);
                }
            }
        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
}
