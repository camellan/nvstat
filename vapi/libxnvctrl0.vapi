[CCode (cheader_filename = "NVCtrl/NVCtrlLib.h")]
namespace NVCtrlLib {
   [Compact]
   [CCode (cname = "XNVCTRLQueryAttribute")]
   public bool XNVCTRLQueryAttribute (
      Xlib.Display *dpy,
      int screen,
      uint display_mask,
      uint attribute,
      int *value
   );

   [CCode (cname = "XNVCTRLQueryTargetAttribute")]
   public bool XNVCTRLQueryTargetAttribute (
      Xlib.Display *dpy,
      int target_Type,
      int target_id,
      uint display_mask,
      uint attribute,
      int *value
   );

   [CCode (cname = "XNVCTRLQueryTargetStringAttribute")]
   public bool XNVCTRLQueryTargetStringAttribute (
      Xlib.Display *dpy,
      int target_type,
      int target_id,
      uint display_mask,
      uint attribute,
      char **ptr
   );

}

[CCode (cheader_filename = "NVCtrl/NVCtrl.h")]
public const uint NV_CTRL_GPU_CORE_TEMPERATURE;
public const uint NV_CTRL_GPU_CURRENT_CLOCK_FREQS;
public const uint NV_CTRL_TOTAL_GPU_MEMORY;
public const uint NV_CTRL_STRING_GPU_UTILIZATION;
public const uint NV_CTRL_USED_DEDICATED_GPU_MEMORY;
public const uint NV_CTRL_GPU_CURRENT_PROCESSOR_CLOCK_FREQS;
public const int NV_CTRL_TARGET_TYPE_GPU;
