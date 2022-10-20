using System;
using System.IO;
using System.Management.Automation;
using System.Management.Automation.Runspaces;

namespace SimpleTemplates
{
    [Cmdlet(VerbsCommon.New, "STFunction" )]
    [OutputType(typeof(string))]
    public class TestSampleCmdletCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string FunctionName { get; set; }


        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
            WriteVerbose("Begin!");
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            string FileName = $"{FunctionName}.ps1";
            if (File.Exists(FileName)) {
                WriteWarning($"File {FileName} exists");
            }
            else {
                WriteVerbose($"Creating file {FileName}...");
                File.Create(FileName).Dispose();
                WriteVerbose($"Created {FileName}");
            }

            // check if template file exists
            string TemplateFileName = "templates/Function.ps1t";
            if (File.Exists(TemplateFileName)) {
                WriteVerbose($"Template file {TemplateFileName} exists");
                foreach (string line in File.ReadLines(TemplateFileName)) {
                    File.AppendAllText(FileName, line.Replace("$1", FunctionName) + Environment.NewLine);
                }
            }
            else {
                WriteWarning($"Template file {TemplateFileName} does not exist");
            }

        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
}
