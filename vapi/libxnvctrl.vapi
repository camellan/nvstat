/**
 * NVCtrlLib Vala Bindings
 * Copyright (C) 2021 Andrey Kultyapov <camellan@yandex.ru>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

namespace NVCtrl {
   [CCode (cheader_filename = "NVCtrl/NVCtrlLib.h", cname = "XNVCTRLQueryAttribute", cprefix = "nv_ctrl_lib_", has_type_id = false)]
   public static bool XNVCTRLQueryAttribute (
      X.Display *dpy,
      int screen,
      uint display_mask,
      uint attribute,
      int *value
   );

   [CCode (cheader_filename = "NVCtrl/NVCtrlLib.h", cname = "XNVCTRLQueryTargetAttribute", cprefix = "nv_ctrl_lib_", has_type_id = false)]
   public static bool XNVCTRLQueryTargetAttribute (
      X.Display *dpy,
      int target_Type,
      int target_id,
      uint display_mask,
      uint attribute,
      int *value
   );

   [CCode (cheader_filename = "NVCtrl/NVCtrlLib.h", cname = "XNVCTRLQueryTargetStringAttribute", cprefix = "nv_ctrl_lib_", has_type_id = false)]
   public static bool XNVCTRLQueryTargetStringAttribute (
      X.Display *dpy,
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
public const uint NV_CTRL_STRING_PRODUCT_NAME;
public const uint NV_CTRL_PCI_ID;
public const  int NV_CTRL_TARGET_TYPE_GPU;
