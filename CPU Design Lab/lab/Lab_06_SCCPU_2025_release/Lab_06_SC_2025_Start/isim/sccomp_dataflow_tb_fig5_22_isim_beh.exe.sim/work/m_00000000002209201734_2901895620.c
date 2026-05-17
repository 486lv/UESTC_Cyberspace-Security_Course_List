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
static const char *ng0 = "F:/lab/lab/Lab_06_SCCPU_2025_release/Lab_06_SC_2025_Start/mux8.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {4U, 0U};
static unsigned int ng3[] = {8U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {5U, 0U};
static unsigned int ng6[] = {13U, 0U};
static unsigned int ng7[] = {2U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {14U, 0U};
static unsigned int ng10[] = {3U, 0U};
static unsigned int ng11[] = {7U, 0U};
static unsigned int ng12[] = {9U, 0U};
static unsigned int ng13[] = {10U, 0U};
static unsigned int ng14[] = {11U, 0U};
static unsigned int ng15[] = {12U, 0U};
static unsigned int ng16[] = {15U, 0U};



static int sp_select(char *t1, char *t2)
{
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t0 = 1;
    xsi_set_current_line(12, ng0);
    t3 = (t1 + 5080);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);

LAB2:    t6 = ((char*)((ng1)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t6, 4);
    if (t7 == 1)
        goto LAB3;

LAB4:    t3 = ((char*)((ng2)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB5;

LAB6:    t3 = ((char*)((ng3)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB7;

LAB8:    t3 = ((char*)((ng4)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB9;

LAB10:    t3 = ((char*)((ng5)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB11;

LAB12:    t3 = ((char*)((ng6)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB13;

LAB14:    t3 = ((char*)((ng7)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB15;

LAB16:    t3 = ((char*)((ng8)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB17;

LAB18:    t3 = ((char*)((ng9)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB19;

LAB20:    t3 = ((char*)((ng10)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB21;

LAB22:    t3 = ((char*)((ng11)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB23;

LAB24:    t3 = ((char*)((ng12)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB25;

LAB26:    t3 = ((char*)((ng13)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB27;

LAB28:    t3 = ((char*)((ng14)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB29;

LAB30:    t3 = ((char*)((ng15)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB31;

LAB32:    t3 = ((char*)((ng16)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB33;

LAB34:
LAB35:    t0 = 0;

LAB1:    return t0;
LAB3:    xsi_set_current_line(13, ng0);
    t8 = (t1 + 3640);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t1 + 3480);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 32);
    goto LAB35;

LAB5:    xsi_set_current_line(14, ng0);
    t4 = (t1 + 3640);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB7:    xsi_set_current_line(15, ng0);
    t4 = (t1 + 3640);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB9:    xsi_set_current_line(16, ng0);
    t4 = (t1 + 3800);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB11:    xsi_set_current_line(17, ng0);
    t4 = (t1 + 3800);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB13:    xsi_set_current_line(18, ng0);
    t4 = (t1 + 3800);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB15:    xsi_set_current_line(19, ng0);
    t4 = (t1 + 3960);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB17:    xsi_set_current_line(20, ng0);
    t4 = (t1 + 3960);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB19:    xsi_set_current_line(21, ng0);
    t4 = (t1 + 3960);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB21:    xsi_set_current_line(22, ng0);
    t4 = (t1 + 4120);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB23:    xsi_set_current_line(23, ng0);
    t4 = (t1 + 4120);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB25:    xsi_set_current_line(24, ng0);
    t4 = (t1 + 4280);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB27:    xsi_set_current_line(25, ng0);
    t4 = (t1 + 4440);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB29:    xsi_set_current_line(26, ng0);
    t4 = (t1 + 4600);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB31:    xsi_set_current_line(27, ng0);
    t4 = (t1 + 4760);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

LAB33:    xsi_set_current_line(28, ng0);
    t4 = (t1 + 4920);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = (t1 + 3480);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    goto LAB35;

}

static void Cont_32_0(char *t0)
{
    char t37[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;

LAB0:    t1 = (t0 + 6000U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1480U);
    t3 = *((char **)t2);
    t2 = (t0 + 1640U);
    t4 = *((char **)t2);
    t2 = (t0 + 1800U);
    t5 = *((char **)t2);
    t2 = (t0 + 1960U);
    t6 = *((char **)t2);
    t2 = (t0 + 2120U);
    t7 = *((char **)t2);
    t2 = (t0 + 2280U);
    t8 = *((char **)t2);
    t2 = (t0 + 2440U);
    t9 = *((char **)t2);
    t2 = (t0 + 2600U);
    t10 = *((char **)t2);
    t2 = (t0 + 2760U);
    t11 = *((char **)t2);
    t2 = (t0 + 2920U);
    t12 = *((char **)t2);
    t2 = (t0 + 5808);
    t13 = (t0 + 848);
    t14 = xsi_create_subprogram_invocation(t2, 0, t0, t13, 0, 0);
    t15 = (t0 + 3640);
    xsi_vlogvar_assign_value(t15, t3, 0, 0, 32);
    t16 = (t0 + 3800);
    xsi_vlogvar_assign_value(t16, t4, 0, 0, 32);
    t17 = (t0 + 3960);
    xsi_vlogvar_assign_value(t17, t5, 0, 0, 32);
    t18 = (t0 + 4120);
    xsi_vlogvar_assign_value(t18, t6, 0, 0, 32);
    t19 = (t0 + 4280);
    xsi_vlogvar_assign_value(t19, t7, 0, 0, 32);
    t20 = (t0 + 4440);
    xsi_vlogvar_assign_value(t20, t8, 0, 0, 32);
    t21 = (t0 + 4600);
    xsi_vlogvar_assign_value(t21, t9, 0, 0, 32);
    t22 = (t0 + 4760);
    xsi_vlogvar_assign_value(t22, t10, 0, 0, 32);
    t23 = (t0 + 4920);
    xsi_vlogvar_assign_value(t23, t11, 0, 0, 32);
    t24 = (t0 + 5080);
    xsi_vlogvar_assign_value(t24, t12, 0, 0, 4);

LAB4:    t25 = (t0 + 5904);
    t26 = *((char **)t25);
    t27 = (t26 + 80U);
    t28 = *((char **)t27);
    t29 = (t28 + 272U);
    t30 = *((char **)t29);
    t31 = (t30 + 0U);
    t32 = *((char **)t31);
    t33 = ((int  (*)(char *, char *))t32)(t0, t26);
    if (t33 != 0)
        goto LAB6;

LAB5:    t26 = (t0 + 5904);
    t34 = *((char **)t26);
    t26 = (t0 + 3480);
    t35 = (t26 + 56U);
    t36 = *((char **)t35);
    memcpy(t37, t36, 8);
    t38 = (t0 + 848);
    t39 = (t0 + 5808);
    t40 = 0;
    xsi_delete_subprogram_invocation(t38, t34, t0, t39, t40);
    t41 = (t0 + 6400);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t37, 8);
    xsi_driver_vfirst_trans(t41, 0, 31);
    t46 = (t0 + 6320);
    *((int *)t46) = 1;

LAB1:    return;
LAB6:    t25 = (t0 + 6000U);
    *((char **)t25) = &&LAB4;
    goto LAB1;

}


extern void work_m_00000000002209201734_2901895620_init()
{
	static char *pe[] = {(void *)Cont_32_0};
	static char *se[] = {(void *)sp_select};
	xsi_register_didat("work_m_00000000002209201734_2901895620", "isim/sccomp_dataflow_tb_fig5_22_isim_beh.exe.sim/work/m_00000000002209201734_2901895620.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
