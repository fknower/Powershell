#ResOne Kill
Stop-Process -processname res
Stop-Process -processname resop
Stop-Process -processname ResPesvc64

Stop-Process -Processname IGStub
Stop-Process -Processname igfxEM
Stop-Process -Processname igfxHK

Stop-Process -Processname guardian

#AppV
Stop-Process -Processname AppVClient
Stop-Process -Processname AppVStreamingUX
