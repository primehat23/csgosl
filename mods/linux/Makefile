#Linux
TARGET=linux
include ../common.mk
METAMOD_HOME_URL="http://www.metamodsource.net/"
METAMOD_URL="http://www.gsptalk.com/mirror/sourcemod/mmsource-1.10.6-linux.tar.gz"
METAMOD_VERSION="1.10.6"
SOURCEMOD_HOME_URL="http://www.sourcemod.net/"
SOURCEMOD_URL="http://www.sourcemod.net/smdrop/1.7/sourcemod-1.7.3-git5303-linux.tar.gz"
SOURCEMOD_VERSION="1.7.3-git5303"
export

all: mods

contribs:
	@echo "$(TARGET) metamod $(METAMOD_VERSION) $(METAMOD_HOME_URL) $(METAMOD_URL)"
	@echo "$(TARGET) sourcemod $(SOURCEMOD_VERSION) $(SOURCEMOD_HOME_URL) $(SOURCEMOD_URL)"
	$(MAKE) -C ../mods/franug-knifes contrib
	$(MAKE) -C ../mods/franug-weapon-paint contrib

dl-metamod:
	wget $(METAMOD_URL) -O metamod.tar.gz

dl-sourcemod:
	wget $(SOURCEMOD_URL) -O sourcemod.tar.gz

mods: dl-metamod dl-sourcemod
	\rm -rf $(MODS_ROOT) mods*.zip >/dev/null 2>&1
	mkdir -p $(MODS_ROOT)
	(cd $(MODS_ROOT) ; tar xzvpf ../metamod.tar.gz)	
	(cd $(MODS_ROOT) ; tar xzvpf ../sourcemod.tar.gz)
	(cd $(MODS_ROOT) ; zip -r ../mods.zip *)
	\rm -rf $(MODS_ROOT) >/dev/null 2>&1
	mkdir -p $(MODS_ROOT)
	$(MAKE) -C ../mods/franug-knifes
	$(MAKE) -C ../mods/franug-weapon-paint
	(cd $(MODS_ROOT) ; zip -r ../mods-risky.zip *)
	\rm -rf $(MODS_ROOT) >/dev/null 2>&1

clean:
	$(MAKE) -C ../mods/franug-knifes clean
	$(MAKE) -C ../mods/franug-weapon-paint clean
	\rm -f metamod.tar.gz sourcemod.tar.gz mods*.zip

