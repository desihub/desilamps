# desilamps
DESI calibration system software tools

Tools for the DESI calibration system (illumination system on the upper ring + screen).

L. Le Guillou, last updated 2019-09-03

============================================================================================

desi-calib-ctrl: generic tool to control the calibration PDUs. Python script, using
                 the snmptools (snmpget/snmpset/snmptable) which should be installed.
		 It also needs the PDU MIB (in the ./mibs directory).

Usage: 
    desi-calib-ctrl [--no-check] [--verbose] [--full] <pdu> [ <outlet> [ON|OFF] | SENSORS ]

    Command-line tool to control the DESI calibration boxes PDUs.
    This command has two modes:

    * Display/change PDU outlet state (turning ON/OFF outlets):

      desi-calib-ctrl <pdu> <outlet> [ON|OFF]

        <pdu> may be:
          A number [0-4]
          A calibration box name: 
              DESI-CALIB-00 to DESI-CALIB-04
          Or the 'all' value.

        <outlet> may be:
          A number [1-8]
          A name in the following device list: 
              Continuum-A
              Continuum-B
              Continuum-C
              Continuum  [ = all continuum lamps ]              
              Cd
              Xe
              Ne
              Kr
              HgAr
              Arcs [ = all arc lamps ]
          Or the 'all' value.

        Without ON/OFF specified, the current outlet state
        will be displayed.

    * Display PDU sensors state:

      desi-calib-ctrl <pdu> SENSORS

        <pdu> may be:
          A number [0-4]
          A calibration box name:
              DESI-CALIB-00 to DESI-CALIB-04
          Or the 'all' value.
    

Options:
  -h, --help      show this help message and exit
  -n, --no-check  Do not check the current state (after action)
  -v, --verbose   Verbose output
  -f, --full      Display all the details (outlet power, current, active
                  energy, etc.)

============================================================================================
