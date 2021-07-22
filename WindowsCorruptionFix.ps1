#Attempts to run an SFC scan in order to repair files
#If the first SFC scan fails, it will attempt a deeper repair by running the DISM scan and then a second SFC scan to clean up.

sfc /scannow
$confirmation = Read-Host "Did the scan complete successfully? (y/n):"
if ($confirmation -eq 'n') {
    # proceed
    Dism /Online /Cleanup-Image /RestoreHealth
    sfc /scannow
}
