#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <X11/Xlib.h>
#include <NVCtrl/NVCtrlLib.h>

int main() {

    int res, res1, res2, res3, res4, res5, temp, u_mem, t_mem, u_freq;
    uint32_t freq;
    uint16_t gpu ;
    uint16_t vmem ;
    char* used;

    Display *nvidia_display;

    if (!(nvidia_display = XOpenDisplay(NULL)))
        fprintf(stderr, "Could not open display ");

    res = XNVCTRLQueryAttribute(
        nvidia_display,
        0,
        0,
        NV_CTRL_GPU_CORE_TEMPERATURE,
        &temp
    );

    if(!res) {
        fprintf(stderr, "Could not query NV_CTRL_GPU_CORE_TEMPERATURE attribute!\n");
        return 1;
    }

    res1 = XNVCTRLQueryAttribute(
         nvidia_display,
         0,
         0,
         NV_CTRL_GPU_CURRENT_CLOCK_FREQS,
         &freq
    );

    if(!res1) {
        fprintf(stderr, "Could not query NV_CTRL_GPU_CURRENT_CLOCK_FREQS attribute!\n");
        return 1;
    }

    gpu = freq>>16;
    vmem = freq&0xFFFF;

    res2 = XNVCTRLQueryAttribute(
         nvidia_display,
         0,
         0,
         NV_CTRL_TOTAL_GPU_MEMORY,
         &t_mem
    );

    if(!res2) {
        fprintf(stderr, "Could not query NV_CTRL_TOTAL_GPU_MEMORY attribute!\n");
        return 1;
    }

    t_mem = t_mem / 1024;

    res3 = XNVCTRLQueryTargetStringAttribute(
            nvidia_display,
            NV_CTRL_TARGET_TYPE_GPU,
            0,
            0,
            NV_CTRL_STRING_GPU_UTILIZATION,
            &used
    );

    if(!res3) {
        fprintf(stderr, "Could not query NV_CTRL_STRING_GPU_UTILIZATION attribute!\n");
        return 1;
    }

    res4 = XNVCTRLQueryTargetAttribute(
            nvidia_display,
            NV_CTRL_TARGET_TYPE_GPU,
            0,
            0,
            NV_CTRL_USED_DEDICATED_GPU_MEMORY,
            &u_mem
    );

    if(!res4) {
        fprintf(stderr, "Could not query NV_CTRL_USED_DEDICATED_GPU_MEMORY attribute!\n");
        return 1;
    }

    res5 = XNVCTRLQueryTargetAttribute(
            nvidia_display,
            NV_CTRL_TARGET_TYPE_GPU,
            0,
            0,
            NV_CTRL_GPU_CURRENT_PROCESSOR_CLOCK_FREQS,
            &u_freq
    );

    if(!res5) {
        fprintf(stderr, "Could not query NV_CTRL_GPU_CURRENT_PROCESSOR_CLOCK_FREQS attribute!\n");
        return 1;
    }

    printf("GPU_CORE_TEMPERATURE: %d°C\n", temp);
    printf("GPU_CLOCK_FREQS: %d MHz\n", gpu);
    printf("MEM_CLOCK_FREQS: %d MHz\n", vmem);
    printf("TOTAL_GPU_MEMORY: %d Gb\n", t_mem);
    printf("USED_GPU_MEMORY: %d Mb\n", u_mem);
    printf("CURRENT_PROCESSOR_CLOCK_FREQS: %d \n", u_freq);
    printf("GPU_UTILIZATION: %s\n", used);

    return 0;
}

// NV_CTRL_GPU_CURRENT_PERFORMANCE_LEVEL
// NV_CTRL_GPU_CORES
// NV_CTRL_THERMAL_SENSOR_READING
// NV_CTRL_GPU_CURRENT_PROCESSOR_CLOCK_FREQS
// NV_CTRL_USED_DEDICATED_GPU_MEMORY
 // возвращает количество видеопамяти в настоящее время используется на видеокарте в МБ
// NV_CTRL_STRING_GPU_UTILIZATION
/*запросить через XNVCTRLQueryTargetStringAttribute () с использованием NV_CTRL_TARGET_TYPE_GPU
 * Стоимость токена
 * целое число "graphics" - процент использования графического движка.
 * Целое число "memory" - процент использования FB.
 * целое число "video" - процент использования видеодвигателя.
 * Целое число "PCIe" - процент использования полосы пропускания PCIe.
 */