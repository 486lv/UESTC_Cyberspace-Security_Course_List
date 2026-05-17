/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Lab_06_SC_2025_Start/addsub32.v";
static int ng1[] = {32, 0};



static void Cont_12_0(char *t0)
{
    char t5[8];
    char t6[8];
    char t10[8];
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(12, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    xsi_vlog_unsigned_add(t5, 32, t3, 32, t4, 32);
    t2 = ((char*)((ng1)));
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    xsi_vlog_mul_concat(t6, 32, 1, t2, 1U, t8, 1);
    t7 = (t0 + 1368U);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t6, 32, t9, 1);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t10);
    t14 = (t12 ^ t13);
    *((unsigned int *)t11) = t14;
    t7 = (t5 + 4);
    t15 = (t10 + 4);
    t16 = (t11 + 4);
    t17 = *((unsigned int *)t7);
    t18 = *((unsigned int *)t15);
    t19 = (t17 | t18);
    *((unsigned int *)t16) = t19;
    t20 = *((unsigned int *)t16);
    t21 = (t20 != 0);
    if (t21 == 1)
        goto LAB4;

LAB5:
LAB6:    t24 = (t0 + 3088);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t11, 8);
    xsi_driver_vfirst_trans(t24, 0, 31);
    t29 = (t0 + 3008);
    *((int *)t29) = 1;

LAB1:    return;
LAB4:    t22 = *((unsigned int *)t11);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t11) = (t22 | t23);
    goto LAB6;

}


extern void work_m_00000000000545750734_3057942373_init()
{
	static char *pe[] = {(void *)Cont_12_0};
	xsi_register_didat("work_m_00000000000545750734_3057942373", "isim/sccomp_dataflow_tb_fig5_22_isim_beh.exe.sim/work/m_00000000000545750734_3057942373.didat");
	xsi_register_executes(pe);
}
