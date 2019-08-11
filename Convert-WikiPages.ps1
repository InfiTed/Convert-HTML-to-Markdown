# Script to convert Atlassian HTML wiki pages into GitHub Flavored Markdown
# This requires PanDoc to be installed on your machine

# These file paths must have a trailing \
$Dir = "C:\filepath\for\files\to\be\converted\"
$Destination = "C:\filepath\for\converted\files\"

# Powershell is Powershell so you've got to get all the files into an object and store it in a variable
$files = Get-ChildItem $Dir -Filter *.html

# For Loop 
ForEach ($file in $files) {
    # Make sure the filename and path is proper and store in a variable
    $start = $Dir + $file
    # Same for the destination
    $end = $Destination + $file + '.md'

    # Build the CLI command for Pandoc and store in a variable
    $command = 'pandoc ' + $start + ' -f html -t gfm -s -o ' + $end
    # Execute the command
    Invoke-Expression $command
}