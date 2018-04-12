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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/lab/Desktop/ucisw2_projekt-master/zajecia/ucisw_projekt/vga_800x600.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);
unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_3908131327_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_4060537613_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_436351764_3965413181(char *, char *, char *, char *, int );


static void work_a_0419244056_3212880686_p_0(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;

LAB0:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3548);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 7283);
    t6 = (t0 + 3640);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 11U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1236U);
    t6 = *((char **)t2);
    t2 = (t0 + 7152U);
    t7 = (t0 + 1592U);
    t8 = *((char **)t7);
    t7 = (t0 + 7056U);
    t9 = ieee_p_3620187407_sub_436351764_3965413181(IEEE_P_3620187407, t13, t8, t7, 1);
    t14 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t6, t2, t9, t13);
    if (t14 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 7152U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t13, t2, t1, 1);
    t6 = (t13 + 12U);
    t21 = *((unsigned int *)t6);
    t22 = (1U * t21);
    t3 = (11U != t22);
    if (t3 == 1)
        goto LAB13;

LAB14:    t7 = (t0 + 3640);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t15 = *((char **)t10);
    memcpy(t15, t5, 11U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 3676);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(68, ng0);
    t10 = (t0 + 7294);
    t16 = (t0 + 3640);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t10, 11U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 3676);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB13:    xsi_size_not_matching(11U, t22, 0);
    goto LAB14;

}

static void work_a_0419244056_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
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

LAB0:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1236U);
    t3 = *((char **)t2);
    t2 = (t0 + 7152U);
    t4 = (t0 + 1660U);
    t5 = *((char **)t4);
    t4 = (t0 + 7072U);
    t6 = ieee_p_3620187407_sub_4060537613_3965413181(IEEE_P_3620187407, t3, t2, t5, t4);
    if (t6 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t17 = (t0 + 3712);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 3556);
    *((int *)t22) = 1;

LAB1:    return;
LAB3:    t12 = (t0 + 3712);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t12);
    goto LAB2;

LAB5:    t7 = (t0 + 1236U);
    t8 = *((char **)t7);
    t7 = (t0 + 7152U);
    t9 = (t0 + 1728U);
    t10 = *((char **)t9);
    t9 = (t0 + 7088U);
    t11 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t8, t7, t10, t9);
    t1 = t11;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_0419244056_3212880686_p_2(char *t0)
{
    char t16[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t17;
    char *t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;

LAB0:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t11 = xsi_signal_has_event(t1);
    if (t11 == 1)
        goto LAB10;

LAB11:    t4 = (unsigned char)0;

LAB12:    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3564);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 7305);
    t6 = (t0 + 3748);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 11U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1328U);
    t7 = *((char **)t2);
    t2 = (t0 + 7168U);
    t8 = (t0 + 1796U);
    t9 = *((char **)t8);
    t8 = (t0 + 7104U);
    t10 = ieee_p_3620187407_sub_436351764_3965413181(IEEE_P_3620187407, t16, t9, t8, 1);
    t17 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t7, t2, t10, t16);
    if (t17 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t1 = (t0 + 7168U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t16, t2, t1, 1);
    t6 = (t16 + 12U);
    t25 = *((unsigned int *)t6);
    t26 = (1U * t25);
    t3 = (11U != t26);
    if (t3 == 1)
        goto LAB16;

LAB17:    t7 = (t0 + 3748);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t18 = *((char **)t10);
    memcpy(t18, t5, 11U);
    xsi_driver_first_trans_fast(t7);

LAB14:    goto LAB3;

LAB7:    t2 = (t0 + 1420U);
    t6 = *((char **)t2);
    t14 = *((unsigned char *)t6);
    t15 = (t14 == (unsigned char)3);
    t3 = t15;
    goto LAB9;

LAB10:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t12 = *((unsigned char *)t5);
    t13 = (t12 == (unsigned char)3);
    t4 = t13;
    goto LAB12;

LAB13:    xsi_set_current_line(85, ng0);
    t18 = (t0 + 7316);
    t20 = (t0 + 3748);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 40U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 11U);
    xsi_driver_first_trans_fast(t20);
    goto LAB14;

LAB16:    xsi_size_not_matching(11U, t26, 0);
    goto LAB17;

}

static void work_a_0419244056_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
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

LAB0:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1328U);
    t3 = *((char **)t2);
    t2 = (t0 + 7168U);
    t4 = (t0 + 1864U);
    t5 = *((char **)t4);
    t4 = (t0 + 7120U);
    t6 = ieee_p_3620187407_sub_4060537613_3965413181(IEEE_P_3620187407, t3, t2, t5, t4);
    if (t6 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t17 = (t0 + 3784);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 3572);
    *((int *)t22) = 1;

LAB1:    return;
LAB3:    t12 = (t0 + 3784);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t12);
    goto LAB2;

LAB5:    t7 = (t0 + 1328U);
    t8 = *((char **)t7);
    t7 = (t0 + 7168U);
    t9 = (t0 + 1932U);
    t10 = *((char **)t9);
    t9 = (t0 + 7136U);
    t11 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t8, t7, t10, t9);
    t1 = t11;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_0419244056_3212880686_p_4(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    unsigned char t12;
    char *t13;
    char *t14;
    unsigned char t15;
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

LAB0:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 1236U);
    t4 = *((char **)t3);
    t3 = (t0 + 7152U);
    t5 = ieee_p_3620187407_sub_3908131327_3965413181(IEEE_P_3620187407, t4, t3, 0);
    if (t5 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB14:    t21 = (t0 + 3820);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 40U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t21);

LAB2:    t26 = (t0 + 3580);
    *((int *)t26) = 1;

LAB1:    return;
LAB3:    t16 = (t0 + 3820);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB2;

LAB5:    t10 = (t0 + 1328U);
    t11 = *((char **)t10);
    t10 = (t0 + 7168U);
    t12 = ieee_p_3620187407_sub_3908131327_3965413181(IEEE_P_3620187407, t11, t10, 0);
    if (t12 == 1)
        goto LAB11;

LAB12:    t9 = (unsigned char)0;

LAB13:    t1 = t9;
    goto LAB7;

LAB8:    t6 = (t0 + 1236U);
    t7 = *((char **)t6);
    t6 = (t0 + 7152U);
    t8 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t7, t6, 800);
    t2 = t8;
    goto LAB10;

LAB11:    t13 = (t0 + 1328U);
    t14 = *((char **)t13);
    t13 = (t0 + 7168U);
    t15 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t14, t13, 600);
    t9 = t15;
    goto LAB13;

LAB15:    goto LAB2;

}

static void work_a_0419244056_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(98, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 3856);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 11U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3588);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0419244056_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(99, ng0);

LAB3:    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t1 = (t0 + 3892);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 11U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3596);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0419244056_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0419244056_3212880686_p_0,(void *)work_a_0419244056_3212880686_p_1,(void *)work_a_0419244056_3212880686_p_2,(void *)work_a_0419244056_3212880686_p_3,(void *)work_a_0419244056_3212880686_p_4,(void *)work_a_0419244056_3212880686_p_5,(void *)work_a_0419244056_3212880686_p_6};
	xsi_register_didat("work_a_0419244056_3212880686", "isim/vga_controller_test_isim_beh.exe.sim/work/a_0419244056_3212880686.didat");
	xsi_register_executes(pe);
}
