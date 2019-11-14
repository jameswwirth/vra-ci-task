                           _______    _______    _______    _______     _______
                          |__   __|  /  ___  \  |__   __|  /  ___  \   |  ___  \
                             | |     | |   | |     | |     | |   |_|   | |___| |
                             | |     | |   | |     | |     | |         |  _____/
                             | |     | |   | |     | |     | |    _    | |
                           __| |__   | |___| |     | |     | |___| |   | |
                          |_______|  \_______/     |_|     \_______/   |_|
---------------------------------------------------------------------------------------------------------

IMPORTANT:
1. The Package Management CLI tool comes precompiled and requires no installation. This means the package-cli
executable cannot be executed from anywhere and would require you to specify the path to it. You could add
the path to the package-cli tool to your PATH environmental variable to fix this. The explanations bellow
will assume you've done so and the tool can be invoked without specifying it's full path.

2. The supplied example yaml file contains relative file paths in the attachments item.

HOW TO CREATE AN IOTC PACKAGE

An iotc package is a custom binary file with the ".iotcp" extension. To create one, the package-cli tool
needs a specification. This specification is contained in a yaml file. In the provided example, that is
the package-spec.yml file inside the example-iotc-package directory. The structure of this file, it's
content and explanations for each attribute it can contain are explained under the
PACKAGE SPECIFICATION YAML FILE section.

Example:

1. Open a terminal
2. Write the command
   > package-cli package create <full path to example-iotc-package yaml file>

This creates an iotc package in the current working directory of the terminal, using the instructions
in the supplied yaml file.

There is one optional flag:
	-o, --output sets the output path for the package that will be created

The agent extracts the files from the payload using the installPaths you've supplied in the yaml
specification file.

HOW TO UPLOAD AN IOTC PACKAGE

Once you've created your iotc package, you can use the tool to upload it to Pulse.
For that you would also need the address to your Pulse IoT Center instance.

Example:

1. Open a terminal
2. Write the commands
   > package-cli upload package <full path to iotc package> http://<Pulse IoT Center host address>

After a successful upload, the uploaded package's UUID is printed to the console.

PACKAGE SPECIFICATION YAML FILE

An iotc package is a binary file containing the software binaries, optional supporting scripts/executables,
and other metadata used by the agent and/or other third party applications/scripts for things like validation,
integrity checks, installation etc. Iotc packages also have a specific internal structure. The packaging
tool needs some "instructions", or specifications, to adhere to this structure and create this metadata.
These specifications are written in a yaml file. For more information about the syntax of yaml files
you can visit https://yaml.org/.

Items in the sample package yaml file (package-spec.yml):

package - It contains all the required data for the package and is mandatory.
          There should be only one such item in a file.
   * name - The name of the package. It is used in the construction of the package's whole name.

   * version - The version of the package. Also used in the package's name.

   os - The targeted os for this package.
        If it is not set, the tool will try to get the OS of the machine which is building the package.
        If it is unable, it will set it to noos.

   architecture - The targeted os for this package.
                  If it is not set, the tool will try to get the OS of the machine which is building the package.
                  If it is unable, it will set it to noarch.

   manifest - Contains information for the manifest file.
      lifecycle - A list of all the phases the campaign goes through and their corresponding action.
         phase - one of: verify, execute, validate, activate, reset. If a phase is included, it is
                 required to have a corresponding action.

         action - A path to an executable file that would perform tasks that are required for the current
                  phase (eg. verify the downloaded content, set the environment and execute an installer,
                  validate the installation was successful etc.). You can write any valid path here. If you
                  want to execute an attachment from the package itself, this path must match the installPath
                  of the attachment.

      headlessExecution - Boolean flag (true or false). It modifies the execution behaviour during the
                          lifecycle of the campaign.
                          If it's true, the agent will automatically go through the lifecycles, calling any
                          supporting scripts supplied in the lifecycle section ( if any are supplied).
                          If it's false, the lifecycles are managed by a third party application, built
                          using the supplied SDK.

   attachments - Represents a list of of all the files that will be added in the package.
                 Here you would also add your extra executable files for the lifecycle phases.
      path - This represents the path to the attachment on the machine you are building the package.
      installPath - This represents the full path where the attachment will be installed on the gateway by
                    the agent. As a full path it SHOULD END WITH a file name.

Items marked with * are mandatory
