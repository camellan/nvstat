using NVCtrlLib;
using Xlib;

void main() {
    int temp = 0, u_mem = 0, t_mem = 0, u_freq = 0;
    // uint32 freq = 0;
    // uint16 gpu = 0;
    // uint16 vmem = 0 ;
    char *used = "";

    Display nvidia_display = new Display ();

    // if (!(nvidia_display = XOpenDisplay(NULL))){
    //     stdout.printf("Could not open display ");
    // }

    var res = XNVCTRLQueryAttribute(
        nvidia_display,
        0,
        0,
        NV_CTRL_GPU_CORE_TEMPERATURE,
        &temp
    );

    if(!res) {
        stdout.printf("Could not query NV_CTRL_GPU_CORE_TEMPERATURE attribute!\n");
        return;
    }

    // var res1 = XNVCTRLQueryAttribute(
    //      nvidia_display,
    //      0,
    //      0,
    //      NV_CTRL_GPU_CURRENT_CLOCK_FREQS,
    //      &freq
    // );

    // if(!res1) {
    //     stdout.printf("Could not query NV_CTRL_GPU_CURRENT_CLOCK_FREQS attribute!\n");
    //     return ;
    // }

    // gpu = freq>>16;
    // vmem = freq&0xFFFF;

    var res2 = XNVCTRLQueryAttribute(
         nvidia_display,
         0,
         0,
         NV_CTRL_TOTAL_GPU_MEMORY,
         &t_mem
    );

    if(!res2) {
        stdout.printf("Could not query NV_CTRL_TOTAL_GPU_MEMORY attribute!\n");
        return ;
    }

    t_mem = t_mem / 1024;

    var res3 = XNVCTRLQueryTargetStringAttribute(
            nvidia_display,
            NV_CTRL_TARGET_TYPE_GPU,
            0,
            0,
            NV_CTRL_STRING_GPU_UTILIZATION,
            &used
    );

    if(!res3) {
        stdout.printf("Could not query NV_CTRL_STRING_GPU_UTILIZATION attribute!\n");
        return ;
    }

    var res4 = XNVCTRLQueryTargetAttribute(
            nvidia_display,
            NV_CTRL_TARGET_TYPE_GPU,
            0,
            0,
            NV_CTRL_USED_DEDICATED_GPU_MEMORY,
            &u_mem
    );

    if(!res4) {
        stdout.printf("Could not query NV_CTRL_USED_DEDICATED_GPU_MEMORY attribute!\n");
        return ;
    }

    var res5 = XNVCTRLQueryTargetAttribute(
            nvidia_display,
            NV_CTRL_TARGET_TYPE_GPU,
            0,
            0,
            NV_CTRL_GPU_CURRENT_PROCESSOR_CLOCK_FREQS,
            &u_freq
    );

    if(!res5) {
        stdout.printf("Could not query NV_CTRL_GPU_CURRENT_PROCESSOR_CLOCK_FREQS attribute!\n");
        return ;
    }

    stdout.printf("GPU_CORE_TEMPERATURE: %d°C\n", temp);
    // stdout.printf("GPU_CLOCK_FREQS: %d MHz\n", gpu);
    // stdout.printf("MEM_CLOCK_FREQS: %d MHz\n", vmem);
    stdout.printf("TOTAL_GPU_MEMORY: %d Gb\n", t_mem);
    stdout.printf("USED_GPU_MEMORY: %d Mb\n", u_mem);
    stdout.printf("CURRENT_PROCESSOR_CLOCK_FREQS: %d \n", u_freq);
    stdout.printf("GPU_UTILIZATION: %s\n", (string) used);
}
