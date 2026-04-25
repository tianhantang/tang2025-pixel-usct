#!/usr/bin/env pwsh
<#
	@brief: create PDF file from the text source of manuscript

	@details:
	1. Call external script `mmd2latex.ps1` to convert custom markup (.mmd) text to LaTeX
	2. Insert the converted text into the LaTeX manuscript at the anchor point.
		2.1 Find the anchor point in the form `@anchor:tag`
		2.2 Insert the converted text after the anchor point
	3. Run the LaTeX command to create the PDF file.

	@date
	- created on 2024-03-08
	- updated on 2024-05-05
#>

# Read manuscript
$file_list = @(
	"t01_abstract.txt",
	"t02_introduction.txt",
	"t03_method_p1.txt",
	"t04_method_p2.txt",
	"t05_method_p3.txt",
	"t06_result_p1.txt",
	"t07_result_p2.txt",
	"t08_result_p3.txt",
	"t09_discussion_p1.txt",
	"t10_discussion_p2.txt",
	"t12_conclusion.txt",
	"t13_reference.txt"
)

foreach ($file_name in $file_list) {

	# Use file name to determine anchor point
	$identifier = $file_name -replace '^(t\d{2}).*', '$1'

	# Convert mmd to latex and store in a variable
	Set-Item -Path "variable:$identifier" -Value (
		./mmd2latex/mmd2latex.ps1 $file_name
	)

}

# Read the latex template
$latex_template = Get-Content -Path "./tex/u2025_ast_gen.tex"

# Insert the converted text into the latex template
$output = @()
foreach ($line in $latex_template) {
	if ($line -match '^@anchor:(?<id>\w[\w/_\-]+)$') {
		if (Test-Path "variable:$($Matches['id'])") {
			$output += (Get-Item -Path "variable:$($Matches['id'])").Value
		} else {
			$output += $line
		}
	} else {
		$output += $line
	}
}

$output > "./tex/u2025_ast.tex"

# Call latex command to create the PDF file
cd ./tex
latex u2025_ast.tex
latex u2025_ast.tex  # run a second time to resolve references
dvipdf ./u2025_ast.dvi
open u2025_ast.pdf

cd ..
