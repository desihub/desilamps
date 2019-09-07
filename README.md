desilamps
DESI calibration system software tools

Tools for the DESI calibration system (illumination system on the upper ring + screen).

L. Le Guillou, last updated 2019-09-03

============================================================================================

desi-calib-ctrl: generic tool to control the calibration PDUs. Python script, using
                 the snmptools (snmpget/snmpset/snmptable) which should be installed.
		 It also needs the PDU MIB (in the ./mibs directory).

--------------------------------------------------------------------------------------------

# Examples:

## Getting the status of all the outlets of box DESI-CALIB-02:
```
  ./desi-calib-ctrl DESI-CALIB-02 all

  PDU DESI-CALIB-02 [2]: Continuum-A  [1] OFF
  PDU DESI-CALIB-02 [2]: Continuum-B  [2] OFF
  PDU DESI-CALIB-02 [2]: Continuum-C  [3] OFF
  PDU DESI-CALIB-02 [2]: Cd           [4] OFF
  PDU DESI-CALIB-02 [2]: Xe           [5] OFF
  PDU DESI-CALIB-02 [2]: Ne           [6] OFF
  PDU DESI-CALIB-02 [2]: Kr           [7] OFF
  PDU DESI-CALIB-02 [2]: HgAr         [8] OFF
```

## Getting a full status, with the currents and power usage:
```
  ./desi-calib-ctrl --full DESI-CALIB-02 all

  PDU DESI-CALIB-02 [2]: Continuum-A [1] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  0 Wh
  PDU DESI-CALIB-02 [2]: Continuum-B [2] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy: 39 Wh
  PDU DESI-CALIB-02 [2]: Continuum-C [3] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  6 Wh
  PDU DESI-CALIB-02 [2]: Cd          [4] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  1 Wh
  PDU DESI-CALIB-02 [2]: Xe          [5] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  2 Wh
  PDU DESI-CALIB-02 [2]: Ne          [6] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  4 Wh
  PDU DESI-CALIB-02 [2]: Kr          [7] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  3 Wh
  PDU DESI-CALIB-02 [2]: HgAr        [8] OFF  Curr.: 0.000 A  Act. Power: 0.0 W  Act. Energy:  7 Wh
```

## Turning on the Xenon lamp on box DESI-CALIB-02:
```
  ./desi-calib-ctrl DESI-CALIB-02 Xe on

  PDU DESI-CALIB-02 [2]: Xe           [5] OFF
  PDU DESI-CALIB-02 [2]: Xe           [5]  ON
```

## Turning off the Xenon lamp on box DESI-CALIB-02:
```
  ./desi-calib-ctrl DESI-CALIB-02 Xe off

  PDU DESI-CALIB-02 [2]: Xe           [5]  ON
  PDU DESI-CALIB-02 [2]: Xe           [5] OFF
```

## Getting the temperature & humidity sensors values for DESI-CALIB-02:
```
  ./desi-calib-ctrl DESI-CALIB-02 SENSORS

  PDU DESI-CALIB-02 [2]: SENSORS: 
      SerialNumber  Name                  State                 Value
      AEH7401748    Temperature 1         normal                25.1  degreeC
      AEI7400538    Temperature 2         normal                25.3  degreeC
      AEI7400538    Relative Humidity 1   normal                48.0  percent
      AEH7401747    Temperature 3         normal                24.3  degreeC
```
--------------------------------------------------------------------------------------------

# Usage: 
```
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

```
============================================================================================
