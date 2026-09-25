overlay:
  image: siderolabs/sbc-raspberrypi
  name: rpi_generic
  options:
    configTxtAppend: |-
    {{- if contains "pi-kube-2" .Node.Host }}
      dtoverlay=rpi-poe-plus,poe_fan_temp0=50000,dtparam=poe_fan_temp1=60000,dtparam=poe_fan_temp2=70000,dtparam=poe_fan_temp3=80000
    {{- else }}
      enable_uart=0
      dtparam=i2c_arm=on,i2c_arm=baudrate=400000
      dtparam=i2c1=on
      dtoverlay=gpio-fan,gpiopin=14,temp=60000
      dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up
    {{- end }}
customization:
  systemExtensions:
    officialExtensions:
      - siderolabs/iscsi-tools
      - siderolabs/nfs-utils
      - siderolabs/util-linux-tools
      - siderolabs/vc4

