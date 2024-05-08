{ config, lib, pkgs, ... }: let
  linuxSurface = pkgs.fetchFromGitHub {
    owner = "linux-surface";
    repo = "linux-surface";
    rev = "03cfcbc7c266acd7f5e1a8ab496e98733298426a";
    hash = "sha256-DVorstcjrA0qrp0wJPdhAaTUKQTnMojW4zEN6P5gWsQ=";
  };
in {

  # boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.callPackage ../../../pkgs/linux-surface {
  #   linux = pkgs.linux_latest;
  # });

  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_latest.override {
    autoModules = false;
    structuredExtraConfig = with lib.kernel; {
      XEN = lib.mkForce no;
      DRM_I915 = module;
      USB_XHCI_HCD = module;
      USB_XHCI_PCI = module;
      USB4 = module;
      USB = yes;
      USB_HID = module;
      MEDIA_SUPPORT = yes;
      MEDIA_CAMERA_SUPPORT = yes;
      MEDIA_USB_SUPPORT = yes;
      USB_VIDEO_CLASS = module;
      USB_STORAGE = module;
      USB_UAS = module;
      HID_GENERIC = module;
      HID_BATTERY_STRENGTH = yes;

      NVME_CORE = module;
      BLK_DEV_NVME = module;
      BLK_DEV_SD = module;

      DRM_AMDGPU = no;
      DRM_NOUVEAU = no;
      XPOWER_PMIC_OPREGION = lib.mkForce unset;
      ZEROPLUS_FF = lib.mkForce unset;

      BTRFS_FS = yes;
      SQUASHFS = yes;
      EXT4_FS = yes;
      EXT3_FS = yes;
      EXT2_FS = yes;
      EXFAT_FS = yes;

      KVM = module;
      KVM_INTEL = module;

      NF_TABLES = module;

      SND_TIMER = module;
      SND_PCM = module;
      SND_HWDEP = module;
      SND_SEQ_DEVICE = module;
      SND_RAWMIDI = module;
      SND_COMPRESS_OFFLOAD = module;
      SND_HRTIMER = module;
      SND_CTL_LED = module;
      SND_SEQUENCER = module;
      SND_SEQ_DUMMY = module;
      SND_SEQ_MIDI_EVENT = module;
      SND_SEQ_MIDI = module;
      SND_HDA = module;
      SND_HDA_INTEL = module;
      SND_HDA_CODEC_REALTEK = module;
      SND_HDA_CODEC_HDMI = module;
      SND_HDA_GENERIC = module;
      SND_HDA_CORE = module;
      SND_HDA_EXT_CORE = module;
      SND_INTEL_DSP_CONFIG = module;
      SND_INTEL_SOUNDWIRE_ACPI = module;
      SND_USB_AUDIO = module;
      SND_SOC = module;
      SND = module;
      SND_SOC_ACPI = module;
      SND_SST_ATOM_HIFI2_PLATFORM = module;
      SND_SST_ATOM_HIFI2_PLATFORM_ACPI = module;
      SND_SOC_ACPI_INTEL_MATCH = module;
      SND_SOC_SOF_PCI_DEV = module;
      SND_SOC_SOF_PCI = module;
      SND_SOC_SOF_DEBUG_PROBES = module;
      SND_SOC_SOF_CLIENT = module;
      SND_SOC_SOF = module;
      SND_SOC_SOF_TOPLEVEL = yes;
      SND_SOC_SOF_INTEL_TOPLEVEL = yes;
      SND_SOC_SOF_HDA_LINK = yes;
      SND_SOC_SOF_HDA_AUDIO_CODEC = yes;
      SND_SOC_SOF_INTEL_COMMON = module;
      SND_SOC_SOF_INTEL_TGL = module;
      SND_SOC_SOF_TIGERLAKE = module;
      SND_SOC_SOF_HDA_COMMON = module;
      SND_SOC_SOF_HDA_MLINK = module;
      SND_SOC_SOF_HDA_LINK_BASELINE = module;
      SND_SOC_SOF_HDA = module;
      SND_SOC_SOF_HDA_PROBES = module;
      SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE = module;
      SND_SOC_SOF_XTENSA = module;
      SND_SOC_I2C_AND_SPI = module;
      SND_SOC_HDAC_HDA = module;

      BT = yes;
      BT_BREDR = yes;
      BT_RFCOMM_TTY = yes;
      BT_LE = yes;
      BT_LE_L2CAP_ECRED = yes;
      BT_DEBUGFS = yes;
      BT_HCIBTUSB_AUTOSUSPEND = yes;
      BT_HCIBTUSB_POLL_SYNC = yes;
      BT_HCIBTUSB_BCM = yes;
      BT_HCIBTUSB_MTK = yes;
      BT_HCIBTUSB_RTL = yes;
      BT_HCIUART_SERDEV = yes;
      BT_HCIUART_H4 = yes;
      BT_HCIUART_BCSP = yes;
      BT_HCIUART_LL = yes;
      BT_HCIUART_QCA = yes;
      BT_RFCOMM = module;
      BT_BNEP = module;
      BT_HIDP = module;
      BT_INTEL = module;
      BT_HCIBTUSB = module;
      BT_HCIUART = module;
      UHID = module;

      SURFACE_PLATFORMS = yes;
      SERIAL_DEV_BUS = yes;
      SURFACE_AGGREGATOR = yes;
      SURFACE_AGGREGATOR_BUS = yes;
      SURFACE_AGGREGATOR_HUB = yes;
      SURFACE_AGGREGATOR_CDEV = yes;
      SURFACE_AGGREGATOR_REGISTRY = yes;
      SURFACE_AGGREGATOR_TABLET_SWITCH = yes;
      SURFACE_DTX = yes;
      SURFACE_PLATFORM_PROFILE = yes;
      SURFACE_HID = yes;
      SURFACE_KBD = yes;
      SURFACE_GPE = yes;
      SENSORS_SURFACE_TEMP = module;
      BATTERY_SURFACE = module;
      CHARGER_SURFACE = module;
      HID_ITHC = module;
      SERIAL_8250_DW = module;
      X86_INTEL_LPSS = yes;
      MFD_INTEL_LPSS_PCI = yes;
      PINCTRL_TIGERLAKE = module;
      HID_MULTITOUCH = module;
      INPUT_UINPUT = module;
      INPUT_SOC_BUTTON_ARRAY = module;
      INPUT_MISC = yes;
      KEYBOARD_GPIO = module;

      IWLWIFI = module;
      IWLMVM = module;

      TCG_TPM = module;
      HW_RANDOM_TPM = yes;
      TCG_TIS = module;
      TCG_CRB = module;
      TRUSTED_KEYS = module;
      TRUSTED_KEYS_TPM = yes;
      DM_CRYPT = module;
      ENCRYPTED_KEYS = module;
      CRYPTO_USER_API_SKCIPHER = module;
      CRYPTO_USER_API_HASH = module;
      CRYPTO_ECB = yes;
      CRYPTO_MD5 = yes;
      CRYPTO_CBC = yes;
      CRYPTO_SHA256 = yes;
      CRYPTO_AES = yes;
      CRYPTO_DES = module;
      CRYPTO_CMAC = yes;
      CRYPTO_HMAC = yes;
      CRYPTO_SHA512 = yes;
      CRYPTO_SHA1_SSSE3 = module;
      CRYPTO_AES_NI_INTEL = module;
      CRYPTO_SHA512_SSSE3 = module;
      CRYPTO_DES3_EDE_X86_64 = module;
      CRYPTO_SHA256_SSSE3 = module;

      NFT_NUMGEN = module;
      NFT_CT = module;
      NFT_FLOW_OFFLOAD = module;
      NFT_CONNLIMIT = module;
      NFT_LOG = module;
      NFT_LIMIT = module;
      NFT_MASQ = module;
      NFT_REDIR = module;
      NFT_NAT = module;
      NFT_TUNNEL = module;
      NFT_QUOTA = module;
      NFT_REJECT = module;
      NFT_REJECT_INET = module;
      NFT_COMPAT = module;
      NFT_HASH = module;
      NFT_FIB = module;
      NFT_FIB_INET = module;
      NFT_XFRM = module;
      NFT_SOCKET = module;
      NFT_OSF = module;
      NFT_TPROXY = module;
      NFT_SYNPROXY = module;
      NFT_DUP_NETDEV = module;
      NFT_FWD_NETDEV = module;
      NFT_FIB_NETDEV = module;
      NFT_REJECT_NETDEV = module;
      NFT_REJECT_IPV4 = module;
      NFT_DUP_IPV4 = module;
      NFT_FIB_IPV4 = module;
      NFT_REJECT_IPV6 = module;
      NFT_DUP_IPV6 = module;
      NFT_FIB_IPV6 = module;
      NFT_BRIDGE_META = module;
      NFT_BRIDGE_REJECT = module;
      BRIDGE = module;
      NF_CONNTRACK = module;
      NF_FLOW_TABLE = module;
      NETFILTER_XT_MATCH_ADDRTYPE = module;
      NETFILTER_XT_MATCH_BPF = module;
      NETFILTER_XT_MATCH_CGROUP = module;
      NETFILTER_XT_MATCH_CLUSTER = module;
      NETFILTER_XT_MATCH_COMMENT = module;
      NETFILTER_XT_MATCH_CONNBYTES = module;
      NETFILTER_XT_MATCH_CONNLABEL = module;
      NETFILTER_XT_MATCH_CONNLIMIT = module;
      NETFILTER_XT_MATCH_CONNMARK = module;
      NETFILTER_XT_MATCH_CONNTRACK = module;
      NETFILTER_XT_MATCH_CPU = module;
      NETFILTER_XT_MATCH_DCCP = module;
      NETFILTER_XT_MATCH_DEVGROUP = module;
      NETFILTER_XT_MATCH_DSCP = module;
      NETFILTER_XT_MATCH_ECN = module;
      NETFILTER_XT_MATCH_ESP = module;
      NETFILTER_XT_MATCH_HASHLIMIT = module;
      NETFILTER_XT_MATCH_HELPER = module;
      NETFILTER_XT_MATCH_HL = module;
      NETFILTER_XT_MATCH_IPCOMP = module;
      NETFILTER_XT_MATCH_IPRANGE = module;
      NETFILTER_XT_MATCH_L2TP = module;
      NETFILTER_XT_MATCH_LENGTH = module;
      NETFILTER_XT_MATCH_LIMIT = module;
      NETFILTER_XT_MATCH_MAC = module;
      NETFILTER_XT_MATCH_MARK = module;
      NETFILTER_XT_MATCH_MULTIPORT = module;
      NETFILTER_XT_MATCH_NFACCT = module;
      NETFILTER_XT_MATCH_OSF = module;
      NETFILTER_XT_MATCH_OWNER = module;
      NETFILTER_XT_MATCH_POLICY = module;
      NETFILTER_XT_MATCH_PKTTYPE = module;
      NETFILTER_XT_MATCH_QUOTA = module;
      NETFILTER_XT_MATCH_RATEEST = module;
      NETFILTER_XT_MATCH_REALM = module;
      NETFILTER_XT_MATCH_RECENT = module;
      NETFILTER_XT_MATCH_SCTP = module;
      NETFILTER_XT_MATCH_SOCKET = module;
      NETFILTER_XT_MATCH_STATE = module;
      NETFILTER_XT_MATCH_STATISTIC = module;
      NETFILTER_XT_MATCH_STRING = module;
      NETFILTER_XT_MATCH_TCPMSS = module;
      NETFILTER_XT_MATCH_TIME = module;
      NETFILTER_XT_MATCH_U32 = module;
      IP_NF_MATCH_RPFILTER = module;
      IP6_NF_MATCH_RPFILTER = module;

      AIC79XX_DEBUG_ENABLE = lib.mkForce unset;
      AIC7XXX_DEBUG_ENABLE = lib.mkForce unset;
      AIC94XX_DEBUG = lib.mkForce unset;
      BRIDGE_VLAN_FILTERING = lib.mkForce unset;
      BXT_WC_PMIC_OPREGION = lib.mkForce unset;
      CEPH_FSCACHE = lib.mkForce unset;
      CEPH_FS_POSIX_ACL = lib.mkForce unset;
      CIFS_DFS_UPCALL = lib.mkForce unset;
      CIFS_FSCACHE = lib.mkForce unset;
      CIFS_UPCALL = lib.mkForce unset;
      CIFS_XATTR = lib.mkForce unset;
      CLS_U32_MARK = lib.mkForce unset;
      CLS_U32_PERF = lib.mkForce unset;
      CROS_EC_ISHTP = lib.mkForce unset;
      DRAGONRISE_FF = lib.mkForce unset;
      DRM_AMDGPU_CIK = lib.mkForce unset;
      DRM_AMDGPU_SI = lib.mkForce unset;
      DRM_AMDGPU_USERPTR = lib.mkForce unset;
      DRM_AMD_ACP = lib.mkForce unset;
      DRM_AMD_DC_FP = lib.mkForce unset;
      DRM_AMD_DC_SI = lib.mkForce unset;
      DRM_AMD_SECURE_DISPLAY = lib.mkForce unset;
      DRM_HYPERV = lib.mkForce unset;
      DRM_I915_GVT = lib.mkForce unset;
      DRM_I915_GVT_KVMGT = lib.mkForce unset;
      DRM_NOUVEAU_GSP_DEFAULT = lib.mkForce unset;
      DRM_NOUVEAU_SVM = lib.mkForce unset;
      EXT2_FS_POSIX_ACL = lib.mkForce unset;
      EXT2_FS_SECURITY = lib.mkForce unset;
      EXT2_FS_XATTR = lib.mkForce unset;
      EXT3_FS_POSIX_ACL = lib.mkForce unset;
      EXT3_FS_SECURITY = lib.mkForce unset;
      FB_3DFX_ACCEL = lib.mkForce unset;
      FB_ATY_CT = lib.mkForce unset;
      FB_ATY_GX = lib.mkForce unset;
      FB_NVIDIA_I2C = lib.mkForce unset;
      FB_RIVA_I2C = lib.mkForce unset;
      FB_SAVAGE_ACCEL = lib.mkForce unset;
      FB_SAVAGE_I2C = lib.mkForce unset;
      FB_SIS_300 = lib.mkForce unset;
      FB_SIS_315 = lib.mkForce unset;
      GREENASIA_FF = lib.mkForce unset;
      HID_ACRUX_FF = lib.mkForce unset;
      HMM_MIRROR = lib.mkForce unset;
      HOLTEK_FF = lib.mkForce unset;
      HSA_AMD = lib.mkForce unset;
      IPV6_FOU_TUNNEL = lib.mkForce unset;
      IP_DCCP_CCID3 = lib.mkForce unset;
      IP_VS_IPV6 = lib.mkForce unset;
      IP_VS_PROTO_AH = lib.mkForce unset;
      IP_VS_PROTO_ESP = lib.mkForce unset;
      IP_VS_PROTO_TCP = lib.mkForce unset;
      IP_VS_PROTO_UDP = lib.mkForce unset;
      JOYSTICK_PSXPAD_SPI_FF = lib.mkForce unset;
      KVM_AMD_SEV = lib.mkForce unset;
      KVM_ASYNC_PF = lib.mkForce unset;
      KVM_GENERIC_DIRTYLOG_READ_PROTECT = lib.mkForce unset;
      L2TP_ETH = lib.mkForce unset;
      L2TP_IP = lib.mkForce unset;
      L2TP_V3 = lib.mkForce unset;
      MEDIA_ANALOG_TV_SUPPORT = lib.mkForce unset;
      MEDIA_ATTACH = lib.mkForce unset;
      MEDIA_CONTROLLER = lib.mkForce unset;
      MEDIA_DIGITAL_TV_SUPPORT = lib.mkForce unset;
      MEDIA_PCI_SUPPORT = lib.mkForce unset;
      MMC_BLOCK_MINORS = lib.mkForce unset;
      MOUSE_ELAN_I2C_SMBUS = lib.mkForce unset;
      MTD_COMPLEX_MAPPINGS = lib.mkForce unset;
      NFSD_V3_ACL = lib.mkForce unset;
      NFSD_V4 = lib.mkForce unset;
      NFSD_V4_SECURITY_LABEL = lib.mkForce unset;
      NINTENDO_FF = lib.mkForce unset;
      NTFS3_FS_POSIX_ACL = lib.mkForce unset;
      NTFS3_LZX_XPRESS = lib.mkForce unset;
      NVME_TARGET_TCP_TLS = lib.mkForce unset;
      NVME_TCP_TLS = lib.mkForce unset;
      PLAYSTATION_FF = lib.mkForce unset;
      PPP_FILTER = lib.mkForce unset;
      PPP_MULTILINK = lib.mkForce unset;
      RT2800USB_RT53XX = lib.mkForce unset;
      RT2800USB_RT55XX = lib.mkForce unset;
      SCSI_SAS_ATA = lib.mkForce unset;
      SLIP_COMPRESSED = lib.mkForce unset;
      SLIP_SMART = lib.mkForce unset;
      SMARTJOYPLUS_FF = lib.mkForce unset;
      SND_AC97_POWER_SAVE = lib.mkForce unset;
      SND_AC97_POWER_SAVE_DEFAULT = lib.mkForce unset;
      SND_SOC_INTEL_SOUNDWIRE_SOF_MACH = lib.mkForce unset;
      SND_USB_CAIAQ_INPUT = lib.mkForce unset;
      TCG_TIS_SPI_CR50 = lib.mkForce unset;
      THRUSTMASTER_FF = lib.mkForce unset;
      TPS68470_PMIC_OPREGION = lib.mkForce unset;
      USB_DWC2_DUAL_ROLE = lib.mkForce unset;
      USB_DWC3_DUAL_ROLE = lib.mkForce unset;
      U_SERIAL_CONSOLE = lib.mkForce unset;
      VFIO_PCI_VGA = lib.mkForce unset;
      VIRTIO_MMIO_CMDLINE_DEVICES = lib.mkForce unset;
      X86_SGX_KVM = lib.mkForce unset;
    };
    kernelPatches = map (pname: {
      name = "linux-surface-${pname}";
      patch = (linuxSurface + "/patches/6.8/${pname}.patch");
    }) [
      "0004-ipts"
      "0005-ithc"
      "0006-surface-sam"
      "0007-surface-sam-over-hid"
      "0008-surface-button"
      "0009-surface-typecover"
      "0010-surface-shutdown"
      "0011-surface-gpe"
      "0014-rtc"
    ];
  });
  # boot.extraModulePackages = with config.boot.kernelPackages; [ ithc ];

}
