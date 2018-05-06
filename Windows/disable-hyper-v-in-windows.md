# 关闭 Windows Hyper-V

Unfortunately, you cannot have Hyper-V running and use the emulator.
Here is what you can do:
  1) Start a command prompt as Administrator
  2) Run the following command: C:\Windows\system32> bcdedit /set hypervisorlaunchtype off
  3) Reboot your machine.