# A handy way to run a command, and automatically throw an error if the exit code is non-zero.
function Invoke-NativeCommand()
{
    if ($args.Count -eq 0)
	{
        throw "Must supply some arguments."
    }

    $command = $args[0]
    $commandArgs = @()
    if ($args.Count -gt 1)
	{
        $commandArgs = $args[1..($args.Count - 1)]
    }

    & $command $commandArgs
    $result = $LASTEXITCODE

    if ($result -ne 0)
	{
        throw "$command $commandArgs exited with code $result."
    }
}
