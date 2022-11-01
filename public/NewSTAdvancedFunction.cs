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

        protected override void BeginProcessing()
        {
            // check if template file exists
            if (!(File.Exists(TemplateFileName))) {
                throw new FileNotFoundException("Template file not found", TemplateFileName);
            }
            WriteVerbose($"Using template file {TemplateFileName}");
        }

        protected override void ProcessRecord()
        {
            foreach (string F1 in FunctionName) {
                Util.CreateFileFromTemplate(this, TemplateFileName, F1);
            }
        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
}
