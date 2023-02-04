apt install -y wget p7zip-full libsndfile1

wget -O voicevox_engine.7z https://github.com/VOICEVOX/voicevox_engine/releases/download/0.13.3/linux-cpu.7z.001
7z x voicevox_engine.7z
rm voicevox_engine.7z
mv linux-cpu .voicevox

chmod 755 .voicevox/run
