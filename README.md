# Jira2Flare
Automatically create release notes in MadCap Flare format from a Jira query

## Pre-requisites

The script requires __Curl__, __Java__ and __Saxon__. __Curl__ should already be installed as part of your OS unless you are using a version of Windows earlier than Windows 10. You can get __Java__ from https://java.com/ and you can get __Saxon__ from http://saxon.sourceforge.net/.

The script expects a Jira custom field with the name `Release Notes`. You can edit the XSL to change the information that is pulled from the Jira XML and how it is formatted.

Download the contents of this repository and make sure Saxon is in the Java `CLASSPATH` environment variable.

## Get a Jira API key.

1. In Jira, navigate to __Your profile and settings__ > __Account settings__ > __Security__ and click __Create and manage API tokens__.
2. Click __Create API token__.
3. Enter a __Label__, for example `Jira2Flare` and click __Create__.
4. Click __Copy__ and paste the result into a text editor.
5. Click __Close__.

__Warning__: You should only use this API key within your script. The script should be stored where only you can access it. If you believe your security has been compromised, in Jira navigate to __Create and manage API tokens__, locate the token and click __Revoke__ to deactivate it.

## Get the Jira query

1. In Jira, run the search that returns the release notes for the release version. This is typically filtered by a `fixVersion`. Take note of the `fixVersion` string.
2. From the __Export__ menu, right-click __Export XML__ and click __Copy link address__ then paste the result into a text editor.

## Modify the script

1. Open the `j2f.cmd` (Windows) or `j2f.sh` sciprt.
2. Replace `user@example.com` with the email address you use to access Jira.
3. Replace `APIkey` with the API key you pasted into your text editor.
4. Replace the string in quotes after the API key with the Jira query you pasted into your text editor. Ensure it is in quotes (`"`).
5. If you are using Windows, replace every `%` within the query with `%%`.
6. Locate the `fixVersion` string within the query. For Windows replace it with `%fixversion%`. Otherwise replace it with `$fixversion`.
7. Save your changes.
8. Close the windows in your text editor containing the query and the API key without saving.

## Run the script

In Windows if you have not defined your class path you can copy the script into the Saxon folder and run it there.

1. From the command line, enter `./j2f.sh` or `j2f` (Windows).
2. Enter the `fixVersion`.

The script uses __Curl__ to download the results of your Jira search as an XML file called `input.xml`. It then uses __Saxon__ to run the XSLT transform to create an `output.html` file in MadCap Flare format. You can modify which information is included in the output file by modifying the `j2f.xsl` file.

## Troubleshooting

* Check the email address in the `curl` command.
* Check the API key in the `curl` command has not been revoked.
* (Windows) Check the Jira query does not contain any unexcaped percent characters other than `%fixversion%`.
* Check the `input.xml` file is valid XML. If not the Jira query was not valid.
* If the output is not what you expected, check the `j2f.xsl` file.

